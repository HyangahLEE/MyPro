<%@page import="lms.student.dto.TrainingDTO"%>
<%@page import="lms.student.dto.MemberDTO"%>
<%@page import="lms.student.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String memberId = (String) session.getAttribute("loginUser");
	MemberDAO dao = MemberDAO.getInstance();
	MemberDTO dto = dao.getMember(memberId);
	TrainingDTO tdto = dao.getTraining(memberId);

	System.out.printf(" 사후관리 페이지 " + "%s, %s\n", dto.getMemberId(), tdto.getMemberId());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>쌍용교육센터</title>
<script>
	$(document).ready(function() {

	});
</script>
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
td {
	text-align: center;
	vertical-align: middle;
}

#tableFirst  th, #tableFirst  td {
	width: 16.6%;
	text-align: center;
	vertical-align: middle;
}

#tableSecond th {
	width: 20%;
	text-align: center;
	vertical-align: middle;
}

#tableThird th {
	width: 33.3%;
	text-align: center;
	vertical-align: middle;
}

#tableFourth th {
	width: 16.6%;
	text-align: center;
	vertical-align: middle;
}

#tablesixth th {
	width: 16.6%;
	text-align: center;
	vertical-align: middle;
}

#tableseventh th {
	width: 16.6%;
	text-align: center;
	vertical-align: middle;
}

#tablesixth input[type="text"] {
	width: 150px;
}

#tableseventh input[type="text"] {
	width: 150px;
}
</style>

