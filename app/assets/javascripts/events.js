function events() {
    $('#event_file').change(function() {
        const file =  $(this).prop('files')[0];
        $('.selected-file').html(file.name);
    })
}