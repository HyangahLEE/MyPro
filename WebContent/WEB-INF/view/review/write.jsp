<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!--     Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">


<title>쌍용교육센터</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function() {

   

});
</script>
<style>
a {
	text-decoration: none;
	color: black;
}

table, tr, td {
	border-radius: 3px;
}
/*    footer {
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
	} */
</style>

</head>
<body>

	<jsp:include page="../main/header.jsp" />
	<jsp:include page="../main/navigator.jsp" />


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			CUSTOMER CENTER <small>후기</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/index.do"><img alt=""
					src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png"
					width="25px" height="25px"></a></li>
			<li class="breadcrumb-item"><a href="/notice_list.do">고객센터</a></li>
			<li class="breadcrumb-item"><a href="/review_list.do">후기</a></li>
			<li class="breadcrumb-item active">교육후기</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="../include/cuscenter.jsp" />
			<!-- <div class="col-lg-3 mb-4">
          <div class="list-group">
            <a href="index.html" class="list-group-item">Home</a>
            <a href="/notice_list.do" class="list-group-item">공지사항</a>
            <a href="/ask_list.do" class="list-group-item">문의게시판</a>
            <a href="/curEmp_list.do" class="list-group-item">취업정보</a>
            <a href="/review_list.do" class="list-group-item">수강후기</a>
            <a href="/intromain-5.do" class="list-group-item">프로젝트</a>
            <a href="/intromain-6.do" class="list-group-item">FAQ</a>
            <a href="/intromain-7.do" class="list-group-item">강의장임대</a>
            <a href="/intromain-8.do" class="list-group-item">결제안내</a>
          </div>
        </div> -->
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">


				<!--  <form action="ask_write_ok.do" method="post">  -->

				<!-- 나중에 name 수정  -->
				<form action="review_write_ok.do?rdid=rdId0001" method="post">

					<table width="600px" style="margin: 50px auto" border="1">

						<tr>
							<td width="70" align="center">작성자</td>
							<td width="330"><input type="text" name="writer" size="12"
								value="memberId0001"></td>
						</tr>

						<tr>
							<td width="70" align="center">제목</td>
							<td width="330"><input type="text" name="rtitle" size="50"
								value='<c:if test="${ not empty param.ref }">[답글]</c:if>'>
							</td>
						</tr>
						<tr>
							<td width="70" align="center">내용</td>
							<td width="330"><textarea rows="13" cols="50"
									name="rcontent"></textarea></td>
						</tr>



						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="글쓰기"> <input type="reset" value="다시작성"> <input
								type="button" value="글목록"
								onclick="location.href='review_list.do'"></td>
						</tr>
					</table>



				</form>
			</div>
		</div>
		<!-- /.row -->

	</div>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<jsp:include page="../main/footer.jsp" />
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>