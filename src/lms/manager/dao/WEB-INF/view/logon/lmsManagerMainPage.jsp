<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<% 
    request.setCharacterEncoding("UTF-8");
 %>

<%
String mgId = (String) session.getAttribute("loginUser");


/* System.out.printf(" 메인 페이지 " + "%s, %s\n", dto.getMemberId(), tdto.getMemberId()); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>쌍용교육센터</title>
<script>
	$(document).ready(function(){

	});
</script>
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
.studentTableTh {
	width: 200px;
	text-align: center;
	vertical-align: middle;
}

.studentImages {
	width: 180px;
}
</style>

</head>





<body>

	<jsp:include page ="/WEB-INF/view/layout/lmsStudentHeader.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/view/layout/lmsManagerNav.jsp"></jsp:include>
    
  

		<div id="content-wrapper">

		
	
		</div>
		
	
	
   <footer>
   <jsp:include page="/WEB-INF/view/layout/lmsStudentFooter.jsp"></jsp:include>
   </footer>
   
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
	</a>


	<!-- Bootstrap core JavaScript-->
	<script src="/Resouces/vendor/jquery/jquery.min.js"></script>
	<script src="/Resouces/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/Resouces/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="/Resouces/vendor/chart.js/Chart.min.js"></script>
	<script src="/Resouces/vendor/datatables/jquery.dataTables.js"></script>
	<script src="/Resouces/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/Resouces/js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="/Resouces/js/demo/datatables-demo.js"></script>
	<script src="/Resouces/js/demo/chart-area-demo.js"></script>
	</body>
</html>