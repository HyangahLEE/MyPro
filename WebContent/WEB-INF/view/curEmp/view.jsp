<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--     Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    
<!-- 모달을 방해하는 놈, 무엇? -->
 <link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">  
   <!-- 모달을 쓰는 참조 링크 -->
 <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

   <title>쌍용교육센터</title>

<style>
a {
   text-decoration: none;
   color: black;
}

table {
   border-spacing: 1px;
   border-collapse: separate;
}

table, tr, td {
   border-radius: 3px;
   padding: 3px;
}
</style>

<script>
$(document).ready(function (){
    $("#btnModalDelete").click(function (){ 
       $("#exampleModalCenter").modal("show");
    });
    
    

    
});
</script>


</head>
<body>

<jsp:include page="../main/header.jsp"/> 
<jsp:include page="../main/navigator.jsp"/>  


  <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
       <h1 class="mt-4 mb-3">CUSTOMER CENTER
        <small>취업정보</small>
      </h1>

      <ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
		  <li class="breadcrumb-item"><a href="/notice_list.do">고객센터</a></li>
		  <li class="breadcrumb-item"><a href="/hire_list.do">취업정보</a></li>
		  <li class="breadcrumb-item active">취업현황</li>
		</ol>
      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
         <jsp:include page="../include/cuscenter.jsp"/> 
      
      
      
      
      
      
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">


  <table style="width:700px;margin:50px auto" border="1" >
      <tr>
        <td align="right" colspan="7">
            <a href="curEmp_write.do">글쓰기</a>
        </td>
      </tr>
      <tr style="background:gray;color:white;font-weight:bold">
        <td width="50" align="center">글번호</td>
        <td width="70" align="center">이름</td>
        <td width="150" align="center">교육과정</td>
        <td width="90" align="center">개강일</td>
        <td width="90" align="center">종료일</td>
        <td width="150" align="center">취업업체명</td>
        <td width="150" align="center">취업분야</td>
      </tr>
      <tbody>
          
           
           <tr class="data">
             <td align="center">${ dto.ceid }</td>	
             <td align="center">${ dto.mname }</td>
             <td align="center">${ dto.tpname }</td>
             <td align="center">${ dto.adminstart }</td>
             <td align="center">${ dto.adminend }</td> 
             <td align="center">${ dto.cecname }</td>    
             <td align="center">${ dto.cecurrfield }</td>              
          </tr>    
       
       </tbody>
         <tr>
         <td colspan="7" align="right">
       <c:if test="${not empty sessionScope.admin }">               
      <input type="button" id="btnModalDelete" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"
            value="글삭제">
         </c:if>  
            <input type="button" value="글목록"
            onclick="location.href='curEmp_list.do?page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
         </td>
      </tr>
   </table>



   </div>
      </div>
      <!-- /.row -->

    </div>

    <!-- Footer -->
    <footer class="py-5 bg-dark">
        <jsp:include page="../main/footer.jsp"/> 
    </footer> 

   <!--  <!-- Bootstrap core JavaScript -->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>





   <!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">게시물삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form id="form1" action="curEmp_delete.do?num=${param.num }" method="post">
       <table width="300px" border="1" align="center">
                        <tr>
                           <td>정말로 삭제하시겠습니까?</td>
                        </tr>
                        <%-- <tr>
                           <td>
                           <input type="password" name="pass"> 
                           <input type="hidden" name="num" value="${ param.num }"></td>
                        </tr> --%>
                        <tr>
                           <td>
                           <input type="submit" id="btnDelete" value="글삭제"/>
                          
                           <a href="curEmp_list.do?page=${param.page }" >글목록</a>
                           <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                           </td> 
                        </tr>
                     </table>
                     </form>
      </div>
     <!--  <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div> -->
    </div>
  </div>
</div>

</body>
</html>