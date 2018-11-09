<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>쌍용교육센터</title>
    

<!--     Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">

<style type="text/css">
	footer {
		margin-top: 80px;
	}
</style>
	
</head>
  
<script type="text/javascript">
  	
  	function returnBack() {  // 취소 버튼 누르면 전페이지로
		//location.href='job03.jsp';
		//location.href='/jsp/offer/edit_guin.jsp';
		//location.href= "/editJobList.do";
	}

	function sendIt() {
		/* replace_text(document.ff2.jrfields); */
		if (document.ff2.jrfields.value.length == 0) {
			alert("모집 분야를 입력하세요.")
			document.ff2.jrfields.focus();
			return;
		}
		/* replace_text(document.ff2.jrworkplace); */
		if (document.ff2.jrworkplace.value.length == 0) {
			alert("근무지를 입력하세요.")
			document.ff2.jrworkplace.focus();
			return;
		}
		/* replace_text(document.ff2.jrrequiredskill); */
		if (document.ff2.jrrequiredskill.value.length == 0) {
			alert("요구 기술을 입력하세요.")
			document.ff2.jrrequiredskill.focus();
			return;
		}
		/* replace_text(document.ff2.jrrecruit); */
		if (document.ff2.jrrecruit.value.length == 0) {
			alert("채용인원을 입력하세요.")
			document.ff2.jrrecruit.focus();
			return;
		}
		/* replace_text(document.ff2.jrdeadline); */
		if (document.ff2.jrdeadline.value.length == 0) {
			alert("마감일을 입력하세요.")
			document.ff2.jrdeadline.focus();
			return;
		}

		var okBt = confirm("구인 의뢰 수정을 하시겠습니까?");

		if(okBt != 0){
			document.ff2.action = "/editJobOk.do";
			document.ff2.submit();
		}	

	}
  
</script>
  

<body>

