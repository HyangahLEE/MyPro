<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>쌍용 교육센터</title>

<!-- Bootstrap core CSS -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/modern-business.css" rel="stylesheet">

<style type="text/css">
.carousel-item img {
	width: 100%;
}

ul {
	list-style: none;
}

.boldRed {
	color: red;
	font-weight: bold;
	padding-left: 10px;
	margin-top: 20px;
}

.row ul li a {
	font-size: 0.8em;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;
	width: 300px;
	overflow: hidden;
}

.row ul {
	margin: 0;
	padding: 0;
}

.info p {
	margin: 0;
	font-size: 0.9em;
}

.row ul {
	padding-left: 10px;
}

.course {
	width: 23.5%;
	float: left;
	border: 1px solid #e3e3e3;
	padding: 20px;
	margin: 10px 20px 20px 0;
	position: relative;
}

.name_text {
	font-size: 1.5em;
	font-weight: Bold;
	line-height: 1.1em;
	position: relative;
	z-index: 99;
}

.d_text {
	margin-top: 40px;
	margin-bottom: 25px;
}

.day, .place {
	font-size: 0.9em;
	line-height: 1.7em;
}

.go_button {
	padding: 10px;
	background-color: #ed234b;
	border-radius: 20px;
	text-align: center;
	color: #fff;
	font-weight: bold;
	font-size: 1em;
}

.day img, .place img {
	width: 7%;
	padding-right: 5px;
}

.intermediate {
	font-size: 0.85em;
	padding: 3px 8px;
	background-color: #ffa200;
	border-radius: 10px;
	margin-bottom: 5px;
	color: white;
	font-weight: normal;
}

.advanced {
	font-size: 0.85em;
	padding: 3px 8px;
	background-color: #ff5400;
	border-radius: 10px;
	margin-bottom: 5px;
	color: white;
	font-weight: normal;
}

