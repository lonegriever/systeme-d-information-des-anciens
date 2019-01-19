function administrators() {
    const context = $('#stats-chart-canvas');
    if (context.length) {
        initializeYearFields();
        const lineChart = new Chart(context, {
            type: 'line'
        });
        updateChart(lineChart);
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
    const currentYear = new Date().getFullYear();
    $('.year-field').each(function(index, element){
        $(this).val(currentYear + index - 5);
    });
}

function updateChart(lineChart) {
    const years = $('.year-field').map(function() {
        return $(this).val();
    }).get();
    const selectedCourse = $('#selected-course-for-statistics').val();
    const url = '/api/admin/get-alumni-statistics';
    $.ajax({
        url: url,
        data: {
            years: years,
            course: selectedCourse
        }
    }).done(function(response) {
        response['data'].map(el => lineChart.data.labels.push(Object.keys(el)[0]));
        lineChart.update();
    })
}

        //  const data = {
        //     labels: [5, 4, 3, 2, 1].map(el => currentYear - el),
        //     datasets: [
        //         {   
        //             label: 'Employed',
        //             borderColor: '#0d47a1',
        //             backgroundColor: 'transparent',
        //             borderWidth: '3px',
        //             data: [25, 50, 60, 100, 65]
        //         },
        //         {
        //             label: 'Unemployed',
        //             data: [10, 20, 40, 60, 75]
        //         }
        //     ]
        // }