App.admin_notifications = App.cable.subscriptions.create("AdminNotificationsChannel", {
    connected: function() {
    // Called when the subscription is ready for use on the server
        console.log('connected')
    },

    disconnected: function() {
    // Called when the subscription has been terminated by the server
    },

    received: function(data) {
    // Called when there's incoming data on the websocket for this channel
        updateNotificationGroup(data);
    }
});

function updateNotificationGroup(data) {
    $('#unread-notifications-count').text(data['unread_notifications_count']);
}
