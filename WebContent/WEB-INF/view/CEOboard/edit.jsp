<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<title>쌍용교육센터</title>
<!--     Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
   
});
</script>
<style>
  a{
     text-decoration: none;
     color:black;
   }
   table,  tr, td {
    border-radius: 3px;
   }
</style>
</head>
<body>

<jsp:include page="../main/header.jsp"/> 
<jsp:include page="../main/navigator.jsp"/> 


  <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">CENTER INTRODUCTION
        <small>CEO컬럼</small>
      </h1>

      <ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
		  <li class="breadcrumb-item"><a href="/intromain.do">센터소개</a></li>
		  <li class="breadcrumb-item active">CEO컬럼</li>
		</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <jsp:include page="../include/introinclude.jsp"/>
        
        
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">

	<form action="ceo_edit_ok.do" method="post">
	 <table width="600px" style="margin:50px auto" border="1">
	   <tr>
	     <td colspan="2" align="right">
	       <a href="ceo_list.do">글목록</a>
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">작성자</td>
	     <td width="330">
	       <input type="text" disabled="disabled" name="ceo" size="12" value="${ dto.ceo }">
	       <input type="hidden" name="ceo" size="12" value="${ dto.ceo }">
	     </td>
	   </tr>
	   
	   <tr>
	     <td width="70" align="center">제목</td>
	     <td width="330">
	       <input type="text" name="ceotitle" size="50" 
	       value='${ dto.ceotitle }'>
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">내용</td>
	     <td width="330">
	       <textarea rows="13" cols="50" name="ceocontent" >${ dto.ceocontent }</textarea>
	     </td>
	   </tr>
	   <tr>
	     <td colspan="2" align="center">
	       <input type="submit" value="저장하기">
	       <input type="reset" value="다시작성">
	       <input type="button" value="글목록" 
	       onclick="location.href='ceo_list.do?page=${ param.page }'">
	     </td>
	   </tr>
	 </table>
	 
	 	<input type="hidden" name="ceoid"  value="${ param.ceoid }">
	    
	</form>
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