.bg_img {
	position: absolute;
	width: 47.5%;
	top: 30px;
	right: 10px;
	z-index: 11;
}
</style>
</head>
<body>

	<c:if test="${not empty message }">
	</c:if>


	<jsp:include page="/WEB-INF/view/main/header.jsp"></jsp:include>


	<jsp:include page="/WEB-INF/view/main/navigator.jsp" />

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('http://www.sist.co.kr/images/main/banner/sist_nbanner_00.jpg'); background-size: cover">

				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('http://www.sist.co.kr/images/main/banner/sist_nbanner_01.jpg')">

				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('http://www.sist.co.kr/images/main/banner/sist_nbanner_02.jpg')">

				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<h5 class="my-4" style="font-weight: bold;">교육과정</h5>

		<!-- Marketing Icons Section -->
		<div class="row">

			<div class="col-lg-4 mb-4">
				<div class="card h-40">
					<!-- 						<h4 class="card-header">취업정보</h4> -->
					<div class="card-body">

						<div class="course gogo" style="width: 100%;">
							<strong class="name_text">프로그래밍 과정</strong> <img class="bg_img"
								src="https://cdn.www.fastcampus.co.kr/wp-content/uploads/2018/04/course26.png">
							<div class="d_text">
								<b class="intermediate" style="margin-right: 5px;">강남</b><b
									class="advanced ">강북</b>
								<p class="day" style="margin: 0; margin-top: 10px;">
									<img
										src="https://cdn.www.fastcampus.co.kr/wp-content/uploads/2018/04/dev_sun.png">재직자
									과정
								</p>
								<p class="place">
									<img
										src="https://cdn.www.fastcampus.co.kr/wp-content/uploads/2018/04/dev_sun.png">취업
									과정
								</p>
							</div>
							<a href="/job.do?index=11" target="_blank"
								style="width: 100%; text-decoration: none;">
								<div class="go_button on">교육 과정 바로가기</div>
							</a>
						</div>

					</div>

				</div>
			</div>


			<div class="col-lg-4 mb-4">
				<div class="card h-39">
					<!-- 						<h4 class="card-header">교육문의</h4> -->
					<div class="card-body">

						<div class="course gogo" style="width: 100%;">
							<strong class="name_text">데이터베이스 과정</strong> <img class="bg_img"
								src="https://cdn.www.fastcampus.co.kr/wp-content/uploads/2018/05/course_prcp.png">
							<div class="d_text">
								<b class="intermediate" style="margin-right: 5px;">강남</b><b
									class="advanced ">강북</b>
								<p class="day" style="margin: 0; margin-top: 10px;">
									<img
										src="https://cdn.www.fastcampus.co.kr/wp-content/uploads/2018/04/dev_sun.png">재직자
									과정
								</p>
								<p class="place">
									<img
										src="https://cdn.www.fastcampus.co.kr/wp-content/uploads/2018/04/dev_sun.png">취업
									과정
								</p>
							</div>
							<a href="/job.do?index=12" target="_blank"
								style="width: 100%; text-decoration: none;">
								<div class="go_button">교육 과정 바로가기</div>
							</a>
						</div>

					</div>

				</div>
			</div>


			<div class="col-lg-4 mb-4">
				<div class="card h-40">
					<!-- 						<h4 class="card-header">교육후기</h4> -->
					<div class="card-body">


						<div class="course gogo" style="width: 100%;">
							<strong class="name_text">스마트폰 과정</strong> <img class="bg_img"
								src="https://cdn.www.fastcampus.co.kr/wp-content/uploads/2018/04/course27.png">
							<div class="d_text">
								<b class="intermediate" style="margin-right: 5px;">강남</b><b
									class="advanced ">강북</b>
								<p class="day" style="margin: 0; margin-top: 10px;">
									<img
										src="https://cdn.www.fastcampus.co.kr/wp-content/uploads/2018/04/dev_sun.png">재직자
									과정
								</p>
								<p class="place">
									<img
										src="https://cdn.www.fastcampus.co.kr/wp-content/uploads/2018/04/dev_sun.png">취업
									과정
								</p>
							</div>
							<a href="/job.do?index=13" target="_blank"
								style="width: 100%; text-decoration: none;">
								<div class="go_button">개강 준비중</div>
							</a>
						</div>

					</div>

				</div>
			</div>
		</div>



		<!-- Portfolio Section -->

		<div class="row" style="margin-top: 30px;">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card">
					<img class="card-img-top" style="width: 700pp; height: 400pp"
						src="http://www.sist.co.kr/images/main/hb_gangnam.jpg" alt="강남캠퍼스">
					<p class="boldRed">[ 현재모집과정 ]</p>

					<ul>

						<c:if test="${! empty list }">

							<c:forEach items="${list }" var="tndto" begin="0" end="4" step="1">
								<c:if test="${tndto.campusname eq '강남쌍용교육센터' }">

									<li><a href="">${tndto.tpname }</a></li>

								</c:if>
							</c:forEach>

						</c:if>

					</ul>
					<div style="width: 100%;">
						<button type="button" class="btn btn-link"
							style="width: 20%; font-size: 0.9em; float: right;" onclick="location='/incumbent.do?index=1'">더보기</button>
					</div>

				</div>
			</div>



			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card">
					<img class="card-img-top" style="width: 700pp; height: 400pp;"
						src="http://www.sist.co.kr/images/main/hb_sinchon.jpg" alt="강북캠퍼스">

					<p class="boldRed">[ 현재모집과정 ]</p>
					<ul>

						<c:if test="${! empty list }">

							<c:forEach items="${list }" var="tndto">
								<c:if test="${tndto.campusname eq '강북쌍용교육센터' }">

									<li><a href="">${tndto.tpname }</a></li>

								</c:if>
							</c:forEach>

						</c:if>

					</ul>

					<div style="width: 100%;">
						<button type="button" class="btn btn-link"
							style="width: 20%; font-size: 0.9em; float: right;" onclick="location='/job.do?index=12'">더보기</button>
					</div>


				</div>
			</div>




			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card">
					<h5 class="card-header">공지사항</h5>

					<div class="card-body">
						<div class="row">
							<div class="col">
								<ul class="list-unstyled mb-0">

									<c:if test="${! empty listN }">
										<c:forEach items="${listN }" var="listN" begin="0" end="9" step="1">

											<li><a href="#">${listN.ntitle }</a></li>

										</c:forEach>
									</c:if>

								</ul>
							</div>
						</div>
					</div>

					<div style="width: 100%;">
						<button type="button" class="btn btn-link"
							style="width: 20%; font-size: 0.9em; float: right;" onclick="location='/notice_list.do'">더보기</button>
					</div>


				</div>
			</div>


			<%-- 			<div class="col-md-4" style="margin-top: -25px;">



				<!-- Categories Widget -->
				<div class="card my-4">
					<h5 class="card-header">공지사항</h5>
					<div class="card-body">
						<div class="row">
							<div class="col">
								<ul class="list-unstyled mb-0">

									<c:if test="${! empty listN }">
										<c:forEach items="${listN }" var="listN">

											<li><a href="#">${listN.ntitle }</a></li>

										</c:forEach>
									</c:if>

								</ul>
							</div>
							<!-- 							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">JavaScript</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">Tutorials</a></li>
								</ul>
							</div> -->
						</div>
					</div>
				</div>

				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">수강후기</h5>
					<div class="card-body">
						<img src="http://www.sist.co.kr/images/main/main_review.jpg"
							alt="HRD-NET 수강후기" style="width: 100%;" />
					</div>
				</div>
				<!--  -->

			</div> --%>
			<!-- /.row -->



			<!-- /.row -->

			<!-- Features Section -->
			<div class="row"
				style="width: 100%; margin-bottom: 15px; height: 250px; padding-left: 10px;">
				<div class="col-lg-6 info" style="padding-top: 25px;">
					<h3>Info</h3>
					<p>상호: 쌍용교육센터</p>
					<p>대표: 노경한</p>
					<p>사업자번호: 214-85-29296</p>
					<p>강남 Tel: 02-3482-4632~5</p>
					<p>강남 Fax: 02-3482-4636</p>
					<p>주소: 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터</p>
				</div>
				<div class="col-lg-6" id="map"></div>
			</div>
			<!-- /.row -->

			<hr>



		</div>
	</div>
	<!-- /.container -->




	<footer class="py-5 bg-dark" style="width: 100%;">
		<div class="container">
			<jsp:include page="/WEB-INF/view/main/footer.jsp" />
		</div>
	</footer>



	<!-- Bootstrap core JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script>
		var lat = 37.499285;
		var lng = 127.03320080000003;
		function myMap() {
			var myCenter = new google.maps.LatLng(lat, lng);
			var mapCanvas = document.getElementById("map");
			var mapOptions = {
				center : myCenter,
				zoom : 15
			};
			var map = new google.maps.Map(mapCanvas, mapOptions);
			var marker = new google.maps.Marker({
				position : myCenter,
				animation : google.maps.Animation.BOUNCE
			});
			marker.setMap(map);
			var info = "<a href='http://www.sist.co.kr'><img src='/images/sist_logo.png.png'/></a>";
			var infowindow = new google.maps.InfoWindow({
				content : info
			});
			infowindow.open(map, marker);

		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvEYN6U07n9K0v-EV6Ld2KzaL7dEk7K6Y&callback=myMap"></script>

</body>
</html>