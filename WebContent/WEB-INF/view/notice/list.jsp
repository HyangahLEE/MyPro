<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String currentPage = request.getParameter("currentPage");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>쌍용교육센터</title>

<!--     Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
<link href="/css/modern-business.css" rel="stylesheet">

<style>
a {
	text-decoration: none;
	color: black;
}

table, tr, td {
	border-radius: 3px;
}

tr.data:hover {
	background: #EFEFEF;
}

table tr td{
	font-size: 0.9em;
	}

</style>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<script>
 $(function (){	 
	$('#searchBtn').click(function (){
		$('form:first').attr('action','notice_list.do');
		$('form:first').attr('method','get');
		$('form:first').submit();
	});
 });
</script>

</head>
<body>
	<script type="text/javascript">   

    if(${param.error}==-1) {
    	
    	alert("비밀번호가 틀렸습니다.");
    	
    }
    	
    </script>



	<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/main/navigator.jsp" />

	<div class="container">

		<!-- Page Content -->
		<div class="container">

			<!-- Page Heading/Breadcrumbs -->
			<h1 class="mt-4 mb-3">
				CUSTOMER CENTER <small>공지사항</small>
			</h1>


			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/index.do"><img alt=""
						src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png"
						width="25px" height="25px"></a></li>
				<li class="breadcrumb-item"><a href="/notice_list.do">공지사항</a></li>
				<li class="breadcrumb-item active">공지사항</li>
			</ol>
			<!--  Content Row -->
			<div class="row">
				<!--   Sidebar Column -->
				<jsp:include page="../include/cuscenter.jsp" />



				<!-- Content Column -->
				<div class="col-lg-9 mb-4">


					<h5>공지사항</h5>
					<!-- style="width:700px;margin:50px auto" -->
					<table class="table table-hover" border="1">

						<thead>
							<!-- 	<th style="background:gray;color:white;font-weight:bold"> -->
							<tr class="table-primary" style="background-color: #343a40;"
								align="center">
								<th scope="col">번호</th>
								<th scope="col">글제목</th>
								<th scope="col">작성날짜</th>
								<th scope="col">조회수</th>

							</tr>
						</thead>
						<tbody>

							<c:if test="${ empty list }">
								<tr align="center">
									<td scope="row" colspan="4">
										<h3>작성된 게시글이 없습니다.</h3>
									</td>
								</tr>
							</c:if>

							<c:if test="${ not empty list }">
								<c:forEach items="${ list }" var="dto">
									<tr align="center">
										<td>${ dto.nnum }</td>
										<td><a
											href="notice_view.do?num=${ dto.nnum }&page=${currentPage }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }">${ dto.ntitle }</a>
										</td>
										<td>${ dto.nwritedt }</td>
										<td>${ dto.nreaded }</td>

									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>

					<!--페이징  -->
					<nav aria-label="Page navigation example"
						style="position: relative;">
						<ul class="pagination justify-content-center">
							<li class="page-item" style="margin-right: 5px;"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
							</a></li>

							<li class="page-item">${paging }</li>
							<li class="page-item" style="margin-left: 5px;"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
									class="sr-only">Next</span>
							</a></li>

							<c:if test="${not empty sessionScope.admin }">
								<div style="position: absolute; right: 10px;">
									<input type="button" value="글쓰기"
										onclick="location.href='notice_write.do'" />
								</div>
							</c:if>

						</ul>
					</nav>

					<%-- <div>
		 <tr>
		 	<td align="center" colspan="3">		 
			  	 	${ paging }
			<td>
		</tr>
	</div> --%>

					<!-- 검색  -->
					<form>
						<div style="text-align: center" class="form-inline my-2 my-lg-0">
							<tr>
								<!-- <td colspan="6" align="center" style="padding:3px;"> -->
								<td><select class="custom-select" id="searchCondition"
									name="searchCondition"
									style="margin-left: 220px; width: 100px;">
										<option value="ntitle"
											${ param.searchCondition eq "ntitle" ? "selected" : "" }>글제목</option>
										<option value="ncontent"
											${ param.searchCondition eq "ncontent" ? "selected" : ""}>내용</option>
										<option value="nnum"
											${ param.searchCondition eq "nnum" ? "selected" : ""}>글번호</option>
										<option value="mgid"
											${ param.searchCondition eq "mgid" ? "selected" : ""}>작성자</option>
								</select> &nbsp;&nbsp;&nbsp; <input class="form-control mr-sm-2"
									placeholder="검색하기" type="text" name="searchWord"
									style="width: 20%" value='${ param.searchWord }'>
									<button type="button" class="btn btn-secondary my-2 my-sm-0"
										value="검색" id="searchBtn" style="width: 10%">Search</button></td>
							</tr>
						</div>
					</form>

				</div>
			</div>
			<!-- /.row -->
		</div>
	</div>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<jsp:include page="../main/footer.jsp" />
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>





</body>
</html>