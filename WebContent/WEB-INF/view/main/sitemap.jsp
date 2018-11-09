<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>
    

<!--     Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    
<style type="text/css">
	footer {
		margin-top: 200px;
	}
</style>
  </head>

  <body>

<jsp:include page="../main/header.jsp"/> 
<jsp:include page="../main/navigator.jsp"/> 


  <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">CUSTOMER CENTER
        <small>강의장임대</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">쌍용교육센터</a>
        </li>
        <li class="breadcrumb-item active">사이트맵</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <!-- <a href="index.html" class="list-group-item">Home</a> -->
            <a href="/lease.do" class="list-group-item">강의장임대</a>
            <a href="/payguide.do" class="list-group-item">결제안내</a>
          </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
         <img alt="이미지" src="/images/sitemap.jpg">
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