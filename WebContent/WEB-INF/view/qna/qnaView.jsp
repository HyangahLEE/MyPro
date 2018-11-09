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
											<th>글번호</th>
											<td>${ dto.qid }</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>${ dto.logid }</td>
										</tr>

										<tr>
											<th>작성일자</th>
											<td>${ dto.qdate }</td>
										</tr>

										<tr>
											<th>글제목</th>
											<td>${ dto.qtitle }</td>
										</tr>

										<tr>
											<th>글내용</th>
											<td>${ dto.content }</td>
										</tr>

									</tbody>

								</table>

								<div style="position: relative;">
									<div style="position: absolute; left: 40%;">
										<input type="button" class="btn btn-light" value="글수정" onclick="location.href='question_edit.do?num=${ dto.qid }&page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
										<input type="button" id="btnModalDelete" class="btn btn-light"
											data-toggle="modal" data-target="#deleteModal" value="글삭제" style="margin: 0 7px;">
<%-- 										<input type="button" class="btn btn-light" value="답글"
											onclick="location.href='question_write.do?num=${ dto.qid }&ref=${ dto.ref }&step=${ dto.step }&depth=${ dto.depth }'" style="margin-right: 7px;"> --%>
										<input type="button" class="btn btn-light" value="글목록"
											onclick="location.href='question_list.do?page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">

									</div>
								</div>

							</div>
						</div>

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

	<!-- Logout Modal-->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 삭제 -->
					<img src="/Resouces/images/sistLogo.png" alt="쌍용교육센터"
						style="width: 130px;" />
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form id="form1" action="question_delete.do" method="get">
					<div class="modal-body">정말 삭제하시겠습니까?</div>
					<div class="modal-footer">

						<input type="hidden" name="num" value="${param.num }" /> <input
							type="submit" class="btn btn-light" id="btnDelete" value="글삭제" />
<%-- 						<button class="btn btn-light" style="margin: 0 10px;"
							onclick="location='question_list.do?page=${param.page }'">글목록</button> --%>
						<button type="button" class="btn btn-light" data-dismiss="modal" style="margin-left: 10px;">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>


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