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

  </head>

  <body>

<jsp:include page="../main/header.jsp"/> 
<jsp:include page="../main/navigator.jsp"/> 


  <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">EDUCATION SERVICE
        <small>기업맞춤교육</small>
      </h1>

     <ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></a></li>
		  <li class="breadcrumb-item"><a href="/eduservice-1.do">취업교육과정</a></li>
		  <li class="breadcrumb-item active">기업맞춤교육</li>
		</ol>


      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <!-- <a href="index.html" class="list-group-item">Home</a> -->
            <a href="/eduservice-1.do" class="list-group-item">취업교육</a>
            <a href="/eduservice-2.do" class="list-group-item">재직자교육</a>
            <a href="/eduservice-3.do" class="list-group-item">기업맞춤교육</a>
            <a href="/eduservice-4.do" class="list-group-item">교육컨설팅</a>
          </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
         <img alt="이미지" src="/images/education3.jpg">
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