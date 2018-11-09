<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
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
    
	<form action="question_edit_ok.do" method="post">
	 <table style="width: 600px;" style="margin:50px auto" border="1">
	   <tr>
	     <td colspan="2" align="right">
	       <a href="question_list.do">글목록</a>
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">작성자</td>
	     <td width="330">
	       <input type="text" disabled="disabled" name="qid" size="12" value="${ dto.logid }">
	       <input type="hidden" name="logid" size="12" value="${ dto.logid }">
	     </td>
	   </tr>
	  
	   <tr>
	     <td width="70" align="center">제목</td>
	     <td width="330">
	       <input type="text" name="title" size="50" 
	       value='${ dto.qtitle }'>
	     </td>
	   </tr>
	   <tr>
	     <td width="70" align="center">내용</td>
	     <td width="330">
	       <textarea rows="13" cols="50" name="content" >${ dto.content }</textarea>
	     </td>
	 
	   <tr>
	     <td colspan="2" align="center">
	       <input type="submit" value="저장하기">
	       <input type="reset" value="다시작성">
	       <input type="button" value="글목록" 
	       onclick="location.href='question_list.do?page=${ param.page }'">
	     </td>
	   </tr>
	 </table>
	 
	 	<input type="hidden" name="num"  value="${ param.num }">	    
	</form>
	

</body>
</html>