function initializeBarChartAdmin() {
    const context = $('#bar-chart-canvas');
    if(context.length) {
        const data = {
            labels: ['The Count', 'Sigma', 'Halo', 'Crowner John'],
            datasets: [
                {
                    label: "Population",
                    backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
                    data: [2478,5267,734,784,433]
                }
            ]
        }
        const barChart = new Chart(
            context, {
                type: 'bar',
                data: data,
                options: {
                    legend: { display: false },
                    title: {
                        display: true,
                        text: 'Graduate Alumni Population'
                    }
                }
            }
        )
    }
}