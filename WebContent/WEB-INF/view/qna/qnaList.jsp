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

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-question-circle"></i> 1:1 문의 게시판
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered"
								style="width: 100%; cellspacing: 0;">
								<tbody>
									<tr>
										<th style="width: 20%;">번호</th>
										<th style="width: 60%;">글제목</th>
										<th style="width: 20%;">작성날짜</th>
									</tr>

									<c:if test="${ empty list }">
										<tr class="data">
											<td align="center" colspan="6"><i
												class="fas fa-exclamation-triangle"></i> <span
												style="margin-left: 5px;">작성한 문의 게시글이 없습니다.</span></td>
										</tr>
									</c:if>


									<c:if test="${ not empty list }">
										<c:forEach items="${ list }" var="dto">
											<tr class="data">
												<td align="center">${ dto.qid }</td>
												<td><c:if test="${ dto.depth gt 0 }">

														<img width="${ dto.depth*10 }px" />
														<img alt="오리" src="/images/arr.gif" />
													</c:if> <a
													href="question_view.do?num=${ dto.qid }&page=${currentPage }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }">${ dto.qtitle }</a>
												<td>${ dto.qdate }</td>
											</tr>
										</c:forEach>
										<tr>
											<td align="center" colspan="3">${ paging }</td>
										</tr>
									</c:if>
								</tbody>
							</table>

							<button class="btn btn-secondary"
								onclick="location='question_write.do'"
								style="float: right; color: white;">글쓰기</button>

							<form style="width: 100%; position: relative;">
								<div
									style="vertical-align: middle; position: absolute; left: 35%;">
									<select id="searchCondition" name="searchCondition">
										<option value="qtitle"
											${ param.searchCondition eq "qtitle" ? "selected" : "" }>글제목</option>
										<option value="content"
											${ param.searchCondition eq "content" ? "selected" : ""}>내용</option>
										<option value="qid"
											${ param.searchCondition eq "qid" ? "selected" : ""}>글번호</option>
									</select> <input type="text" name="searchWord" style="margin: 0 10px;"
										value='${ param.searchWord }'> <input type="button"
										class="btn btn-light" value="검색" id="searchBtn">
								</div>
							</form>
							
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