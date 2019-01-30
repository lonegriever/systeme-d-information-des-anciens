class AdminNotificationsChannel < ApplicationCable::Channel
    def subscribed
        stream_from "admin_notifications_channel"
    end

    def unsubscribed
        
    end
end
