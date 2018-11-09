// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Bar Chart Example
var ctx = document.getElementById("myBarChart");

/*추가*/
var labelsvalus = ["${list[0].pename}", "${list[1].pename}", "${list[0].sname}", "${list[1].sname}"];

/*추가*/
var datas = ["${list[0].pescore}","${list[1].pescore}", "${list[0].sscore}","${list[1].sscore}"];

var myBarChart = new Chart(ctx, {
  type: 'bar',
  data: {
/*    labels: ["January", "February", "March", "April", "May", "June"],*/
	  /*추가*/
      labels: labelsvalus,
    datasets: [{
/*      label: "Revenue",*/
      label: "# of Votes",
      data: datas,
      backgroundColor: "rgba(2,117,216,1)",
      borderColor: "rgba(2,117,216,1)"
/*      data: [4215, 5312, 6251, 7841, 9821, 14984],*/

    }],
  },
  options: {
    scales: {
/*      xAxes: [{
        time: {
          unit: 'month'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 6
        }
      }],*/
      yAxes: [{
        ticks: {
          min: 0,
/*          max: 15000,*/
          max: 100,
          maxTicksLimit: 5
        },
        gridLines: {
          display: true
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
