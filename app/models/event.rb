class Event < ApplicationRecord
    belongs_to :user
    mount_uploader :file, FileUploader

    validates :caption, length: { maximum: 1000 }
    # validates :file, presence: true

    after_create :create_notification_for_users

    private

    def create_notification_for_users
        new_notification = Services::Notification::Create.invoke(
            "event-creation",
            "A new event has been created",
            nil
        )
        Services::Notification::Broadcast.invoke(
            'alumni_channel',
            {
                message: 'A new event has been created.',
                unread_notifications_count: Notification.notifications_for_users.count,
                new_notification: new_notification,
                alumnus_record_id: new_notification[:alumnus_record_id]
            }
        )
    end
end
