<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용교육센터</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="/css/style.css" media="screen" title="no title" charset="utf-8">
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/js/bootstrap.min.js"></script>

	
</head>

<body >
<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-end"  style="position: relative;">
  <a class="navbar-brand" href="/index.do"></a>
   <div class="navbar-nav">
      <img id="sistimg" alt="" src="/images/sist.png" onclick="location.href='/index.do'" style="position: absolute; left: 10px;">
	  <a class="nav-item nav-link " href="/join/userTerms.do"><small>회원가입</small></a>	     
      <a class="nav-item nav-link" href="/sitemap.do"><small>사이트맵</small></a>
    </div>
</nav>


      <div class="container">
       

        <div class="col-md-12">
        <div class="page-header">
    	    <h1>회원가입 </h1>
        </div>
        <form class="form-horizontal" method="post"  name="userInfo" action="/join/join_ok.do" >
        <!--  이름 -->
         <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" name="mname" type="text" placeholder="이름">
          </div>
        </div>
        
        <!--아이디  -->
         <div class="form-group">
            <label class="col-sm-3 control-label" for="inputId">아이디</label>
          <div class="col-sm-6">
            <div class="input-group">
              <input class="form-control" id="inputId" name="memberid" type="text" placeholder="아이디" onkeydown="inputIdChk()">
              <span class="input-group-btn">
               <input type="hidden" id="idDuplication" name="idDuplication" value="idUnckeck"/>
              
                <button class="btn btn-success" id="inputIdCheck" onclick="openIdChk()"  type="button">아이디 중복 확인<i class="fa fa-edit spaceLeft"></i></button>
              
              </span>
            </div>
          </div>
        </div>
         <input type="hidden" id="xxx" value="-1"/>
        
        <!-- 비밀번호 -->
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" name="mpwd" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 문자 포함 5자 이상 16자 이하</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
          
          <!-- 주민번호 -->
           <div class="form-group">
          <label class="col-sm-3 control-label" for="inputRRN">주민등록번호</label>
         <div class="col-sm-6">
          <input class="form-control" id="inputRRN" name="mbirth" type="text" placeholder="생년월일" maxlength="6" style="display:inline-block; width: 213px"> - <input class="form-control" id="inputGender" name="mgender" type="text" placeholder="주민등록번호 뒷자리" maxlength="1" style="width: 213px;display: inline;">
         </div>
        </div>
          
          <!--이메일  -->
       <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
         <div class="col-sm-6">
         <input type="hidden" name="from" value="dlgiddk30@naver.com">
          <input class="form-control" id="inputEmail" name="memail" type="email" placeholder="이메일">
         </div>
        </div>
        
        <!-- 주소  -->
    <!--  <form name="form" id="form" method="post"> -->
       <div id="callBackDiv">
         <div class="form-group">
            <label class="col-sm-3 control-label" for="inputZipcode">우편번호</label>
              <div class="col-sm-6">
                <div class="input-group">
                  <input type="tel" class="form-control"  id="zipNo"  name="zipNo" placeholder="우편번호"/>
                  <span class="input-group-btn">
                    <button class="btn btn-success"  id="zip_codeBtn" onclick="goPopup();"  type="button" >우변번호 찾기</button>
                  </span>
                </div>
              </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputAddr01"></label>
          <div class="col-sm-6">
            <input class="form-control"  id="roadFullAddr"  name="roadFullAddr" type="text" placeholder="상세주소" >
          </div>
        </div>
        
       <div class="form-group">
            <label class="col-sm-3 control-label" for="inputAddr02"></label>
          <div class="col-sm-6">
            <input class="form-control" id="addrDetail"  name="addrDetail" type="text" placeholder="나머지 주소" >
          </div>
        </div>
     </div>
<!--     </form>  -->   
        
        <!-- 집전화 -->
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputTel">집 전화번호</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputTel" name="mtel" type="text" placeholder="집 전화번호">
          </div>
        </div>
        
        <!-- 휴대폰번호 -->
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputNumber" name="mphone" type="tel" placeholder="- 없이 입력해 주세요">
          </div>
        </div>
        
        
     
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" id="finallyJoin" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" id="joinCancle" type="button">가입취소<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </div>
 

 
 
