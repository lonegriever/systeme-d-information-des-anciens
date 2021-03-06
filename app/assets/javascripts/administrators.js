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
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: false,
                            userCallback: function(label, index, labels) {
                                if (Math.floor(label) === label) {
                                    return  label;
                                }
                            }
                        }
                    }]
                } 
            }
        });
        updateChart(lineChart);
        attatchEventToLineChartCourseSelector(lineChart);
    }
    attachEventToTableRows();
    initializeBarChartAdmin();
    initializeAdminNavigation();
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
        $(this).on('input', function() {
            if ($(this).val() > 2019) {
                $(this).val('2019');
            }
        })
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
        removeAllDataAndLabelsFromChart(lineChart);
        updateAlumniStatisticsSummary(response);
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

function removeAllDataAndLabelsFromChart(lineChart) {
    lineChart.data.labels = [];
    lineChart.data.datasets.forEach((dataset) => {
        dataset.data = []
    });
    lineChart.update();
}

function attatchEventToLineChartCourseSelector(lineChart) {
    $('#selected-course-for-statistics').change(function() {
        updateChart(lineChart);
    });
    $('#refresh-chart-button').click(function() {
        updateChart(lineChart);
    })
}

function updateAlumniStatisticsSummary(response) {
    $('.header-item').each(function(index) {
        if (Object.keys(response['data'][index])[0].length > 0) {
            $(this).text(Object.keys(response['data'][index])[0]);
        } else {
             $(this).text('Undefined');
        }
    });

    $('.employed-count-data').each(function(index) {
        if (Object.keys(response['data'][index])[0].length > 0) {
            $(this).text(Object.values(response['data'][index])[0]['employed_count']);
        } else {
             $(this).text(0);
        }
    });

    $('.unemployed-count-data').each(function(index) {
        if (Object.keys(response['data'][index])[0].length > 0) {
            $(this).text(Object.values(response['data'][index])[0]['unemployed_count']);
        } else {
             $(this).text(0);
        }
    })

    $('.total-count-data').each(function(index) {
        if (Object.keys(response['data'][index])[0].length > 0) {
            $(this).text(Object.values(response['data'][index])[0]['total_count']);
        } else {
            $(this).text(0);
        }
    })
}