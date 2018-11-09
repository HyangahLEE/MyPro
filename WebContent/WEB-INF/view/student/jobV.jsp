<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>쌍용 교육센터</title>

    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/modern-business.css" rel="stylesheet">


<style type="text/css">

</style>
<script>
function applyBnt(userid, tpid) {
    if(userid != "") {
        var userId = document.getElementById("userId").value;
        location.href="/jobA.do?userId="+userId+"&tpid="+tpid; // 신청하기 폼
    } else {
        if(confirm("쌍용 교육센터의 회원이십니까?")) {
            location.href="/logon/loginMain.do"; // 로그인
        }
    }
    
}


</script>
</head>
<body>
<jsp:include page="/WEB-INF/view/main/header.jsp"/> 
<jsp:include page="/WEB-INF/view/main/navigator.jsp"/> 



        <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3"> JOB CURRICULUM
        <small>취업교육과정</small>
      </h1>

<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></a></li>
  <li class="breadcrumb-item"><a href="/incumbent.do?index=11">취업교육과정</a></li>
  <li class="breadcrumb-item active">${title }</li>
</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
     <jsp:include page="/WEB-INF/view/include/incumbent.jsp"/>
     
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
            <input type="hidden" id ="tpid" value="${tpid }"/>
	        <!-- <input type="hidden" id ="userId" value="${userId }"/> -->
	        <input type="hidden" id ="userId" value="1"/>
	        <div style="text-align: center; margin-top: 20px;"><img alt="자료없음" src="/images/${tpid }.png"/></div>
	        <div style="text-align: center; margin-bottom: 20px;">
	        <button style="margin-right: 10px; width: 120px; height: 40px;"onclick="javascript:applyBnt('${userId}','${tpid}')">신청하기</button>
            <button style="width: 120px; height: 40px;"onclick="javascript:history.back();">뒤로가기</button>
        </div>


         </div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <footer class="py-5 bg-dark">
        <jsp:include page="../main/footer.jsp"/> 
    </footer>


    <!-- Bootstrap core JavaScript -->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>
</html>
