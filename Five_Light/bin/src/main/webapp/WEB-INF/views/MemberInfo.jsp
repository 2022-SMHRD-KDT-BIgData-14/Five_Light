<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

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
	
	<!-- 차트 링크 아래 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 차트 링크 끝 -->
</head>

<body>
	<!-- 관리자 로그인 이후 -->

	<!-- 좌측 카테고리 -->
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		
		<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
			<h1 id="colorlib-logo">
				<a href="index.jsp">당.근 P.T</a>
			</h1>
			
			<div class="userImg mb-4" style="background-image: url(images/당근5.jfif);"></div>	
						
			<div id="nickname_1" class="nickBtn" value="${info.name}">
				<h2 id="user_nickname" style="cursor:pointer">${info.nickname}</h2>
			</div>		
		
			<!-- 좌측 목록 -->
			<nav id="colorlib-main-menu" role="navigation" list-style=snone>
				<ul class="main-menu">
					<li class="colorlib-active"><a href="memberInfo.do">My Info</a></li>
					<li><a href="challenge.do">Challenge</a></li>
					<li><a href="ranking.do">Ranking</a></li>
					<li><a href="training.do">Training</a></li>
				</ul>
			</nav>
			
			<div class="Logout">
				<a href="logout.do">Logout</a>
			</div>
			
			<div class="infoDelete">
				<a href="infoDelete.do?email=${info.email}">회원 탈퇴</a>
			</div>
			<!-- 좌측 목록 끝 -->
		</aside>
		<!-- 좌측 카테고리 끝 -->

		<!-- 로그인 상태 라인  -->
		<div id="colorlib-main">
			<div class="hero-wrap " style="background-image: url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">
				<!--herp-wrap에서 이거 뺌 js-fullheight -->
				<div class="overlay"></div>
				
				<section class="ftco-section">
					<div class="container">
						<div class="row">
							<!-- 라인 그래프 -->
							<div class="col-md-12">
								<div class="row">
									<canvas id="myChart"></canvas>
									
									<div class="card card-body text-center bg-primary">
										<h3>Challenge 진행률?</h3>
									</div>
								</div>
								<!-- 라인 그래프 끝-->

								<!-- 피드백 -->
								<div class="row">
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
															<td><a href="feedDetail.do?nickname=${feedbackList.nickname}">내용보기</a></td>
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
												<button id="weight_corr">수정하기</button>
											</div>
											
											<table id="weight_table" class="table table-hover my-0">
												<tbody>
													<tr>
														<th>시작 몸무게</th>
														<td>
															<span id="weight_start">${info.weight_start}</span>
															<span>Kg</span>
														</td>
													</tr>
													<tr>
														<th>현재 몸무게</th>
														<td>
															<span id="weight_now">${info.weight_now}</span>
															<span>Kg</span>
														</td>
													</tr>
													<tr>
														<th>목표 몸무게</th>
														<td>
															<span id="weight_target">${info.weight_target}</span>
															<span>Kg</span>
														</td>														
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 몸무게 끝 -->

						<script type="text/javascript">
							// 몸무게, 닉네임 스크립트
							var nickname = $('#user_nickname').text()
							var username = $('#nickname_1').attr('value')
							var weight_start = $('#weight_start').text()
							var weight_now = $('#weight_now').text()
							var weight_target = $('#weight_target').text()
							
							$(document).on('click', '#user_nickname', ()=> {
								$('#user_nickname').contents().unwrap().wrap('<input id="user_nick_corr" type="text" placeholder="변경할 Nickname을 입력하세요." onfocus="this.placeholder=&apos;&apos;" size=27 style="height: 40px !important;"/>')
								$('#user_nick_corr').after('<button id="nick_correct">변경하기</button>')
								$('#nick_correct').after('<button id="nick_correct_cancel">변경취소</button>')
							})
							
							$(document).on('click', '#nick_correct_cancel', ()=> {
								$('#user_nick_corr').remove()
								$('#nick_correct').remove()
								$('#nick_correct_cancel').remove()								
								$('#nickname_1').append('<h2 id="user_nickname" style="cursor:pointer">${info.nickname}</h2>')
							})
							
							$(document).on('click', '#nick_correct', ()=> {
								var nickname = $('#user_nick_corr').val()
								
								$.ajax({
									url: "nickcorr.do",
									data: {
										nickname : nickname,
										name : username,
										access : `${info.access}`,
										weight_start : `${info.weight_start}`,
										weight_now : `${info.weight_now}`,
										weight_target : `${info.weight_target}`
									},
									dataType: "text",
									
									success : function(res) {
										$('#user_nick_corr').remove()
										$('#nick_correct').remove()
										$('#nick_correct_cancel').remove()
										$('#nickname_1').append('<h2 id="user_nickname" style="cursor:pointer">' + nickname + '</h2>')
									}																	
								})
							})
							
							$(document).on('click', '#weight_corr', ()=> {								
								$('#weight_corr').text('수정완료')
								$('#weight_corr').after('<button id="weight_corr_cancel">취소</button>')
								$('#weight_corr').attr('id', 'weight_corr_fix')
								
								$('#weight_start').contents().unwrap().wrap('<span id="weight_start"><input id="weight_start_corr" class="weight_corr_input" type="text" value="${info.weight_start}" size=15 style="height: 30px !important;"/></span>')
								$('#weight_now').contents().unwrap().wrap('<span id="weight_now"><input id="weight_now_corr" class="weight_corr_input" type="text" value="${info.weight_now}" size=15 style="height: 30px !important;"/></span>')
								$('#weight_target').contents().unwrap().wrap('<span id="weight_target"><input id="weight_target_corr" class="weight_corr_input" type="text" value="${info.weight_target}" size=15 style="height: 30px !important;"/></span>')
							})
							
							$(document).on('click', '#weight_corr_cancel', ()=> {
								$('#weight_corr_cancel').remove()
								$('#weight_corr_fix').text('수정하기')
								$('#weight_corr_fix').attr('id', 'weight_corr')								
								
								$('.weight_corr_input').remove()
								$('#weight_start').append('<span id="weight_start">${info.weight_start}</span>')
								$('#weight_now').append('<span id="weight_now">${info.weight_now}</span>')
								$('#weight_target').append('<span id="weight_target">${info.weight_target}</span>')
							})
							
							$(document).on('click', '#weight_corr_fix', ()=> {
								var weight_start = $('#weight_start_corr').val()
								var weight_now = $('#weight_now_corr').val()
								var weight_target = $('#weight_target_corr').val()
								
								$.ajax({
									url: 'weight.do',
									data: {
										weight_start : weight_start,
										weight_now : weight_now,
										weight_target : weight_target,
										nickname : `${info.nickname}`,
										name : `${info.name}`,										
										access : `${info.access}`
									},
									dataType: "text",
									
									success : function(res) {
										$('#weight_corr_fix').text('수정하기')
										$('#weight_corr_fix').attr('id', 'weight_corr')
										
										$('#weight_corr_cancel').remove()
										$('.weight_corr_input').remove()
										
										$('#weight_start').append('<span id="weight_start">' + weight_start + '</span>')
										$('#weight_now').append('<span id="weight_now">' + weight_now + '</span>')
										$('#weight_target').append('<span id="weight_target">' + weight_target + '</span>')
									}
								})
							})							
						</script>
					</div>
				</section>
			</div>
		</div>
		<!-- END COLORLIB-PAGE -->
	</div>
	
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
     		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    	</svg>
	</div>

	<!-- 라인차트 스크립트 시작 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<!-- 차트 -->
	<script>
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
			// 챠트 종류를 선택
			type: 'line',

			// 챠트에 그릴 데이터
			data: {
				labels: ['날짜', '날짜', '날짜', '날짜', '날짜', '날짜', '날짜', '날짜', '날짜' ],
				datasets: [{
					label: '날짜별 Challenge 점수',
					backgroundColor: 'transparent',
					borderColor: 'red',
					data: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
				}]
			},
			
			// 옵션
			options : {}
		});
	</script>
	<!-- 라인차트 스크립트 끝 -->	 

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