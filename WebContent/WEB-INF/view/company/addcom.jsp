<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>쌍용교육센터</title>


<!--     Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/modern-business.css" rel="stylesheet">

<style>
	footer{
		margin-top: 200px;
	}
</style>


</head>

<body>

	<jsp:include page="../main/header.jsp" />
	<jsp:include page="../main/navigator.jsp" />


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			EMPLOYMENT <small>업체등록관리</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item">
			<a href="/index.do">
			<img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px">
			</a>
			</li>
			<li class="breadcrumb-item"><a href="/company.do">인재추천의뢰</a></li>
			<li class="breadcrumb-item active">업체등록관리</li>
		</ol>




		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="../include/companyinclude.jsp" />


			<!-- Content Column -->
			<div class="col-lg-9 mb-4">


				
		<tr> 
          <td height="59" align="center"> 
            <table width="90%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td align="center"><strong><font color="#FF6600">업체등록</font></strong>이 완료되었습니다</td>
              </tr>
            </table>
          </td>
        </tr>	
			
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

</body>

</html>