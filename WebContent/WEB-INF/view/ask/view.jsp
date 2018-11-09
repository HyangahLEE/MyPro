<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--     Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
    
<!-- 모달을 방해하는 놈, 무엇? -->
<!--  <link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">   -->
   <!-- 모달을 쓰는 참조 링크 -->
 <script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<!-- <script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
 -->
   
<title>IT리더교육센터</title>
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
    
    // Delete.jsp 복사 붙이기 ㅋㅋ
    $("#btnDelete").click(function (){
       // alert("test");
       if( confirm("정말 삭제합니까? ")){
       
     /*      // delete.do?num=1&cp&sc&sw */
          $("#form1").submit();
       }
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
        <small>문의게시판</small>
      </h1>

      <ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
		  <li class="breadcrumb-item"><a href="/notice_list.do">고객센터</a></li>
		  <li class="breadcrumb-item"><a href="/ask_list.do">문의게시판</a></li>
		  <li class="breadcrumb-item active">취업교육</li>
		</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
         <jsp:include page="../include/cuscenter.jsp"/> 
       
       
       
       
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">


   <table width="600" style="margin: 50px auto" border="1">
      <!-- <tr>
         <td colspan="2" align="right">글보기</td>
      </tr> -->
      <tr>
         <td width="70" align="center">글번호</td>
         <td width="330">${ dto.anum }</td>
      </tr>
      <tr>
         <td width="70" align="center">조회수</td>
         <td width="330">${ dto.areaded }</td>
      </tr>
      <tr>
         <td width="70" align="center">작성자  </td>
         
         <td width="330">${ dto.writer }</td>
      </tr>
       <tr>
         <td width="70" align="center">작성일자</td>
         <td width="330">${ dto.awritedt }</td>
      </tr>
      <tr>
         <td width="70" align="center">글제목</td>
         <td width="330">${ dto.atitle }</td>
      </tr>
      <tr>
         <td width="70" align="center">글내용</td>
         <td width="330">
            <div style="width: 100%; height: 200px; overflow: scroll;">${ dto.acontent }
            </div>
         </td>
      </tr>
           <tr>
         <td width="70" align="center">파일</td>
         <td width="330">${ dto.afile }</td>
      </tr>
      <tr>
         <td colspan="2" align="right">
       
     <c:if test="${ sessionScope.loginUser == dto.writer ||  not empty sessionScope.admin} ">
         <input type="button" value="글수정"
            onclick="location.href='ask_edit.do?num=${ dto.anum }&page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
                    
      <input type="button" id="btnModalDelete"  data-toggle="modal" data-target="#exampleModalCenter"
            value="글삭제">
     </c:if>
            <input type="button" value="답글"
            onclick="location.href='ask_write.do?num=${ dto.anum }&ref=${ dto.ref }&step=${ dto.step }&depth=${ dto.depth }&adid=${ dto.adid }'">
  
       <input type="button" value="글목록"
            onclick="location.href='ask_list.do?page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
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
       <form id="form1" action="ask_delete.do" method="post">
       <table width="300px" border="1" align="center">
                        <tr>
                           <td>비밀 번호 입력하세요?</td>
                        </tr>
                        <tr>
                           <td>
                           <input type="password" name="pass"> 
                           <input type="hidden" name="num" value="${ param.num }"></td>
                        </tr>
                        <tr>
                           <td>
                           <input type="button" id="btnDelete" value="글삭제"/>
                           <%-- <input type="button"  onclick="notice_list.do?page=${param.page }" id="btnList" value="글목록"/> --%>
                           <a href="notice_list.do?page=${param.page }" >글목록</a>
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