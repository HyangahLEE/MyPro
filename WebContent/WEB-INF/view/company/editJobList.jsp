<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>쌍용교육센터</title>

<style type="text/css">
	footer {
		margin-top: 143px;
	}
</style>

<!--     Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

</head>

<script type="text/javascript">

	function closeDiv() {
		//location.href='job03.jsp';
		//location.href='/jsp/offer/edit_guin.jsp';
		location.href = "/editJobList.do?com_id=" + document.ff2.cpnum.value;
	}

</script>

<body>

	<jsp:include page="../main/header.jsp" />
	<jsp:include page="../main/navigator.jsp" />


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		 <h1 class="mt-4 mb-3">EMPLOYMENT
        <small>구인의뢰 수정</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
        <li class="breadcrumb-item"><a href="/company.do">인재추천의뢰</a></li>
        <li class="breadcrumb-item active">구인의뢰 수정</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        
      <jsp:include page="../include/companyinclude.jsp"/> 
			
			
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">


				<div id="right-container" class="o3">
					<!-- 사진  or 글 넣기 -->

				</div>

				<tr>
					<td colspan="2">

						<div id="div7">
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								align="center">
								<tr>
									<td align=middle width=139 bgcolor="#CF5757">분야</td>

									<td align=middle width=105 bgcolor="#CF5757">모집분야</td>
									
									<td align=middle width=105 bgcolor="#CF5757">담당업무</td>
									
									<td align=middle width=105 bgcolor="#CF5757">근무지</td>

									<td align=middle width=105 bgcolor="#CF5757">승인여부</td>

								</tr>
								
								
								<tbody>



									<c:if test="${ empty list }">
										<tr class="data">
											<td align="center" colspan="5">
												<h3>신청한 구인의뢰가 없습니다</h3>
											</td>
										</tr>
									</c:if>

								
									<c:if test="${ not empty list }">
										
											<c:forEach items="${ list }" var="dto">
												
												<form action="/editJob.do">
												<tr class="data">
													<!-- <td align="center"></td> -->
													<td align=middle width=139 bgColor=#eeeeee>
														<input type="hidden" name="jrid" value="${ dto.jrid }" />
														<input type="submit" value="수정하기">
													</td>
													<td align=middle width=105 bgColor=#eeeeee>${ dto.jrfields }</td>
													<td align=middle width=105 bgColor=#eeeeee>${ dto.jrrespon }</td>
													<td align=middle width=105 bgColor=#eeeeee>${ dto.jrworkplace }</td>
													<td align=middle width=105 bgColor=#eeeeee>${ dto.jrapproval }</td>
													
												</tr>
												
												</form>
											</c:forEach>
										
									</c:if>

								</tbody>
								

							</table>
						</div>
					</td>
				</tr>



			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<!-- <div align="center">
    
   <img alt="이미지" src="/images/intro.jpg">
    </div> -->


	<!-- Footer -->
	<footer class="py-5 bg-dark">
    	<jsp:include page="../main/footer.jsp"/> 
    </footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>