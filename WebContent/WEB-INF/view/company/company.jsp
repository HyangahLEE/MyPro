<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>쌍용교육센터</title>


<!--     Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/modern-business.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- ajax를 사용하는 선언 -->
<script type="text/javascript">
	$("document").ready(function (){
		$("#cpnumbtn").click(function(){ 
            var params = $("form").serialize(); 
           
    
            $.ajax({ 
            	url : "coNumCheck.do",
                dataType : "json", 
                type: "post", 
                data: params, 
                cache: false, 
                success: function(data){ 
             
                	if( data.count == 0 ) { 
                		alert("등록 가능한 사업자 번호 입니다."); 
                		
                		/* 
                		var co_num = document.ff2.cpnum.value;
    					if(check_busino(co_num)){
                      		alert("등록 가능한 사업자 번호 입니다.");
    					} else {
    						alert("유효한 사업자등록번호가 아닙니다.")
    						document.ff2.cpnum.value = ""; 
    					}
    					 */
                   }else if ( data.count == 1 ){ 
                  
                      	alert("이미 등록된 사업자 번호 입니다.")
                      	document.ff2.cpnum.value = ""; 
                   } 
                } , error: function(){ 
                      	alert("사업자등록번호를 입력해주세요"); 
                    } 
             }); 
          }); 
     });
</script>



<script>
	function check_busino(vencod) {
		var sum = 0;
		var getlist =new Array(10);
		var chkvalue =new Array("1","3","7","1","3","7","1","3","5");
		for(var i=0; i<10; i++) { getlist[i] = vencod.substring(i, i+1); }
		for(var i=0; i<9; i++) { sum += getlist[i]*chkvalue[i]; }
		sum = sum + parseInt((getlist[8]*5)/10);
		sidliy = sum % 10;
		sidchk = 0;
		if(sidliy != 0) { sidchk = 10 - sidliy; }
		else { sidchk = 0; }
		if(sidchk != getlist[9]) { return false; }
		return true;
	}
				
 				
  				
	function sendIt(){
		if(document.ff2.cpname.value.length == 0){
			alert("업체명을 입력하세요.");
			document.ff2.cpname.focus();
			return;
		}
		if(document.ff2.cpnum.value.length == 0){
			alert("사업자 등록번호를 입력하세요.")
			document.ff2.cpnum.focus();
			return;
		}
		if(document.ff2.cphomepage.value.length == 0){
			alert("홈페이지를 입력하세요.")
			document.ff2.cphomepage.focus();
			return;
		}
		if(document.ff2.cpestablished.length == 0){
			alert("설립년도를 입력하세요.")
			document.ff2.cpestablished.focus();
			return;
		}
		if(document.ff2.cpceo.value.length == 0){
			alert("대표자 성명을 입력해 주세요");
			document.ff2.cpceo.focus();
			return;
		}
		if(document.ff2.cpzipcode.value.length == 0){
			alert("우편번호를 입력해 주세요");
			document.ff2.cpzipcode.focus();
			return;
		}
		if(document.ff2.cpaddr2.value.length == 0){
			alert("나머지 주소를 입력해 주세요");
			document.ff2.cpaddr2.focus();
			return;
		}
		if(document.ff2.cpsector.value.length == 0){
			alert("업종을 입력해 주세요");
			document.ff2.cpsector.focus();
			return;
		}
		if(document.ff2.cpbusinessarea.value.length == 0){
			alert("사업분야를 입력해 주세요");
			document.ff2.cpbusinessarea.focus();
			return;
		}
		if(document.ff2.cpcontactname.value.length == 0){
			alert("담당자 성명을 입력해 주세요");
			document.ff2.cpcontactname.focus();
			return;
		}
		if(document.ff2.cpcontactposition.value.length == 0){
			alert("담당자 직위를 입력해 주세요");
			document.ff2.cpcontactposition.focus();
			return;
		}
		if(document.ff2.cpcontacttel.value.length == 0){
			alert("담당자 연락처를 입력해 주세요");
			document.ff2.cpcontacttel.focus();
			return;
		}
					
		var okBt = confirm("업체 등록을 하시겠습니까?");
						
		if(okBt != 0){
			document.ff2.action = "/addcom.do";
			document.ff2.submit();
		}				
				
	}
				
			
	function checkLen(pMaxlen, pObj){


		var temp;  
				 
		var memocount; //문자길이 누적

					
		memocount = 0;
				 
		len = pObj.value.length;
		for(k=0; k<len; k++){

					
		memocount++;
				
				
				 
	}

				 
	if (pMaxlen < memocount) {
				  
		alert('입력할 수 있는 최대길이를 넘었습니다.');
			  
		pObj.value = pObj.value.substring(0, pMaxlen);
				  
		pObj.focus();
				 
	}
 
} 
</script>

