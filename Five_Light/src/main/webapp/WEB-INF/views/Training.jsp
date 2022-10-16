<%@ page import="com.fivelight.domain.Exercise" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fivelight.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>당근 P.T</title>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
	
	<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/aos.css">
	<link rel="stylesheet" href="css/ionicons.min.css">
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/jquery.timepicker.css">
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/font.css">
	
	<!-- 차트 링크 아래 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 차트 링크 끝 -->
</head>

<body>
	<!-- 좌측 카테고리 -->
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>

		<aside id="colorlib-aside" role="complementary" class="boxShadow js-fullheight text-center">
			<div class="cotainer">
				<!-- 좌측 목록 페이지 로고 -->
				<div class="row">
					<div class="col-12">
						<div class="col-12 logo">
							<a href="MyInfo.jsp"><img src="images/logo.png"></a>
						</div>

						<!-- 로고 밑 닉네임 -->
						<div id="nickCategory">
							<div id="nickname_1" class="col-12 userName" value="${info.nickname}">
								<h3 id="user_nickname">${info.nickname}</h3>
							</div>
						</div>
						<!-- 로고 밑 닉네임 끝 -->
					</div>

					<!-- 좌측 목록 -->
					<% User info = (User) session.getAttribute("info"); %>
					<div class="col-12">
						<div class="main-menu">
							<nav id="colorlib-main-menu" role="navigation" list-style=snone>
								<ul class="main-menu">
									
									<li><a href="myInfo.do">My Info</a></li>
									<li><a href="challenge.do">Challenge</a></li>
									<li><a href="ranking.do">Ranking</a></li>
									<li><a href="training.do">Training</a></li>
								</ul>
							</nav>
						</div>

						<div class="fiveLight">
							<p>Five_Light ㅣ 오경락 백성연 공석준 기아성 최지훈</p>
						</div>
					</div>
					<!--좌측 목록 끝  -->
				</div>
			</div>
		</aside>
	</div>
	<!-- 좌측 카테고리 끝 -->

	<!-- 로그인 상태 라인  -->
	<div id="colorlib-main">
		<section class="ftco-section">
			<div class="container">
				<div class="row">
					<!-- versus me  문구 -->
					<div class="col-12">
						<div class="trainingTitle">
							<h1>Training</h1>
						</div>
					</div>
					<!-- versus me  문구 끝-->

					<!-- 운동 사진 -->
					<!-- 랫풀 다운-->
					<div class="row col-12 imgdivdiv">
						<div class="col-4">
							<a href="http://127.0.0.1:5002/lat_TR?nickname=${info.nickname}" class="photography-entry img d-flex justify-content-center align-items-center" style="background-image: url(images/latpull.jpg);">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>랫풀 다운</h3>
								</div>
							</a>
						</div>
						<!-- 랫풀 다운 끝 -->

						<!-- 바벨 데드리프트 -->
						<div class="col-4">
							<a href="VideoRecord.html" class="photography-entry img d-flex justify-content-center align-items-center" style="background-image: url(images/deadlift.png);">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>바벨 데드리프트</h3>
								</div>
							</a>
						</div>
						<!-- 바벨 데드리프트 끝-->

						<!-- 바벨 런지 -->
						<div class="col-4">
							<a href="VideoRecord.html" class="photography-entry img d-flex justify-content-center align-items-center" style="background-image: url(images/lunge.jpg);">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>바벨 런지</h3>
								</div>
							</a>
						</div>
						<!-- 바벨 런지 끝-->

						<!-- 바벨 로우 -->
						<div class="col-4">
							<a href="VideoRecord.html" class="photography-entry img d-flex justify-content-center align-items-center" style="background-image: url(images/babellow.png);">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>바벨 로우</h3>
								</div>
							</a>
						</div>
						<!-- 바벨 로우 끝 -->

						<!-- 바벨 스쿼트 -->
						<div class="col-4">
							<a href="http://127.0.0.1:5002/squat_TR?nickname=${info.nickname}" class="photography-entry img d-flex justify-content-center align-items-center" style="background-image: url(images/squat.jpg);">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>바벨 스쿼트</h3>
								</div>
							</a>
						</div>
						<!-- 바벨 스쿼트  끝-->

						<!-- 바벨 컬-->
						<div class="col-4">
							<a href="http://127.0.0.1:5002/cal_TR?nickname=${info.nickname}" class="photography-entry img d-flex justify-content-center align-items-center" style="background-image: url(images/babelcurl.jpg);">
								<div class="overlay"></div>
								<div class="text text-center">
									<h3>바벨 컬</h3>
								</div>
							</a>
						</div>
						<!-- 바벨 컬 끝 -->
						<!-- 운동 사진 끝 -->
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
    		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
    		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</body>
</html>