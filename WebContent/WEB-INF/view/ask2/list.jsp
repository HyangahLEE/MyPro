<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
 String currentPage = request.getParameter("currentPage");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->


<title>쌍용교육센터</title>

<style>
a {
	text-decoration: none;
	color: black;
}

table, tr, td {
	border-radius: 3px;
}

table tr td{
	font-size: 0.8em;
	}
/*  
   tr.data:nth-last-child(odd) {
    background: gray;
   }
   
   tr.data:nth-last-child(even) {
       background: #EFEFEF;
   }
    */
tr.data:hover {
	background: #EFEFEF;
}

/* footer {
	position: absolute;
	bottom: 0;
	left: 0;
	right: 0;
} */
</style>
<style>
/* 탭 스타일 */
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px; /*--Set height of tabs--*/
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}

ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	/*--Subtract 1px from the height of the unordered list--*/
	line-height: 31px; /*--Vertically aligns the text within the tab--*/
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px; /*--Pull the list item down 1px--*/
	overflow: hidden;
	position: relative;
	background: #e0e0e0;
}

ul.tabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	/*--Gives the bevel look with a 1px white border inside the list item--*/
	border: 1px solid #fff;
	outline: none;
}

ul.tabs li a:hover {
	background: #ccc;
}

html ul.tabs li.active, html ul.tabs li.active a:hover {
	/*--Makes sure that the active tab does not listen to the hover properties--*/
	background: #fff;
	/*--Makes the active tab look like it's connected with its content--*/
	border-bottom: 1px solid #fff;
}

/*Tab Conent CSS*/
.tab_container {
	border: 1px solid #999;
	border-top: none;
	overflow: hidden;
	clear: both;
	float: left;
	width: 100%;
	background: #fff;
}

.tab_content {
	padding: 20px;
	font-size: 1.2em;
}

</style>




<!--     Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">


<script>
 $(function (){    
   $('#searchBtn').click(function (){
      $('form:first').attr('action','ask2_list.do');
      $('form:first').attr('method','get');
      $('form:first').submit();
   });
   
   
    //When page loads...
   /*   $(".tab_content").hide(); //Hide all content

    $("ul.tabs li").eq(1).addClass("active").show(); //Activate first tab
    $(".tab_content").eq(1).show(); //Show first tab content 

    //On Click Event
    $("ul.tabs li").click(function() {

        $("ul.tabs li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab_content").hide(); //Hide all tab content

        var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        $(activeTab).fadeIn(); //Fade in the active ID content
        return false;
    }); 
    */
   
 });
</script>



</head>

<body>

	<jsp:include page="../main/header.jsp" />
	<jsp:include page="../main/navigator.jsp" />


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			CUSTOMER CENTER <small>문의게시판</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/index.do"><img alt=""
					src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png"
					width="25px" height="25px"></a></li>
			<li class="breadcrumb-item"><a href="/notice_list.do">고객센터</a></li>
			<li class="breadcrumb-item"><a href="/ask_list.do">문의게시판</a></li>
			<li class="breadcrumb-item active">정규교육</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="../include/cuscenter.jsp" />


			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<!-- <img alt="이미지" src="/images/intro_2.jpg"> -->
				<h3>문의게시판</h3>

				<div id="wrapper">

					<!--탭 메뉴 영역 -->
					<ul class="tabs">
						<li><a href="ask_list.do">취업교육</a></li>
						<li><a href="#tab2" style="background-color: white">정규교육</a></li>
					</ul>

					<!--탭 콘텐츠 영역 -->
					<div class="tab_container">


						<div id="tab2" class="tab_content">
							<!--Content-->
							<h5>정규교육</h5>

							<table class="table table-hover" border="1">

								<thead>
									<tr class="table-primary" style="background-color: #343a40;"
										align="center">
										<td scope="col">글번호</td>
										<td scope="col">작성자</td>
										<td scope="col">글제목</td>
										<td scope="col">작성날짜</td>
										<td scope="col">조회수</td>
										<td scope="col">첨부</td>

									</tr>
								</thead>
								<tbody>


									<c:if test="${ empty list }">
										<tr align="center">
											<td scope="row" colspan="6">
												<h3>작성된 게시글이 없습니다.</h3>
											</td>
										</tr>
									</c:if>

									<c:if test="${ not empty list }">
										<c:forEach items="${ list }" var="dto">



											<tr align="center">
												<td>${ dto.anum }</td>
												<td>${ dto.writer }</td>
												<td><c:if test="${ dto.depth gt 0 }">

														<img width="${ dto.depth*10 }px" />
														<img alt="" src="/images/arr.gif" />
													</c:if> <a
													href="ask2_view.do?num=${ dto.anum }&page=${currentPage }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }">${ dto.atitle }</a>
												</td>

												<td>${ dto.awritedt }</td>
												<td>${ dto.areaded }</td>
												<td><a href="filedown.do?filename=${dto.savefile }">${ dto.afile }</a></td>

											</tr>


										</c:forEach>
									</c:if>

								</tbody>
							</table>

							<!-- 페이징 -->
							<nav aria-label="Page navigation example"
								style="position: relative;">
								<ul class="pagination justify-content-center">
									<li class="page-item" style="margin-right: 5px;"><a
										class="page-link" href="#" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
									</a></li>

									<li class="page-item">${paging }</li>
									<li class="page-item" style="margin-left: 5px;"><a
										class="page-link" href="#" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
									</a></li>

									<c:if
										test="${ not empty sessionScope.loginUser|| not empty sessionScope.admin }">
										<div style="position: absolute; right: 10px;">
											<input type="button" value="글쓰기"
												onclick="location.href='ask2_write.do?adid=adId0002'" />
										</div>
									</c:if>

								</ul>
							</nav>


							<!-- 검색 -->
							<form>
								<div style="text-align: center" class="form-inline my-2 my-lg-0">
									<tr>
										<td><select class="custom-select " id="searchCondition"
											name="searchCondition"
											style="margin-left: 220px; width: 100px;">
												<option value="atitle"
													${ param.searchCondition eq "atitle" ? "selected" : "" }>글제목</option>
												<option value="anum"
													${ param.searchCondition eq "anum" ? "selected" : "" }>글번호</option>
												<option value="writer"
													${ param.searchCondition eq "writer" ? "selected" : "" }>작성자</option>
												<option value="acontent"
													${ param.searchCondition eq "acontent" ? "selected" : ""}>내용</option>
												<option value="awritedt"
													${ param.searchCondition eq "awritedt" ? "selected" : ""}>작성날짜</option>
										</select> &nbsp;&nbsp;&nbsp; <input class="form-control mr-sm-2"
											placeholder="검색하기" type="text" name="searchWord"
											style="width: 20%" value='${ param.searchWord }'>
											<button type="button" class="btn btn-secondary my-2 my-sm-0"
												value="검색" id="searchBtn" style="width: 10%">Search</button>


										</td>
									</tr>
								</div>
							</form>


						</div>
					</div>
				</div>
				<!-- /.row -->




			</div>





		</div>
	</div>


	<footer class="py-5 bg-dark" style="width: 100%;">
		<div class="container">
			<jsp:include page="/WEB-INF/view/main/footer.jsp" />
		</div>
	</footer>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>





</body>


<script type="text/javascript">   

    if(${param.error}==-1) alert("비밀번호가 틀렸습니다.");

   </script>

</html>