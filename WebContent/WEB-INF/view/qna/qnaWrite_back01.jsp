<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
String memberId = (String) session.getAttribute("loginUser");
%> --%>
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


	<form action="question_write_ok.do" method="post">
	 <table width="600px" style="margin:50px auto" border="1">
	   <tr>
	     <td colspan="2" align="right">
	       <a href="question_list.do">글목록</a>
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">작성자</td>
	     <td width="330">
	       <input type="text" name="logid" size="12" value="${ sessionScope.loginUser }" >
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">제목</td>
	     <td width="330">
	       <input type="text" name="qtitle" size="50" 
	       value='<c:if test="${ not empty param.ref }">[답글]</c:if>' >
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">내용</td>
	     <td width="330">
	       <textarea rows="13" cols="50" name="content"></textarea>
	     </td>
	   </tr>
	   <tr>
	   <tr>
	     <td colspan="2" align="center">
	       <input type="submit" value="글쓰기">
	       <input type="reset" value="다시작성">
	       <input type="button" value="글목록" onclick="location.href='question_list.do'">
	 	    </td>
	   </tr>
	 </table>
	 
	 	<!-- 답글 쓰기 : 부모글에 대한 정보 -->
	    <input type="hidden" name="p_num"  value="${param.num}">
	    <input type="hidden" name="p_ref"  value="${param.ref}">
	    <input type="hidden" name="p_step"  value="${param.step}">
	    <input type="hidden" name="p_depth"  value="${param.depth}">
	</form>


</body>
</html>