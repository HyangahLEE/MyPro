<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>쌍용교육센터</title>
    

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
      <h1 class="mt-4 mb-3">EMPLOYMENT
        <small>수료생장점</small>
      </h1>

      <ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
		  <li class="breadcrumb-item"><a href="/company.do">인재추천의뢰</a></li>
		  <li class="breadcrumb-item active">SIST수료생 장점</li>
		</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <jsp:include page="../include/companyinclude.jsp"/> 
        
        
        
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
         	
         	<div id="right-container" class="o4">			
				<!-- 공백 -->
			</div>

			<div class="sub_content_center_wrap">
				<table>
			            	
					  <tr>
						<td><table width="690" border="0" cellspacing="0" cellpadding="0">
						  <tr>
							<td><img src="http://www.sist.co.kr/images/talente/inf0401_text1.jpg"></td>
						  </tr>
						</table></td>
					  </tr>
				</table>
			</div>
         	
         </div>
      </div>
      <!-- /.row -->

    </div>
    


    <!-- Footer -->
    <footer class="py-5 bg-dark">
     	<jsp:include page="../main/footer.jsp"/> 
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>