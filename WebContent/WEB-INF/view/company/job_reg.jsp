<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>쌍용교육센터</title>


<!--     Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">


<!-- ajax를 사용하는 선언 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$("document").ready(function() {
		$("#cpnumFindbtn1").click(function() {
			// list.do?
			var params = $("form").serialize();

			$.ajax({
				url : "coNumCheck.do",
				dataType : "json",
				type : "post",
				data : params,
				cache : false,
				success : function(data) {

					if (data.count == 1) {

						alert("등록되어 있는 사업자 등록번호 입니다");

					} else if (data.count == 0) {

						alert("등록되지 않은 사업자 등록번호 입니다")
						document.ff2.cpnum.value = "";
					}

				},
				error : function() {
					alert("사업자등록번호를 입력해주세요");
				}
			});
		});
	});
</script>



<script type="text/javascript">


	function get_lastday(year, month) {
		var last = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
		if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0))
			last[1] = 29;

		return last[parseInt(month - 1)];
	}

	function replace_text(obj) {
		box = obj;
		box.value = box.value.replace(/\s/g, "");

	}

	function sendIt() {
		replace_text(document.ff2.cpnum);
		if (document.ff2.cpnum.value.length == 0) {
			alert("사업자 등록번호를 입력하세요.")
			document.ff2.cpnum.focus();
			return;
		}

		replace_text(document.ff2.jrfields);
		if (document.ff2.jrfields.value.length == 0) {
			alert("모집 분야를 입력하세요.")
			document.ff2.jrfields.focus();
			return;
		}
		replace_text(document.ff2.jrworkplace);
		if (document.ff2.jrworkplace.value.length == 0) {
			alert("근무지를 입력하세요.")
			document.ff2.jrworkplace.focus();
			return;
		}
		replace_text(document.ff2.jrrequiredskill);
		if (document.ff2.jrrequiredskill.value.length == 0) {
			alert("요구 기술을 입력하세요.")
			document.ff2.jrrequiredskill.focus();
			return;
		}
		replace_text(document.ff2.jrrecruit);
		if (document.ff2.jrrecruit.value.length == 0) {
			alert("채용인원을 입력하세요.")
			document.ff2.jrrecruit.focus();
			return;
		}


		if (document.ff2.cpnum.value.length == 0) {
			alert("사업자 등록번호를 체크 하셔야 합니다.");
			return;
		}

		var okBt = confirm("구인 의뢰 신청을 하시겠습니까?");
		
		if(okBt != 0){
			document.ff2.action = "/addjob.do";
			document.ff2.submit();
		}

	}

	function checkLen(pMaxlen, pObj) {
		var temp;

		var memocount; //문자길이 누적


		memocount = 0;

		len = pObj.value.length;
		for (k = 0; k < len; k++) {

			memocount++;

		}


		if (pMaxlen < memocount) {

			alert('입력할 수 있는 최대길이를 넘었습니다.');

			pObj.value = pObj.value.substring(0, pMaxlen);

			pObj.focus();

		}

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
			EMPLOYMENT <small>구인의뢰 신청</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/index.do"><img alt=""
					src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png"
					width="25px" height="25px"></a></li>
			<li class="breadcrumb-item"><a href="/company.do">인재추천의뢰</a></li>
			<li class="breadcrumb-item active">구인의뢰 신청</li>
		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Sidebar Column -->

			<jsp:include page="../include/companyinclude.jsp" />


			<!-- Content Column -->
			<div class="col-lg-9 mb-4">

				<div id="right-container" class="o2">
				<h3><span class="index">구인의뢰신청</span></h3>

				</div>

				<div class="sub_content_center_wrap">
					<form name="ff2" method="post">
						<table width="690" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="75"><img
									src="http://www.sist.co.kr/images/talente/inf_list2_1.jpg"
									width="690" height="75"></td>
							</tr>
							<tr>
								<td>

									<table width="100%" border="0" cellspacing="1" cellpadding="3">
										<tr class="attendTxt">
											<td width="10" height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="110" align="left"><font color="#000000">사업자등록번호</font></td>
											<td colspan="4"><table width="160" border="0"
													cellspacing="0" cellpadding="0">
													<tr class="dottednone">
														<td><input name="cpnum" type="text" class="fmTxt"
															maxLength="10" size="12"> <input name="num_ch"
															type="hidden" /></td>
														<td><input type="button" style="cursor: hand"
															id="cpnumFindbtn1" onClick="duplicate_id()" value="확인"></td>
													</tr>
												</table></td>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">모집분야</font></td>
											<td colspan="4" align="left"><TEXTAREA value="it"
													class="fmTxt" name="jrfields" rows=3 wrap=hard cols=65
													onKeyUp="checkLen(100, this);"></TEXTAREA></td>
										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">담당업무</font></td>
											<td colspan="4" align="left"><input maxLength=100
												size=44 class=fmTxt name="jrrespon"
												onKeyUp="checkLen(25, this);"></td>
										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">근무지</font></td>
											<td width="220" align="left"><select name="jrworkplace"
												class="fmTxt">
													<option value="서울">서울</option>
													<option value="경기">경기</option>
													<option value="인천">인천</option>
													<option value="부산">부산</option>
													<option value="대구">대구</option>
													<option value="광주">광주</option>
													<option value="대전">대전</option>
													<option value="울산">울산</option>
													<option value="세종">세종</option>
													<option value="강원">강원</option>
													<option value="경남">경남</option>
													<option value="경북">경북</option>
													<option value="전남">전남</option>
													<option value="전북">전북</option>
													<option value="충남">충남</option>
													<option value="충북">충북</option>
													<option value="제주">제주</option>
											</select></td>
											<td width="13" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="55" align="left"><font color="#000000">연봉</font></td>
											<td align="left">약 
											 <input value="" name="jrsal" type="text" class="fmTxt"
												size="7"
												onKeyPress="if((event.keyCode<48)||(event.keyCode >57)){event.returnValue=false;}"
												style="text-align: right; ime-mode: disabled; padding-right: 2px">만원
											</td>
										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">요구기술</font></td>
											<td colspan="4" align="left"><textarea value="java"
													name="jrrequiredskill" cols="65" rows="5" class="fmTxt"></textarea></td>
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
									src="http://www.sist.co.kr/images/talente/inf_list2_2.jpg"
									width="690" height="75"></td>
							</tr>
							<tr>
								<td>

									<table width="100%" border="0" cellspacing="1" cellpadding="3">
										<tr class="attendTxt">
											<td width="10" height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="110" align="left"><font color="#000000">학력</font></td>
											<td width="145" align="left"><SELECT name="jreducation">
													<OPTION value="고졸 이상">고졸 이상</OPTION>
													<OPTION value="초대졸 이상">초대졸 이상</OPTION>
													<OPTION value="대졸 이상">대졸 이상</OPTION>
													<OPTION value="제한없음" selected>제한없음</OPTION>
											</SELECT></td>
											<td align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">경력</font></td>
											<td align="left"><INPUT value="" type="number"
												maxLength=2 size=3 name="jrcareer" class="fmTxt"> 년
											</td>
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
									src="http://www.sist.co.kr/images/talente/inf_list2_3.jpg"
									width="690" height="75"></td>
							</tr>
							<tr>
								<td>

									<table width="100%" border="0" cellspacing="1" cellpadding="3">

										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">채용인원</font></td>
											<td width="145" align="left"><INPUT type="number"
												value="" maxLength=2 size=4 name="jrrecruit" class="fmTxt">명 </td>
											<td width="13" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="100" align="left"><font color="#000000">접수마감일</font></td>
											<td width="155" align="left"><INPUT type="text"
												maxLength=11 size=11 name="jrdeadline" class="fmTxt" placeholder=" 2019/01/01 "></td>
										</tr>
										<tr class="attendTxt">
											<td height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">근무조건</font></td>
											<td width="145" align="left">주 <INPUT value=""
												maxLength=2 size=4 name="jrcondition" class="fmTxt">
												일 <FONT color=#FF6600></FONT></td>
											<td width="13" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="100" align="left"><font color="#000000">고용형태</font></td>
											<td width="155" align="left"><SELECT name="jremptype">
													<OPTION value="정규직">정규직</OPTION>
													<OPTION value="계약직">계약직</OPTION>
													<OPTION value="인턴직">인턴직</OPTION>
											</SELECT></td>
										</tr>
										<tr class="attendTxt">
											<td width="10" height="30" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td width="110" align="left"><font color="#000000">우대사항</font></td>
											<td colspan="4" align="left"><INPUT value="" type="text"
												size=30 name="jrpreference" onKeyUp="checkLen(25, this);"
												class="fmTxt"></td>
										</tr>
										<tr class="dottednone">
											<td height="15" align="center"><img
												src="http://www.sist.co.kr/images/recommend/ico_squarered.gif"
												width="3" height="3"></td>
											<td align="left"><font color="#000000">기타</font></td>
											<td height="15" colspan="4" align="left"><textarea
													name="jretc" cols="65" rows="10" class="fmTxt"></textarea></td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="text-align: center; height: 80px">
									<input class="btn btn-primary" type="button" value="신청하기"
									onclick="sendIt();" style="cursor: pointer"> 
									<input class="btn btn-primary" type="reset" width="83" height="24">
								</td>
							</tr>
						</table>
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
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>