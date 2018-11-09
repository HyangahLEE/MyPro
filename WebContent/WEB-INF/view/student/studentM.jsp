<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>쌍용 교육센터</title>

<!-- Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/modern-business.css" rel="stylesheet">


<style type="text/css">
footer {
	margin-top: 192px;
}

td {
	font-size: 0.95em;
}
</style>
<script>
function goView(tpid) {
    $("#tpid").val(tpid);
    $("#studentForm").submit();
    //location.href="/incumbentV.do?tpid="+tpid;
};
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/header.jsp" />
	<jsp:include page="/WEB-INF/view/main/navigator.jsp" />



	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			REGULAR CURRICULUM <small>재직자교육과정</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.do"><img alt=""
					src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png"
					width="25px" height="25px"></a></a></li>
			<li class="breadcrumb-item"><a href="/incumbent.do?index=1">재직자교육과정</a></li>
			<li class="breadcrumb-item active">${title }</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="/WEB-INF/view/include/incumbent.jsp" />


			<!-- Content Column -->
			<div class="col-lg-9 mb-4">

				<form action="/incumbentV.do" id="studentForm">
					<input type="hidden" id="tpid" name="tpid" value="" />
				</form>
				<h3>${title }</h3>
				<table>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="3"><img alt="데이터 없음" src="/images/nodata.jpg"></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="list">
								<tr>
									<td style="border-bottom: 1px solid #E6E6E6;">
										<table style="margin: 10px 0;">
											<c:if test="${list.campusname eq '강남쌍용교육센터'}">
												<tr>
													<td rowspan="5"><img width="190px" height="150px"
														alt="강남" src="/images/gangnam.jpg" style="margin-right: 5px;" /></td>
												</tr>
											</c:if>
											<c:if test="${list.campusname eq '강북쌍용교육센터'}">
												<tr>
													<td rowspan="5"><img width="190px" height="150px"
														alt="강북" src="/images/gangbuk.jpg" style="margin-right: 5px;" /></td>
												</tr>
											</c:if>
											<tr>
												<td>강의명 : ${list.tpname }</td>
											</tr>
											<tr>
												<td>강의장소 : ${list.campusname }</td>
											</tr>
											<tr>
												<td>모집인원 : ${list.mcnt }</td>
											</tr>
											<tr>
												<td><button onclick="javascript:goView('${list.tpid}')" class="btn btn-primary">자세히보기</button></td>
											</tr>
										</table>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</table>

			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<footer class="py-5 bg-dark">
		<jsp:include page="../main/footer.jsp" />
	</footer>


	<!-- Bootstrap core JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>

