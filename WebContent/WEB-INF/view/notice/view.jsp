<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!--     Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
<link href="/css/modern-business.css" rel="stylesheet">



<!-- 모달을 방해하는 놈, 무엇? -->
<!--  <link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  -->
<!-- 모달을 쓰는 참조 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- <script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->
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
	$(document).ready(function() {
		$("#btnModalDelete").click(function() {
			$("#exampleModalCenter").modal("show");
		});

		// Delete.jsp 복사 붙이기 ㅋㅋ
		$("#btnDelete").click(function() {
			// alert("test");
			if (confirm("정말 삭제합니까? ")) {

				/*      // delete.do?num=1&cp&sc&sw */
				$("#form1").submit();
			}
		});

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
			고객센터 <small>공지사항</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/index.do"><img alt=""
					src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png"
					width="25px" height="25px"></a></li>
			<li class="breadcrumb-item"><a href="/notice_list.do">공지사항</a></li>
			<li class="breadcrumb-item active">공지사항</li>
		</ol>

		<!--    Content Row -->
		<div class="row">
			<!--  Sidebar Column -->

			<jsp:include page="../include/cuscenter.jsp" />



			<!--   Content Column -->
			<div class="col-lg-9 mb-4">


				<table width="600" style="margin: 50px auto" border="1">
					<!-- <tr>
         <td colspan="2" align="right">글보기</td>
      </tr> -->
					<tr>
						<td width="70" align="center">글번호</td>
						<td width="330">${ dto.nnum }</td>
					</tr>
					<tr>
						<td width="70" align="center">조회수</td>
						<td width="330">${ dto.nreaded }</td>
					</tr>
					<tr>
						<td width="70" align="center">작성자</td>
						<td width="330">${ dto.mgid }</td>
					</tr>
					<tr>
						<td width="70" align="center">작성일자</td>
						<td width="330">${ dto.nwritedt }</td>
					</tr>
					<tr>
						<td width="70" align="center">글제목</td>
						<td width="330">${ dto.ntitle }</td>
					</tr>
					<tr>
						<td width="70" align="center">글내용</td>
						<td width="330">
							<div style="width: 100%; height: 200px; overflow: scroll;">${ dto.ncontent }
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right"><c:if
								test="${not empty sessionScope.admin }">
								<input type="button" value="글수정"
									onclick="location.href='notice_edit.do?num=${ dto.nnum }&page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
								<%-- <a href="delete.do?num=${ dto.nnum }">글삭제</a> --%>
								<input type="button" id="btnModalDelete" data-toggle="modal"
									data-target="#exampleModalCenter" value="글삭제">
								<%-- 
       <input type="button" value="글삭제" 
       onclick="location.href='Delete.do?num=${ vo.num }&currentPage=${currentPage}'">
        --%>
								<input type="button" value="답글"
									onclick="location.href='notice_write.do?num=${ dto.nnum } &ref=${ dto.ref }&step=${ dto.step }&depth=${ dto.depth }'">
							</c:if> <input type="button" value="글목록"
							onclick="location.href='notice_list.do?page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
						</td>
					</tr>
					<
					<!-- tr>
         <td colspan="2" align="center">
            days03/Ex01.jsp 
      <input type="button" id="btnModalDelete"
            value="모달창으로 글 삭제">
         </td>
      </tr> -->
				</table>

			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->


	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<jsp:include page="../main/footer.jsp" />
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



	<!-- 모다아아아ㅏㄹ -->


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
					<form id="form1" action="notice_delete.do" method="post">
						<table width="300px" border="1" align="center">
							<tr>
								<td>비밀 번호 입력하세요?</td>
							</tr>
							<tr>
								<td><input type="password" name="pass"> <input
									type="hidden" name="num" value="${ param.num }"></td>
							</tr>
							<tr>
								<td><input type="button" id="btnDelete" value="글삭제" /> <input type="button"  onclick="notice_list.do?page=${param.page }" id="btnList" value="글목록"/>
									<a href="notice_list.do?page=${param.page }">글목록</a>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button></td>
							</tr>
						</table>
					</form>
				</div> --%>



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
					<form id="form1" action="notice_delete.do" method="post">

						<p>비밀 번호 입력하세요?</p>

						<input type="password" name="pass"> <br /> <input
							type="hidden" name="num" value="${ param.num }"><br />
						<hr />
						<div style="float: right;">
							<input type="button" id="btnDelete" value="글삭제"
								class="btn btn-danger" />
							<%-- <input type="button"  onclick="notice_list.do?page=${param.page }" id="btnList" value="글목록"/> --%>

							<button type="button"
								onclick="location.href='notice_list.do?page=${param.page }'"
								class="btn">글목록</button>
							<%--                            <a href="notice_list.do?page=${param.page }" >글목록</a> --%>
							<button type="button" data-dismiss="modal" class="btn">취소</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>



	<!-- Modal -->
	<%-- <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog" style="width: 350px">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">게시물 삭제</h4>
            </div>
            <div class="modal-body">
               <!-- Delete.jsp 복사 붙이기.  -->
               <div style="text-align: center">
                  <form id="form1" action="notice_delete.do" method="post">
                     <table width="300px" border="1" align="center">
                        <tr>
                           <td>비밀 번호 입력하세요?</td>
                        </tr>
                        <tr>
                           <td>
                           <input type="password" name="pass"> 
                           <input type="hidden" name="num" value="${ param.num }"></td>
                        </tr>
                        <tr>
                           <td><input type="button" id="btnDelete" value="글삭제">
                              <a href="notice_list.do?page=${param.page }">글목록</a></td>
                        </tr>
                     </table>
                  </form>
               </div>

            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
         </div>

      </div>
   </div>
    --%>


</body>
</html>