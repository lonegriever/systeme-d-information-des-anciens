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
    const new_notification = data['new_notification']
    let notif_is_read = new_notification.is_read ? 'read-notif' : 'not-read-notif'
    let userID = `<input type="hidden" value="${new_notification.alumnus_record_id}"></input>`
    let listItem = `<li class='${notif_is_read} notif-list-item' ${userID}<span class="notification-details">${new_notification.notification_details}</span></li>`;
    $('#notifications-list').prepend(listItem);
    $('#notif-sound').trigger('play');
}