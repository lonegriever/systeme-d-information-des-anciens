const currentYear = new Date().getFullYear();
function administrators() {
    const context = $('#stats-chart-canvas');
    if (context.length) {
        initializeYearFields();
        initializeDataSet();
         const data = {
            labels: [5, 4, 3, 2, 1].map(el => currentYear - el),
            datasets: [
                {   
                    label: 'Employed',
                    borderColor: '#0d47a1',
                    backgroundColor: 'transparent',
                    borderWidth: '3px',
                    data: [25, 50, 60, 100, 65]
                },
                {
                    label: 'Unemployed',
                    data: [10, 20, 40, 60, 75]
                }
            ]
        }
        const lineChart = new Chart(context, {
            type: 'line',
            data: data
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

function initializeYearFields() {
    $('.year-field').each(function(index, element){
        $(this).val(currentYear + index - 5);
    });
}

function initializeDataSet() {
    years = $('.year-field').map(function() {
        return $(this).val();
    })
    console.log(years.get());
}