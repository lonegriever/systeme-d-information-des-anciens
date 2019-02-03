module Services::Notification
    class Create
        include ActionView::Helpers::DateHelper
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
            notification = 'Notification'.constantize
            notif = notification.create(
                notification_type: notification_type,
                notification_details: notification_details,
                user_id: user_id
            )
            {
                id: notif.id,
                notification_details: "#{notif.notification_details} #{time_ago_in_words(notif.created_at)} ago",
                is_read: notif.is_read,
                user_id: notif.user_id,
                alumnus_record_id: User.find_by(id: user_id).alumnus_record.id
            }
        end
    end
end