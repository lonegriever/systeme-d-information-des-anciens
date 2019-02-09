module Services::Notification
    class RetrieveAll
        include ActionView::Helpers::DateHelper
        attr_reader :offset, :notifications_for, :all_users, :notification_model

        def self.invoke(offset = 0, notifications_for = 'admins')
            self.new(offset, notifications_for).execute
        end

        def initialize(offset, notifications_for)
            @offset = offset
            @notifications_for = notifications_for
            @all_users = User.all.includes(:alumnus_record)
            @notification_model = 'Notification'.constantize
        end

        def execute
            return notifications_for_admin if notifications_for == 'admins'
        end

        private

        def format_notifications notifs
            notifs.map do |notif|
                {
                    id: notif.id,
                    is_read: notif.is_read,
                    notification_details: "#{notif.notification_details} #{time_ago_in_words(notif.created_at)} ago",
                    user_id: notif.user.id,
                    alumnus_record_id: all_users.find_by(id: notif.user.id).alumnus_record.id
                }
            end
        end

        def notifications_for_admin
            notifs = notification_model.offset(offset).order('created_at DESC').limit(10);
            notifs = format_notifications(notifs)
            {
                message: 'success',
                notifications: notifs,
                unread_notifications_count: Notification.unread_count,
                status: 200
            }
        end
    end
end