<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	margin-bottom: 62px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
<script>
$(document).ready(function(){
  
	$("#findId").click(function(){
		location.href='/logon/findId.do';
	})
	
 	$("#findpwd").click(function(){
		 
   /*  $("#exampleModal").modal(); */
 		$("#gotoLogon").click(function(){
 				 
 		 $("form").submit();
 				 
 		})
 		
		
	})
	 
});
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/> 



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
	               <h2><img alt="" src="/images/sist_logo.png">비밀번호 찾기</h2>
	                </div>
	                <div class="login-form mt-4">
	                <hr>
	                <!--form  -->
	                   <!--  <form action="/logon/findId_ok.do" method="post" > -->
	                  <form action="/logon/findPwd_ok.do" method="post">
	                  <div class="form-group">
                        <label for="exampleInputId">아이디</label>
                        <input type="text" class="form-control" id="memberid" name="memberid" value="dlgiddk20" aria-describedby="emailHelp" placeholder="아이디을 입력해주세요">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputName">이름</label>
                        <input type="text" class="form-control" id="mname" name="mname" value="이향아" aria-describedby="emailHelp" placeholder="이름을 입력해주세요">
                      </div>  
                      <div class="form-group">
                        <label for="exampleInputId">이메일</label>
                        <input type="hidden" name="from" value="dlgiddk30@naver.com" >
                        <input type="text" class="form-control" id="memail" name="memail" value="dlgiddk20@gmail.com" aria-describedby="emailHelp" placeholder="이메일을 입력해주세요">
                      </div>                   
                      <div class="form-check">                         
                        <button type="button" class="btn btn-primary" id="findId">아이디 찾기</button>
                        <button class="btn btn-info" type="button" name="findpwd" id="findpwd" data-toggle="modal" data-target="#exampleModal" >비밀번호 찾기</button> 
                      
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
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="modalbody">
        회원님의 비밀번호가 이메일로 전송되었습니다.<br> 다시 로그인 해주세요.
      </div>
      <div class="modal-footer">       
        <!--  -->
           <button type="button" class="btn btn-secondary" id="gotoLogon" >로그인</button>
         <button type="button" class="btn btn-secondary" id="modalClose" data-dismiss="modal" >닫기</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>