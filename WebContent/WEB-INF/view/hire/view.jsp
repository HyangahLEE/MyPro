<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<!--     Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- 모달을 방해하는 놈, 무엇? -->
<!--  <link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">   -->
<!-- 모달을 쓰는 참조 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- <script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 -->

<title>쌍용교육센터</title>
<style>
a {
	text-decoration: none;
	color: black;
}

table {
	border-spacing: 1px;
	border-collapse: separate;
}

table, tr, td {
	border-radius: 3px;
	padding: 3px;
}
</style>

<script>
$(document).ready(function (){
    $("#btnModalDelete").click(function (){ 
       $("#exampleModalCenter").modal("show");
    });
    
    // Delete.jsp 복사 붙이기 ㅋㅋ
  
    

    
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
			CUSTOMER CENTER <small>취업정보</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/index.do"><img alt=""
					src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png"
					width="25px" height="25px"></a></li>
			<li class="breadcrumb-item"><a href="/notice_list.do">고객센터</a></li>
			<li class="breadcrumb-item"><a href="/hire_list.do">취업정보</a></li>
			<li class="breadcrumb-item active">채용정보</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="../include/cuscenter.jsp" />


			<!-- Content Column -->
			<div class="col-lg-9 mb-4">


				<table width="600" style="margin: 50px auto" border="1">

					<tr>
						<td colspan="2">
							<p class="bc_content_top">
								<span class="bc_write"> <img
									src="http://www.sist.co.kr/images/recruit/t_text_01.jpg"
									width="80" height="25"> :
								</span> <span class="com_title">${dto.companyname}&nbsp;${dto.homepage}
								</span>

							</p>
						</td>


					</tr>
					<tr>
						<td colspan="2"><span class="bc_write"><img
								src="http://www.sist.co.kr/images/recruit/t_text_02.jpg"
								width="80" height="25"> : &nbsp;&nbsp;</span>${dto.hiwritedt }</td>
					</tr>
					<tr>
						<td><span class="bc_write"><img
								src="http://www.sist.co.kr/images/recruit/t_text_03.jpg"
								width="80" height="25"> : &nbsp;&nbsp;</span>${dto.hnumber }</td>
						<td><span class="bc_write"><img
								src="http://www.sist.co.kr/images/recruit/t_text_04.jpg"
								width="80" height="25"> : &nbsp;&nbsp;</span>${dto.htype }</td>
					</tr>
					<tr>
						<td><span class="bc_write"><img
								src="http://www.sist.co.kr/images/recruit/t_text_05.jpg"
								width="80" height="25"> : &nbsp;&nbsp;</span>${dto.hiworkplace }
						</td>
						<td><span class="bc_write"><img
								src="http://www.sist.co.kr/images/recruit/t_text_06.jpg"
								width="80" height="25"> : &nbsp;&nbsp;</span>${dto.hpossi }</td>
					</tr>
					<tr>
						<td><span class="bc_write"><img
								src="http://www.sist.co.kr/images/recruit/t_text_07.jpg"
								width="80" height="25"> : &nbsp;&nbsp;</span>${dto.hpay }</td>
						<td><span class="bc_write"><img
								src="http://www.sist.co.kr/images/recruit/t_text_08.jpg"
								width="80" height="25"> : &nbsp;&nbsp;</span>${dto.deadline }</td>
					</tr>
					<tr>
						<td><span class="bc_write"><img
								src="http://www.sist.co.kr/images/recruit/t_text_09.jpg"
								width="80" height="25"> : &nbsp;&nbsp;</span>${dto.htel }</td>
						<td><span class="bc_write"><img
								src="http://www.sist.co.kr/images/recruit/t_text_10.jpg"
								width="80" height="25"> : &nbsp;&nbsp;</span>${dto.hiemail }</td>
					</tr>
					<tr>
						<td colspan="2" class="end">

							<div class="bc_content_text">${dto.hicontent }</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right" class="none_td">
							<p class="bc_content_bottom">
								<input type="button" onclick="location.href='hire_list.do'"
									value="글목록"></a>
								<c:if test="${not empty sessionScope.admin }">
									<input type="button" id="btnModalDelete" data-toggle="modal"
										data-target="#exampleModalCenter" value="글삭제">
								</c:if>
							</p>

						</td>
					</tr>
				</table>



			</div>
		</div>
		<!-- /.row -->

	</div>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<jsp:include page="../main/footer.jsp" />
	</footer>

	<!--  <!-- Bootstrap core JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>





	<!-- Modal -->
<%-- 	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">게시물삭제</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="form1" action="hire_delete.do?num=${param.num}"
						method="post">
						<table width="300px" border="1" align="center">
							<tr>
								<td>정말로 삭제하시겠습니까?</td>
							</tr>
							<tr>
                           <td>
                           <input type="password" name="pass"> 
                           <input type="hidden" name="num" value="${ param.num }"></td>
                        </tr>
							<tr>
								<td><input type="submit" id="btnDelete" value="글삭제" /> <input type="button"  onclick="notice_list.do?page=${param.page }" id="btnList" value="글목록"/>
									<a href="hire_list.do?page=${param.page }">글목록</a>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button></td>
							</tr>
						</table>
					</form>
				</div>

			</div>
		</div>
	</div>
 --%>


	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">게시물삭제</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					<form id="form1" action="hire_delete.do?num=${param.num}"
						method="post">

						<p>정말 삭제하시겠습니까?</p>

                           <input type="hidden" name="num" value="${ param.num }">
                           
						<hr />
						<div style="float: right;">
							<input type="submit" id="btnDelete" value="글삭제" class="btn btn-danger" />
								
							<%-- <input type="button"  onclick="notice_list.do?page=${param.page }" id="btnList" value="글목록"/> --%>

							<button id="btnList" type="button" onclick="hire_list.do?page=${param.page }'" class="btn">글목록</button>
							<%--                            <a href="notice_list.do?page=${param.page }" >글목록</a> --%>
							<button type="button" data-dismiss="modal" class="btn">취소</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>




</body>
</html>