<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <li class="breadcrumb-item"><a href="index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></a></li>
  <li class="breadcrumb-item"><a href="/incumbent.do?index=1">재직자교육과정</a></li>
  <li class="breadcrumb-item active">${title }</li>
</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <jsp:include page="/WEB-INF/view/include/incumbent.jsp"/>
        
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
         <form>
            <table style=" width=100%; border=1; margin-top: 20px; margin-bottom: 20px;">
            
                <tbody>
                    <tr>
                        <th>신청인 : </th>
                        <td><input type="text" /></td>
                    </tr>
                    <tr>
                        <th>연락처 : </th>
                        <td><input type="text" /></td>
                    </tr>
                    <tr>
                        <th>e-Mail : </th>
                        <td><input type="text" /></td>
                    </tr>
                    <tr>
                        <th>구분 : </th>
                        <td>
                        <input type="radio" name="a" />대학생,일반
                        <input type="radio" name="a" />교육비납부(회사)
                        <input type="radio" name="a" />교육비납부(개인)
                        </td>
                    </tr>
                    <tr>
                        <th>회사명 : </th>
                        <td><input type="text" /></td>
                    </tr>
                    <tr>
                        <th>관련항목 : </th>
                        <td>
                            <input type="checkbox" /> 회사직원수가 300명 미만 &nbsp;&nbsp;&nbsp;
                            <input type="checkbox" /> 우선지원대상기업에 근무하는 재직자
                            <p>
                            <input type="checkbox" /> 파견근로자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" /> 만 40세 이상인자(재직중)
                            
                            <p>
                            <input type="checkbox" /> 회사직원수가 300명 이상&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" /> 1년이하 계약직
                            
                        </td>
                    </tr>
                    <tr>
                        <th>캠퍼스 선택 : </th>
                        <td>
                        <input type="radio" name="aa"/>쌍용강남캠퍼스
                        <input type="radio" name="aa"/>쌍용강북캠퍼스
                        </td>
                    </tr>
                    <tr>
                        <th>선택 과목 : </th>
                        <td><input type="checkbox" /> 스마트 폰 개발과정</td>
                    </tr>
                    <tr>
                        <th></th>
                        <td><input type="checkbox" /> 웹 프로그래밍과정</td>
                    </tr>
                    <tr>
                        <th></th>
                        <td><input type="checkbox" /> 데이터베이스 과정</td>
                    </tr>
                    <tr>
                        <th></th>
                        <td><input type="checkbox" /> 기타 과정</td>
                    </tr>
                    <tr>
                        <th>교육 시간 : </th>
                        <td>
                            <select name="time">
                                <option value="1">09:30~12:30</option>
                                <option value="2">14:00~17:00</option>
                                <option value="3">19:30~22:30</option>
                                <option value="4">주말반(토,일)</option>
                            </select>
                         </td>
                    </tr>
                    <tr>
                        <th>결재 방법 : </th>
                        <td>
                            <select name="signway">
                                <option value="1">현금</option>
                                <option value="2">능력카드</option>
                                <option value="3">방문결재</option>
                            </select>
                         </td> 
                    </tr>
                    <tr>
                        <th>기타과정 및 <br/> 문의사항 : </th>
                        <td>
                            <textarea name="inq" rows="6" cols="60"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center">
                            <div style="text-align: center; margin-bottom: 20px;">
                                <input type="button" value="보내기"  style="margin-right: 10px; width: 120px; height: 40px; cursor:pointer;"/>&nbsp;
                                <input type="reset" value="다시쓰기" style="margin-right: 10px; width: 120px; height: 40px; cursor:pointer;"/>
                            </div>
                         </td>
                    </tr>                       
                </tbody>
                    
            </table>
            
            
        </form>
    
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
