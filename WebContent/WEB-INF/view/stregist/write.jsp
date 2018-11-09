	<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>쌍용교육센터 LMS</title>

    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	// 버튼 클릭시 Row 값 가져오기
    $(".checkBtn").click(function(){ 
        
        var str = ""
        var tdArr = new Array();    // 배열 선언
        var checkBtn = $(this);
        // checkBtn.parent() : checkBtn의 부모는 <td>이다.
        // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
        var tr = checkBtn.parent().parent();
        var td = tr.children();
        var radioVal = $('input[name="radioTxt"]:checked').val();        
        var memberid = td.eq(0).text();
        var passFail = radioVal;        
       alert( tr.children().eq(3).is(":checked").val() );
       
        
        var tpid = "<%= request.getParameter("tpid") %>";
        
        console.log(memberid);
        console.log(passFail);
        console.log(tpid);

      /*   $.ajax({ 
            url : "savePass.do",
            dataType : "json", 
            type: "post", 
            data: {"memberid" : memberid, "passFail" : passFail, "tpid" : tpid },
            cache: false, 
            success: function(data){ 
         
               if( data.count == 1) { 
            
                  alert("저장 완료."); 
               }else{ 
              
                  alert("이미 완료된 데이터 입니다.")
                 
               } 
          
            }

        }); */
	});   
});


</script>
</head>
<body id="page-top">

	<jsp:include page ="/WEB-INF/view/layout/lmsNav.jsp"></jsp:include>
	



    <div id="wrapper">

      <!-- Sidebar : 사이드바 start-->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="regist_list.do">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>재직자 교육 과정</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="regist2_list.do">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>취업자 교육 과정</span></a>
        </li>      
      </ul>
<!--사이드바 end  -->

<!-- 콘텐츠 시작  -->
      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs : 루트-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="#">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Overview</li>
          </ol>



          <!-- DataTables Example : 표시작 !! 여기다가 넣으면댐-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
              Data Table Example</div>
            <div class="card-body">
              <div class="table-responsive">
     <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                
  <thead>
    <tr>
      <th scope="col">훈련명</th>
       <th scope="col">수업요일</th>
      <th scope="col">과정타입</th>           
      <th scope="col">훈련시작일</th>
      <th scope="col">훈련종료일</th>
      <th scope="col">캠퍼스</th>

    </tr>
  </thead>
  <tbody>
  
    <tr>
     
      <td><input type="text" /></td>
	  <td><input type="text" /></td>
	   <td><input type="text" /></td>	  
      <td><input type="text" /></td>
      <td><input type="text" /></td>
       <td><input type="text" /></td>
   </tr>

	<tr align="center">
		 		<td scope="row" colspan="6" align="right">
		 			<input type="button" value="저장" onclick="location.href='regSave.do'">		 		
		 		</td>
		 	</tr>	  
  </tbody>
</table>


              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
          <!--표 end  -->
          
          

        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        	<jsp:include page ="/WEB-INF/view/layout/lmsFooter.jsp"></jsp:include>

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
    
    
    <input type="hidden" name="tpid" value="${param.tpid }" />

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>
	
	
</body>
</html>