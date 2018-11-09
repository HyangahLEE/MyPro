<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>IT리더교육센터</title>

<!-- Bootstrap core CSS-->
<link href="/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/css/sb-admin.css" rel="stylesheet">

<script>
	function checkValue() {
		if (document.loginInfo.mgId.value.length == 0) {
			alert("아이디를 입력하세요.");
			loginInfo.mgId.focus();
			return false;
		}
		if (document.loginInfo.mPwd.value == "") {
			alert("비밀번호를 입력하세요.");
			loginInfo.mPwd.focus();
			return false;
		}
		return true;
	}
</script>

</head>
<body class="bg-dark">

	<%
		if (request.getAttribute("message") != null) {
	%>
	<script>
		alert("${message}");
	</script>
	<%
		}
	%>

	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">
				<img src="/images/itleader.png" alt="IT리더교육센터" />
			</div>
			<div class="card-body">
			
				<form action="/loginCheck_manager.do" method="post" name="loginInfo">
					<div class="form-group">
						<div class="form-label-group">
							<input type="text" id="mgId" name="mgId" class="form-control"
								placeholder="Id" required="required" autofocus="autofocus"
								autocomplete="off" value="mgId0001"> <label for="userId">Id</label>
						</div>
					</div>
					<div class="form-group">
						<div class="form-label-group">
							<input type="password" id="mPwd" name="mPwd"
								class="form-control" placeholder="Password" required="required"
								autocomplete="off" value="1234"> <label for="userPw">Password</label>
						</div>
					</div>
					<input class= "btn btn-primary btn-block" type="submit" value="Login" onclick="return checkValue()" />
				</form>
				
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>
</html>