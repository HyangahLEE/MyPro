<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%
String memberId = (String) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>쌍용교육센터</title>
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
th {
	width: 33.3%;
}
table {
	text-align: center;
	vertical-align: middle;
}
</style>

<script>
	$(document).ready(function(){
	
	});
</script>
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
						<i class="fas fa-file-download"></i> 과정 관련 참고 안내서
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" style="width: 100%; cellspacing: 0;">
								<tbody>
									<tr>
										<th>과정명</th>
										<th>학습안내서</th>
										<th>교수계획서</th>
									</tr>
									
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="dto" varStatus="status">
										<tr>
											<td>${dto.tpName }</td>
												<!-- 학습안내서 -->
												<td>
													<c:if test="${! empty dto.tpGuideBook }">	<!-- "WebContent/upload/테스트.txt" -->
															<button type="button" class="btn btn-primary" onclick="location.href='/fileDown.do?fileName=테스트.txt'">다운로드</button>
													</c:if>
													<c:if test="${empty dto.tpGuideBook }">
															<p></p>
													</c:if>
												</td>
												<!-- 교수계획서 -->
												<td>
													<c:if test="${! empty dto.pGuide }">
														<button type="button" class="btn btn-danger">다운로드</button>
													</c:if>
													<c:if test="${empty dto.pGuide }">
														<p></p>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</c:if>

								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
			<jsp:include page="/WEB-INF/view/layout/lmsStudentFooter.jsp"></jsp:include>
		</div>
	</div>

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