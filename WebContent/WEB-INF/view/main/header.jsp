<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/modern-business.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>IT리더교육센터</title>
<style type="text/css">
body {
  padding-top: 2px;
}
#sistimg{
/* margin: 20px; */

display: inline-block;
}

#sistimg:hover{
cursor: pointer;
}

a {
	display: inline-block;
}

.navbar-nav  {
	float: right;
}

</style>
</head>
<body>


 <!-- 회원가입, 로그인, 사이트맵  -->

<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-end" style="position: relative;">
  <a class="navbar-brand" href="/index.do"></a>
  <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> -->
  
    <div class="navbar-nav ">
<!--     <img id="sistimg" alt="" src="/images/sist.png" style="margin-right: 1000px; height: 33px" onclick="location.href='/index.do'"> -->
        <img id="sistimg" alt="" src="/images/itleader.png" onclick="location.href='/index.do'" style="position: absolute; left: 100px;">
     
   <%--  <c:forEach items="${dto }" var="dto">
    ${dto.mname }님 환영합니다.
    </c:forEach> --%>
	      <c:if test="${ empty sessionScope.loginUser &&  empty sessionScope.state   }">
	       <a class="nav-item nav-link " href="/join/userTerms.do"><small>회원가입</small></a>
	      <a class="nav-item nav-link active" href="/logon/loginMain.do"><small>로그인</small></a>
	      
	      </c:if>
		 <c:if test="${ not empty sessionScope.loginUser || not empty sessionScope.state }">
		<!--   <a class="nav-item nav-link active" href="javascript:click_logout();">로그아웃</a> -->

		 <a class="nav-item nav-link active" href="/logon/logout.do" onclick="return logout();"><small>로그아웃</small></a>
		 </c:if>
      
      <a class="nav-item nav-link" href="/sitemap.do"><small>사이트맵</small></a>
     
    </div>
 
</nav>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
</script>
 
   <script type="text/javascript">
      function logout() {
         $.ajax({
            type : "POST",
            dataType : 'text',
            url : "http://nid.naver.com/nidlogin.logout",
            crossDomain : true,
            xhrFields : {
               withCredentials : true
            }
         }).done(function(data) {
 
            $('#logout').submit();
         }).fail(function(xhr, textStatus, errorThrown) {
 
            $('#logout').submit();
         });
         alert("로그아웃 되었습니다");
      }
   </script> -->




<script type="text/javascript">
function logout() {
	 var result =  window.confirm("로그아웃 하시겠습니까?");
	//alert(result);// 넵 ==true / 놉 == false
	if(result){ //t
		self.close();
		location.href="/logon/logout.do";
		return true;
	//	window.close();
	}else{
		/* location.href="/index.do"; */
		return false;
	}
}
</script>
</body>
</html>