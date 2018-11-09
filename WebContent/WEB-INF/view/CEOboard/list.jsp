<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
 String currentPage = request.getParameter("currentPage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>쌍용교육센터</title>
<!--     Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
    <link href="css/modern-business.css" rel="stylesheet">
<style>     
   a{
     text-decoration: none;
     color:black;
   }
   table,  tr, td {
    border-radius: 3px;
   }
    /*  
   tr.data:nth-last-child(odd) {
    background: gray;
	}
	
	tr.data:nth-last-child(even) {
	    background: #EFEFEF;
	}
	 */
	tr.data:hover{
	    background:#EFEFEF;
	}
	
/* 	footer {
		margin-top: 150px;
	} */
	
	
	table tr td{
	font-size: 0.9em;
	}

</style>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
 
<script>
 $(function (){	 
	$('#searchBtn').click(function (){
		$('form:first').attr('action','ceo_list.do');
		$('form:first').attr('method','get');
		$('form:first').submit();
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
      <h1 class="mt-4 mb-3">CENTER INTRODUCTION
        <small>CEO컬럼</small>
      </h1>

      <ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
		  <li class="breadcrumb-item"><a href="/company.do">센터소개</a></li>
		  <li class="breadcrumb-item active">CEO컬럼</li>
		</ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        <jsp:include page="../include/introinclude.jsp"/>
         
         
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">


   <h5>CEO컬럼</h5>
	<table class="table table-hover" border="1" >
	
	<thead>
		<tr class="table-primary" style="background-color: #343a40;" align="center">
		  <td scope="col">번호</td>
		  <td scope="col">글제목</td>
		  <td scope="col">작성날짜</td>
		  <td scope="col">조회수</td>
		</tr>
		</thead>
		<tbody>
		
		 <c:if test="${ empty list }">
		 	<tr align="center">
		 		<td scope="row" colspan="4">
		 			<h3>작성된 게시글이 없습니다.</h3>
		 		</td>
		 	</tr>
		 </c:if>
		 
		 <c:if test="${ not empty list }">
		  <c:forEach items="${ list }" var="dto">
		 	<tr align="center">
		 		<td>${ dto.ceoid }</td>
		 		<td>			 		
		 			<a href="ceo_view.do?ceoid=${ dto.ceoid }&page=${currentPage }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }">${ dto.ceotitle }</a>
		 		</td>
		 		<td>${ dto.ceowritedt }</td>
		 		<td>${ dto.ceoreadcnt }</td>
		 		
		 	</tr>
		  </c:forEach>	
		 </c:if>
		 
		 
		 </tbody>
		 </table>
		 
    
    <nav aria-label="Page navigation example" style="position: relative;">
		  <ul class="pagination justify-content-center">
		    <li class="page-item" style="margin-right: 5px;">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    
		    <li class="page-item">${paging }</li>
		    <li class="page-item" style="margin-left: 5px;">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		    
	<c:if test="${not empty sessionScope.admin }">
		<div style="position: absolute; right: 10px;">
			<input type="button" value="글쓰기" onclick="location.href='ceo_write.do'" />
		</div>
	</c:if>
		    
		  </ul>
	</nav>
    
    
		 
	<form>
	<div style="text-align: center" class="form-inline my-2 my-lg-0">
		<tr>
	      <td>
	        <select class="custom-select" id="searchCondition" name="searchCondition" 
	        style="margin-left:220px;width:100px;">
	          <option value="ceotitle" ${ param.searchCondition eq "ceotitle" ? "selected" : "" }>글제목</option>
	          <option value="ceocontent" ${ param.searchCondition eq "ceocontent" ? "selected" : ""}>내용</option>
	          <option value="ceoid" ${ param.searchCondition eq "ceoid" ? "selected" : ""}>글번호</option>
	          <option value="ceo" ${ param.searchCondition eq "ceo" ? "selected" : ""}>작성자</option>	        
	        </select>
	        
	        
	        &nbsp;&nbsp;&nbsp;
	        <input class="form-control mr-sm-2"  placeholder="검색하기" type="text" name="searchWord"  style="width: 20%" value='${ param.searchWord }'>
	        <button type="button" class="btn btn-secondary my-2 my-sm-0" value="검색" id="searchBtn" style="width: 10%">Search</button>
	        
	        
	      </td>
	    </tr>	
	    </div>
	 </form>
	
	</div>
      </div>
      <!-- /.row -->

    </div>
	

    <!-- Footer -->
   <footer class="py-5 bg-dark">
      <jsp:include page="../main/footer.jsp"/>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	


</body>
</html>