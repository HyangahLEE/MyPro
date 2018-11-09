<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>쌍용 교육센터</title>

    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/modern-business.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
body {
  padding-top: 2px;
}

/* .nav-link{
color: rgb(251,251,251);
} */
</style>
</head>
<body>
<!-- <img id="sistimg"  alt="쌍용교육센터" src="/img/sist.png"> -->


  <!-- Navigation -->
    <nav class="navbar sticky-top navbar-expand-lg navbar-light fixed-top" style="background-color: rgba(177, 17, 22, 1)" >
      <div class="container">
       <a class="navbar-brand" href="/index.do"></a> 
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          <!-- 센터소개 -->
          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" color: rgb(251,251,251);">
                센터소개
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="/intromain.do" >개요</a>
                <a class="dropdown-item" href="/ceo_list.do">CEO컬럼</a>	
                <a class="dropdown-item" href="/intromain-3.do">연혁</a>
                <a class="dropdown-item" href="/intromain-4.do">시설 및 장비</a>
                <a class="dropdown-item" href="/intromain-5.do">교수진소개</a>
                <a class="dropdown-item" href="/intromain-6.do">입학안내</a>
                <a class="dropdown-item" href="/intromain-7.do">수상현황</a>
                <a class="dropdown-item" href="/intromain-8.do">찾아오시는길</a>
              </div>
            </li>
            <!-- <li class="nav-item">
              <a class="nav-link" href="/main/about.html">센터소개</a>
            </li> -->
            
          <!-- 재직자 교육과정  -->
          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" color: rgb(251,251,251);">
              		  재직자교육과정
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="/incumbent.do?index=1">프로그래밍 과정</a>
                <a class="dropdown-item" href="/incumbent.do?index=2">데이터베이스 과정</a>
                <a class="dropdown-item" href="/incumbent.do?index=3">스마트폰 과정</a>
               <!--  <a class="dropdown-item" href="/portfolio-4-col.html">4 Column Portfolio</a>
                <a class="dropdown-item" href="/portfolio-item.html">Single Portfolio Item</a> -->
              </div>
            </li>
            
            <!-- 취업 교육과정  -->
                <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" color: rgb(251,251,251);">
              		  취업교육과정
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                <a class="dropdown-item" href="/job.do?index=11">프로그래밍 과정</a>
                <a class="dropdown-item" href="/job.do?index=12">데이터베이스 과정</a>
                <a class="dropdown-item" href="/job.do?index=13">스마트폰 과정</a>
             
              </div>
            </li>
            
            <!-- 예약센터 -->
            <li class="nav-item" >
              <a class="nav-link" style=" color: rgb(251,251,251);" href="/reservation.do">예약센터</a>
            </li>
            
            <!-- 교육서비스 -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" color: rgb(251,251,251);">
                교육서비스
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="/eduservice-1.do">취업교육</a>
                <a class="dropdown-item" href="/eduservice-2.do">재직자교육</a>
                <a class="dropdown-item" href="/eduservice-3.do">기업맞춤교육</a>
                <a class="dropdown-item" href="/eduservice-4.do">교육컨설팅</a>
      	          
              </div>
            </li>
            
            <!-- 인재추천의뢰 -->
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" color: rgb(251,251,251);">
             	   인재추천의뢰
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="/company.do">업체등록관리</a>
                <a class="dropdown-item" href="/job_reg.do">구인의뢰 신청</a>
                <a class="dropdown-item" href="/job_reg_edit.do">구인의뢰 수정</a>
                <a class="dropdown-item" href="/sistadv.do">SIST수료생 장점</a>
              </div>
            </li>
            
            
            
            <!-- 고객센터  -->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style=" color: rgb(251,251,251);">
               고객센터
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                <a class="dropdown-item" href="/notice_list.do">공지사항</a>
                <a class="dropdown-item" href="/ask_list.do">문의게시판</a>
                <a class="dropdown-item" href="/hire_list.do">취업정보</a>
                <a class="dropdown-item" href="/review_list.do">수강후기</a>
                <a class="dropdown-item" href="#">프로젝트</a>
                <a class="dropdown-item" href="/faq_list.do">FAQ</a>
                <a class="dropdown-item" href="/lease.do">강의장임대</a>
                <a class="dropdown-item" href="/payguide.do">결제안내</a>
              </div>
            </li>
          
            
           
           
          </ul>          
        </div>
      </div>
    </nav>
</body>
</html>