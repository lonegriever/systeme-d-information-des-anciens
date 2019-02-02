module Services::Notification
    class Create
        attr_reader :notification_type, :notification_details, :user_id
        def self.invoke(notification_type, notification_details, user_id)
            self.new(notification_type, notification_details, user_id).execute
        end

        def initialize(notification_type, notification_details, user_id)
            @notification_type = notification_type
            @notification_details = notification_details
            @user_id = user_id
        end

        def execute
            Notification.create(
                notification_type: notification_type,
                notification_details: notification_details,
                user_id: user_id
            )
        end
    end
end