<!-- <form name="form" id="form" method="post">
  <input type="hidden" name="currentPage" value="1"/>				요청 변수 설정 (현재 페이지. currentPage : n > 0)
  <input type="hidden" name="countPerPage" value="10"/>				요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
  <input type="hidden" name="resultType" value="json"/> 			요청 변수 설정 (검색결과형식 설정, json) 
  <input type="hidden" name="confmKey" value="U01TX0FVVEgyMDE4MDkyOTAxMjE1NjEwODIwMzY="/>		요청 변수 설정 (승인키)
  <input type="text" name="keyword" value=""/>						요청 변수 설정 (키워드)
  <input type="button" onClick="getAddr();" value="주소검색하기"/>
  <div id="list"> 검색 결과 리스트 출력 영역 </div>
</form>
 -->
<script type="text/javascript">

//회원가입버튼 submit()


//가입취소
$("#joinCancle").click(function(){
	
	location.href="/join/joinForm.do";
});
	



//유효성 검사
/* var idDupli = ; */

$("form").submit(function(){
	var name = $("#inputName").val();
	var id = $("#inputId").val();
	
	var pwd = $("#inputPassword").val();
	var repwd = $("#inputPasswordCheck").val();
	var birth = $("#inputRRN").val();
	var gender = $("#inputGender").val();
	var phone = $("#inputNumber").val();
	var pwdReg = /^[A-Za-z0-9_-]{5,16}$/;
		
	//alert($("#xxx").val());
	
	if(!id){
		alert("아이디를 입력하세요");
		
		event.preventDefault();
		 $("#inputId").focus();
	}else if(!pwd){
		alert("비밀번호를 입력하세요");
		event.preventDefault();
		$("#inputPassword").focus();
		
	}else if(!$("#idDuplication").val("idCheck")){
		alert("아이디 중복체크를 해주세요");
		return false;
	}else if(pwd != repwd){
		alert("비밀번호를 동일하게 입력하세요.");
		event.preventDefault();	 
	}else if( !name ){
		alert("이름을 입력하세요");		
		event.preventDefault();
		$("#inputName").focus();
	}else if(!isNaN(name)){
		alert("숫자입력은 불가능합니다.");
		event.preventDefault();
	}else if(isNaN(birth) || isNaN(gender) || isNaN(phone)){
		alert("숫자만 입력 가능합니다.");
		event.preventDefault();
	}else if(!pwdReg.exec(pwd)){
		alert("비밀번호는 숫자, 문자 포함 5자 이상 16자 이하입니다.");		
		event.preventDefault();
		$("#inputPassword").focus();
	}else if($("#xxx").val()!=1){
		alert("아이디 중복 확인해주세요.");	
		event.preventDefault();
		 $("#inputId").focus();
		 
	}
	
	
	 
});

/* if($("#xxx").val()==null){
	$("#xxx").val(0);
} */
/* console.log($("#xxx").val()); */
// 아이디 중복체크 화면open
function openIdChk(){
	window.name = "아이디 중복체크";
	var pop = window.open("/join/idCheck.do","idpop","width=570,height=420, scrollbars=yes, resizable=yes"); 
 
    // alert( pop.document.getElementById("userId") ); null
 };

function inputIdChk(){
	document.userInfo.idDuplication.value= "idUncheck";
}

</script>
   
   
   
   
<script type="text/javascript">
   

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/join/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
    	
    	function jusoCallBack(roadFullAddr, zipNo,addrDetail){
    		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    		document.getElementById("roadFullAddr").value = roadFullAddr;    		
    		document.getElementById("zipNo").value = zipNo;  
    		document.getElementById("addrDetail").value = addrDetail;
    		
    }

   
    
</script>
<script type="text/javascript">
function getAddr(){
	// AJAX 주소 검색 요청
	$.ajax({
		url:"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"	// 주소검색 OPEN API URL
		,type:"post"
		,data:$("#form").serialize() 								// 요청 변수 설정
		,dataType:"jsonp"											// 크로스도메인으로 인한 jsonp 이용, 검색결과형식 JSON 
		,crossDomain:true
		,success:function(jsonStr){									// jsonStr : 주소 검색 결과 JSON 데이터			
			$("#list").html("");									// 결과 출력 영역 초기화
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){ 
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr!= null){
					makeListJson(jsonStr);							// 결과 JSON 데이터 파싱 및 출력
				}
			}
		}
		,error: function(xhr,status, error){
			alert("에러발생");										// AJAX 호출 에러
		}
	});
}
function makeListJson(jsonStr){
	var htmlStr = "";

	// jquery를 이용한 JSON 결과 데이터 파싱
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+this.roadAddr+"</td>";		
		htmlStr += "<td>"+this.zipNo+"</td>";		
		htmlStr += "</tr>";
	});
	
	// 결과 HTML을 FORM의 결과 출력 DIV에 삽입
	$("#list").html(htmlStr);
}	
</script>

</body>
</html>