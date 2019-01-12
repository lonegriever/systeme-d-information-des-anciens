function administrators() {
    const context = $('#stats-chart-canvas');
    if (context) {
         const data = {
            labels: ['Red', 'Blue', 'Green']
        }
        const barChart = new Chart(context, {
            type: 'bar',
            data: data
            // options: options
        })
    }
   
}