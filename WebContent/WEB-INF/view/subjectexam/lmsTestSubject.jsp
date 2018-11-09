<%@page import="lms.student.dto.MemberDTO"%>
<%@page import="lms.student.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%
String memberId = (String) session.getAttribute("loginUser");
MemberDAO dao = MemberDAO.getInstance();
MemberDTO dto = dao.getMember(memberId);
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
th {
	width: 20%;
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

input[type="radio"] {
	border: 1px solid #D8D8D8;
}


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
						<i class="fas fa-edit"></i> 시험 과목 현황
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" style="width: 100%; cellspacing: 0;">

								<tbody>
									<tr>
										<th>과목명</th>
										<th>NCS</th>
										<th>교강사</th>
										<th>평가</th>
										<th>시험현황</th>
									</tr>
									
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="dto" varStatus="status">
										<tr>
											<td>${dto.subjectsName }</td>
											<td>${dto.subjectsDiv }</td>
											<td>${dto.pName }</td>
											<td>${dto.semDiv }</td>
											<td>
												<c:if test="${dto.semCurr eq '출제전'}">
													<button type="button" class="btn btn-secondary">시험대기중</button>
												</c:if>
												<!-- semScore변경하기 -->
												<c:if test="${dto.semScore eq 0 and dto.semCurr eq '출제완료'}">
													<button type="button" class="btn btn-success" data-toggle="modal"
		data-target="#testModal" data-backdrop="static">미응시</button>											
												</c:if>
												<c:if test="${dto.semCurr eq '출제완료' and dto.semScore ne 0}">
													<button type="button" class="btn btn-danger">시험결과</button>
												</c:if>	
											</td>
										</tr>
										</c:forEach>
									</c:if>
									
									<c:if test="${empty list }">
										<tr>
											<td colspan="5">
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

<!-- 	Modal -->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">


		<!-- modal-lg 추가 -->
			<form action="/modalTestEx01.jsp">
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
						<i class="fas fa-book-open"></i> 과목명 DB 시험문제지

	
					</div>
					<div class="card-body">
						<div class="table-responsive">

							<table class="table table-bordered"
								style="border-collapse: collapse;">
								<tbody>
									<c:if test="${!empty list }">
										<c:forEach items="${list }" var="dto" varStatus="status">
											<tr>
												<th>교과목</th>
												<td colspan="3">${dto.subjectsName }</td>
											</tr>
																	
											<tr>
												<th class="tableTdwidth2">평가일시</th>
												<td class="tableTdwidth2">${dto.semDate }</td>
												<th class="tableTdwidth2">훈련생</th>
												<td class="tableTdwidth2"><%=dto.getmName() %></td>
											</tr>
											
											<tr>
												<th class="tableTdwidth2">능력단위명</th>
												<td class="tableTdwidth2">${dto.unitName }</td>
												<th class="tableTdwidth2">훈련교사</th>
												<td class="tableTdwidth2">${dto.pName }</td>
											</tr>			
											
											<tr>
												<th class="tableTdwidth2">평가유형</th>
												<td class="tableTdwidth2">${dto.semType }</td>
												<th class="tableTdwidth2">평가시간/총배점</th>
												<td class="tableTdwidth2">${dto.semTime }분 / ${dto.semScore }</td>
											</tr>		

										</c:forEach>
									</c:if>																							
										
									<tr>
										<th>능려단위 요소</th>
										<td colspan="3">문항</td>
									</tr>	
									
									<tr>
										<th>현행 시스템 분석하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항1]</span>
												개발하고자 하는 응용소프트웨어에 대한 이해를 높이기 위해, 현행 시스템의 적용현황을 파악함으로써 개발범위와 향후 개발될 시스템으로의 이행 방향성을 분석하는 방법으로 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz1" />1) 현행 시스템 파악의 정의는 현행 시스템이 어떤 하위 시스템으로 구성되어 있는지, 제공하는 기능이 무엇인지, 다른 시스템들과 어떤 정보를 주고받는지, 어떤 기술요소를 사용하고 있는지, 사용하고 있는 소프트웨어 및 하드웨어는 무엇인지, 네트워크는 어떻게 구성되어 있는지 등을 파악하는 활동이다.<br />
												<hr />
												<input type="radio" value="2" name="quiz1" />2) 현행 시스템 파악 절차는 1단계 현행 시스템의 구성, 기능, 인터페이스 현황을 파악하는 단계와 2단계 현행 시스템의 아키텍처 및 소프트웨어 구성 현황을 파악하는 단계로 활동한다.<br />
												<hr />
												<input type="radio" value="3" name="quiz1" />3) 현행 시스템 구성 현황 작성 시 고려 사항으로 각 업무에 속하는 단위 업무 정보시스템들의 명칭, 주요 기능들을 명시함으로써 조직 내 존재하는 모든 정보시스템의 현황을 파악하도록 한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz1" />4) 현행 시스템 아키텍처 구성도의 정의는 기간 업무를 수행하기 위하여 계층별로 어떠한 기술 요소들을 사용하고 있는지 최상위 수준에서 그림으로 표현한 것이다.<br />
										</td>
									</tr>
									
									<tr>
										<th class="innerTableWidth">현행 시스템 분석하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항2]</span>
												개발하고자 하는 응용소프트웨어와 관련된 운영체제, 데이터베이스관리시스템, 미들웨어 등의 요구사항을 식별하는 설명으로 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz2" />1) 운영체제 관련 요구사항 식별을 위해 고려해야 할 사항으로 신뢰도, 성능, 기술 지원, 주변 기기, 구축 비용을 확인한다.<br />
												<hr />
												<input type="radio" value="2" name="quiz2" />2) DBMS의 정의는 사용자, 다른 애플리케이션, 데이터베이스와 상호 작용하여 데이터를 저장하고 분석하기 위한 컴퓨터 소프트웨어 애플리케이션으로, 데이터베이스 생성, 조회, 변경 등의 관리가 주요 기능이다.<br />
												<hr />
												<input type="radio" value="3" name="quiz2" />3) 미들웨어의 정의는 운영체제와 소프트웨어 애플리케이션 사이에 위치하는 미들웨어(Middleware)는 소프트웨어 애플리케이션에게 운영체제가 제공하는 서비스를 추가 및 확장하여 제공하는 컴퓨터 소프트웨어를 말한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz2" />4) 미들웨어 중 웹 애플리케이션 서버(WAS: Web Application Server)는 소스 코드를 공개해 누구나 특별한 제한 없이 그 코드를 보고 사용할 수 있는 오픈 소스 라이선스를 만족하는 소프트웨어를 말한다.<br />
										</td>
									</tr>				
									
									<tr>
										<th class="innerTableWidth">현행 시스템 분석하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항3]</span>
												현행 시스템을 분석하여, 개발하고자 하는 응용소프트웨어가 이후 적용될 목표시스템을 명확하고 구체적으로 기술하기 위한 설명으로 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz3" />1) DBMS의 종류는 Oracle, IBM DB2, MySQL, MongoDB 등이 있다.<br />
												<hr />
												<input type="radio" value="2" name="quiz3" />2) 주요 운영체제로는 마이크로소프트 윈도즈(Microsoft Windows), 유닉스(UNIX), 리눅스(Linux), 아이오에스(iOS), 안드로이드(Android) 등이 있다.<br />
												<hr />
												<input type="radio" value="3" name="quiz3" />3) 자바 가상 머신(JVM: Java Virtual Machine)은 다양한 하드웨어 및 운영체제에서 자바 (Java) 언어로 작성된 애플리케이션을 수행하기 위한 사양(JVM Specification)의 구현체 (Implementation)를 의미한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz3" />4) 일반적으로 리눅스(Linux) 기반 시스템이 하드웨어 및 소프트웨어 소유 비용이 가장 많이 소요된다.<br />
												<hr />
												<input type="radio" value="4" name="quiz3" />5) 안정적이고 신뢰할 수 있으며 대용량 처리를 위해서는 유닉스(UNIX) 기반 시스템이 선호되고 있다.<br />												
										</td>
									</tr>																

									<tr>
										<th class="innerTableWidth">요구사항 확인하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항4]</span>
												소프트웨어 공학기술의 요구사항 분석 기법을 활용하여 업무 분석가가 정의한 응용소프트웨어의 요구사항을 확인하는 방법으로 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz4" />1) 요구사항 도출은 소프트웨어가 해결해야 할 문제를 이해하는 첫 번째 단계로서 요구사항이 어디에 있고, 어떻게 수집할 것인가와 관련되어 있다.<br />
												<hr />
												<input type="radio" value="2" name="quiz4" />2) 요구사항 분석은 요구사항들 간 상충되는 것을 해결하고, 소프트웨어의 범위를 파악하며, 소프트웨어가 환경과 어떻게 상호 작용하는지 이해하는 과정이다.<br />
												<hr />
												<input type="radio" value="3" name="quiz4" />3) 요구사항 분석시 소프트웨어 요구사항을 정제하여 시스템 요구사항을 도출한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz4" />4) 요구사항 명세란 체계적으로 검토, 평가, 승인될 수 있는 문서를 작성하는 것을 의미한다. 시스템 정의, 시스템 요구사항, 소프트웨어 요구사항을 작성한다.<br />
										</td>
									</tr>			
									
									<tr>
										<th class="innerTableWidth">요구사항 확인하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항5]</span>
												요구사항 분석을 통해 요구사항을 기술하는 설명 중에서 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz5" />1) 요구사항 분석을 통해 요구사항을 기술할 때에는 아래의 작업들이 가능하도록 충분하고 정확하게 기술하여야 한다. - 요구사항의 확인(Validation) - 요구사항 구현의 검증(Verification) - 비용 추정<br />
												<hr />
												<input type="radio" value="2" name="quiz5" />2) 분석기법으로 요구사항 분류((Requirement Classification), 개념 모델링(Conceptual Modeling), 요구사항 할당((Requirement Allocation), 요구사항 협상((Requirement Negotiation), 정형 분석(Formal Analysis) 등이 있다.<br />
												<hr />
												<input type="radio" value="3" name="quiz5" />3) 개념 모델의 역할은 실세계 문제에 대한 모델링이 소프트웨어 요구사항 분석의 핵심이며, 모델은 문제가 발생하는 상황에 대한 이해를 증진시키고 해결책을 설명한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz5" />4) 개념 모델의 모델링 표기법으로 대부분 UML(Unified Modeling Language)을 사용한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz5" />5) UML 다이어그램에서 행위 다이어그램(Behavior Diagram)은 시스템의 정적 구조(Static Structure)와 다양한 추상화 및 구현 수준에서 시스템의 구성 요소, 구성 요소들 간의 관계를 보여 준다.<br />									
										</td>
									</tr>
									
									<tr>
										<th class="innerTableWidth">요구사항 확인하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항6]</span>
												업무 분석가가 분석한 요구사항에 대해 정의된 검증 기준과 절차에 따라서 요구사항을 확인하는 방법으로 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz6" />1) 요구사항 검증의 가장 일반적인 방법으로, 여러 검토자들이 에러, 잘못된 가정, 불명확성, 표준과의 차이 등을 찾아내는 작업을 수행하며, 검토자 그룹을 어떻게 구성하느냐가 중요하다.<br />
												<hr />
												<input type="radio" value="2" name="quiz6" />2) 검토는 시스템 정의서(System Definition Document), 시스템 사양서(System Specification), 소프트웨어 요구사항 명세서(SRS: Software Requirements Specification Document)를 완성한 시점 등에서 이루어진다.<br />
												<hr />
												<input type="radio" value="3" name="quiz6" />3) 프로토타이핑은 새로운 요구사항을 도출하기 위한 수단으로, 또한 소프트웨어 요구사항에 대해 소프트웨어 엔지니어가 해석한 것을 확인하기 위한 수단으로 많이 사용된다.<br />
												<hr />
												<input type="radio" value="4" name="quiz6" />4) 요구사항 확인에서 최종 제품이 요구사항을 만족시키는지 확인하는 인수 테스트는 불필요하다.<br />
												<hr />
												<input type="radio" value="4" name="quiz6" />5) 요구사항 확인에서 분석가가 요구사항을 이해했는지 확인(Validation)하는 것이 필요하고, 요구사항 문서가 회사의 표준에 적합하고 이해 가능하고, 일관성이 있고, 완전한지 검증(Verification)하는 것이 중요하다.<br />									
										</td>
									</tr>																											

									<tr>
										<th class="innerTableWidth">요구사항 확인하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항7]</span>
												업무 분석가가 수집하고 분석한 요구사항이 개발하고자 하는 응용소프트웨어에 미칠 영향에 대해서 검토하고 확인하는 설명으로 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz7" />1) 요구사항의 기술적 타당성 검토 4단계는 성능 및 용량산정의 적정성, 시스템 간 상호 운용성, IT 시장 성숙도 및 트렌드 부합성, 기술적 위험 분석이다.<br />
												<hr />
												<input type="radio" value="2" name="quiz7" />2) 기술적 위험 분석은 요구사항을 만족시키기 위하여 적용한 기술의 복잡성, 검증 여부, 의존성 등에 대하여 위험 발생 가능성, 영향도를 파악한다.<br />
												<hr />
												<input type="radio" value="3" name="quiz7" />3) 시스템 구축 시 요구되는 영역별 정보 기술들의 시장 성숙도 및 발전 방향이 요구사항에 부합하는지 판단하지 않아도 된다.<br />
												<hr />
												<input type="radio" value="4" name="quiz7" />4) 요구사항중에서 목표 시스템이 조직 내외 타 시스템과의 연동을 요구하는 경우, 상호 운용이 가능한지 여부를 판단해야 한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz7" />5) 목표 시스템의 용량이 산정되면, 과거 유사 프로젝트 경험치를 적용하여 필요시 재조정한 후, 성능 관련 비기능 요구사항과 비교하여 적정성 여부를 판단한다.<br />									
										</td>
									</tr>		

									<tr>
										<th class="innerTableWidth">분석모델 확인하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항8]</span>
												소프트웨어 공학기술의 요구사항 도출 기법을 활용하여 업무 분석가가 제시한 분석모델에 대해서 확인하는 설명으로 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz8" />1) 분석모델 검증 방법으로 유스케이스 모델 검증, 개념 수준의 분석 클래스 검증, 분석 클래스 검증 절차를 진행한다.<br />
												<hr />
												<input type="radio" value="2" name="quiz8" />2) 분석 클래스 검증의 점검 대상은 액터, 유스케이스, 유스케이스 명세서이다.<br />
												<hr />
												<input type="radio" value="3" name="quiz8" />3) 분석 클래스의 스테레오 타입 중 경계(Boundary)는 시스템이 유지해야 하는 정보를 관리하는 기능을 전담하는 클래스이다.<br />
												<hr />
												<input type="radio" value="4" name="quiz8" />4) 분석 클래스의 스테레오 타입 중 제어(Control)는 시스템이 제공하는 기능의 로직 및 제어를 담당하는 클래스이다.<br />
												<hr />
												<input type="radio" value="4" name="quiz8" />5) 유스케이스마다 분석 클래스가 적절히 도출되었고, 제어 클래스의 도출 등이 충분하고 상세하게 도출되어 클래스의 역할, 클래스 간의 관계, 메시지 흐름 등을 확인할 수 있는지 검토한다.<br />									
										</td>
									</tr>	
									
									<tr>
										<th class="innerTableWidth">분석모델 확인하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항9]</span>
												소프트웨어 공학기술의 요구사항 도출 기법을 활용하여 업무 분석가가 제시한 분석모델에 대해서 확인하는 설명으로 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz9" />1) 분석모델까지 요구사항 추적표를 작성하고 검토 의견 컬럼을 추가한다.<br />
												<hr />
												<input type="radio" value="2" name="quiz9" />2) 요구사항 추적표에서 요구사항에 대한 검토 의견을 정제시, 누락된 유스케이스 모델/개념 수준 분석 클래스/분석 클래스가 존재하는 경우, 검토 의견에 “비기능 요구사항, 작성 불필요”라고 입력한다.<br />
												<hr />
												<input type="radio" value="3" name="quiz9" />3) 유스케이스 모델 검토 의견을 작성한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz9" />4) 개념 수준 분석 클래스 모델 검토 의견을 작성한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz9" />5) 분석 클래스 모델 검토 의견을 작성한다.<br />									
										</td>
									</tr>	
									
									<tr>
										<th class="innerTableWidth">분석모델 확인하기</th>
										<td colspan="3">
											<p class="quizbar quizContent">
												<span class="quizNum">[문항10]</span>
												업무 분석가가 제시한 분석모델이 개발할 응용소프트웨어에 미칠 영향을 검토하여 기술적인 타당성 조사를 하는 방법으로 올바르지 않은 것은? (배점:10)
											</p>
												<input type="radio" value="1" name="quiz10" />1) 분석모델을 이용하여 보다 구체적으로, 시스템 간 상호 정보 및 서비스를 교환 가능한지 검토한다.<br />
												<hr />
												<input type="radio" value="2" name="quiz10" />2) 분석모델을 구현하기 위하여 특정 업체 기술, 특허, 라이선스에 의존해야 하는지는 제외한다.<br />
												<hr />
												<input type="radio" value="3" name="quiz10" />3) 분석모델이 검증되지 않은 기술의 사용을 가정으로 하고 있어 추가적인 비용 발생 가능성이 있는지 확인한다.<br />
												<hr />
												<input type="radio" value="4" name="quiz10" />4) 유스케이스 모델의 개별 유스케이스에 대한 분석모델을 작성한 이후, 해당 분석모델로 시스템을 개발하는 경우에 어떠한 영향을 미치는지 필요한 자원, 상호 운용성, 시장 성숙도, 기술적 위험 분석 측면에서 타당성을 조사한다.<br />
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