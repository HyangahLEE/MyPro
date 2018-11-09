<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
 
   </style>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<!-- <body onload="pValue()"> -->
<body>
<div id="wrap">
    <br>
    <b><font size="4" color="gray">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm" >
            <input type="text" name="idinput" id="userId" >
            <input type="button" value="중복확인" id="idCheck">
       
        <div id="msg"></div>
        <br>
        <c:if test="">
        <input id="xxx" type="hidden" value="xxx">
        </c:if>
        <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
        <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
        </form>
    </div>
</div>    
  
  <script type="text/javascript">
 $(document).ready(function(){
	 
	var uid = opener.document.getElementById("inputId").value;
	$("#userId").val(uid);
	 
	 
	 
  $("#idCheck").click(function(){
        //아이디체크 json 받아오기
        opener.document.getElementById("xxx").value=-1;
        var params = $("form").serialize(); 
       $.ajax({
         url : "/join/idCheck_ok.do",
         dataType : "json",
         type: "post",
         data: params, 
         cache: false,
         success: function(data){
        	 
        	 console.log( data.cnt);
        	 
            if( data.cnt == 0) {
            	
               //사용가능
            	 $("#cancelBtn").css("visibility","hidden");
                 $("#useBtn").css("visibility","visible");
                 $("#msg")
                   .css("color","black")
                   .html("사용 가능한 아이디입니다.");
                 opener.document.getElementById("xxx").value=1;
                 //alert(opener.document.getElementById("xxx").value);
            }else if( data.cnt == 1){
               //사용 불가능
               $("#cancelBtn").css("visibility","visible");
                 $("#useBtn").css("visibility","hidden");
               $("#msg").css("color","red").html("이미 사용 중인 아이디입니다.");
               opener.document.getElementById("xxx").value=-1;
            }
         }
         
      });
    });   
 })    
  
  
  // 회원가입창의 아이디 입력란의 값을 가져온다.
  /* $().load(function(){	 
          $("#userId").val() = 
       	$("#inputId",opener.document.body.form).val(); 
  }); */
 
 
 
  </script>
 <script type="text/javascript">
    
   var httpRequest = null;
        
        // httpRequest 객체 생성
        function getXMLHttpRequest(){
            var httpRequest = null;
        
            if(window.ActiveXObject){
                try{
                    httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
                } catch(e) {
                    try{
                        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e2) { httpRequest = null; }
                }
            }
            else if(window.XMLHttpRequest){
                httpRequest = new window.XMLHttpRequest();
            }
            return httpRequest;    
        } 
        

        
        
        // 회원가입창의 아이디 입력란의 값을 가져온다.
     /*   ("body").load(this,function(){ */
    	   function pValue(){
    		   opener.document.userInfo.memberid.value; 
                      
    	   }
            /*   $("#userId").val() = 
            	$("#memberid",opener.document.body.form).val(); */
     /*   }); */
        
        // 아이디 중복체크
      /*    function idCheck(){
 
            var id = document.getElementById("userId").value;
            var idReg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
 	
            if (!id) {
                alert("아이디를 입력하지 않았습니다.");
                return false;
            }else   {
                var param="id="+id
                httpRequest = getXMLHttpRequest();
                httpRequest.onreadystatechange = callback;
                httpRequest.open("POST", "/join/memberIdCheck.do", true);    
                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
                httpRequest.send(param);
            }
        } 
        
         function callback(){
            if(httpRequest.readyState == 4  && httpRequest.status==200){
                // 결과값가져오기
                var resultText = httpRequest.responseText;
                 alert(resultText); 
                if(resultText == 0||resultText == "0" || resultText==true){
                    alert("사용할수없는 아이디입니다.");
                    document.getElementById("cancelBtn").style.visibility='visible';
                    document.getElementById("useBtn").style.visibility='hidden';
                    document.getElementById("msg").innerHTML ="";
                } 
                else if(resultText == 1 || resultText == "1" || resultText==false){ 
                    document.getElementById("cancelBtn").style.visibility='hidden';
                    document.getElementById("useBtn").style.visibility='visible';
                    document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
                }
            }
        }
          */
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
            // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.userInfo.idDuplication.value ="idCheck";
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.userInfo.memberid.value = document.getElementById("userId").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }    
   </script> 

</body>
</html>