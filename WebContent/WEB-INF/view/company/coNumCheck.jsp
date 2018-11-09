<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>쌍용교육센터</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- <link href="../style/text.css" rel="stylesheet" type="text/css"> -->
<script language="JavaScript">
  function check_busino(vencod) {
        var sum = 0;
        var getlist =new Array(10);
        var chkvalue =new Array("1","3","7","1","3","7","1","3","5");
        for(var i=0; i<10; i++) { getlist[i] = vencod.substring(i, i+1); }
        for(var i=0; i<9; i++) { sum += getlist[i]*chkvalue[i]; }
        sum = sum + parseInt((getlist[8]*5)/10);
        sidliy = sum % 10;
        sidchk = 0;
        if(sidliy != 0) { sidchk = 10 - sidliy; }
        else { sidchk = 0; }
        if(sidchk != getlist[9]) { return false; }
        return true;
  }

  function setID(){
  	opener.ff2.cpnum.value = document.all.ch_id.value;
	opener.ff2.num_ch.value='ok';
	close();
  }
  
  
  function checkID(){
	if(document.f.id.value == ""){
		alert("사업자등록번호를 입력하세요");
		document.f.id.focus();
	}else if(document.f.id.value != null){
		var co_num = document.f.id.value;
		if(check_busino(co_num)){
			// action="co_numCheck.jsp"
			document.f.action = "/coNumCheck.do";
			document.f.submit();
		}else
			alert("사업자 등록번호가  올바르지 않습니다.");
	}
  }
  
  
  function closed(ch){
	if(ch == 'true'){	
		opener.ff2.cpnum.value = document.all.ch_id.value;
		opener.ff2.num_ch.value='ok';
		close();

	}else
		close();

  }

</script>
<style type="text/css">
 * {font-size:12px;}
</style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="422" height="295" border="0" cellpadding="0" cellspacing="1" bgcolor="#DEC7DC">
  <tr>
    <td valign="top"><table width="422" height="290" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td height="60" valign="top"><img src="http://www.sist.co.kr/images/recommend/pupup_title01.gif" width="422" height="60"></td>
      </tr>
      <tr>
        <td height="29" valign="top"><img src="http://www.sist.co.kr/images/recommend/check_img01.gif" width="150" height="29"></td>
      </tr>
      <tr>
        <td height="65" valign="top"><table width="374" height="65" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="23"><img src="http://www.sist.co.kr/images/main/tmp.gif" width="23" height="10"></td>
            <td align="center"><table width="374" height="65" border="0" cellpadding="0" cellspacing="0" background="http://www.sist.co.kr/images/recommend/check_img02.gif">
              <tr>
                <td align="center">
                <form name="f" method="post">
                <table width="204" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="128"><input name="id" type="text" class="fmPop" size="20" maxlength="20" value="${ param.id }"></td>
                    <td width="76" align="right"><img src="http://www.sist.co.kr/images/buttons/ssearch_meg.gif" width="67" height="21" onClick="checkID()" style="cursor:hand"></td>
                  </tr>
                </table>
                </form>
                </td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="25" align="center"><img src="http://www.sist.co.kr/images/mycampus/popup_line.gif" width="382" height="1"></td>
      </tr>
      <tr>
        <td height="40" align="center"><table width="270" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="203"><span class="idCheck"><img src="http://www.sist.co.kr/images/buttons/arrow02.gif" width="9" height="9">

            
    <c:if test="${ empty param.id }">
    	<strong>사업자 등록번호</strong>를 입력하지 않으셨습니다.
    </c:if>
    
    
    <c:if test="${ not empty param.id }">
    	<strong>${ param.id }</strong>는 <strong><font color="#FF5300">사용 
                  가능</font></strong> 합니다.</td>
		<input type="hidden" name="ch_id" value="${ param.id }"/>
        <td width="67" align="right"><img src="http://www.sist.co.kr/images/buttons/sschoice.gif" width="67" height="21" onClick="setID()" style="cursor:hand">
    </c:if>
    
               
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="35" align="center">&nbsp;</td>
      </tr>
      <tr>
        <td height="25" align="right" bgcolor="#eeeeee">
        	<img src="http://www.sist.co.kr/images/buttons/close.gif" width="49" height="11" onClick="closed('false')" style="cursor:hand">
        	<img src="http://www.sist.co.kr/images/main/tmp.gif" width="10" height="10"> 
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
