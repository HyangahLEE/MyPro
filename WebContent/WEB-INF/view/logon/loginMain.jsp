<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용교육센터</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
/* .login-img img{
	width:10%; 
	max-height:20%;
	} */
	/* 
	.container{
	margin-bottom: 62px;
	}
	 */
	footer{
		margin-top: 167px;
	}
	
</style>
<script>
$(document).ready(function(){
	
	
	$("form").submit(function(){
        if(!$("#memberid").val()){
            alert("아이디를 입력하세요.");
           
            event.preventDefault();
            $("#memberid").focus();
        }
        
        if(!$("#mpwd").val()){
            alert("비밀번호를 입력하세요.");
            
            event.preventDefault();
            $("#memberid").focus();
        }
      
     })
	


});
</script>
</head>
<body>

 <%
      if (request.getAttribute("message") != null) {
   %>
   <script>
      alert("${message}");
   </script>
   <%
      }
   %>

<!-- header -->
<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-end"  style="position: relative;">
  <a class="navbar-brand" href="/index.do"></a>
   <div class="navbar-nav">
      <img id="sistimg" alt="" src="/images/sist.png" onclick="location.href='/index.do'" style="position: absolute; left: 10px;">
	  <a class="nav-item nav-link " href="/join/userTerms.do"><small>회원가입</small></a>	     
      <a class="nav-item nav-link" href="/sitemap.do"><small>사이트맵</small></a>
    </div>
</nav>



<div class="container">
	<div class="row text-center mb-4">
		<div class="col-md-12">
		  
		</div>
	</div>
	<div class="row text-center">
	    <div class="col-md-6 offset-md-3">
	        <div class="card">
	            <div class="card-body">
	                <div class="login-img">
	                    <img src="/images/sist.png">
	                </div>
	                <div class="login-form mt-4">
	                <!--form  -->
	                    <form action="/logon/logon_ok.do" method="post" name="logonok" >
                        <div class="form-row">
                            <div class="form-group col-md-12">
                              <input id="memberid" name="memberid" placeholder="아이디"  class="form-control" type="text">
                            </div>
                            <div class="form-group col-md-12">
                              <input type="password" class="form-control" id="mpwd" name="mpwd" placeholder="비밀번호">
                            </div>
                          </div>
                         <div class="form-row">
                        <div class="form-group">
                                <div class="form-check">
                                  <input class="form-check-input" type="checkbox" value="" id="updatecheck1">
                                  <label class="form-check-label" for="updatecheck1">
                                    <small>로그인 상태 유지 </small>
                                    
                                  </label>
                                 
                                </div>
                              </div>
                    </div>                        
                        
                        <div class="form-row" >
                           
                        </div>
                        <div class="form-row">
                         <button type="submit" class="btn btn-block" style="background-color: rgba(177, 17, 22, 1);color: rgb(251,251,251);width: 131.19;height: 50">로그인</button>
                        <a href="${apiURL}" class="btn  btn-block"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
                    	 </div>
                    </form>
	                </div>
	                <div class="logi-forgot text-right mt-2">
	                	 <a href="../join/userTerms.do">회원가입 </a>&nbsp;&nbsp;
	                 	<a href="/logon/findId.do">아이디 찾기</a>&nbsp;&nbsp;
	                    <a href="/logon/findPwd.do">비밀번호 찾기 </a>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>

  <footer class="py-5 bg-dark">
      <jsp:include page="../main/footer.jsp"/>
      <!-- /.container -->
    </footer>

</body>
</html>