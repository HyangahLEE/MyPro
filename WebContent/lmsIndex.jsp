<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>쌍용교육센터</title>

<!-- Bootstrap core CSS-->
<link href="/Resouces/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="/Resouces/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/Resouces/css/sb-admin.css" rel="stylesheet">

<style>
.card-register {
	max-width: 20rem;
}

button:hover {
	cursor: pointer;
}
</style>


</head>
<body class="bg-dark" style="overflow-x: hidden;">

	<div class="container">
	

		<div style="width: 100%; padding-left: 22%; position: absolute; top: 120px;">


			<div style="display: inline-block; margin-right: 15%;">
				<div class="card card-register mx-auto mt-5" style="padding-top: 20px;">

					<div class="card-body">

						<img src="/Resouces/images/study.png" alt="수강생 사이트"
							style="width: 70%; margin-left: 15%; margin-bottom: 20px;" /> <br />

						<button class="btn btn-primary btn-block"
							onclick="location.href='moveStudent.do'" style="font-size: 1.2rem;">수강생
							사이트 바로가기</button>

					</div>
					
				</div>
			</div>


			<div style="display: inline-block;">
				<div class="card card-register mx-auto mt-5" style="padding-top: 20px;">
					
					<div class="card-body">

						<img src="/Resouces/images/settingsGears.png" alt="관리자 사이트"
							style="width: 70%; margin-left: 15%; margin-bottom: 20px;" /> <br />

						<button class="btn btn-primary btn-block"
							onclick="location.href='moveAdmin.do'" style="font-size: 1.2rem;">관리자
							사이트 바로가기</button>

					</div>
					
				</div>
			</div>


		</div>


	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>
</html>