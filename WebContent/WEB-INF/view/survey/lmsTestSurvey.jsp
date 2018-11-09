<%@page import="lms.student.dto.TrainingDTO"%>
<%@page import="lms.student.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%
String memberId = (String) session.getAttribute("loginUser");
MemberDAO dao = MemberDAO.getInstance();
TrainingDTO tdto = dao.getTraining(memberId);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>쌍용교육센터</title>
<!-- Bootstrap core CSS-->
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
/* th {
	width: 25%;
} */
table {
	text-align: center;
	vertical-align: middle;
}

.modifyWidth {
	width: 40%;
}

th:not(.modifyWidth){
	width: 20%;
}
</style>

<style>

.modal-content th {
	background-color: #B4B4FF;
	color: white;
}


.quizNum {
	color: red;
}

.quizbar {
	border-bottom: 1px solid #D8D8D8;
	padding-bottom: 10px;
}

.tableThwidth {
	width: 15%;
}

.tableTdwidth2 {
	width: 25%;
}

.tableTdwidth1 {
	width: 45%;
}

.answerFont {
	font-size: 0.8rem;
	font-weight: bold;
}

.quizContent {
	text-align: justify;
}

.modalFontsize {
	font-size: 0.85rem;
}

.innerTableWidth {
width: 16.66%;
}

