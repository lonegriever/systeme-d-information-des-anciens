function initializeAdminNavigation() {
    updateNotificationsList();
}

function updateNotificationsList(offset = 0) {
    $('#notifications-list');

    const url = '/api/admin/get-notifications'

    $.ajax({
        url: url,
        data: {
            offset: offset
        }
    }).done(function(data) {
        // console.log($('.notification-offset-count').val());
        $('#unread-notifications-count').text(data['unread_notifications_count']);
        data['notifications'].forEach(notif => {
            notif_is_read = notif.is_read ? 'read-notif' : 'not-read-notif'
            let listItem = `<li class='${notif_is_read}'><span class="notification-details">${notif.notification_details}</span></li>`;
            $('#notifications-list').append(listItem) 
        });
    })
}