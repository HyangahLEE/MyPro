<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%

request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거


String inputYn = request.getParameter("inputYn"); 
String roadFullAddr = request.getParameter("roadFullAddr");
String addrDetail = request.getParameter("addrDetail");
String zipNo = request.getParameter("zipNo"); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>  
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>쌍용교육센터</title>
<style type="text/css">
#custom-search-input{
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#custom-search-input input{
    border: 0;
    box-shadow: none;
}

#custom-search-input button{
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{
    font-size: 23px;
}
</style>
</head>
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("주소입력화면 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "/join/jusoForm.do";

 function init(){
	var url = location.href;
	var confmKey = "U01TX0FVVEgyMDE4MDkyOTAyNDEyODEwODIwNDA=";
	var resultType = "1"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번, 3 : 도로명+상세건물명, 4 : 도로명+지번+상세건물명
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		//document.form.action="http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do"; //모바일 웹인 경우, 인터넷망
		
		
		document.form.submit();
		
	}else{
		opener.jusoCallBack("<%=roadFullAddr%>","<%=zipNo%>","<%=addrDetail%>");
		window.close();
		}
} 
</script>
<body onload="init();">
	<form id="form" name="form" method="post" action="/join/joinForm.do">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
		<input type="hidden" id="roadFullAddr" name="roadFullAddr" value="<%=roadFullAddr%>"/>
		<input type="hidden" id="zipNo" name="zipNo" value="<%=zipNo%>"/>
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
		<!-- 
		<input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
		 -->
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
	</form>
</body>
</html>	
<!-- <body onload="init();">
<div class="container">
	<div class="row">
        <div class="col-md-6">
    		<h4>우편번호</h4>
            <div id="custom-search-input">
                <div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg"  name="keyword" placeholder="도로명주소, 건물명  또는 지번주소" />
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="button" onClick="getAddr();">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>                    
                </div>
            </div>
            <span>검색어 예 : 도로명(반포대로 58), 건물명(독립기념관), 지번(삼성동 25)</span>
        </div>
	</div>
	<br><br>

 <table class="table table-hover">
    <thead>
      <tr>
        <th>No</th>
        <th>우편번호</th>
        <th>상세주소</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td id="list">1</td>
       
      </tr>
     
    </tbody>
  </table>
	
</div>

<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>	
		<input type="hidden" id="resultType" name="resultType" value=""/>			
	</form>
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
</body> -->
