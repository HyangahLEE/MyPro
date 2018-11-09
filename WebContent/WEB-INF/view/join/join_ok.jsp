<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.getAttribute("data"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT리더교육센터</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  
});
</script>

</head>
<body>
	<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-end" >
  <a class="navbar-brand" href="/index.do"></a>
   <div class="navbar-nav ">
      <img id="sistimg" alt="" src="/images/sist.png" style="margin-right: 1100px; height: 33px" onclick="location.href='/index.do'">       
	  <a class="nav-item nav-link " href="/join/userTerms.do"><small>회원가입</small></a>	
	  <a class="nav-item nav-link " href="/join/loginMain.do"><small>로그인</small></a>	     
      <a class="nav-item nav-link" href="#"><small>사이트맵</small></a>  
    </div>
</nav>  -->

	<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-end" style="position: relative;">
  <a class="navbar-brand" href="/index.do"></a>
  <!-- <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> -->
  
    <div class="navbar-nav ">
<!--     <img id="sistimg" alt="" src="/images/sist.png" style="margin-right: 1100px; height: 33px" onclick="location.href='/index.do'"> -->
        <img id="sistimg" alt="" src="/images/itleader.png" onclick="location.href='/index.do'" style="position: absolute; left: 10px;">
     
   <%--  <c:forEach items="${dto }" var="dto">
    ${dto.mname }님 환영합니다.
    </c:forEach> --%>
	      
	       <a class="nav-item nav-link " href="/join/userTerms.do"><small>회원가입</small></a>
	      <a class="nav-item nav-link active" href="/logon/loginMain.do"><small>로그인</small></a>
	      
	  
		
      
      <a class="nav-item nav-link" href="/sitemap.do"><small>사이트맵</small></a>
     
    </div>
 
</nav>
	<jsp:include page="../main/navigator.jsp" />

	<!-- Page Content -->
	<div class="container">

		<input type="hidden" value=${ data } />
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			${param.mname } <small>님의 가입을 축하드립니다!!</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item ">이메일 주소 인증이 전송되었습니다. 로그인하려면 이메일을
				인증해주세요.</li>
		</ol>

		<!-- <p>Most of Start Bootstrap's unstyled templates can be directly integrated into the Modern Business template. You can view all of our unstyled templates on our website at
        <a href="http://startbootstrap.com/template-categories/unstyled">http://startbootstrap.com/template-categories/unstyled</a>.</p>
 -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="../main/footer.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>