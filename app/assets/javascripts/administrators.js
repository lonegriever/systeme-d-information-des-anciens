function administrators() {
    const context = $('#stats-chart-canvas');
    if (context.length) {
        initializeYearFields();
         const data = {
            datasets: [
                {   
                    label: 'Employed',
                    backgroundColor: '#03a9f4',
                    borderColor: '#03a9f4',
                    borderWidth: '2px',
                    fill: false,
                    pointRadius: 3,
                    pointHitRadius: 50,
                    pointHoverBackgroundColor: '#0288d1'
                },
                {
                    label: 'Unemployed',
                    backgroundColor: '#ef9a9a',
                    borderColor: '#ef9a9a',
                    borderWidth: '2px',
                    fill: false,
                    pointRadius: 3,
                    pointHitRadius: 50,
                    pointHoverBackgroundColor: '#e53935'
                }
            ]
        }
        const lineChart = new Chart(context, {
            type: 'line',
            data: data,
            options: {
                hover: {
                    onHover: function(event) {
                        // event.target.style.cursor = 'pointer'
                        // console.log(event);
                        const point = this.getElementAtEvent(event);
                        if (point.length) {
                            event.target.style.cursor = 'pointer';
                        } else {
                            event.target.style.cursor = 'default';
                        }
                    }
                },
                tooltips: {    
                    callbacks: {
                        label: function(tooltipItem, data) {
                            const label = data.datasets[tooltipItem.datasetIndex].label || '';
                            return `${label}: ${tooltipItem.yLabel}%`;
                        }
                    }
                } 
            }
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
        lineChart.data.datasets.forEach((dataset) => {
            label = dataset.label == 'Employed' ? 'employed' : 'unemployed';
            response['data'].forEach((yearData) => {        
                dataset.data.push(Object.values(yearData)[0][label]);
            })
        })
        lineChart.update();
    })
}

        //  const data = {
        //     datasets: [
        //         {   
        //             label: 'Employed',
        //             borderColor: '#0d47a1',
        //             backgroundColor: 'transparent',`
        //             borderWidth: '3px',
        //             data: [25, 50, 60, 100, 65]
        //         },
        //         {
        //             label: 'Unemployed',
        //             data: [10, 20, 40, 60, 75]
        //         }
        //     ]
        // }