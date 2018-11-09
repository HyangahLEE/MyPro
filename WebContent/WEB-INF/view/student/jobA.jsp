<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 

    <title>쌍용 교육센터</title>

    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/modern-business.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">

</style>
<script>
function applyBnt() {
    if(document.getElementById("userId").value != "") {
        location.href="/index.do"; // 신청하기 폼
    } else {
        if(confirm("쌍용 교육센터의 회원이십니까?")) {
            location.href="/index.do"; // 로그인
        }
    }
    
}
function addCareer01() {
    var tag = "";
    tag += "<tr>";
    tag += "<th><input type='text' /></th>";
    tag += "<td>";
    tag += "<input type='text' size='3' maxlength='4' value='0' /> / ";
    tag += "<input type='text' size='2' maxlength='2' value='0' /> / ";
    tag += "<input type='text' size='2' maxlength='2' value='0' /> ~ ";
    tag += "<input type='text' size='3' maxlength='4' value='0' /> / ";
    tag += "<input type='text' size='2' maxlength='2' value='0' /> / ";
    tag += "<input type='text' size='2' maxlength='2' value='0' />";
    tag += "</td>";
    tag += "<td><input type='text' /></td>";
    tag += "<td><img src='http://sist.co.kr/images/btn/btn_x.gif' width='13' height='13' border='0' style='cursor:hand' alt='삭제' onclick='delCareerRow02(this)' /></td>";
    tag += "</tr>";
    $("#tableA").append(tag);
}

function delCareerRow01(aa) {
    $(aa).parent().parent().html('');
}

function addCareer02() {
    var tag = "";
    tag += "<tr>";
    tag += "<th><input type='text' /></th>";
    tag += "<td>";
    tag += "<input type='text' size='3' maxlength='4' value='0' /> / ";
    tag += "<input type='text' size='2' maxlength='2' value='0' /> / ";
    tag += "<input type='text' size='2' maxlength='2' value='0' />";
    tag += "</td>";
    tag += "<td><input type='text' /></td>";
    tag += "<td><img src='http://sist.co.kr/images/btn/btn_x.gif' width='13' height='13' border='0' style='cursor:hand' alt='삭제' onclick='delCareerRow02(this)' /></td>";
    tag += "</tr>";
    $("#tableB").append(tag);
}

function delCareerRow02(aa) {
    $(aa).parent().parent().html('');
}