</head>
<body id="page-top">

	<jsp:include page="/WEB-INF/view/layout/lmsStudentHeader.jsp"></jsp:include>

	<div id="wrapper">

		<jsp:include page="/WEB-INF/view/layout/lmsStudentNav.jsp"></jsp:include>

		<div id="content-wrapper">

			<div class="container-fluid">

				<form action="/followupupdate.do" method="post">

					<!-- DataTables Example -->
					<div class="card mb-3" id="tableFirst">
						<div class="card-header">
							<i class="fas fa-user"></i> 기본 정보
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered"
									style="border-collapse: collapse; width: 100%;">
									<tbody>

										<tr>
											<th>성명</th>
											<td><%=dto.getmName()%></td>
											<th>생년월일</th>
											<td><%=dto.getmBirth()%></td>
											<th>성별</th>
											<td><%=dto.getmGender().equals("1") || dto.getmGender().equals("3")  ? "남" : "여" %></td>
										</tr>
										<tr>
											<th>훈련과정명</th>
											<td colspan="2"><%=tdto.getTpName()%></td>
											<th>교육기간</th>
											<td colspan="2"><%=tdto.getTpoStartDt()%> ~ <%=tdto.getTpoEndDt()%>
											</td>
										</tr>
										<tr>
											<th>수료일</th>
											<td colspan="2"></td>
											<th>제적일</th>
											<td colspan="2"></td>
										</tr>

										<c:if test="${!empty list }">
											<c:forEach items="${list }" var="jdto" varStatus="status">

												<!-- 학력, 전공 if 조건문 걸기 -->
												<tr>

													<th>최종학력<br />(학교명)
													</th>

													<!-- 대학원 -->
													<c:if test="${! empty jdto.gSchool}">
														<td>${jdto.gSchool}대학원</td>
													</c:if>
													<!-- 대학교 -->
													<c:if
														test="${empty jdto.gSchool and ! empty jdto.university}">
														<td>${jdto.university}대학교</td>
													</c:if>
													<!-- 대학 -->
													<c:if
														test="${empty jdto.gSchool and empty jdto.university and ! empty jdto.college}">
														<td>${jdto.college}대학</td>
													</c:if>
													<!-- 고등학교 -->
													<c:if
														test="${empty jdto.gSchool and empty jdto.university and empty jdto.college and ! empty jdto.hSchool}">
														<td>${jdto.hSchool}고등학교</td>
													</c:if>

													<th>전공</th>

													<!-- 대학원 학과-->
													<c:if test="${! empty jdto.gDepartment}">
														<td>${jdto.gDepartment}</td>
													</c:if>
													<!-- 대학교 학과-->
													<c:if
														test="${empty jdto.gDepartment and ! empty jdto.uDepartment}">
														<td>${jdto.uDepartment}</td>
													</c:if>
													<!-- 대학교 학과-->
													<c:if
														test="${empty jdto.gDepartment and empty jdto.uDepartment and ! empty jdto.cDepartment}">
														<td>${jdto.cDepartment}</td>
													</c:if>

													<th>본인휴대폰</th>
													<td><c:set var="phoneN" value="<%= dto.getmPhone()%>" />
														${fn:substring(phoneN,0,3) }-${fn:substring(phoneN,3,7) }-${fn:substring(phoneN,7,11) }
													</td>
												</tr>
											</c:forEach>
										</c:if>


									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 첫번째 테이블 -->

					<div class="card mb-3" id="tableSecond">
						<div class="card-header">
							<i class="fas fa-building"></i> 경력 사항
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered"
									style="border-collapse: collapse; width: 100%;">
									<tbody>

										<tr>
											<th>근무처</th>
											<!-- <th>근무시간</th> -->
											<th>직위</th>
											<th>담당업무</th>
											<th>급여수준</th>
										</tr>

										<!-- 경력사항이 있는 경우 -->
										<c:if test="${!empty list }">
											<c:forEach items="${list }" var="dto" varStatus="status">

												<tr>
													<td>${dto.workesA }</td>
													<!-- <td>DB</td> -->
													<td>${dto.position }</td>
													<td>${dto.mworkEa }</td>
													<td>${dto.salary }</td>
												</tr>
											</c:forEach>
										</c:if>

										<!-- 경력 사항이 없는 경우 -->
										<c:if test="${empty list }">
											<c:forEach items="${list }" var="dto" varStatus="status">

												<tr>
													<td></td>
													<!-- <td>DB</td> -->
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</c:forEach>
										</c:if>


									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 두번째 테이블 -->

					<div class="card mb-3" id="tableThird">
						<div class="card-header">
							<i class="fas fa-address-card"></i> 자격 취득 사항
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered"
									style="border-collapse: collapse; width: 100%;">
									<tbody>
										<tr>
											<th>자격 · 면허</th>
											<th>발급기관</th>
											<th>발급일자</th>
										</tr>

										<!-- 자격증이 있는 경우만 작성하기 -->
										<c:if test="${!empty list }">
											<c:forEach items="${list }" var="dto" varStatus="status">
												<tr>
													<td>${dto.licensEa }</td>
													<td>${dto.issuanceA }</td>
													<td>${dto.acQuisitionYa }.${dto.acQuisitionMa }.${dto.acQuisitionDa }</td>
												</tr>
											</c:forEach>
										</c:if>

									</tbody>
								</table>
							</div>
						</div>
					</div>


					<!-- 			<form action="/followupupdate.do" method="post" >	 -->

					<div class="card mb-3" id="tableFourth">
						<div class="card-header">
							<i class="fas fa-plus"></i> 기타 사항
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered"
									style="border-collapse: collapse; width: 100%;">
									<tbody>
										<tr>
											<th rowspan="2" colspan="2">외국어</th>
											<th colspan="2">시험</th>
											<th colspan="2">점수·등급</th>
										</tr>

										<!-- 시험 성적은 무조건 1개만 있는 걸로 작성 forEach문 작성X 상관없음-->
										<c:if test="${!empty list }">
											<c:forEach items="${list }" var="dto" varStatus="status">

												<tr>
													<td colspan="2">${dto.testA }</td>
													<td colspan="2">${dto.scoreA }</td>
												</tr>

											</c:forEach>
										</c:if>

										<!-- 시험 성적은 없는 경우-->
										<c:if test="${empty list }">
											<c:forEach items="${list }" var="dto" varStatus="status">

												<tr>
													<td colspan="2"></td>
													<td colspan="2"></td>
												</tr>

											</c:forEach>
										</c:if>


										<tr>
											<th colspan="2">고용지원금 대상자 여부<br />(지원프로그램명 기재)
											</th>
											<td><input type="radio" name="raeligibleck" value="Y"
												${ fudto.raeligibleck eq "Y" ? "checked" : ""} />Y <input
												type="radio" name="raeligibleck" value="N"
												style="margin-left: 10px;"
												${ fudto.raeligibleck eq "N" ? "checked" : ""} />N</td>
											<th colspan="2">소속기관명<br />(취업성공패키지 등)
											</th>
											<td><input type="text" name="rafacility"
												value="${ fudto.rafacility }" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="card mb-3" id="tableFifth">
						<div class="card-header">
							<i class="fas fa-plus"></i> 교육기관 수료 후 취득 직무능력 조사
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered"
									style="border-collapse: collapse; width: 100%;">
									<tbody>
										<tr>
											<th colspan="2">보유기술</th>
											<td colspan="2"><input type="text" name="ratecha"
												value="${ fudto.ratecha }" /></td>
											<td colspan="2"><input type="text" name="ratechb"
												value="${ fudto.ratechb }" /></td>
										</tr>
										<tr>
											<th colspan="2">기타특이사항</th>
											<td colspan="4"><input type="text" style="width: 400px;"
												name="raothers" value="${ fudto.raothers }" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="card mb-3" id="tablesixth">
						<div class="card-header">
							<i class="fas fa-lightbulb"></i> 수료 후 희망 근무 조건
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered"
									style="border-collapse: collapse; width: 100%;">
									<tbody>
										<tr>
											<th>희망지역</th>
											<td><input type="text" name="rgida"
												value="${ fudto.rgida }" /></td>
											<td><input type="text" name="rgidb"
												value="${ fudto.rgidb }" /></td>
											<td><input type="text" name="rgidc"
												value="${ fudto.rgidc }" /></td>
											<th>취업<br />희망분야
											</th>
											<td><input type="text" name="wfield"
												value="${ fudto.wfield }" /></td>
										</tr>
										<tr>
											<th>가능<br />고용형태
											</th>
											<td colspan="2"><input type="radio" name="htype"
												value="정규직" ${ fudto.htype eq "정규직" ? "checked" : ""} />정규직
												<input type="radio" name="htype" value="계약직"
												${ fudto.htype eq "계약직" ? "checked" : ""} />계약직 <input
												type="radio" name="htype" value="인턴직"
												${ fudto.htype eq "인턴직" ? "checked" : ""} />인턴직</td>
											<th>가능<br />근무형태
											</th>
											<td colspan="2"><input type="radio" name="wtype"
												value="주5일" ${ fudto.wtype eq "주5일" ? "checked" : ""} />주5일
												<input type="radio" name="wtype" value="주6일"
												style="margin-left: 10px;"
												${ fudto.wtype eq "주6일" ? "checked" : ""} />주6일 <input
												type="radio" name="wtype" value="격주휴무"
												style="margin-left: 10px;"
												${ fudto.wtype eq "격주휴무" ? "checked" : ""} />격주휴무</td>
										</tr>
										<tr>
											<th>가능<br />근무시간
											</th>
											<td colspan="2"><input type="radio" name="wtime"
												value="주간" ${ fudto.wtime eq "주간" ? "checked" : ""} />주간 <input
												type="radio" name="wtime" value="야간"
												style="margin-left: 10px;"
												${ fudto.wtime eq "야간" ? "checked" : ""} />야간 <input
												type="radio" name="wtime" value="심야"
												style="margin-left: 10px;"
												${ fudto.wtime eq "심야" ? "checked" : ""} />심야</td>
											<th>희망<br />급여수준
											</th>
											<td colspan="2"><input type="text" name="radesiredsal"
												value="${ fudto.radesiredsal }" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="card mb-3" id="tableseventh">
						<div class="card-header">
							<i class="fas fa-star-of-life"></i> 취업 관리 사항
						</div>
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-bordered"
									style="border-collapse: collapse; width: 100%;">
									<tbody>
										<tr>
											<th>업체명</th>
											<td><input type="text" name="cname"
												value="${ fudto.cname }" /></td>
											<th>사업자<br />등록번호
											</th>
											<td><input type="text" name="cpnum"
												value="${ fudto.cpnum }" /></td>
											<th>취업<br />확인서
											</th>
											<td><input type="radio" name="echeck" value="Y"
												${ fudto.echeck eq "Y" ? "checked" : ""} />Y <input
												type="radio" name="echeck" value="N"
												style="margin-left: 10px;"
												${ fudto.echeck eq "N" ? "checked" : ""} />N</td>
										</tr>
										<tr>
											<th>주소</th>
											<td colspan="3"><input type="text" name="addr"
												value="${ fudto.addr }" style="width: 500px;" /></td>
											<th>연락처</th>
											<td><input type="text" name="phone"
												value="${ fudto.phone }" /></td>
										</tr>
										<tr>
											<th>근무직종</th>
											<td><input type="text" name="efield"
												value="${ fudto.efield }" /></td>
											<th>고용보험<br />여부
											</th>
											<td><input type="radio" name="insuranceck" value="Y"
												${ fudto.insuranceck eq "Y" ? "checked" : ""} />Y <input
												type="radio" name="insuranceck" value="N"
												style="margin-left: 10px;"
												${ fudto.insuranceck eq "N" ? "checked" : ""} />N</td>
											<th>취업일</th>
											<td><input type="text" name="edate"
												value="${ fudto.edate }" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- 수정버튼 -->
					<input type="submit" class="btn btn-danger" value="수정"
						style="margin-bottom: 50px; float: right;" />
				</form>
				<!-- form태그 닫기 -->
			</div>
			<jsp:include page="/WEB-INF/view/layout/lmsStudentFooter.jsp"></jsp:include>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


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