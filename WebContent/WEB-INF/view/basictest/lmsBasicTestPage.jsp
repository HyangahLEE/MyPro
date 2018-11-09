<%@page import="lms.student.dto.MemberDTO"%>
<%@page import="lms.student.dto.TrainingDTO"%>
<%@page import="lms.student.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%
String memberId = (String) session.getAttribute("loginUser");
MemberDAO dao = MemberDAO.getInstance();
TrainingDTO tdto = dao.getTraining(memberId);
MemberDTO dto = dao.getMember(memberId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IT리더교육센터</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
#baseTable th {
	width: 25%;
}
table {
	text-align: center;
	vertical-align: middle;
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
</style>

<script>
	$(document).ready(function(){
	
        $('#radioButton').click(function () {
            // getter

            oneN = Number($('input[name="quiz1"]:checked').val());
           // alert(oneN);
            twoN = Number($('input[name="quiz2"]:checked').val());
            threeN = Number($('input[name="quiz3"]:checked').val());
            fourN = Number($('input[name="quiz4"]:checked').val());
            fiveN = Number($('input[name="quiz5"]:checked').val());
            sixN = Number($('input[name="quiz6"]:checked').val());
            sevenN = Number($('input[name="quiz7"]:checked').val());
            eigthN = Number($('input[name="quiz8"]:checked').val());
            nineN = Number($('input[name="quiz9"]:checked').val());
            tenN = Number($('input[name="quiz10"]:checked').val());
            
            var result = oneN + twoN + threeN + fourN + fiveN + sixN + sevenN + eigthN + nineN + tenN;
            
            /* alert(Number(result)); */
            
				/* $("#testScore").text(result); */
				/* 	$("#js_result").val(sum); */
 
			$("#totalScore").val(Number(result));
			$("#seCurr").val("출제완료");
			
            return result;

          });
		
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
						<i class="fas fa-edit"></i> 시험 과목 현황
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table id="baseTable" class="table table-bordered" style="width: 100%; cellspacing: 0;">

								<tbody>
									<tr>
										<th>평가</th>
										<th>평가유형</th>
										<th>담당교수</th>
										<th>시험현황</th>
									</tr>
									
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="dto" varStatus="status">
											<tr>
												<td>${dto.seName }</td>
												<td>${dto.seType }</td>
												<td>${dto.pName }</td>
												
									<!-- 모달창 == 미응시버튼에 적용 예정 -->
												<td>
												<c:if test="${dto.seCurr eq '출제전' or empty dto.seCurr}">
													<button type="button" class="btn btn-secondary">시험대기중</button>
												</c:if>
												<c:if test="${dto.totalScore eq 0 and dto.seCurr eq '출제완료' }">								
													<button type="button" class="btn btn-success" data-toggle="modal"
		data-target="#testModal" data-backdrop="static">미응시</button>
												</c:if>
												<c:if test="${dto.seCurr eq '출제완료' and dto.totalScore ne 0}">												
													<button type="button" class="btn btn-danger" data-toggle="modal"
		data-target="#testModal" data-backdrop="static">시험결과</button>
												</c:if>										
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
	
	
	<!-- 	Test Modal -->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
	
			<!-- modal -->
		<form action="/basicScore.do">
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
							<i class="fas fa-book-open"></i> 사전 평가지
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered"
									style="border-collapse: collapse;">
									<tbody>
										<c:forEach items="${list }" var="dto" varStatus="status">
											<tr>
												<th class="studentTableTh">과정명</th>
												<td class="tableTdwidth1"><%=tdto.getTpName() %></td>
												<th class="studentTableTh">평가시간</th>
												<td class="tableTdwidth2">${dto.seTime }분</td>
											</tr>
											<tr>
												<th>훈련생</th>
												<td><%=dto.getmName() %></td>
												<th>훈련교사</th>
												<td><%=tdto.getpName() %></td>
											</tr>
											<tr>
												<th>평가유형</th>
												<td>${dto.seType }</td>
												<th>총배점</th>
												<td>${dto.seScore }</td>
											</tr>
											
											<tr>
												<th>평가점수</th>
												<td>
													<c:if test="${dto.totalScore ne 0}">
															<span>${dto.totalScore}</span>
													</c:if>
													<c:if test="${dto.totalScore eq 0}">
															<span></span>
													</c:if>													
												</td>
												<th>성취수준</th>
												<td>
													<c:if test="${dto.totalScore ne 0}">
														<c:set var="grade" value="${dto.totalScore }"></c:set>
		
														<c:choose>
															  <c:when test="${grade > 0 and grade < 60}">
															     1 수준
															  </c:when>
															  <c:when test="${grade >= 60 and grade < 70}">
															     2 수준
															  </c:when>
															  <c:when test="${grade >= 70 and grade < 80}">
															     3 수준
															  </c:when>
															  <c:when test="${grade >= 80 and grade < 90}">
															     4 수준
															  </c:when>
															  <c:when test="${grade >= 90 and grade == 100}">
															     5 수준
															  </c:when>
															  <c:otherwise>
															     
															  </c:otherwise>
														  </c:choose>
													  </c:if>
												</td>
											</tr>
										</c:forEach>
										<tr>
											<th>성취기준</th>
											<td colspan="3">
												<table style="margin: 0 auto; width: 100%;">
													<tr>
														<th>수준</th>
														<th>5수준</th>
														<th>4수준</th>
														<th>3수준</th>
														<th>2수준</th>
														<th>1수준</th>
													</tr>
													<tr>
														<td class="innerTableWidth">점수구간</td>
														<td class="innerTableWidth">90점 이상</td>
														<td class="innerTableWidth">80~89점</td>
														<td class="innerTableWidth">70~79점</td>
														<td class="innerTableWidth">60~69점</td>
														<td class="innerTableWidth">60점 미만</td>
													</tr>
												</table>
											</td>
										</tr>

										<tr>
											<th style="width: 15%;">진단영역</th>
											<th colspan="3">문항</th>
										</tr>
										<tr>
											<th>훈련과정이해</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항1]</span> 나는 국가직무능력표준 (NCS)가
													산업현장에서 직무를 수행하기 위해 요구되는 지식‧기술‧태도 등의 내용을 국가가 체계화한 것임을 알고 있다.
													(배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz1" checked="checked"/>전혀모른다 <input type="radio"
												value="4" name="quiz1" />거의모른다 <input type="radio"
												value="6" name="quiz1" />보통이다 <input type="radio" value="8"
												name="quiz1" />잘안다 <input type="radio" value="10"
												name="quiz1" />매우잘안다
											</td>
										</tr>
										<tr>
											<th>NCS<br />훈련과정이해
											</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항2]</span> 나는 NCS채용을 통한 기업의 능력중심
													인사관리 및 근로자의 평생경력 관리 지원에 활용하는 것을 알고 있다. (배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz2" />전혀모른다 <input type="radio"
												value="4" name="quiz2" checked="checked"/>거의모른다 <input type="radio"
												value="6" name="quiz2" />보통이다 <input type="radio" value="8"
												name="quiz2" />잘안다 <input type="radio" value="10"
												name="quiz2" />매우잘안다
											</td>
										</tr>
										<tr>
											<th>NCS<br />훈련과정이해
											</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항3]</span> 나는 NCS 훈련과정은 훈련생 성취도 평가를
													위해 능력단위별 평가를 실시한다는 사실을 알고 있다. (배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz3" />전혀모른다 <input type="radio"
												value="4" name="quiz3" checked="checked"/>거의모른다 <input type="radio"
												value="6" name="quiz3" />보통이다 <input type="radio" value="8"
												name="quiz3" />잘안다 <input type="radio" value="10"
												name="quiz3" />매우잘안다
											</td>
										</tr>

										<tr>
											<th>훈련과정<br />이해도<br />(선수학습 및 경력)
											</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항4]</span> 나는 해당 훈련과정과 유사한 과목을 학교에서
													수강한 경험이 있다 (배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz4" />전혀모른다 <input type="radio"
												value="4" name="quiz4" checked="checked"/>거의모른다 <input type="radio"
												value="6" name="quiz4" />보통이다 <input type="radio" value="8"
												name="quiz4" />잘안다 <input type="radio" value="10"
												name="quiz4" />매우잘안다
											</td>
										</tr>

										<tr>
											<th>훈련과정<br />이해도<br />(선수학습 및 경력)
											</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항5]</span> 나는 해당 훈련과정과 유사한 훈련과정을
													정규교육과정 이외에 수강한 경험이 있다. (배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz5" checked="checked"/>전혀모른다 <input type="radio"
												value="4" name="quiz5" />거의모른다 <input type="radio"
												value="6" name="quiz5" />보통이다 <input type="radio" value="8"
												name="quiz5" />잘안다 <input type="radio" value="10"
												name="quiz5" />매우잘안다
											</td>
										</tr>

										<tr>
											<th>훈련과정<br />이해도<br />(선수학습 및 경력)
											</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항6]</span> 나는 해당 훈련과정의 훈련목표를 숙지하고
													있다. (배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz6" checked="checked"/>전혀모른다 <input type="radio"
												value="4" name="quiz6" />거의모른다 <input type="radio"
												value="6" name="quiz6" />보통이다 <input type="radio" value="8"
												name="quiz6" />잘안다 <input type="radio" value="10"
												name="quiz6" />매우잘안다
											</td>
										</tr>

										<tr>
											<th>훈련과정<br />이해도<br />(선수학습 및 경력)
											</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항7]</span> 나는 해당 훈련과정 수강을 통해 성취도가
													향상 되리라 생각된다. (배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz7" checked="checked"/>전혀모른다 <input type="radio"
												value="4" name="quiz7" />거의모른다 <input type="radio"
												value="6" name="quiz7" />보통이다 <input type="radio" value="8"
												name="quiz7" />잘안다 <input type="radio" value="10"
												name="quiz7" />매우잘안다
											</td>
										</tr>

										<tr>
											<th>교육의지</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항8]</span> 나는 훈련과정과 관련된 수업 내용에 대한
													관심을 가지고 있다. (배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz8" checked="checked"/>전혀모른다 <input type="radio"
												value="4" name="quiz8" />거의모른다 <input type="radio"
												value="6" name="quiz8" />보통이다 <input type="radio" value="8"
												name="quiz8" />잘안다 <input type="radio" value="10"
												name="quiz8" />매우잘안다
											</td>
										</tr>

										<tr>
											<th>교육의지</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항9]</span> 나는 훈련과정 수강 중 평가와 관련된 정보를
													제공 받기를 희망한다. (배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz9" />전혀모른다 <input type="radio"
												value="4" name="quiz9" checked="checked"/>거의모른다 <input type="radio"
												value="6" name="quiz9" />보통이다 <input type="radio" value="8"
												name="quiz9" />잘안다 <input type="radio" value="10"
												name="quiz9" />매우잘안다
											</td>
										</tr>

										<tr>
											<th>교육의지</th>
											<td colspan="3">
												<p class="quizbar quizContent">
													<span class="quizNum">[문항10]</span> 나는 지각‧조퇴‧결석 없이 훈련과정을
													성실하게 수강한다. (배점:5)
												</p> <span class="answerFont">작성 답안 :</span> <input type="radio"
												value="2" name="quiz10" />전혀모른다 <input type="radio"
												value="4" name="quiz10" />거의모른다 <input type="radio"
												value="6" name="quiz10" checked="checked"/>보통이다 <input type="radio" value="8"
												name="quiz10" />잘안다 <input type="radio" value="10"
												name="quiz10" />매우잘안다
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소</button>
							
<!-- 						<a class="btn btn-primary" href="#" style="margin-left: 10px;">제출</a> -->

						<input id="radioButton" type="submit" value="제출" class="btn btn-primary" style="margin-left: 10px;"/>
					</div>
				</div>
				
				<input type="hidden" name="totalScore" id="totalScore" value=""/>
				<input type="hidden" name="memberId" value="<%=dto.getMemberId()%>"/>
				<input type="hidden" name="seCurr" id="seCurr" value=""/>
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