input[type="radio"] {
margin : 0 10px;
</style>

<script>
	$(document).ready(function(){
	
	});
</script>
</head>
<body id="page-top">

	<jsp:include page="/WEB-INF/view/layout/lmsStudentHeader.jsp"></jsp:include>

	<div id="wrapper">

		<jsp:include page="/WEB-INF/view/layout/lmsStudentNav.jsp"></jsp:include>
		
		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- DataTables Example -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-file-signature"></i> 과정 설문조사 현황
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" style="width: 100%; cellspacing: 0;">

								<tbody>
									<tr>
										<th class="modifyWidth">설문</th>
										<th>훈련교수</th>
										<th>설문일시</th>
										<th>설문현황</th>
									</tr>
									
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="dto" varStatus="status">
											<tr>
												<td>${dto.surQuestion }</td>
												<td>${dto.pName }</td>
												<td>${dto.ssmTime }</td>
												<td>
													<c:if test="${dto.ssmDiv eq '작성완료' }">
														<button type="button" class="btn btn-danger">참여완료</button>
													</c:if>
													<c:if test="${dto.ssmDiv eq '미작성' }">
														<button type="button" class="btn btn-success"  data-toggle="modal"
		data-target="#testModal" data-backdrop="static">미참여</button>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									
									<c:if test="${empty list }">
										<tr>
											<td colspan="4">
												<i class="fas fa-exclamation-triangle"></i> <span style="margin-left: 5px;">등록된 내용이 없습니다.</span>
											</td>
										</tr>
									</c:if>
									
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
			<jsp:include page="/WEB-INF/view/layout/lmsStudentFooter.jsp"></jsp:include>
		</div>
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	

<!-- Modal -->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">


		<!-- modal-lg 추가 -->
			<form action="/survey.do">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<!-- DataTables Example -->
	
				<div class="card mb-3 modalFontsize">
					<div class="card-header">
						<i class="fas fa-book-open"></i> 설문지

	
					</div>
					<div class="card-body">
						<div class="table-responsive">

							<table class="table table-bordered"
								style="border-collapse: collapse;">
								<tbody>
									<tr>
										<th class="tableThwidth">과정명</th> <!-- 15 -->
										<td class="tableTdwidth1"><%=tdto.getTpName()%></td> <!-- 45 -->
										<th class="tableThwidth">교육기간</th> <!-- 15 -->
										<td class="tableTdwidth2"><%=tdto.getTpoStartDt() %> ~ <%=tdto.getTpoEndDt() %></td> <!-- 25 -->
									</tr>
									<tr>
										<td colspan="4">
										본 설문은 쌍용교육센터 직업교육과정 <span><b><%=tdto.getTpName() %></b></span>를 파악하기 위한 조사입니다.
의견을 수렴하여 앞으로의 교육과정에 유용한 자료로 활용 하고자 하오니 정확한 조사가 되도록 설문지 작성에 많은 협조 부탁드립니다. <br />
<b>각 질문을 자세히 읽고 해당란을 선택하여 주시기 바랍니다.</b>
										</td>
									</tr>
									
									<tr>
									<th colspan="4">설문지 문항</th>
									</tr>	
									
									<tr>
										<th rowspan="2">설문 1<br />[강사평가]<br />- 과목평가</th>
										<td colspan="3"><b>1. 교육내용에 대한 이해도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey1" value="1"/>미흡
										<input type="radio" name="survey1" value="2"/>다소 미흡
										<input type="radio" name="survey1" value="3"/>보통
										<input type="radio" name="survey1" value="4"/>다소 만족
										<input type="radio" name="survey1" value="5"/>매우 만족																													
										</td>
									</tr>
									
									<tr>
										<th rowspan="2">설문 2<br />[강사평가]<br />- 과목평가</th>
										<td colspan="3"><b>2. 과목구성 및 내용의 적합성</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey2" value="1"/>미흡
										<input type="radio" name="survey2" value="2"/>다소 미흡
										<input type="radio" name="survey2" value="3"/>보통
										<input type="radio" name="survey2" value="4"/>다소 만족
										<input type="radio" name="survey2" value="5"/>매우 만족																																
										</td>
									</tr>	
									
									<tr>
										<th rowspan="2">설문 3<br />[강사평가]<br />- 과목평가</th>
										<td colspan="3"><b>3. 시간배분</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey3" value="1"/>미흡
										<input type="radio" name="survey3" value="2"/>다소 미흡
										<input type="radio" name="survey3" value="3"/>보통
										<input type="radio" name="survey3" value="4"/>다소 만족
										<input type="radio" name="survey3" value="5"/>매우 만족																																
										</td>
									</tr>		

									<tr>
										<th rowspan="2">설문 4<br />[강사평가]<br />- 강사평가</th>
										<td colspan="3"><b>1. 교육열의 및 준비도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey4" value="1"/>미흡
										<input type="radio" name="survey4" value="2"/>다소 미흡
										<input type="radio" name="survey4" value="3"/>보통
										<input type="radio" name="survey4" value="4"/>다소 만족
										<input type="radio" name="survey4" value="5"/>매우 만족																														
										</td>
									</tr>	
									
									<tr>
										<th rowspan="2">설문 5<br />[강사평가]<br />- 강사평가</th>
										<td colspan="3"><b>2. 강의기법</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey5" value="1"/>미흡
										<input type="radio" name="survey5" value="2"/>다소 미흡
										<input type="radio" name="survey5" value="3"/>보통
										<input type="radio" name="survey5" value="4"/>다소 만족
										<input type="radio" name="survey5" value="5"/>매우 만족																														
										</td>
									</tr>			
									
									<tr>
										<th rowspan="2">설문 6<br />[강사평가]<br />- 강사평가</th>
										<td colspan="3"><b>3. 교육내용에 대한 전문성</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey6" value="1"/>미흡
										<input type="radio" name="survey6" value="2"/>다소 미흡
										<input type="radio" name="survey6" value="3"/>보통
										<input type="radio" name="survey6" value="4"/>다소 만족
										<input type="radio" name="survey6" value="5"/>매우 만족																														
										</td>
									</tr>				
									
									<tr>
										<th rowspan="2">설문 7<br />[강사평가]<br />- 강사평가</th>
										<td colspan="3"><b>4. 질의응답 및 사례의 적합성</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey7" value="1"/>미흡
										<input type="radio" name="survey7" value="2"/>다소 미흡
										<input type="radio" name="survey7" value="3"/>보통
										<input type="radio" name="survey7" value="4"/>다소 만족
										<input type="radio" name="survey7" value="5"/>매우 만족																														
										</td>
									</tr>	
									
									<tr>
										<th rowspan="2">설문 8<br />[강사평가]<br />- 교재평가</th>
										<td colspan="3"><b>1. 교재의 활용도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey8" value="1"/>미흡
										<input type="radio" name="survey8" value="2"/>다소 미흡
										<input type="radio" name="survey8" value="3"/>보통
										<input type="radio" name="survey8" value="4"/>다소 만족
										<input type="radio" name="survey8" value="5"/>매우 만족																														
										</td>
									</tr>																																		

									<tr>
										<th rowspan="2">설문 9<br />[강사평가]<br />- 교재평가</th>
										<td colspan="3"><b>2. 교과내용과 교재의 일치성</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey9" value="1"/>미흡
										<input type="radio" name="survey9" value="2"/>다소 미흡
										<input type="radio" name="survey9" value="3"/>보통
										<input type="radio" name="survey9" value="4"/>다소 만족
										<input type="radio" name="survey9" value="5"/>매우 만족																														
										</td>
									</tr>		
									
									<tr>
										<th rowspan="2">설문 10<br />[강사평가]<br />- 교재평가</th>
										<td colspan="3"><b>3. 교과내용에 대한 본인의 관심도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey10" value="1"/>미흡
										<input type="radio" name="survey10" value="2"/>다소 미흡
										<input type="radio" name="survey10" value="3"/>보통
										<input type="radio" name="survey10" value="4"/>다소 만족
										<input type="radio" name="survey10" value="5"/>매우 만족																														
										</td>
									</tr>		
									
									<tr>
										<th rowspan="2">설문 11<br />[과정평가]<br />- 전반적인<br />교육과정 평가</th>
										<td colspan="3"><b>1. 본 교육과정의 전체 만족도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey11" value="1"/>미흡
										<input type="radio" name="survey11" value="2"/>다소 미흡
										<input type="radio" name="survey11" value="3"/>보통
										<input type="radio" name="survey11" value="4"/>다소 만족
										<input type="radio" name="survey11" value="5"/>매우 만족																														
										</td>
									</tr>																																			

									<tr>
										<th rowspan="2">설문 12<br />[과정평가]<br />- 전반적인<br />교육과정 평가</th>
										<td colspan="3"><b>2. 본 교육과정에 대한 본인 필요의 충족성</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey12" value="1"/>미흡
										<input type="radio" name="survey12" value="2"/>다소 미흡
										<input type="radio" name="survey12" value="3"/>보통
										<input type="radio" name="survey12" value="4"/>다소 만족
										<input type="radio" name="survey12" value="5"/>매우 만족																														
										</td>
									</tr>																																												

									<tr>
										<th rowspan="2">설문 13<br />[과정평가]<br />- 전반적인<br />교육과정 평가</th>
										<td colspan="3"><b>3. 본 교육과정에 대한 교육목표 달성도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey13" value="1"/>미흡
										<input type="radio" name="survey13" value="2"/>다소 미흡
										<input type="radio" name="survey13" value="3"/>보통
										<input type="radio" name="survey13" value="4"/>다소 만족
										<input type="radio" name="survey13" value="5"/>매우 만족																														
										</td>
									</tr>		
									
									<tr>
										<th rowspan="2">설문 14<br />[과정평가]<br />- 전반적인<br />교육과정 평가</th>
										<td colspan="3"><b>4. 본 과정을 주위 사람에게 추천하고 싶은 정도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey14" value="1"/>미흡
										<input type="radio" name="survey14" value="2"/>다소 미흡
										<input type="radio" name="survey14" value="3"/>보통
										<input type="radio" name="survey14" value="4"/>다소 만족
										<input type="radio" name="survey14" value="5"/>매우 만족																														
										</td>
									</tr>		
									
									<tr>
										<th rowspan="2">설문 15<br />[과정평가]<br />- 교육활용도 및 자기계발 적응도</th>
										<td colspan="3"><b>1. 향후 본 교육의 활용 예측정도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey15" value="1"/>미흡
										<input type="radio" name="survey15" value="2"/>다소 미흡
										<input type="radio" name="survey15" value="3"/>보통
										<input type="radio" name="survey15" value="4"/>다소 만족
										<input type="radio" name="survey15" value="5"/>매우 만족																														
										</td>
									</tr>			
									
									<tr>
										<th rowspan="2">설문 16<br />[과정평가]<br />- 교육활용도 및 자기계발 적응도</th>
										<td colspan="3"><b>2. 본 교육의 자기계발 도움정도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey16" value="1"/>미흡
										<input type="radio" name="survey16" value="2"/>다소 미흡
										<input type="radio" name="survey16" value="3"/>보통
										<input type="radio" name="survey16" value="4"/>다소 만족
										<input type="radio" name="survey16" value="5"/>매우 만족																														
										</td>
									</tr>		
									
									<tr>
										<th rowspan="2">설문 17<br />[과정평가]<br />- 운영평가</th>
										<td colspan="3"><b>1. 교육장 환경 및 시설에 대한 만족도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey17" value="1"/>미흡
										<input type="radio" name="survey17" value="2"/>다소 미흡
										<input type="radio" name="survey17" value="3"/>보통
										<input type="radio" name="survey17" value="4"/>다소 만족
										<input type="radio" name="survey17" value="5"/>매우 만족																														
										</td>
									</tr>	
									
									<tr>
										<th rowspan="2">설문 18<br />[과정평가]<br />- 운영평가</th>
										<td colspan="3"><b>2. 교육 담당자(매니저 선생님)의 진행 만족도</b></td>
									</tr>
									
									<tr>
										<td colspan="3">
										<input type="radio" name="survey18" value="1"/>미흡
										<input type="radio" name="survey18" value="2"/>다소 미흡
										<input type="radio" name="survey18" value="3"/>보통
										<input type="radio" name="survey18" value="4"/>다소 만족
										<input type="radio" name="survey18" value="5"/>매우 만족																														
										</td>
									</tr>
									
									<tr>
										<th rowspan="2">설문 19<br />[교육소감]</th>
										<td colspan="3"><b>※ 교육 전반에 대한 소감을 적어 주시기 바랍니다.</b></td>
									</tr>										

									<tr>
										<td colspan="3"><input type="text" name="servey19" maxlength="99" style="width: 100%;"/></td>
									</tr>																																																																	
								</tbody>
																								
							</table>
						</div>
					</div>
				</div>


				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
<!-- 					<a href="#" style="margin-left: 10px;">제출</a> -->

					<input id="radioButton" type="submit" value="제출" class="btn btn-primary" style="margin-left: 10px;"/>
				</div>
			</div>
		</div>
	</form>
	</div>
	
	

	<!-- Bootstrap core JavaScript-->
	<script src="/Resouces/vendor/jquery/jquery.min.js"></script>
	<script src="/Resouces/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/Resouces/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="/Resouces/vendor/chart.js/Chart.min.js"></script>
	<script src="/Resouces/vendor/datatables/jquery.dataTables.js"></script>
	<script src="/Resouces/vendor/datatables/dataTables.bootstrap4.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/Resouces/js/sb-admin.min.js"></script>

	<!-- Demo scripts for this page-->
	<script src="/Resouces/js/demo/datatables-demo.js"></script>
	<script src="/Resouces/js/demo/chart-area-demo.js"></script>

</body>
</html>