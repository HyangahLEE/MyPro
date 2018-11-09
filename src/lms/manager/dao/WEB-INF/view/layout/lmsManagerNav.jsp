<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="/Resouces/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">

<!-- Custom fonts for this template-->
<link href="/Resouces/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="/Resouces/vendor/datatables/dataTables.bootstrap4.css"
   rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/Resouces/css/sb-admin.css" rel="stylesheet">
<style>
   .selectedNav {
      color: red;
   }
</style>
<style>


</style>
</head>
<body>
<body>

<nav class="navbar navbar-light" style="background-color: #e3f2fd;">
  <!-- Navbar content  -->
<ul class="nav nav-pills">
  <li class="nav-item" >
    <a class="nav-link" style="margin-left: 250px"   href="#">수강등록</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">신청 목록관리</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">재직자교육과정</a>
      <a class="dropdown-item" href="#">취업 교육과정</a>      
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">출결관리</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">상담 및 접수</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">입학 상담내역</a>
      <a class="dropdown-item" href="#">일일 모집현황</a>
      <a class="dropdown-item" href="#">교육생 등록현황</a>
      <a class="dropdown-item" href="#">수강생 파일등</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">관리자메뉴얼보기</a>
      <a class="dropdown-item" href="#">훈련생메뉴얼보기</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">학적부</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">훈련생현황(신상기록부)</a>
      <a class="dropdown-item" href="#">교육생 상담일지</a>
      <a class="dropdown-item" href="#">1:1문의</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">관리자메뉴얼보기</a>
      <a class="dropdown-item" href="#">훈련생메뉴얼보기</a>
    </div>
  </li>
  <li class="nav-item dropdown" >
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">훈련일지</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">훈련일지</a>
      <a class="dropdown-item" href="#">보강훈련일</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">관리자메뉴얼보기</a>
      <a class="dropdown-item" href="#">훈련생메뉴얼보기</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">사전평가</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">평가기본정보</a>
      <a class="dropdown-item" href="#">평가표</a>
      <a class="dropdown-item" href="#">평가결과회의록</a>
      <a class="dropdown-item" href="#">사전평가평가지</a>
      <a class="dropdown-item" href="#">시험지파일등록</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">관리자메뉴얼보기</a>
      <a class="dropdown-item" href="#">훈련생메뉴얼보기</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">평가관리</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">과목별평가설정</a>
      <a class="dropdown-item" href="#">훈련생 종합 성적표</a>
      <a class="dropdown-item" href="#">능력단위 분석표</a>
      <a class="dropdown-item" href="#">훈련생 개별 성적표</a>
      <a class="dropdown-item" href="#">능력단위별 분석표</a>
      <a class="dropdown-item" href="#">편차 비교표</a>
      <a class="dropdown-item" href="#">평가결과 분석</a>
      <a class="dropdown-item" href="#">평가결과 회의록</a>
      <a class="dropdown-item" href="#">능력단위별 평가지</a>
      <a class="dropdown-item" href="#">시험지파일등록</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">관리자메뉴얼보기</a>
      <a class="dropdown-item" href="#">훈련생메뉴얼보기</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">설문관리</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">설문지</a>
      <a class="dropdown-item" href="#">설문지 결과분석</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">관리자메뉴얼보기</a>
      <a class="dropdown-item" href="#">훈련생메뉴얼보기</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">사후관리</a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">일일취업현황</a>
      <a class="dropdown-item" href="#">취업현황보고서</a>
      <a class="dropdown-item" href="#">사후관리현황</a>
      <a class="dropdown-item" href="#">사후관리현황표</a>
      <a class="dropdown-item" href="#">취업확인서</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">관리자메뉴얼보기</a>
      <a class="dropdown-item" href="#">훈련생메뉴얼보기</a>
    </div>
  </li>
</ul>

</nav>


 <ul class="sidebar navbar-nav" style="background-color: #e3f2fd;">
          <li class="nav-pills ">
            <a class="nav-link">&nbsp;&nbsp;&nbsp;&nbsp;
            <i class="fas fa-address-card"></i> <span>사후관리</span>
         </a></li>
         <li class="nav-pills">
            <a class="nav-link" href="/mainPage.do">&nbsp;&nbsp;&nbsp;&nbsp;
            <i class="fas fa-address-card"></i> <span>일일취업보고</span>
         </a></li>
         <li class="nav-pills">
         <a class="nav-link" href="/followup.do">&nbsp;&nbsp;&nbsp;&nbsp;
            <i class="fas fa-folder-open"></i> <span>취업현황보고서</span>
         </a> </li>
         <li class="nav-pills"><a class="nav-link" href="/guidebook.do">&nbsp;&nbsp;&nbsp;&nbsp;
               <i class="fas fa-file-export"></i> <span>사후관리현황</span>
         </a></li>
         <li class="nav-pills"><a class="nav-link" href="/basictest.do">&nbsp;&nbsp;&nbsp;&nbsp;
               <i class="fas fa-edit"></i> <span>사후관리현황표</span>
         </a></li>
         <li class="nav-pills"><a class="nav-link" href="/subjectexam.do">&nbsp;&nbsp;&nbsp;&nbsp;
               <i class="fas fa-folder-plus"></i> <span>취업확인서</span>
         </a></li>
         <li class="nav-pills"><a class="nav-link" href="#">&nbsp;&nbsp;&nbsp;&nbsp;
               <i class="fas fa-folder-plus"></i> <span>관리자메뉴얼보기</span>
         </a></li>
         <li class="nav-pills"><a class="nav-link" href="#">&nbsp;&nbsp;&nbsp;&nbsp;
               <i class="fas fa-chart-area"></i> <span>훈련생메뉴얼보기</span>
         </a></li>
      </ul> 


</body>
<!-- Scroll to Top Button-->
   <a class="scroll-to-top rounded" href="#page-top"> 
      <i class="fas fa-angle-up"></i>
   </a>


   <!-- Bootstrap core JavaScript-->
   <script src="/Resouces/vendor/jquery/jquery.min.js"></script>
   <script src="/Resouces/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

   <!-- Core plugin JavaScript-->
   <script src="/Resouces/vendor/jquery-easing/jquery.easing.min.js"></script>

   <!— Page level plugin JavaScript—>
   <script src="/Resouces/vendor/chart.js/Chart.min.js"></script>
   <script src="/Resouces/vendor/datatables/jquery.dataTables.js"></script>
   <script src="/Resouces/vendor/datatables/dataTables.bootstrap4.js"></script>

   <!— Custom scripts for all pages—>
   <script src="/Resouces/js/sb-admin.min.js"></script>

   <!— Demo scripts for this page—>
   <script src="/Resouces/js/demo/datatables-demo.js"></script>
   <script src="/Resouces/js/demo/chart-area-demo.js"></script>
</html>