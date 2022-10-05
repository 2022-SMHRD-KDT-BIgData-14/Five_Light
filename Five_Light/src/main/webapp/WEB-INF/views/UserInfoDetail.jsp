<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>당근 P.T</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700"
	rel="stylesheet">

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
<!-- 차트 링크 아래 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- 차트 링크 끝 -->
</head>

<body>

	<!--  
																		info : 로그인한 사람 정보
																		userInfo : 회원(PT회원의 정보=null)
																		userList : 회원리스트(PT회원의 정보=null)
																		feedbackList : 회원 피드백 정보 리스트
																	-->

	<!-- 사용자 로그인 이후 -->

	<!-- 좌측 카테고리 -->
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary"
			class="js-fullheight text-center">
			<!-- 좌측 목록 페이지 로고 -->
			<h1 id="colorlib-logo">
				<a href="index.jsp">당.근 P.T</a>
			</h1>
			<!-- 좌측 로고 밑 사진 -->
			<div class="userImg mb-4"
				style="background-image: url(images/당근5.jfif);"></div>
			<div class="userName">${info.name}</div>

			<!-- 좌측 목록 -->
			<nav id="colorlib-main-menu" role="navigation" list-style=snone>
				<ul class="main-menu">
					<li class="colorlib-active"><a href="userInfo.do">User Info</a></li>
					<li><a href="rank.do">Ranking</a></li>
				</ul>
			</nav>
			<div class="Logout">
				<a href="logout.do">Logout</a>
			</div>
			<!--좌측 목록 끝  -->
		</aside>
		<!-- 좌측 카테고리 끝 -->


		<!-- 로그인 상태 라인  -->
		<div id="colorlib-main">
			<div class="hero-wrap "
				style="background-image: url(images/bg_1.jpg);"
				data-stellar-background-ratio="0.5">
				<!--herp-wrap에서 이거 뺌 js-fullheight -->
				<div class="overlay"></div>
				<section class="ftco-section">
					<div class="container"></div>
					<div class="row">
						<!-- 회원목록 -->
						<div class="col-md-12">${userInfo.name}정보</div>
						<div class="col-md-3">
							<div class="card flex-fill">

								<div class="card-header">
									<h5 class="card-title mb-0">회원수 ${userList.size()}</h5>
								</div>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>번호</th>
											<th class="d-none d-xl-table-cell">이름</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="userList" items="${userList}">
											<c:set var="i" value="${i+1}" />
											<tr>
												<td>${i}</td>
												<td class="d-none d-xl-table-cell"><a
													href="/userInfoDetail.do?nickname=${userList.nickname}">${userList.name}</a></td>
												<td><button class="badge bg-success">삭제</button></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>


						<!-- 회원목록 끝 -->

						<!-- 도넛 그래프 -->

						<div class="col-md-9">
							<canvas id="myChart2"></canvas>
							<div class="card card-body text-center bg-primary">
								<h3>선호 운동</h3>
							</div>
						</div>
						<!-- 도넛 그래프 끝-->

						<!-- 피드백 -->
						<div class="col-md-8">
							<div class="card flex-fill">
								<div class="card-header">
									<h5 class="card-title mb-0">피드백</h5>
								</div>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>날짜</th>
											<th class="d-none d-xl-table-cell">P.T</th>
											<th>내용</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="feedbackList" items="${feedbackList}">
											<tr>
												<td>${feedbackList.feed_date}</td>
												<td class="d-none d-xl-table-cell">${feedbackList.ex_name}</td>
												<td><a href="feedDetail.do?nickname=${feedbackList.nickname}"> 내용보기</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- 피드백 끝 -->
						<!-- 몸무게 -->
						<div class="col-md-4">
							<div class="card flex-fill">
								<div class="card-header">
									<h5 class="card-title mb-0">나의 도전</h5>
									<button id="correction1" onclick="correction_1()">수정</button>
								</div>
								<table class="table table-hover my-0">
									<tbody>
										<tr>
											<th>시작 몸무게</th>
											<td><input class="correction1" id="weight_start"
												type="text" value="${userInfo.weight_start}"
												readonly='readonly'></td>
										</tr>
										<tr>
											<th>현재 몸무게</th>
											<td><input class="correction1" id="weight_now"
												type="text" value="${userInfo.weight_now}"
												readonly='readonly'></td>
										</tr>
										<tr>
											<th>목표 몸무게</th>
											<td><input class="correction1" id="weight_target"
												type="text" value="${userInfo.weight_target}"
												readonly='readonly'></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<!-- 몸무게 끝 -->
					</div>
				</section>
			</div>
		</div>
		<!-- END COLORLIB-PAGE -->
	</div>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    </svg>
	</div>

	<!-- 도넛 차트 스크립트 시작 -->
	<script>
		data = {
			datasets : [ {
				backgroundColor : [ 'red', 'yellow', 'blue', 'green', 'pupple','black' ],
				data : [ 1, 2, 3, 4, 2, 2 ]
			} ],
			// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남
			labels : [ 'red', 'yellow', 'blue' ]
		};

		// 도넛형 차트
		var ctx2 = document.getElementById("myChart2");
		var myDoughnutChart = new Chart(ctx2, {
			type : 'doughnut',
			data : data,
			options : {}
		});
	</script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<!-- 도넛 차트 스크립트 끝 -->
	
	
	
	
	<!-- 몸무게 스크립 시작 -->
			<script type="text/javascript">
			let num1 = 1

			function correction_1() {
				if (num1 == 1) {
					$('#correction1').text('완료')
					$('#correction1')
						.attr('id', 'correction11')
					$('.correction1').removeAttr('readonly') // input 태그 안써지는속성 제거 해서 숫자 변경 할수 있도록 함
					num1 = 2
					console.log(num1)
				} else {
					console.log(123)
					var weight_start = document
						.getElementById('weight_start').value;
					var weight_now = document
						.getElementById('weight_now').value;
					var weight_target = document
						.getElementById('weight_target').value;

					console.log(weight_start)

					// 숫자 하나를 data로 요청 >> controller 제곱을 해서 돌려주는 함수
					$.ajax({
						url: 'weight.do',
						type: 'get',
						data: {
							weight_start: weight_start,
							weight_now: weight_now,
							weight_target: weight_target,
							nickname: `${info.nickname}`
						},
						success: function(res) {
							console.log(res)
							$('#correction11').text('수정')
							$('#correction11').attr('id',
								'correction1')
							$('.correction1').attr('readonly',
								'readonly')
							num1 = 1
						},
						errer: function(e) {
							alert(e);
						}

					});

				}
			}
			</script>
	
	<!-- 몸무게 스크립 끝 -->

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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</body>

</html>