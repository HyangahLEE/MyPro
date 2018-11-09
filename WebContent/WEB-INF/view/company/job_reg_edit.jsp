<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>쌍용교육센터</title>
    

<!--     Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--     Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
         
<script type="text/javascript">
     $("document").ready(function (){
        $("#cpnumFindbtn2").click(function(){ 
            // list.do?
             var params = $("form").serialize(); 
           
    
             $.ajax({ 
                url : "coNumCheck.do",
                dataType : "json", 
                type: "post", 
              data: params, 
                cache: false, 
                success: function(data){ 
             
                   if( data.count == 1 ) { 
                
                	   alert("등록되어 있는 사업자 등록번호 입니다");
                	   document.ff2.action = "/editJobList.do";
                	   document.ff2.submit();
                	   
                   }else if( data.count == 0 ){ 
                  
                	   alert("등록되지 않은 사업자 등록번호 입니다")
                	   document.ff2.cpnum.value = "";                       
                   } 
                   
                } , error: function(){ 
                      alert("사업자등록번호를 입력해주세요"); 
                           } 
             }); 
          }); 
     });
     
</script>


<style type="text/css">
	footer {
		margin-top: 143px;
	}
</style>
	
</head>
<body>

<jsp:include page="../main/header.jsp"/> 
<jsp:include page="../main/navigator.jsp"/> 


  <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">EMPLOYMENT
        <small>구인의뢰 수정</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/index.do"><img alt="" src="https://icon-icons.com/icons2/259/PNG/128/ic_home_128_28521.png" width="25px" height="25px"></a></li>
        <li class="breadcrumb-item"><a href="/company.do">인재추천의뢰</a></li>
        <li class="breadcrumb-item active">구인의뢰 수정</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Sidebar Column -->
        
      <jsp:include page="../include/companyinclude.jsp"/> 
      
      
        <!-- Content Column -->
        <div class="col-lg-9 mb-4">
         
         
         	

			<div class="sub_content_center_wrap">
				
				<!-- method="post" -->
					<table width="690" border="0" cellspacing="0" cellpadding="0">
					  <tr>
						<td><img src="http://www.sist.co.kr/images/talente/inf_list1_2.jpg" width="690" height="75"></td>
					  </tr>
					  
					  <tr>
						<td colspan="2">
							  <tr>
							   
								<td align="center">
								<form name="ff2" method="get" >
									<table width="560" height="25"  border="0" cellpadding="0" cellspacing="0">
									
										<tr>
										  <td width="13" align="center" valign="middle"><img src="http://www.sist.co.kr/images/recommend/ico_squarered.gif" width="5" height="5"> </td>
										  <td width="97" align="center" valign="middle" >사업자등록번호</td>
										  <td width="90" align="left"><input type="text" name="cpnum" class=fmTxt id="seminar" size=12 maxLength=10 value="108457894"></td>
										  <td width="61" align="left"><input type="button" value="확인" id="cpnumFindbtn2" style="cursor:hand"></td>
										  <td width="201" align="left"><font color="#FF6600">예)1231212345</font></td>
										  <td width="98" align="right">
										  	<input type="hidden" id="list" style="cursor:hand" value="구인의뢰목록">
										  </td>
										
										</tr>
									</table>
								  </form>
							   </td>
							  </tr>
					  
					</table>
					
         </div>
      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->
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