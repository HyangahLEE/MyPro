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


  


   <table width="600" style="margin: 50px auto" border="1">
      <!-- <tr>
         <td colspan="2" align="right">글보기</td>
      </tr> -->
      <tr>
         <td width="70" align="center">글번호</td>
         <td width="330">${ dto.qid }</td>
      </tr>
      <tr>
         <td width="70" align="center">작성자</td>
         <td width="330">${ dto.logid }</td>
      </tr>
       <tr>
         <td width="70" align="center">작성일자</td>
         <td width="330">${ dto.qdate }</td>
      </tr>
      <tr>
         <td width="70" align="center">글제목</td>
         <td width="330">${ dto.qtitle }</td>
      </tr>
      <tr>
         <td width="70" align="center">글내용</td>
         <td width="330">
            <div style="width: 100%; height: 200px; overflow: scroll;">${ dto.content }
            </div>
         </td>
      </tr>
      <tr>
         <td colspan="2" align="right">
         <input type="button" value="글수정"
            onclick="location.href='question_edit.do?num=${ dto.qid }&page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
           <%-- <a href="delete.do?num=${ dto.nnum }">글삭제</a> --%>                      
      <input type="button" id="btnModalDelete" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"
            value="글삭제">
            <%-- 
       <input type="button" value="글삭제" 
       onclick="location.href='Delete.do?num=${ vo.num }&currentPage=${currentPage}'">
        --%> <input type="button" value="답글"
            onclick="location.href='question_write.do?num=${ dto.qid }&ref=${ dto.ref }&step=${ dto.step }&depth=${ dto.depth }'">
            <input type="button" value="글목록"
            onclick="location.href='question_list.do?page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
         </td>
      </tr>
   </table>
   
   

<!-- 모다아아아ㅏㄹ -->


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
       <form id="form1" action="question_delete.do" method="get">
       <table width="300px" border="1" align="center">
                        <tr>
                           <td>정말 삭제하시겠습니까?</td>
                        </tr>                      
                        <tr>
                           <td>
                           <input type="hidden" name="num" value="${param.num }" />
                           <input type="submit" id="btnDelete" value="글삭제"/>                    
                           <a href="question_list.do?page=${param.page }" >글목록</a>
                           <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                           </td> 
                        </tr>
                     </table>
         </form>
      </div>    
    </div>
  </div>
</div>

</body>
</html>