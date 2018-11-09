<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<style>
.selectedNav {
	color: red;
}
</style>
</head>
<body>
<body>
	<ul class="sidebar navbar-nav">
		<li class="nav-item"><a class="nav-link" href="/mainPage.do">
				<i class="fas fa-address-card"></i> <span>신상기록부</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="/followup.do">
				<i class="fas fa-folder-open"></i> <span>사후관리카드</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="/guidebook.do">
				<i class="fas fa-file-export"></i> <span>학습안내서/교수계획서</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="/basictest.do">
				<i class="fas fa-edit"></i> <span>사전평가</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="/subjectexam.do">
				<i class="fas fa-folder-plus"></i> <span>평가관리</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="/survey.do"> 
			<i class="fas fa-folder-plus"></i> <span>설문관리</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="/rgraph.do"> 
			<i class="fas fa-chart-area"></i> <span>성적표</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="/attendance.do">
				<i class="fas fa-calendar-alt"></i> <span>출결확인</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="/question_list.do">
				<i class="fas fa-question-circle"></i> <span>1:1문의</span>
		</a></li>
	</ul>
</body>
</html>