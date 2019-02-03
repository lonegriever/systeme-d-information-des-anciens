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
        data['notifications'].forEach((notif, index) => {
            notif_is_read = notif.is_read ? 'read-notif' : 'not-read-notif'
            let userID = `<input type="hidden" value="${notif.alumnus_record_id}"></input>`
            let listItem = `<li class='${notif_is_read} notif-list-item'>${userID}<span class="notification-details">${notif.notification_details}</span></li>`;
            $('#notifications-list').append(listItem);
            attachNotifListEventListener($('#notifications-list').children('li')[index]);
        });
    })
}

function attachNotifListEventListener(listItem) {
    $(listItem).click(function() {
        // console.log($(this).text());
        $('#notif-get-profile').
    })
}


// const form = document.createElement('form');
//         form.setAttribute('method', 'get')
//         form.setAttribute('action', url + $(this).children('input').val());
//         $(document.body).append(form);
//         form.submit();