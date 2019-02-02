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
        console.log(data);
        console.log($('.notification-offset-count').val());
    })
}