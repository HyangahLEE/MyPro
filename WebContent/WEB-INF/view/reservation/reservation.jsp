<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title></title>
    

<!--     Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
    <link href="/css/modern-business.css" rel="stylesheet">
<style type="text/css">
	footer {
		margin-top: 50px;
	}
</style>
  </head>

  <body>

<jsp:include page="../main/header.jsp"/> 
<jsp:include page="../main/navigator.jsp"/> 


  <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">RESERVATION CENTER
        <small>예약센터</small>
      </h1>
    <!--   <img alt="이미지" src="/images/reservation.png" style="width: 350px; height: 100px; margin: 10px"> -->

     <ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></a></li>
		  <li class="breadcrumb-item"><a href="/reservation.do">예약센터</a></li>
		  <li class="breadcrumb-item active">예약신청</li>
		</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <div class="col-lg-3 mb-4">
          <div class="list-group">
            <!-- <a href="index.html" class="list-group-item">Home</a> -->
            <a href="about.html" class="list-group-item active" >예약신청</a>
          </div>
        </div>
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
        	<div align="center"><img alt="이미지" src="/images/reservation.png" style="width: 500px ; height: 160px; margin:auto 0 "></div>
         
         <hr>
  <form>
         
  <div class="form-group row">
    <label for="email" class="col-sm-2 col-form-label">신청인</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="mname" name="mname" placeholder="신청인">
    </div>
  </div>
  <div class="form-group row">
    <label for="phoneNumber" class="col-sm-2 col-form-label">연락처</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="mphone" placeholder="연락처">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="memail" name="memail" placeholder="이메일">
    </div>
  </div>
  <hr>
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-2 pt-0">구분</legend>
      <div class="col-sm-10">
        <div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
			  <label class="form-check-label" for="inlineRadio1">대학생 또는 일반</label>
		</div>
		<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
			  <label class="form-check-label" for="inlineRadio2">교육비 납부(회사)</label>
		</div>
		<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
			  <label class="form-check-label" for="inlineRadio2">교육비 납부(개인)</label>
		</div>
		<hr>
		
      
    </div>
    
    
  </fieldset>
  
  <!-- 캠퍼스 선택  -->
  <fieldset class="form-group">
    <div class="row">
      <legend class="col-form-label col-sm-2 pt-0">캠퍼스 선택</legend>
      <div class="col-sm-10">
        <div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
			  <label class="form-check-label" for="inlineRadio1">강남캠퍼스</label>
		</div>
		<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
			  <label class="form-check-label" for="inlineRadio2">강북캠퍼스</label>
		</div>
    </div>
  </fieldset>
  <hr>
  <div class="form-group row">
    <div class="col-sm-2">선택과목</div>
    <div class="col-sm-10">
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="gridCheck1">
        <label class="form-check-label" for="gridCheck1">
          웹 프로그래밍 과정
        </label>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="gridCheck1">
        <label class="form-check-label" for="gridCheck1">
          데이터 베이스 과정
        </label>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="gridCheck1" disabled="disabled">
        <label class="form-check-label" for="gridCheck1">
          스마트폰 개발 과정
        </label>
      </div><div class="form-check">
        <input class="form-check-input" type="checkbox" id="gridCheck1">
        <label class="form-check-label" for="gridCheck1">
         기타 과정
        </label>
      </div>
    </div>
  </div>
  <hr>
    <div class="form-group">
    <label for="exampleFormControlTextarea1">기타 희망과정</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
  <br>
  <div class="form-group row" style="margin-left: 310px;">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">보내기</button>&nbsp;&nbsp;&nbsp;
      <button type="reset" class="btn btn-primary">취소</button>
    </div>
  </div>
  
</form>
         </div>
      </div>
      <!-- /.row -->

    </div>
   


    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <jsp:include page="../main/footer.jsp"/> 
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
