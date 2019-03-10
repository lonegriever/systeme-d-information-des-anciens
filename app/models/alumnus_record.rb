class AlumnusRecord < ApplicationRecord
    belongs_to :user, optional: true
    has_one :employment_record, dependent: :destroy
    accepts_nested_attributes_for :employment_record

    before_create :down_case_attributes
    # after_create :create_notification_for_admin
    
    validates_presence_of [
        :first_name,
        :last_name,
        :email,
        :gender,
        :birth_date,
        :course,
        :year_graduated,
        :employment_status
    ]

    validates :first_name, length:  {minimum: 2, maximum: 16}
    validates :last_name,  length:  {minimum: 2, maximum: 16}
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :reason_for_unemployment, length: {maximum: 500}
    validates :reason_for_unemployment, presence: true, if: :unemployed

    def full_name
        "#{self.first_name.capitalize} #{self.last_name.capitalize}"
    end

    paginates_per 5

    private

    def down_case_attributes
        attributes.each do |attr_name, attr_value|
            if attr_value.class == String
                unless attr_name == 'course' || attr_name == 'reason_for_unemployment'
                    self[attr_name.to_sym] = attr_value.downcase
                end
            end
        end
    end

    def create_notification_for_admin
        new_notification = Services::Notification::Create.invoke(
            "alumnus-record-creation",
            "A user has created an account.",
            self.user.id
        )

        Services::Notification::Broadcast.invoke(
            'admin_notifications_channel',
            {
                message: 'An alumnus has created an account.',
                username: self.user.username,
                unread_notifications_count: Notification.notifications_for_admins.count,
                new_notification: new_notification,
                alumnus_record_id: new_notification[:alumnus_record_id]
            }
        )
    end

    def unemployed
        self.employment_status == 'unemployed'
    end

end