<script>


   function goPopup() {
      // 주소검색을 수행할 팝업 페이지를 호출합니다.
      // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
      var pop = window.open("address_pop.do", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");

   // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
   //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
   }

   function jusoCallBack(roadFullAddr, zipNo, addrDetail) {
      // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
      document.getElementById("roadFullAddr").value = roadFullAddr;
      document.getElementById("zipNo").value = zipNo;
      document.getElementById("addrDetail").value = addrDetail;

   }
</script>

<style type="text/css">
	footer {
		margin-top: 80px;
	}
</style>

</head>

<body>

	<jsp:include page="../main/header.jsp" />
	<jsp:include page="../main/navigator.jsp" />


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			EMPLOYMENT <small>업체등록관리</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item">
			<a href="/index.do">
			<img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px">
			</a>
			</li>
			<li class="breadcrumb-item"><a href="/company.do">인재추천의뢰</a></li>
			<li class="breadcrumb-item active">업체등록관리</li>
		</ol>




		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->
			<jsp:include page="../include/companyinclude.jsp" />


			<!-- Content Column -->
			<div class="col-lg-9 mb-4">


				<!-- /addcom.do -->

				<div id="right-container">
					<form name="ff2" method="post">
						<table width="690" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="75"><img
									src="http://www.sist.co.kr/images/talente/inf_list1_1.jpg"
									width="690" height="75"></td>
							</tr>
							<tr>
								<td><img
									src="http://www.sist.co.kr/images/talente/inf0101_text1.jpg"></td>
							</tr>
							<tr>
								<td style="height: 10px"></td>
							</tr>
							<tr>
								<td><img
									src="http://www.sist.co.kr/images/talente/inf0101_text2.jpg"></td>
							</tr>
							<tr>
								<td height="20"><img
									src="http://www.sist.co.kr/images/talente/hr.jpg" width="690"
									height="20"></td>
							</tr>
							<tr>
								<td height="75"><img
									src="http://www.sist.co.kr/images/talente/inf_list1_2.jpg"
									width="690" height="75"></td>
							</tr>
							<tr>
								<td>

									<table width="100%" border="0" cellspacing="1" cellpadding="3">
										<tr class="attendTxt">
											<td width="8" height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="89" align="left"><font color="#000000">업체명</font></td>
											<td width="170"><input name="cpname" type="text"
												class="fmTxt" size=30></td>

											<td width="6" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="118"><font color="#000000">사업자등록번호</font></td>
											<td width="160">
												<table width="160" border="0" cellspacing="0"
													cellpadding="0">
													<tr class="dottednone">
														<td><input name="cpnum" id="cpnum" type="text"
															class="fmTxt" maxLength="10" size="12"></td>
														<td><input type="button" id="cpnumbtn" value="중복확인"
															style="cursor: hand"></td>
													</tr>
												</table>
											</td>

											<!-- onClick="duplicate_id()"  -->

										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">홈페이지</font></td>
											<td colspan="4" align="left"><input name="cphomepage"
												type="text" class="fmTxt" value="http://" size="75"></td>
										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">설립년도</font></td>
											<td align="left"><INPUT maxLength=4 size=4
												name="cpestablished" class=fmTxt> 년 </td>
											<td align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">대표자성명</font></td>
											<td align="left"><input name="cpceo" type="text"
												class="fmTxt" size="10"></td>
										</tr>

										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">우편번호</font></td>
											<td colspan="4" align="left">
												<table width="215" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td><input type="tel" class="form-control" id="zipNo"
															name="cpzipcode" placeholder="우편번호" /></td>
														<td>
															<button class="btn btn-primary" id="zip_codeBtn"
																onclick="goPopup();" type="button">우편번호 찾기</button>
														</td>
													</tr>


												</table>
											</td>
										</tr>


										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">주소</font></td>
											<td align="left"><input name="cpaddr1" type="text"
												class="fmTxt" size="24" maxlength="75"></td>
										</tr>
										<tr class="attendTxt">
											<td align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">나머지 주소</font></td>
											<td align="left"><input name="cpaddr2" type="text"
												class="fmTxt" size="24" maxlength="75"></td>
										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">종업원수</font></td>
											<td align="left"><input name="cpempnum"
												onkeyup="if ( isNaN(this.value) ) { alert('숫자만 쓰세요'); this.value=''; }"
												style='IME-MODE: disabled' type="text" class="fmTxt"
												maxLength=5 size=4> 명</td>
											<td align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">업종</font></td>
											<td align="left"><input name="cpsector" type="text"
												class="fmTxt" size="24" maxlength="40"></td>
										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">규모</font></td>
											<td align="left"><input name="cpscale" type="text"
												class="fmTxt" size="15" maxlength="15"></td>
											<td align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">사업분야</font></td>
											<td align="left"><input name="cpbusinessarea"
												type="text" class="fmTxt" size="15" maxlength="15"></td>
										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">연매출액</font></td>
											<td align="left"><input name="cpannual" type="text"
												class="fmTxt" size="15" maxlength="15"></td>
											<td align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">팩스번호</font></td>
											<td align="left"><input name="cpfax" type="text"
												class="fmTxt" size="15" maxlength="15"></td>
										</tr>
										<tr class="dottednone">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">기타사항</font></td>
											<td colspan="4" align="left"><textarea name="cpetc"
													cols="65" rows="5" class="fmTxt"
													onKeyUp="checkLen(200, this);"></textarea></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="20"><img
									src="http://www.sist.co.kr/images/talente/hr.jpg" width="690"
									height="20"></td>
							</tr>
							<tr>
								<td height="75"><img
									src="http://www.sist.co.kr/images/talente/inf_list1_3.jpg"
									width="690" height="75"></td>
							</tr>
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="1" cellpadding="3">
										<tr class="attendTxt">
											<td width="10" height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="110" align="left"><font color="#000000">성명</font></td>
											<td width="145" align="left"><input name="cpcontactname"
												type="text" class="fmTxt" size="6" maxlength="6"></td>
											<td width="13" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="100" align="left"><font color="#000000">직위</font></td>
											<td width="155" align="left"><input
												name="cpcontactposition" type="text" class="fmTxt" size="24"
												maxlength="40"></td>
										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">담당자연락처</font></td>
											<td align="left"><input name="cpcontacttel" type="text"
												class="fmTxt" size="15" maxlength="15" placeholder=" - 제외 "></td>
											<td align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">회사번호</font></td>
											<td align="left"><input name="cptel" type="text"
												class="fmTxt" size="15" maxlength="15" placeholder=" - 제외 "></td>
										</tr>
										<tr class="dottednone">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">이메일</font></td>
											<td colspan="4" align="left"><input
												name="cpcontactemail" type="text" class="fmTxt" size="75"
												maxlength="75"></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="text-align: center; height: 50px; margin-top: 80px;">
									<input class="btn btn-primary" type="button" value="신청하기"
									onclick="sendIt();" style="cursor: pointer" />
									 
									<input class="btn btn-primary" type="reset"
									style="cursor: pointer" />
								</td>
							</tr>
						</table>
						<input type="hidden" name="num_ch" />
					</form>
				</div>


			</div>
		</div>
		<!-- /.row -->




	</div>
	<!-- /.container -->


	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<jsp:include page="../main/footer.jsp" />
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>