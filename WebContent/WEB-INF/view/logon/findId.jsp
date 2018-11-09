<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.getAttribute("message"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<style type="text/css">
/* .login-img img{
	width:10%; 
	max-height:20%;
	} */
	.container{
	margin-bottom: 62px;
	}
	
</style>
<script>
$(document).ready(function(){
	$("#findPwd").click(function(){
		location.href='/logon/findPwd.do';
	})
	
	
	
	
	//모달
	 $("#btnModal").click(function (){ 
      
       // ajax 처리
        var params = $("form").serialize();
       $.ajax({
           url:"/logon/findId_ok.do",
           dataType:"json",
           type:"post",
           data: params,
           cache:false,           
           success:function(data) {
        	   $("#modalbody")
               .css("color","black")
               .text("아이디는 "+ data.mid+ "입니다.");
        	   
        	   //
        	   $("#idid").text(  $("#mname").val()  );
           },
           error : function( jqXHR, textStatus ) {
           	  alert( "입력하신 회원의 정보가 존재하지 않습니다." );
           }
        })
       
       
        
      /*   $("#exampleModalCenter").modal(); */
    });
    
   
	
	$("form").submit(function(){
        if(!$("#mname").val()){
            alert("이름를 입력하세요.");
           
            event.preventDefault();
            $("#mname").focus();
        }
        
        if(!$("#memail").val()){
            alert("이메일을 입력하세요.");
            
            event.preventDefault();
            $("#memail").focus();
        }
        
        if(!$("#mphone").val()){
            alert("휴대폰번호를 입력하세요.");
            
            event.preventDefault();
            $("#mphone").focus();
        }
      
     })
	


});
</script>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-end" >
  <a class="navbar-brand" href="/index.do"></a>
   <div class="navbar-nav ">
      <img id="sistimg" alt="" src="/images/sist.png" style="margin-right: 1100px; height: 33px" onclick="location.href='/index.do'">       
	  <a class="nav-item nav-link " href="/join/userTerms.do"><small>회원가입</small></a>	  
	  <a class="nav-item nav-link" href="/logon/loginMain.do"><small>로그인</small></a>     
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
	               <h2> <img alt="" src="/images/sist_logo.png">아이디 찾기</h2>
	                </div>
	                <div class="login-form mt-4">
	                <hr>
	                <!--form  -->
	                   <!--  <form action="/logon/findId_ok.do" method="post" > -->
	                  <form method="post">
	                  <div class="form-group">
                        <label for="exampleInputEmail1">이름</label>
                        <input type="text" class="form-control" id="mname" name="mname" value="김초밥" aria-describedby="emailHelp" placeholder="이름을 입력해주세요">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail1">이메일</label>
                        <input type="email" class="form-control" id="memail" name="memail" value="ddwe111@navar.com" aria-describedby="emailHelp" placeholder="가입하신 이메일을 입력해주세요">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword1">휴대폰번호</label>
                        <input type="tel" class="form-control" name="mphone" id="mphone" value="01015745466" placeholder="휴대폰번호를 입력해주세요">
                      </div>
                      <div class="form-check">
                         
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" id="btnModal">아이디 찾기</button>
                        <button class="btn btn-info" type="button" name="findPwd" id="findPwd">비밀번호 찾기</button>
                      </div>
                   </form>
	        </div>
	    </div>
	</div>
	
</div>
</div>
</div>

<jsp:include page="../main/footer.jsp"></jsp:include>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><span id="idid"></span> 님의 아이디</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalbody">
        ${data} 
      </div>
      <div class="modal-footer">       
        
         <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>