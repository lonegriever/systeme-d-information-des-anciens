function initializeBarChartAdmin() {
    const context = $('#bar-chart-canvas');
    if(context.length) {
        const data = {
            labels: [
                'Bachelor of Science in Information Technology',
                'Bachelor of Science in Hospitality Management',
                'Bachelor of Science in Criminology',
                'Bachelor of Science in Tourism Management',
                'Bachelor of Arts in Communication',
                'Bachelor of Science in Business Administration',
                'Bachelor of Science on Accountancy',
                'Bachelor of Science in Psychology',
                'Bachelor of Science in Computer Science'
            ],
            datasets: [
                {
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"]
                }
            ]
        }
        Chart.defaults.global.maintainAspectRatio = true;
        const barChart = new Chart(
            context, {
                type: 'bar',
                data: data,
                options: {
                    responsive: false,
                    legend: { display: false },
                    title: {
                        display: true,
                        text: 'Graduate Alumni Population'
                    }
                },
                plugins: [
                    {
                        beforeUpdate: function(barChart) {
                            barChart.data.labels.forEach(function(value, index, array) {
                                array[index] = value.split(' ')
                            })
                        }
                    }
                ]
            }
        )
        Chart.defaults.global.maintainAspectRatio = false;
        updateBarChart(barChart);
        bindBarChartUpdateToCourseSelect(barChart);
    }
}

function updateBarChart(barChart) {
    const selectedYear = $('.bar-chart-year-selector').val();
    const url = '/api/admin/get-employed-count';
    $.ajax({
        url: url,
        data: {
            selectedYear: selectedYear
        }
    }).done(function(response) {
        removeAllDataAndLabelsFromChart(barChart);
        barChart.data.datasets.forEach(dataset => {
            for (let key in response['data']) {
                barChart.data.labels.push(key)
                dataset.data.push(response['data'][key]);
            }
        });
        barChart.update();
    });   
}

function bindBarChartUpdateToCourseSelect(barChart) {
    $('#refresh-bar-chart-button').click(function() {
        updateBarChart(barChart);
    })
}