function initializeAdminNavigation() {
    updateNotificationsList();
    attachEventListenerToNotifGroup();
}

function updateNotificationsList(offset = 0) {
    const url = '/api/admin/get-notifications'

    $.ajax({
        url: url,
        data: {
            offset: offset,
            notifications_for: 'admins'
        }
    }).done(function(data) {
        // console.log($('.notification-offset-count').val());
        $('#unread-notifications-count').text(data['unread_notifications_count']);
        data['notifications'].forEach((notif, index) => {
            notif_is_read = notif.is_read ? 'read-notif' : 'not-read-notif'
            let userID = `<input type="hidden" value="${notif.alumnus_record_id}"></input>`
            let listItem = `<li class='${notif_is_read} notif-list-item'>${userID}<span class="notification-details">${notif.notification_details}</span></li>`;
            $('#notifications-list').append(listItem);
            attachEventListeners($('#notifications-list').children('li')[index], notif.id, data['user_is_an_admin'] );
        });
    })
}

function attachEventListenerToNotifGroup() {
    $('i.fa-bell').click(function() {
        $('div.notifications-list-container').toggleClass('visible');
    })
}

function attachEventListeners(listItem, notif_id, user_is_an_admin) {
    $(listItem).click(function() {
        let url = user_is_an_admin? '/admin/alumnus-record-notif/' + $(this).children('input').val() + `/${notif_id}` : `/events?notif_id=${notif_id}`;
        const form = document.createElement('form');
        form.setAttribute('method', 'get')
        form.setAttribute('action', url);
        $(document.body).append(form);
        form.submit();
    })
}