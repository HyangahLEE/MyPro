<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--     Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    

<title>쌍용교육센터</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function() {

   

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
         <h1 class="mt-4 mb-3">CUSTOMER CENTER
        <small>문의게시판</small>
      </h1>

      <ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
		  <li class="breadcrumb-item"><a href="/notice_list.do">고객센터</a></li>
		  <li class="breadcrumb-item"><a href="/ask_list.do">문의게시판</a></li>
		  <li class="breadcrumb-item active">정규교육</li>
		</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
         <jsp:include page="../include/cuscenter.jsp"/> 
       
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
   
            
	<!--  <form action="ask_write_ok.do" method="post">  -->
	 <form action="ask2_write_ok.do" method="post" enctype="Multipart/form-data"> 
	
	 <table width="600px" style="margin:50px auto" border="1">
	   
	   <tr>
	     <td width="70" align="center">작성자</td>
	     <td width="330">
	       <input type="text" name="writer" size="12" value="${ sessionScope.loginUser}" >
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">이메일</td>
	     <td width="330">
	       <input type="text" name="email" size="30" >
	     </td>
		   </tr>
	   <tr>
	     <td width="70" align="center">제목</td>
	     <td width="330">
	       <input type="text" name="atitle" size="50" 
	       value='<c:if test="${ not empty param.ref }">[답글]</c:if>' >
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">내용</td>
	     <td width="330">
	       <textarea rows="13" cols="50" name="acontent"></textarea>
	     </td>
	   </tr>
	   
	    <tr>
	     <td width="70" align="center">파일</td>
	     <td width="330">
	       <input  type="file" name="afile">
	     </td>
	   </tr>	   
	   <tr>
	     <td width="70" align="center">비밀번호</td>
	     <td width="330">
	       <input type="password" name="pass" size="10" >
	     </td>
	   </tr>
	   <tr>
	     <td colspan="2" align="center">
	       <input type="submit" value="글쓰기">
	       <input type="reset" value="다시작성">
	       <input type="button" value="글목록" onclick="location.href='ask2_list.do'">
	 	    </td>
	   </tr>
	 </table>
	 
	 <!-- 탭 구분자 -->
	
	    <input type="hidden" name="adid"  value="${param.adid}">	    
	 
	 	<!-- 답글 쓰기 : 부모글에 대한 정보 -->
	    <input type="hidden" name="p_num"  value="${param.num}">
	    <input type="hidden" name="p_ref"  value="${param.ref}">
	    <input type="hidden" name="p_step"  value="${param.step}">
	    <input type="hidden" name="p_depth"  value="${param.depth}"> 
	    
	</form>
 </div>
      </div>
      <!-- /.row -->

    </div>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <jsp:include page="../main/footer.jsp"/> 
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 

</body>
</html>