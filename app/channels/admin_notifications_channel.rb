class AdminNotificationsChannel < ApplicationCable::Channel
    def subscribed
        stream_from "admin_notifications_channel" if signed_in_user.is_an_admin
    end

    def unsubscribed
        
    end
end
