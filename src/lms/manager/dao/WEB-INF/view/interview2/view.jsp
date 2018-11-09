
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
   
});
</script>

	
<link href="/Resouces/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">




</head>
<body>

<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">memberid</th>
      <th scope="col">이름</th>
      <th scope="col">생년월일</th>
      <th scope="col">합격여부</th>
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
    <tr>
      <th scope="row">${dto.memberid }</th>
      <td>${dto.mname }</td>
      <td>${dto.mbirth }</td>
      <td>
        <input type="radio" name="passFail" value="합격" /> 합격
        <input type="radio" name="passFail" value="불합격" checked="checked" /> 불합격     
      </td>
   </tr>
    </c:forEach>
		  </c:if>
  </tbody>
</table>

<!--페이징  -->
	<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    
		    <li class="page-item">${paging }</li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		  </ul>


</body>


</html>