function submitA() {
    
    $("#formA").submit();
    
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/view/main/header.jsp"/> 
<jsp:include page="/WEB-INF/view/main/navigator.jsp"/> 




    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3"> JOB CURRICULUM
        <small>취업교육과정</small>
      </h1>

			<ol class="breadcrumb">
			  <li class="breadcrumb-item"><a href="index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></a></li>
			  <li class="breadcrumb-item"><a href="/incumbent.do?index=11">취업교육과정</a></li>
			  <li class="breadcrumb-item active">${title }</li>
			</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <jsp:include page="/WEB-INF/view/include/incumbent.jsp"/>
        
        
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
         
    <form action="/jobAF.do" method="post" id="formA">
        <input type="hidden" name="tpid" id="tpid" value="${tpid }"/>
            <div style="margin-top: 20px;">
            <h3>기본사항</h3>
            </div>
            <div style="margin-top: 10px;">
            <ul>
                <li>
                <span> 지원과정 : </span> 
                <span>${tpname}</span>
                </li>
                <li>
                <span>아이디 : </span>
                <span>${memberInfo.memberid }</span>
                </li>
                <li>
                <span>주민등록번호 : </span>
                <span>******-*******</span>
                </li>
                <li>
                <span>성별 : </span>
                <c:if test="${memberInfo.mgender eq '남'}">
                    <input type="radio" name="aa" checked="checked" disabled="disabled"/>남자
                    <input type="radio" name="aa"  disabled="disabled"/>여자
                </c:if>
                <c:if test="${memberInfo.mgender eq '여'}">
                    <input type="radio" name="aa"  disabled="disabled"/>남자
                    <input type="radio" name="aa" checked="checked"  disabled="disabled"/>여자
                </c:if>
                
                </li>
                <li>
                <span>전화번호 : </span>
                <span>${memberInfo.mtel }</span>
                </li>
                <li>
                <span>휴대폰 : </span>
                <span>${memberInfo.mphone }</span>
                </li>
                <li>
                <span>우편번호 : </span>
                <span>${memberInfo.mzipcode}</span>
                </li>
                <li>
                <span>주소 1 : </span>
                <span>${memberInfo.maddr1 }</span>
                </li>
                <li>
                <span>이메일 : </span>
                <span>${memberInfo.memail }</span>
                </li>
            </ul>
            </div>
            
            
            <!--                                                  -->
            <h3 style="margin-top: 20px;">학력사항</h3>
            <table class="job_apply_content2" style="margin-top: 10px;">
                     <thead>
                        <tr>
                            <th class="h_col1" scope="col">학교 및 학과(계열)</th>
                            <th class="h_col2" scope="col">졸업년월</th>
                            <th class="h_col3" scope="col">졸업구분</th>
                            <th class="h_col4" scope="col">소재지</th>
                            <th class="h_col5" scope="col">성적</th>
                        </tr>
                     </thead>               
                                    
                     <tr>
                       <th>&nbsp;&nbsp;
                                     
                        <input type="text"  id="hschool" name="hschool" size="10" maxlength="20" />고등학교<br/>&nbsp;&nbsp;
                        <input type="text" id="linea" name="linea" size="10" maxlength="20"  />계열
                        <input type="hidden" name="hack_major_1_12" value="0000" />
                        </th>
                        <td>
                         <input type="text" id="hgyear" name="hgyear" size="7" maxlength="20" value="0" />년&nbsp;
                         <input type="text" id="hgmonth" name="hgmonth" size="7" maxlength="20" value="0" />월 &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                         <select id="hgclassification"name="hgclassification"  >
                               <option value=""></option> 
                               <option value="졸업" selected>졸업</option>
                               <option value="중퇴" >중퇴</option> 
                               <option value="수료" >수료</option> 
                               <option value="재학" >재학</option> 
                               <option value="졸업예정" >졸업예정</option>
                         </select>
                        </td>
                        <td> 
                         <select id="hlocation" name="hlocation">
                            <option value=""></option> 
                            <option value="강원도" >강원도</option> 
                            <option value="경기도" >경기도</option> 
                            <option value="경상남도" >경상남도</option> 
                            <option value="경상북도" >경상북도</option> 
                            <option value="광주광역시" >광주광역시</option> 
                            <option value="대구광역시" >대구광역시</option> 
                            <option value="대전광역시" >대전광역시</option> 
                            <option value="부산광역시" >부산광역시</option> 
                            <option value="서울특별시" selected>서울특별시</option> 
                            <option value="울산광역시" >울산광역시</option> 
                            <option value="인천광역시" >인천광역시</option> 
                            <option value="전라남도" >전라남도</option> 
                            <option value="전라북도" >전라북도</option> 
                            <option value="제주도" >제주도</option> 
                            <option value="충청남도" >충청남도</option>
                            <option value="충청북도" >충청북도</option>
                          </select>
                        </td>
                        <td>(예 : 3.5/4.5)</td>
                      </tr>
                      <tr>
                       <th>&nbsp;&nbsp;
                                     
                        <input type="text" id="college" name="college" size="10" maxlength="20" />대학<br/>&nbsp;&nbsp;
                        <input type="text" id="cdepartment" name="cdepartment" size="10" maxlength="20"  />학과
                        <input type="hidden" name="hack_major_1_12" value="0000" />
                        </th>
                        <td>
                         <input type="text" id="cgyear" name="cgyear" size="7" maxlength="20" value="0" />년&nbsp;
                         <input type="text" id="cgmonth" name="cgmonth" size="7" maxlength="20" value="0" />월 &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                         <select id="cgclassification" name="cgclassification"  >
                               <option value=""></option> 
                               <option value="졸업" >졸업</option>
                               <option value="중퇴" >중퇴</option> 
                               <option value="수료" >수료</option> 
                               <option value="재학" >재학</option> 
                               <option value="졸업예정" >졸업예정</option>
                         </select>
                        </td>
                        <td> 
                         <select id="clocation" name="clocation" >
                            <option value=""></option> 
                            <option value="강원도" >강원도</option> 
                            <option value="경기도" >경기도</option> 
                            <option value="경상남도" >경상남도</option> 
                            <option value="경상북도" >경상북도</option> 
                            <option value="광주광역시" >광주광역시</option> 
                            <option value="대구광역시" >대구광역시</option> 
                            <option value="대전광역시" >대전광역시</option> 
                            <option value="부산광역시" >부산광역시</option> 
                            <option value="서울특별시" >서울특별시</option> 
                            <option value="울산광역시" >울산광역시</option> 
                            <option value="인천광역시" >인천광역시</option> 
                            <option value="전라남도" >전라남도</option> 
                            <option value="전라북도" >전라북도</option> 
                            <option value="제주도" >제주도</option> 
                            <option value="충청남도" >충청남도</option>
                            <option value="충청북도" >충청북도</option>
                          </select>
                        </td>
                        <td>
                        <input type="text" id="csexualA" name="csexualA" size="2" maxlength="20" value="0" />/
                        <input type="text" id="csexualB" name="csexualB" size="2" maxlength="20" value="0" />
                        </td>
                      </tr>
                      <tr>
                       <th>&nbsp;&nbsp;
                                     
                        <input type="text" id="university" name="university" size="10" maxlength="20" />대학교<br/>&nbsp;&nbsp;
                        <input type="text" id="udepartment" name="udepartment" size="10" maxlength="20"  />학과
                        <input type="hidden" name="hack_major_1_12" value="0000" />
                        </th>
                        <td>
                         <input type="text" id="ugyear" name="ugyear" size="7" maxlength="20" value="0" />년&nbsp;
                         <input type="text" id="ugmonth" name="ugmonth" size="7" maxlength="20" value="0" />월 &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                         <select id="ugclassification" name="ugclassification"  >
                               <option value=""></option> 
                               <option value="졸업" >졸업</option>
                               <option value="중퇴" >중퇴</option> 
                               <option value="수료" >수료</option> 
                               <option value="재학" >재학</option> 
                               <option value="졸업예정" >졸업예정</option>
                         </select>
                        </td>
                        <td> 
                         <select id="ulocation" name="ulocation" >
                            <option value=""></option> 
                            <option value="강원도" >강원도</option> 
                            <option value="경기도" >경기도</option> 
                            <option value="경상남도" >경상남도</option> 
                            <option value="경상북도" >경상북도</option> 
                            <option value="광주광역시" >광주광역시</option> 
                            <option value="대구광역시" >대구광역시</option> 
                            <option value="대전광역시" >대전광역시</option> 
                            <option value="부산광역시" >부산광역시</option> 
                            <option value="서울특별시" >서울특별시</option> 
                            <option value="울산광역시" >울산광역시</option> 
                            <option value="인천광역시" >인천광역시</option> 
                            <option value="전라남도" >전라남도</option> 
                            <option value="전라북도" >전라북도</option> 
                            <option value="제주도" >제주도</option> 
                            <option value="충청남도" >충청남도</option>
                            <option value="충청북도" >충청북도</option>
                          </select>
                        </td>
                        <td>
                        <input type="text" id="usexualA" name="usexualA" size="2" maxlength="20" value="0"/>/
                        <input type="text" id="usexualB" name="usexualB" size="2" maxlength="20" value="0"/>
                        </td>
                      </tr>
                      <tr>
                       <th>&nbsp;&nbsp;
                                     
                        <input type="text"  id="gschool" name="gschool" size="10" maxlength="20" />대학원<br/>&nbsp;&nbsp;
                        <input type="text"  id="gdepartment" name="gdepartment" size="10" maxlength="20"  />학과
                        <input type="hidden" name="hack_major_1_12" value="0000" />
                        </th>
                        <td>
                         <input type="text" id="ggyear" name="ggyear" size="7" maxlength="20" value="0" />년&nbsp;
                         <input type="text" id="ggmonth" name="ggmonth" size="7" maxlength="20" value="0" />월 &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                         <select id="ggclassification" name="ggclassification"  >
                               <option value=""></option> 
                               <option value="졸업" >졸업</option>
                               <option value="중퇴" >중퇴</option> 
                               <option value="수료" >수료</option> 
                               <option value="재학" >재학</option> 
                               <option value="졸업예정" >졸업예정</option>
                         </select>
                        </td>
                        
                        <td> 
                         <select id="glocation" name="glocation" >
                            <option value=""></option> 
                            <option value="강원도" >강원도</option> 
                            <option value="경기도" >경기도</option> 
                            <option value="경상남도" >경상남도</option> 
                            <option value="경상북도" >경상북도</option> 
                            <option value="광주광역시" >광주광역시</option> 
                            <option value="대구광역시" >대구광역시</option> 
                            <option value="대전광역시" >대전광역시</option> 
                            <option value="부산광역시" >부산광역시</option> 
                            <option value="서울특별시" >서울특별시</option> 
                            <option value="울산광역시" >울산광역시</option> 
                            <option value="인천광역시" >인천광역시</option> 
                            <option value="전라남도" >전라남도</option> 
                            <option value="전라북도" >전라북도</option> 
                            <option value="제주도" >제주도</option> 
                            <option value="충청남도" >충청남도</option>
                            <option value="충청북도" >충청북도</option>
                          </select>
                        </td>
                        <td>
                        <input type="text"  id="gsexualA" name="gsexualA" size="2" maxlength="20" value="0" />/
                        <input type="text"  id="gsexualB" name="gsexualB" size="2" maxlength="20" value="0" />
                        </td>
                      </tr>
                 </table>
                 
                  <!--                                                  -->
                 <h3 style="margin-top: 20px;">가입경위</h3>
                 <table style="margin-top: 10px;" >
                    <tbody>
                     <tr >
                       <th scope="row">정보를 얻은 매체 : </th>
                        <td bgcolor="#FFFFFF">
                           <input type="radio" name="mprocess"  value="취업뽀개기" />취업뽀개기&nbsp;&nbsp;   
                           <input type="radio" name="mprocess"  value="네이버" />네이버&nbsp;&nbsp; 
                           <input type="radio" name="mprocess"  value="다음" />다음&nbsp;&nbsp;  
                           <input type="radio" name="mprocess"  value="사람인" />사람인&nbsp;&nbsp; 
                           <input type="radio" name="mprocess"  value="지인소개" checked="checked" />지인소개&nbsp;&nbsp;   
                           <input type="radio" name="mprocess"  value="커리어" />커리어&nbsp;&nbsp; 
                           <input type="radio" name="mprocess"  value="잡코리아" />잡코리아&nbsp;&nbsp;    
                           <input type="radio" name="mprocess"  value="인크루트" />인크루트&nbsp;&nbsp;    
                           <input type="radio" name="mprocess"  value="기타" />기타&nbsp;&nbsp;
                         </td>
                     </tr>
                            <!------------------------- 기타 경위 --------------------------->
                     <tr >  
                        <th scope="row">기타 경위 : </th>
                            <td>
                                <input type="text" id="eprocess" name="eprocess" style="width:460px;"/>
                            </td>
                     </tr>
                    </tbody>
                 </table>
            
            
             <!--                                                  -->
             <h3 style="margin-top: 20px;">병역사항</h3>
             <table style="margin-top: 10px;">
                    <tbody>
                      <tr >
                       <th scope="row">병역구분</th>
                        <td>
                          <input type="radio" name="msd"  value="필" checked />필 
                          <input type="radio" name="msd"  value="단기" />단기 
                          <input type="radio" name="msd"  value="미필" />미필 
                          <input type="radio" name="msd"  value="면제" />면제
                        </td>
                      </tr>
                        <tr > 
                         <th scope="row">군별</th>
                         <td bgcolor="#FFFFFF">
                            <input type="radio" name="stype"  value="육군" checked />육군 
                            <input type="radio" name="stype"  value="해군" />해군 
                            <input type="radio" name="stype"  value="공군" />공군 
                            <input type="radio" name="stype"  value="해병" />해병 
                            <input type="radio" name="stype"  value="기타" />기타
                         </td>
                        </tr>
                        <tr > 
                           <th scope="row">면제사유</th>
                           <td>
                            <input type="text" id="exemption" name="exemption" style="width:460px;"  value='' />
                           </td>
                        </tr>
                         <tr > 
                           <th scope="row">복무기간</th>
                              <td> 
                                  <input type="text" style="width:40px;" maxlength="4"  id="periodsy" name="periodsy" value="0" /> &nbsp;년 
                                  <input type="text" style="width:30px;" maxlength="2"  id="periodsm" name="periodsm" value="0" /> &nbsp;월&nbsp;&nbsp;~ 
                                  <input type="text" style="width:40px;" maxlength="4"  id="periodey" name="periodey" value="0" /> &nbsp;년 
                                  <input type="text" style="width:30px;" maxlength="2"  id="periodem" name="periodem" value="0" /> &nbsp;월 
                              </td>         
                         </tr>
                    </tbody>
                   </table>
                   
                   
                   
                   
                   <!--                                          -->
                    <h3 style="margin-top: 20px;">외국어</h3>
                        <table  style="width: 100%; border: 0; margin-top: 10px; " >
                            <tbody>
                              <tr >
                                 <th>외국어1</th>
                                 <td><input type="text" id="foreignlA" name="foreignlA" value="" /></td>
                                 <td>테스트명</td>
                                 <td><input type="text" id="testA" name="testA" value="" /></td>
                                 <td><input type="text" id="scoreA" name="scoreA" value="0"  maxlength="3" /> 점(등급)</td>
                              </tr>
                              <tr >
                                 <th>외국어2</th>
                                 <td><input type="text" id="foreignlB" name="foreignlB" value="" /></td>
                                 <td>테스트명</td>
                                 <td><input type="text" id="testB" name="testB" value="" /></td>
                                 <td><input type="text" id="scoreB" name="scoreB" value="0"  maxlength="3" /> 점(등급)</td>
                              </tr>
                              <tr >
                                 <th>외국어3</th>
                                 <td><input type="text" id="foreignlC" name="foreignlC" value="" /></td>
                                 <td>테스트명</td>
                                 <td><input type="text" id="testC" name="testC" value="" /></td>
                                 <td><input type="text" id="scoreC" name="scoreC" value="0"  maxlength="3" /> 점(등급)</td>
                              </tr>                                  
                            </tbody>
                         </table>
                         
                         
                         <!--                                                          -->
                         
                         <h3 style="margin-top: 20px;">경력사항</h3>
                            <table style="margin-top: 10px;" id="tableA">
                                  <thead>
                                      <tr>
                                        <th>근무처</th>
                                        <th>근무기간</th>
                                        <th>담당업무</th>
                                        <th>삭제</th>
                                       </tr>
                                  </thead>
                                 <tr>                       
                                     <th><input type="text" id="workesA" name="workesA"/></th>
                                     <td>
                                        <input type="text" id="worketsyA" name="worketsyA" size="3" maxlength="4" value="0" />
                                       /  
                                        <input type="text" id="worketsmA" name="worketsmA" size="2" maxlength="2" value="0" />
                                       / 
                                        <input type="text" id="worketsdA" name="worketsdA" size="2" maxlength="2" value="0" />
                                       ~ 
                                        <input type="text" id="worketeyA" name="worketeyA" size="3" maxlength="4" value="0" />
                                       / 
                                        <input type="text" id="worketemA" name="worketemA" size="2" maxlength="2" value="0" />
                                       / 
                                        <input type="text" id="worketedA" name="worketedA" size="2" maxlength="2" value="0" />
                                     </td> 
                                     <td><input type="text" id="mworkeA" name="mworkeA" /></td>
                                     <td></td>
                                  </tr>
                           </table>
                                <p>
                                <a onclick="addCareer01();return false;">
                                <img src="http://sist.co.kr/images/btn/btn_add.jpg" alt="추가" />
                                </a>
                                </p>
                         
                         
                         <!--                                                                   -->
                         
                          <h3 style="margin-top: 20px;">전산관련자격증</h3>
                            <table style="margin-top: 10px;" id="tableB">
                                  <thead>
                                      <tr>
                                        <th>자격증명</th>
                                        <th>취득일</th>
                                        <th>발령처</th>
                                        <th>삭제</th>
                                       </tr>
                                  </thead>
                                 <tr>                       
                                     <th><input type="text" id="licenseA" name="licenseA" /></th>
                                     <td>
                                        <input type="text" id="acquisitionyA" name="acquisitionyA" size="3" maxlength="4" value="0" />
                                       / 
                                        <input type="text" id="acquisitionmA" name="acquisitionmA" size="2" maxlength="2" value="0" />
                                       / 
                                        <input type="text" id="acquisitiondA" name="acquisitiondA" size="2" maxlength="2" value="0" />
                                     </td> 
                                     <td><input type="text" id="IssuanceA" name="IssuanceA" /></td>
                                     <td></td>
                                  </tr>
                           </table>
                                <p>
                                <a onclick="addCareer02();return false;">
                                <img src="http://sist.co.kr/images/btn/btn_add.jpg" alt="추가" />
                                </a>
                                </p>
                         
                         
                         
                         <!--                            -->
                         <h3 style="margin-top: 20px;">전산지식</h3>
                            <div style="margin-top: 10px;">
                                <textarea rows="5" cols="100" id="computational" name="computational" ></textarea>
                            </div>
                         
                         
                         
                         <!--                        -->
                         <h3 style="margin-top: 20px;">지원동기</h3>
                            <div style="margin-top: 10px;">
                                <textarea rows="5" cols="100" id="motive" name="motive" ></textarea>
                            </div>  
                            
                            

        </form>
            <div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
            <button style="width: 120px; height: 40px;" id="submit" onclick="javascript:submitA();">신청하기</button>
            <button style="width: 120px; height: 40px;"onclick="javascript:history.back();">뒤로가기</button>
        </div>
         </div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <footer class="py-5 bg-dark">
        <jsp:include page="../main/footer.jsp"/> 
    </footer>


    <!-- Bootstrap core JavaScript -->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>
</html>


