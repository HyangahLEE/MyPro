<%@page import="java.util.ArrayList"%>
<%@page import="lms.student.dto.TrainingDTO"%>
<%@page import="lms.student.dto.MemberDTO"%>
<%@page import="lms.student.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String memberId = (String) session.getAttribute("loginUser");
MemberDAO dao = MemberDAO.getInstance();
MemberDTO dto =dao.getMember(memberId);
TrainingDTO tdto = dao.getTraining(memberId);

System.out.printf(" 메인 페이지 " + "%s, %s\n", dto.getMemberId(), tdto.getMemberId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>IT리더교육센터</title>
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
<body id="page-top">

	<jsp:include page="/WEB-INF/view/layout/lmsStudentHeader.jsp"></jsp:include>

	<div id="wrapper">

		<jsp:include page="/WEB-INF/view/layout/lmsStudentNav.jsp"></jsp:include>

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-user"></i> 기본 정보
					</div>
					<div class="card-body">
						<div class="table-responsive">

							<table class="table table-bordered"
								style="border-collapse: collapse; width: 100%;">
								<tbody>
									<tr>
										<th class="studentTableTh" rowspan="5"><img
											class="studentImages"
											src="/Resouces/images/<%=tdto.getSbmImgFile() %>"
											alt="학생증명사진" /></th>
										<th class="studentTableTh">성명</th>
										<td><%=dto.getmName()%></td>
										<th class="studentTableTh">주민등록번호</th>
										<td><%=dto.getmBirth() %> - <%=dto.getmGender() %>******</td>
									</tr>
									<tr>
										<th class="studentTableTh">교육과정</th>
										<td colspan="3"><%=tdto.getTpName() %></td>
									</tr>
									<tr>
										<th class="studentTableTh">교육타입</th>
										<td><%=tdto.getTpType() %></td>
										<th class="studentTableTh">교육기간</th>
										<td><%=tdto.getTpoStartDt() %> ~ <%=tdto.getTpoEndDt() %></td>
									</tr>
									<tr>
										<th class="studentTableTh">본인휴대폰</th>
										<td><c:set var="phoneN" value="<%= dto.getmPhone()%>" />
											${fn:substring(phoneN,0,3) }-${fn:substring(phoneN,3,7) }-${fn:substring(phoneN,7,11) }
										</td>
										<th class="studentTableTh">집전화</th>
										<td><%=dto.getmTel()%></td>
									</tr>
									<tr>
										<th class="studentTableTh">주소</th>
										<td colspan="3"><%=dto.getmAddr1()%></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</div>
			<jsp:include page="/WEB-INF/view/layout/lmsStudentFooter.jsp"></jsp:include>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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