<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
             <h1 class="mt-4 mb-3">CUSTOMER CENTER
        <small>FAQ</small>
      </h1>

      <ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
		  <li class="breadcrumb-item"><a href="/notice_list.do">고객센터</a></li>
		  <li class="breadcrumb-item active">FAQ</li>
		</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
         <jsp:include page="../include/cuscenter.jsp"/> 
        <!-- <div class="col-lg-3 mb-4">
          <div class="list-group">
           <a href="/notice_list.do" class="list-group-item">공지사항</a>
            <a href="/ask_list.do" class="list-group-item">문의게시판</a>
            <a href="/hire_list.do" class="list-group-item">취업정보</a>
            <a href="/intromain-4.do" class="list-group-item">수강후기</a>
            <a href="/intromain-5.do" class="list-group-item">프로젝트</a>
            <a href="/faq_list.do" class="list-group-item">FAQ</a>
            <a href="/intromain-7.do" class="list-group-item">강의장임대</a>
            <a href="/intromain-8.do" class="list-group-item">결제안내</a>
          </div>
        </div> -->
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">

	<form action="faq_write_ok.do" method="post">
	 <table width="600px" style="margin:50px auto" border="1">
	   
	   <tr>
	     <td width="70" align="center">작성자</td>
	     <td width="330">
	       <input type="text" name="mgid" size="12" value="mgId0001" >
	     </td>
	   </tr>
	<tr>
	
	     <td width="70" align="center">구분</td>
	     <td width="330">
	     <select name="keywords">	     	
	     	<option value="faqdId0001" ${ param.keywords eq "faqdId0001" ? "selected" : "" }>입학관련</option>
	     	<option value="faqdId0002" ${ param.keywords eq "faqdId0002" ? "selected" : "" }>교육비관련</option>
	     	<option value="faqdId0003" ${ param.keywords eq "faqdId0003" ? "selected" : "" }>취업및정부지원</option>
	     </select>
	      </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">제목</td>
	     <td width="330">
	       <input type="text" name="faqtitle" size="50" 
	       value='<c:if test="${ not empty param.ref }">[답글]</c:if>' >
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">내용</td>
	     <td width="330">
	       <textarea rows="13" cols="50" name="faqcontent"></textarea>
	     </td>
	   </tr>
	   
	   <tr>
	     <td colspan="2" align="center">
	       <input type="submit" value="글쓰기">
	       <input type="reset" value="다시작성">
	       <input type="button" value="글목록" onclick="location.href='faq_list.do'">
	 	    </td>
	   </tr>
	 </table>
	 
	
	  
	</form>
</div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <jsp:include page="../main/footer.jsp"/> 
    </footer> 

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>