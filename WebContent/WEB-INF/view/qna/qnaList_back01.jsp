<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<% 
 String currentPage = request.getParameter("currentPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
	
	});
</script>
</head>
<body>


   <h3>1:1문의사항</h3>
	<table style="width:700px;margin:50px auto" border="1" >
		<tr>
		  <td align="right" colspan="6">
			   <a href="question_write.do">글쓰기</a>
		  </td>
		</tr>
		<tr style="background:gray;color:white;font-weight:bold">
		  <td width="50" align="center">번호</td>
		  <td width="280" align="center">글제목</td>
		  <td width="100" align="center">작성날짜</td>
		</tr>
		<tbody>
		 <c:if test="${ empty list }">
		 	<tr class="data">
		 		<td align="center" colspan="6">
		 			<h3>작성된 게시글이 없습니다.</h3>
		 		</td>
		 	</tr>
		 </c:if>
		 
		 <c:if test="${ not empty list }">
		  <c:forEach items="${ list }" var="dto">
		 	<tr class="data">
		 		<td align="center">${ dto.qid }</td>
		 		<td>			 		
		 		<c:if test="${ dto.depth gt 0 }">
		 				 			
		 			<img width="${ dto.depth*10 }px"/>
		 			<img alt="오리" src="/images/arr.gif"/>
		 		</c:if> 
		 	<a href="question_view.do?num=${ dto.qid }&page=${currentPage }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }">${ dto.qtitle }</a>

		 		<td>${ dto.qdate }</td>
		 	</tr>
		  </c:forEach>
		  <tr>
		  	<td align="center" colspan="3">	${ paging }</td> 
		  	
		  </tr>	
		 </c:if>
		 </tbody>
	<form>
		<tr>
	      <td colspan="6" align="center" style="padding:3px;">
	        <select id="searchCondition" name="searchCondition" 
	        style="font-size: 19px;vertical-align: bottom;">
	          <option value="qtitle" ${ param.searchCondition eq "qtitle" ? "selected" : "" }>글제목</option>
	          <option value="content" ${ param.searchCondition eq "content" ? "selected" : ""}>내용</option>
	          <option value="qid" ${ param.searchCondition eq "qid" ? "selected" : ""}>글번호</option>        
	        </select>
	        <input type="text" name="searchWord"   value='${ param.searchWord }'>
	        <input type="button" style="height:25px;width:50px"
	        value="검색" id="searchBtn">
	      </td>
	    </tr>	
	 </form>
	</table>
	
</body>
</html>