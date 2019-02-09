class Event < ApplicationRecord
    belongs_to :user
    mount_uploader :file, FileUploader

    validates :caption, length: { minimum: 20, maximum: 1000 }
    # validates :file, presence: true

    after_create :create_notification_for_users

    private

    def create_notification_for_users
        new_notification = Services::Notification::Create.invoke(
            "event-creation",
            "A new event has been created",
            nil
        )
    end
end
