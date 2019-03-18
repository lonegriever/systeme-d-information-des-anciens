function eventsIndex() {
    $('#events-index-calendar').datepicker().datepicker('show');

    $('#search-event-input').keypress(function(event) {
        if(event.which == 13) {
            $('#search-event-form').submit();
            return false;
        }
    })
}