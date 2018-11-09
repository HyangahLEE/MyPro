<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>쌍용 교육센터</title>

    <!-- Bootstrap core CSS -->
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/modern-business.css" rel="stylesheet">


<style type="text/css">

</style>
<script>

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
      <h1 class="mt-4 mb-3"> REGULAR CURRICULUM
        <small>재직자교육과정</small>
      </h1>

    
      
<ol class="breadcrumb">
  <li class="breadcrumb-item"><a href="index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
  <li class="breadcrumb-item"><a href="/incumbent.do?index=1">재직자교육과정</a></li>
  <li class="breadcrumb-item active">${title }</li>
</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <jsp:include page="/WEB-INF/view/include/incumbent.jsp"/> 
        
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
         
    <form action="/incumbentAF.do" method="post" id="formA">
    <input type="hidden" name="tpid" id="tpid" value="${tpid }"/>
            <h3 style="margin-top: 20px;">회사정보</h3>
            <div>
              <ul>
                <li>
                    <span>과정명 :     </span>&nbsp;&nbsp;
                    <span>${tpname}</span>
                </li>
                <li>
                    <span>회사 :     </span>&nbsp;&nbsp;
                    <span><input type="text" id="company" name="company"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>부서명 :     </span>&nbsp;&nbsp;
                    <span><input type="text" id="department" name="department"/></span>
                </li>
                <li>
                    <span>전화 :     </span>&nbsp;&nbsp;
                    <span><input type="text" id="tel" name="tel"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>팩스 :     </span>&nbsp;&nbsp;
                    <span><input type="text" id="fax" name="fax"/></span>
                </li>
                <li>
                    <span>네이버아이디 :     </span>&nbsp;&nbsp;
                    <span><input type="text" id="naverid" name="naverid"/></span>
                    <span>구분 :     </span>&nbsp;&nbsp;
                    <span>
                        <select name="division" id="division">
                            <option value="개인환급">개인환급</option>
                            <option value="회사환급">회사환급</option>
                            <option value="능력개발카드">능력개발카드</option>
                            <option value="일반인">일반인</option>
                        </select>
                    </span>
                </li>
                <li>
                    <span>가입경위 :</span>&nbsp;&nbsp;
                    <dl>
                        <dt>정보를 얻은 매체</dt>
                            <dd>
                                    <input type="radio" name="mprocess" value="네이버" checked/>네이버
                                    <input type="radio" name="mprocess" value="다음" />다음
                                    <input type="radio" name="mprocess" value="잡코리아" />잡코리아
                                    <input type="radio" name="mprocess" value="인쿠르트" />인쿠르트
                                    <input type="radio" name="mprocess" value="지인소개" />지인소개
                                    <input type="radio" name="mprocess" value="커리어" />커리어
                                    <input type="radio" name="mprocess" value="사람인" />사람인
                                    <input type="radio" name="mprocess" value="기타" />기타
                                </dd>
                            <dd>
                            <span>기타경위 : </span>&nbsp;&nbsp;
                            <input type="text" name="eprocess" id="eprocess"/>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        
            <h3 style="margin-top: 20px;">개인정보 및 결제금액</h3>
            <div>
              <ul>
                <li>
                    <span>과정명 : </span>&nbsp;&nbsp;&nbsp;
                    <span>${tpname }</span>
                </li>
                <li>
                    <span>성명 :</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span><input type="text" value="${memberInfo.mname }" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span>가격 :</span>&nbsp;&nbsp;
                    <span>${ tpcost }</span>
                </li>
                <li>
                    <span>이동전화 : </span>&nbsp;&nbsp;
                    <span><input type="text" value="${memberInfo.mphone }" /> "-"빼고 입력</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>전자우편 : </span>&nbsp;&nbsp;
                    <span><input type="text" value="${memberInfo.memail }" /></span>
                </li>                
              </ul>
            </div>
        
            <h3 style="margin-top: 20px;">결제안내</h3>
            <div>
              <ul>
                <li>
                    <span><input type="radio" name="payment" value="무통장" checked />무통장 : </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>은행명 : 신한은행</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>계좌번호 : 100-021-579776</span>
                </li>
                <li>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>은행명 : 신한은행</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>계좌번호 : 100-021-579800</span>
                </li>
                <li>
                    <span><input type="radio" name="payment" value="방문"/>방문 : </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    저희 교육센터에 직접방문하여 카드단말기를 통해서 결제하는 메뉴입니다.
                </li>
              </ul>
            </div>
        
            
 
        </form>
               <div style="text-align: center; margin-bottom: 20px;">
            <button style="width: 120px; height: 40px;" id="submit" onclick="javascript:submitA();">신청하기</button>
            <button style="width: 120px; height: 40px;" onclick="javascript:history.back();">뒤로가기</button>
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


