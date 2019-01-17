function administrators() {
    const context = $('#stats-chart-canvas');
    if (context.length) {
         const data = {
            labels: ['Red', 'Blue', 'Green']
        }
        const barChart = new Chart(context, {
            type: 'bar',
            data: data
            // options: options
        })
    }
   attachEventToTableRows()
}

function attachEventToTableRows() {
    let url = '/admin/alumnus-record/'
    $('.table-data-row').click(function() {
        const form = document.createElement('form');
        form.setAttribute('method', 'get')
        form.setAttribute('action', url + $(this).children('input').val());
        $(document.body).append(form);
        form.submit();
    })
}