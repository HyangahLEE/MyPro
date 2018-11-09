<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty  loginUser}">
	<jsp:forward page=""></jsp:forward>
</c:if>
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
<h2>성공 페이지</h2>
<p>${loginUser.memberId }님 로그인 성공!</p>
</body>
</html>