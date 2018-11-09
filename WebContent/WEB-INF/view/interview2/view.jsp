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
        var tpid = "<%= request.getParameter("tpid") %>";

        $.ajax({ 
            url : "savePass2.do",
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

        });
	});   
});


</script>
</script>
</head>
<body id="page-top">

	<jsp:include page ="/WEB-INF/view/layout/lmsNav.jsp"></jsp:include>
	
	


    <div id="wrapper">

      <!-- Sidebar : 사이드바 start-->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="interview_list.do">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>재직자 교육 과정</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="interview2_list.do">
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

          <!-- Icon Cards : 카드 시작-->
       <!--    <div class="row">
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-primary o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-comments"></i>
                  </div>
                  <div class="mr-5">26 New Messages!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-warning o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-list"></i>
                  </div>
                  <div class="mr-5">11 New Tasks!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-success o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-shopping-cart"></i>
                  </div>
                  <div class="mr-5">123 New Orders!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
              <div class="card text-white bg-danger o-hidden h-100">
                <div class="card-body">
                  <div class="card-body-icon">
                    <i class="fas fa-fw fa-life-ring"></i>
                  </div>
                  <div class="mr-5">13 New Tickets!</div>
                </div>
                <a class="card-footer text-white clearfix small z-1" href="#">
                  <span class="float-left">View Details</span>
                  <span class="float-right">
                    <i class="fas fa-angle-right"></i>
                  </span>
                </a>
              </div>
            </div>
          </div> -->
          <!--카드 end  -->

          <!-- Area Chart Example : 도표 시작-->
          <%-- <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-chart-area"></i>
              Area Chart Example</div>
            <div class="card-body">
              <canvas id="myAreaChart" width="100%" height="30"></canvas>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div> --%>
			    <!-- Area Chart Example : 도표 end-->



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
      
      <form action="">
        <input type="radio" name="radioTxt" ${ dto.iresult == '합격' ? 'checked' : '' } value="합격" /> 합격
        <input type="radio" name="radioTxt" ${ dto.iresult == '불합격' ? 'checked' : '' } value="불합격"/> 불합격 
        </form>
        
      </td>
      <td><input class="checkBtn" type="button" value="저장"/> </td>
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
	</nav>
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