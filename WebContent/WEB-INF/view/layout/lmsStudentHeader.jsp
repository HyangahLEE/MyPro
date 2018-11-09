<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	
	});
</script>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-light static-top">
		<!-- 삭제 -->
		<img src="/Resouces/images/itleader.png" alt="IT리더교육센터"
			style="width: 150px;" />

		<!-- Navbar -->
		<!-- 변경 -->
		<ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-user-circle fa-fw" style="font-size: 2rem;"></i>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="/logout.do" data-toggle="modal"
						data-target="#logoutModal">Logout</a>
				</div></li>
		</ul>
	</nav>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<!-- 삭제 -->
					<img src="/Resouces/images/itleader.png" alt="IT리더교육센터"
						style="width: 130px;" />
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃 하시겠습니까?</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="/WEB-INF/view/logon/lmsStudentLogout.jsp"
						style="margin-left: 10px;">Logout</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>