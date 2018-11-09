<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String currentPage = request.getParameter("currentPage");
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
* {
	font-size: 1rem;
}

th {
	width: 33.3%;
	background-color: #6E6E6E;
	color: white;
}

table {
	text-align: center;
	vertical-align: middle;
}
</style>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body id="page-top">

	<jsp:include page="/WEB-INF/view/layout/lmsStudentHeader.jsp"></jsp:include>

	<div id="wrapper">

		<jsp:include page="/WEB-INF/view/layout/lmsStudentNav.jsp"></jsp:include>

		<div id="content-wrapper">

			<div class="container-fluid">


<form action="question_write_ok.do" method="post">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-question-circle"></i> 1:1 문의 게시판
					</div>


						<div class="card-body">
							<div class="table-responsive" style='height: 350px;'>
								<table class="table table-bordered"
									style="width: 100%; cellspacing: 0;">
									<tbody>
										<tr>
											<th>작성자</th>
											<td>
											<input style="width: 100%;" type="text" name="logid" size="12" value="${ sessionScope.loginUser }" >
											</td>
										</tr>
										<tr>
											<th>제목</th>
											<td><input type="text" name="qtitle" size="50"
												style="width: 100%;" autocomplete="off"
												value='<c:if test="${ not empty param.ref }">[답글]</c:if>'>
											</td>
										</tr>

										<tr>
											<th>내용</th>
											<td><textarea style="width: 100%;" rows="6" cols="60"
													name="content"></textarea></td>
										</tr>
									</tbody>

								</table>

								<div style="position: relative;">
									<div style="position: absolute; left: 40%;">
										<input type="submit" class="btn btn-light" value="글쓰기">
										<input type="reset" class="btn btn-light" value="다시작성">
										<input type="button" class="btn btn-light" value="글목록"
											onclick="location.href='question_list.do'">
									</div>
								</div>

							</div>
						</div>

						<!-- 답글 쓰기 : 부모글에 대한 정보 -->
						<input type="hidden" name="p_num" value="${param.num}"> <input
							type="hidden" name="p_ref" value="${param.ref}"> <input
							type="hidden" name="p_step" value="${param.step}"> <input
							type="hidden" name="p_depth" value="${param.depth}">


				</div>
				
					</form>				
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