<jsp:include page="../main/header.jsp"/> 
<jsp:include page="../main/navigator.jsp"/> 


  <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">EMPLOYMENT
        <small>구인의뢰수정</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
        <li class="breadcrumb-item"><a href="/company.do">인재추천의뢰</a></li>
        <li class="breadcrumb-item active">구인의뢰 수정</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
      <jsp:include page="../include/companyinclude.jsp"/> 
      
        <!-- Content Column -->
           <div class="col-lg-9 mb-4">
            
            <div id="right-container" class="o3">
               <h3>
                  <span class="index">구인의뢰수정</span>
               </h3>

            </div>

            <div class="sub_content_center_wrap">

               
                  <table width="690" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                        <td><img
                           src="http://www.sist.co.kr/images/talente/inf_list1_2.jpg"
                           width="690" height="75"></td>
                     </tr>
                     
                     <tr>
                        <td width="300" align="right"><input id="cpname"
                           type="text"
                           style="padding-right: 110px; border: 0 !important; text-align: right; background: #FFFFFF !important;"
                           readOnly name="cpname" width="100%" /></td>
                     </tr>
                  
         </table> 
         
         <div align="center;">
         <form name="ff2" method="post"> 
                       <tr>
                        <td align="center">

                     <div id="div1" >
                        <table cellSpacing=1 cellPadding=1 width=680
                           bgColor=#ffffff border=0 >
                           <TR>
                              <TD align=middle width=139 bgColor=#eeeeee></TD>
                              <TD align=left bgColor=#f6f6f6 colSpan=3>
                                 <INPUT type="hidden" class="fmTxt" size=30 name=jrid readonly="readonly" value="${ dto.jrid }">
                              </TD>
                           </TR>
                           <TR>
                              <TD align=middle width=139 bgColor=#eeeeee>사업자등록번호</TD>
                              <TD align=left bgColor=#f6f6f6 colSpan=3>
                                 <INPUT type="text" class="fmTxt" size=7 name=cpnum readonly="readonly" value="${ dto.cpnum }">
                              </TD>
                           </TR>
                           
                        
                           <TR>
                              <TD align=middle width=97 bgColor=#eeeeee>모집분야</TD>
                              <TD bgColor=#f6f6f6 colSpan=3>
                                 <%-- <TEXTAREA class="fmTxt" name=jrfields rows=3 wrap=hard cols=65>${ jobreg.jrfields }</TEXTAREA> --%>
                                 <INPUT type="text" class="fmTxt" size=30 name=jrfields value="${ dto.jrfields }">
                              </TD>
                           </TR>
                           <TR>
                              <TD align=middle bgColor=#eeeeee>담당업무</TD>
                              <TD bgColor=#f6f6f6 colSpan=3><INPUT type="text" size=30
                                 class="fmTxt" name=jrrespon value="${ dto.jrrespon }"></TD>
                           </TR>
                           <TR>
                              <TD align=middle width=97 bgColor=#eeeeee>근무지</TD>
                              <TD width="236" bgColor=#f6f6f6><INPUT type="text"
                                 maxLength=35 size=30 class="fmTxt" name=jrworkplace value="${ dto.jrworkplace }"></TD>
                          </tr>
                          <tr>
                              <TD align=middle width=97 bgColor=#eeeeee>연봉</TD>
                              <TD width="139" bgColor=#f6f6f6>약 <INPUT type="text"
                                 maxLength=8 size=1 class="fmTxt" name=jrsal value="${ dto.jrsal }">만원 </TD>
                           </TR>
                           <TR>
                              <TD align=middle bgColor=#eeeeee>요구기술</TD>
                              <TD align=left bgColor=#f6f6f6 colSpan=3>
                                 <!-- <TEXTAREA class="fmTxt" name=jrrequiredskill rows=3 wrap=hard cols=65></TEXTAREA> -->
                                 <INPUT type="text" class="fmTxt" size=30 name=jrrequiredskill value="${ dto.jrrequiredskill }">
                              </TD>
                           </TR>
                        </table>
                     </div>

                     </td>
                     </tr>
                     
                     <tr>
                        <td colspan="2">

                           <div id="div2">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                    <td height="30">
                                       <table width="100%" border="0" cellspacing="0"
                                          cellpadding="0">
                                          <tr>
                                             <td width="15"><img
                                                src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
                                                width="5" height="5"></td>
                                             <td class="attendTit">자격요건</td>
                                          </tr>
                                       </table>
                                    </td>
                                 </tr>
                              </table>
                           </div>

                        </td>
                     </tr>
                     
                     <tr>
                        <td colspan="2">

                           <div id="div3">
                              <table width="680" border="0" cellpadding="5" cellspacing="0"
                                 bgcolor="#E6E6E6">
                                 <tr>
                                    <td width="529" align="center">
                                       <TABLE cellSpacing=1 cellPadding=1 width=100% bgColor=#ffffff border=0>
                                          <TR>
                                             <TD align=middle bgColor=#eeeeee>학력</TD>
                                             <TD bgColor=#f6f6f6>
                                             <SELECT name=jreducation>
                                                <OPTION value="고졸 이상" ${ dto.jreducation eq "고졸 이상" ? "selected" : ""} >고졸 이상</OPTION>
                                                <OPTION value="초대졸 이상" ${ dto.jreducation eq "초대졸 이상" ? "selected" : ""}>초대졸 이상</OPTION>
                                                <OPTION value="대졸 이상" ${ dto.jreducation eq "대졸 이상" ? "selected" : ""}>대졸 이상</OPTION>
                                                <OPTION value="제한없음" ${ dto.jreducation eq "제한없음" ? "selected" : ""}>제한없음</OPTION>
                                             </SELECT></TD>
                                             
                                             <TD align=middle bgColor=#eeeeee>경력</TD>
                                             <TD bgColor=#f6f6f6>
                                                <INPUT type="text" maxLength=2 size=3 class="fmTxt" name=jrcareer value="${ dto.jrcareer }"> 년</TD>
                                          </TR>
                                       </TABLE>
                                    </td>
                                 </tr>
                              </table>
                           </div>

                        </td>
                     </tr>
                     
                     <tr>
                        <td colspan="2">

                           <div id="div4">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                    <td width="15"><img
                                       src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
                                       width="5" height="5"></td>
                                    <td class="attendTit" align="left">기타사항</td>
                                 </tr>
                              </table>
                           </div>

                        </td>
                     </tr>
                     
                     <tr>
                        <td colspan="2">

                           <div id="div5">
                              <table width="680" border="0" cellpadding="5" cellspacing="0"
                                 bgcolor="#E6E6E6">
                                 <tr>
                                    <td width="529" align="center">
                                       <TABLE cellSpacing=1 cellPadding=1 width=100%
                                          bgColor=#ffffff border=0>

                                          <TR>
                                             <TD align=middle width=139 bgColor=#eeeeee>채용인원</TD>
                                             <TD width="111" bgColor=#f6f6f6><INPUT maxLength=4
                                                size=1 name=jrrecruit value="${ dto.jrrecruit }">명 </TD>
                                             <TD align=middle width=105 bgColor=#eeeeee>접수마감일</TD>
                                             <TD width="162" bgColor=#f6f6f6><INPUT type="text"
                                                maxLength=10 size=7 class="fmTxt" name=jrdeadline placeholder="2019/01/01"
                                                value="${ dto.jrdeadline }"></TD>
                                          </TR>

                                          <TR>
                                             <TD align=middle width=139 bgColor=#eeeeee>근무조건</TD>
                                             <TD width="111" bgColor=#f6f6f6>주<INPUT maxLength=4
                                                size=1 name=jrcondition value="${ dto.jrcondition }">일</TD>
                                             <TD align=middle bgColor=#eeeeee>고용형태</TD>
                                             <TD bgColor=#f6f6f6>
                                             <SELECT name=jremptype>
                                                   <OPTION value="정규직" ${ dto.jremptype eq "정규직" ? "selected" : ""}>정규직</OPTION>
                                                   <OPTION value="계약직" ${ dto.jremptype eq "계약직" ? "selected" : ""}>계약직</OPTION>
                                                   <OPTION value="인턴직" ${ dto.jremptype eq "인턴직" ? "selected" : ""}>인턴직</OPTION>
                                             </SELECT></TD>
                                          </TR>
                                          <TR>
                                             <TD align=middle width=139 bgColor=#eeeeee>우대사항</TD>
                                             <TD align=left bgColor=#f6f6f6 colSpan=3><INPUT
                                                type="text" class="fmTxt" size=63 name=jrpreference value="${ dto.jrpreference }"></TD>
                                          </TR>

                                          <TR>
                                             <TD align=middle bgColor=#eeeeee colSpan=4>기타</TD>
                                          </TR>
                                          <TR>
                                             <TD align=middle bgColor=#f6f6f6 colSpan=4>
                                                <!-- <TEXTAREA class="fmTxt" name=jretc rows=5 wrap=hard cols=75></TEXTAREA> -->
                                                <INPUT type="text" class="fmTxt" size=88 name=jretc value="${ dto.jretc }">
                                             </TD>
                                          </TR>
                                          <tr align=middle bgColor=#f6f6f6 colSpan=4>
                                             <td>
                                                
                                                <input type="hidden"
                                                maxLength=4 size=4 class="fmTxt" name=jrapproval
                                                value="${ dto.jrapproval }"/>
                                                
                                             </td>
                                          </tr>
                                       </TABLE>
                                    </td>
                                 </tr>
                              </table>
                           </div>

                        </td>
                     </tr>
                     
                     <tr>
                        <td colspan="2">

                           <div id="div6" style="margin-left:320px; margin-top: 30px;">
                              <table>
                                 
                                 <tr>
                                    <td height="30" align="center">
                                       
                                       <table border="0" cellspacing="0" cellpadding="0">
                                          
                                          <tr>
                                             <td>
                                                <!-- <a href="javascript:sendIt()"> -->
                                                <input class="btn btn-primary" onclick="sendIt()" type="button" value="수정하기" name="Image21111" id="Image211"><!-- </a> -->
                                             </td>
                                            
                                          </tr>
                                          
                                       </table>
                                       
                                    </td>
                                 </tr>
                              </table>
                           </div>

                        </td>
                     </tr>
         </form>
         </div>
         
             </div>
         
         </div>
       </div> 
      <!-- /.row -->

    </div>
    <!-- /.container -->
    
		
		
    <!-- Footer -->
    <footer class="py-5 bg-dark">
     	<jsp:include page="../main/footer.jsp"/> 
      <!-- /.container -->
    </footer>


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>