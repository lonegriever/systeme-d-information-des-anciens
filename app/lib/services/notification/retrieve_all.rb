module Services::Notification
    class RetrieveAll
        include ActionView::Helpers::DateHelper
        attr_reader :offset, :all_users

        def self.invoke(offset = 0)
            self.new(offset).execute
        end

        def initialize(offset)
            @offset = offset
            @all_users = User.all.includes(:alumnus_record)
        end

        def execute
            notification = 'Notification'.constantize
            notifs = notification.offset(offset).order('created_at DESC').limit(10);
            notifs = format_notifications(notifs)
            {
                message: 'success',
                notifications: notifs,
                unread_notifications_count: Notification.unread_count,
                status: 200
            }
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
    end
end