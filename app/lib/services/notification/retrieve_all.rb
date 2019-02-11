module Services::Notification
    class RetrieveAll
        include ActionView::Helpers::DateHelper
        attr_reader :offset, :notifications_for, :all_users, :notification_model, :current_user

        def self.invoke(offset = 0, notifications_for = 'admins', current_user)
            self.new(offset, notifications_for, current_user).execute
        end

        def initialize(offset, notifications_for, current_user)
            @offset = offset
            @notifications_for = notifications_for
            @all_users = User.all.includes(:alumnus_record)
            @notification_model = 'Notification'.constantize
            @current_user = current_user
        end

        def execute
            return retrieve_notifications_for('admins') if notifications_for == 'admins'
            return retrieve_notifications_for('alumni') if notifications_for == 'alumni'
        end

        private

        def format_notifications notifs
            notifs.map do |notif|
                {
                    id: notif.id,
                    is_read: notif.is_read,
                    notification_details: "#{notif.notification_details} #{time_ago_in_words(notif.created_at)} ago",
                    user_id: notif.user_id.present? ? notif.user_id : nil,
                    alumnus_record_id: notif.user_id.present? ? all_users.find_by(id: notif.user.id).alumnus_record.id : nil
                }
            end
        end

        def retrieve_notifications_for(users_type)
            if users_type == 'admins'
                notifs = notification_model.notifications_for_admins
            elsif users_type == 'alumni'
                notifs = notification_model.notifications_for_users
            end
            notifs_array = format_notifications(notifs.offset(offset).order('created_at DESC').limit(10))
            {
                message: 'success',
                notifications: notifs_array,
                unread_notifications_count: notifs.where(is_read: false).count,
                user_is_an_admin: current_user.is_an_admin,
                status: 200
            }
        end
    end
end