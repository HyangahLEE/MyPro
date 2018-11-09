<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>쌍용교육센터</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Bootstrap core CSS-->
<link href="/Resouces/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="/Resouces/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="/Resouces/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/Resouces/css/sb-admin.css" rel="stylesheet">

<!-- Bootstrap core CSS-->
<link href="/Resouces/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="/Resouces/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="/Resouces/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/Resouces/css/sb-admin.css" rel="stylesheet">


<style>
</style>
</head>
<body id="page-top">

	<jsp:include page="/WEB-INF/view/layout/lmsStudentHeader.jsp"></jsp:include>

	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/layout/lmsStudentNav.jsp"></jsp:include>
		<div id="content-wrapper">
			<div class="container-fluid">

				<div class="card mb-3">
					<div class="card-header">
					<i class="fas fa-chart-area"></i> <span>성적표</span>
					</div>

					<!-- 		<div class="col-lg"> -->
					<div>
						<canvas id="myChart" style="height: 40%;"></canvas>

					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/view/layout/lmsStudentFooter.jsp"></jsp:include>
		</div>
	</div>


	<script>
		var ctx = document.getElementById("myChart").getContext('2d');

		var labelsvalus = [ "${list[0].pename}", "${list[1].pename}",
				"${list[0].sname}", "${list[1].sname}" ]; // json array
		/* console.log(labelsvalus); */
		var datas = [ "${list[0].pescore}", "${list[1].pescore}",
				"${list[0].sscore}", "${list[1].sscore}" ];

		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : labelsvalus,
				datasets : [ {
					/*  					label : '# of Votes', */
					label : '취득 점수',
					data : datas,
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							min : 0,
							max : 100,
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>
</body>
</html>