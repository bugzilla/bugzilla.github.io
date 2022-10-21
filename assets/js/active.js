var formattedData = [];
for (let key in active_installations) {
  var install = active_installations[key];
  var dateArray = install["Date"].split('/');
  var date = new Date(dateArray[2], dateArray[0] - 1, dateArray[1]);
  var hash = { x: date, y: install["Count"] };
  formattedData.push(hash);
}

document.addEventListener('DOMContentLoaded', function(){ 
  var ctx = document.getElementById('chart');
  var chart = new Chart(ctx, {
      type: 'line',
      data: {
          datasets: [{
              label: 'Active Instances',
              backgroundColor: '#9248c8',
              borderColor: '#9248c8',
              pointBorderColor: 'transparent',
              pointBackgroundColor: 'transparent',
              pointHoverBorderColor: '#9248c8',
              pointHoverBackgroundColor: '#9248c8',
              fill: false,
              data: formattedData
          }]
      },
      options: {
          scales: {
              xAxes: [{
                  type: 'time',
                  time: {
                      unit: 'month',
                      tooltipFormat: 'll'
                  }
              }]
          },
          legends: {
              defaultFontFamily: "FiraGO"
          }
      }
  });
}, false);
