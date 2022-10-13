<%@ page import="javax.sound.midi.SysexMessage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fivelight.domain.Exercise" %>
<%@ page import="com.fivelight.domain.Feedback" %>
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
	<!-- 사용자 로그인 이후 -->

	<!-- 좌측 카테고리 -->
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		
		<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
			<div class="cotainer">
				<!-- 좌측 목록 페이지 로고 -->
				<div class="row">
					<div class="col-12">
						<div class="col-12 logo">
							<a href="UserInfo.jsp"><img src="images/logo.png"></a>
						</div>
		
						<!-- 좌측 로고 밑 닉네임 -->
						<% User info = (User)session.getAttribute("info"); %>
						<div class="row col-12 nickCategory">
							<div id="nickname_1" class="col-8 userName" value="<%=info.getNickname()%>">
								<p id="user_nickname"><%=info.getName()%></p>
							</div>

							<div class="col-4 nickCorr">
								<img type="button" class="nickCorrBtn" src="images/nickCorr.png">
							</div>
						</div>
						<!-- 좌측 로고 밑 닉네임 끝 -->

						<!-- 좌측 목록 -->
						<div class="col-12">
							<div class="main-menu">
								<nav id="colorlib-main-menu" role="navigation" list-style=snone>
									<ul class="main-menu">
										<li class="colorlib-active"><a href="userInfo.do">Userinfo</a></li>
										<li><a href="rank.do">Ranking</a></li>
									</ul>
								</nav>
							</div>
		
							<div class="infoLogout">
								<a href="logout.do" onclick="return confirm('정말 로그아웃 하시겠습니까??');">로그아웃</a>
							</div>
							
							<div class="fiveLight">
								<div>
									<p>Five_Light ㅣ 오경락 백성연 공석준 기아성 최지훈</p>
								</div>
							</div>							
						</div>
						<!--좌측 목록 끝  -->
					</div>
				</div>
			</div>
		</aside>
	</div>		
	<!-- 좌측 카테고리 끝 -->

	<!-- 로그인 상태 라인  -->
	<div id="colorlib-main">
		<div class="container userTable">
			<div class="col-12">
				<!-- 회원목록 -->
				<div class="userTotal">
					<span>회원수: ${userList.size()}</span>
				</div>
				
				<div class="userTranScoll type1">
					<ul>
						<c:forEach var="userList" items="${userList}">
							<c:set var="i" value="${i + 1}" />
							<li class="userlistItem">
								<div class="userTableDiv">
									<table class="userTableDetail">
										<tr>
											<td class="userTableNo">${i}.</td>
											<td class="userTableName">
												<a class="userTableNameA" href="/userInfoDetail.do?nickname=${userList.nickname}">${userList.name}</a>
											</td>
											<td class="userTableDel">
												<button class="delLogo"	onclick="return confirm('정말 삭제하시겠습니까??');">
													<img src="\images\userDel.png" alt="">
												</button>
											</td>
										</tr>
									</table>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<div class="row">
				<!-- 파이차트 -->
				<div class="col-8">
					<canvas id="myChart2"></canvas>
					<div class="card card-body text-center bg-primary">
						<h3>${userInfo.name}님의선호운동</h3>
					</div>
				</div>
				<!-- 파이차트 끝-->	
						
				<!-- 몸무게 -->
				<div class="col-4">
					<div class="col-12">
						<div class="card flex-fill">
							<div class="card-header">
								<h5 class="card-title mb-0">${userInfo.name}님의 도전<button id="weight_corr">수정</button>	</h5>
							</div>

							<table class="table table-hover my-0">
								<tbody>
									<tr>
										<th>시작 몸무게</th>
										<td><span id="weight_start">${userInfo.weight_start} Kg</span></td>
									</tr>
									<tr>
										<th>현재 몸무게</th>
										<td><span id="weight_now">${userInfo.weight_now} Kg</span></td>
									</tr>
									<tr>
										<th>목표 몸무게</th>
										<td><span id="weight_target">${userInfo.weight_target} Kg</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 몸무게 끝 -->
					
					<!-- 피드백 -->
					<div class="col-12">
						<div class="card flex-fill">
							<div class="card-header">
								<h5 class="card-title mb-0">피드백</h5>
							</div>

							<table class="table table-hover my-0">
								<thead>
									<tr>
										<th>날짜</th>
										<th class="d-none d-xl-table-cell">FeedBack</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach var="feedbackList" items="${feedbackList}">
										<tr>
											<td>${feedbackList.feed_date}</td>
											<td class="d-none d-xl-table-cell">
												<a href="feedDetail.do?nickname=${feedbackList.nickname}">	${feedbackList.ex_name}</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">		
      		<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
      		<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    	</svg>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
			
	<script type="text/javascript">
		<!-- 몸무게 스크립 시작 -->
		var weight_start = $('#weight_start').text()
		var weight_now = $('#weight_now').text()
		var weight_target = $('#weight_target').text()
		
		$(document).on('click', '#weight_corr', ()=> {
			var weight_start = $('#weight_start').text()
			var weight_now = $('#weight_now').text()
			var weight_target = $('#weight_target').text()
			
			$('#weight_corr').text('수정완료')
			$('#weight_corr').after('<button id="weight_corr_cancel">취소</button>')
			$('#weight_corr').attr('id', 'weight_corr_fix')
			
			$('#weight_start').contents().unwrap().wrap('<span id="weight_start"><input id="weight_start_corr" class="weight_corr_input" type="text" value="' + weight_start + '" size=15 style="height: 30px !important;"/></span>')
			$('#weight_now').contents().unwrap().wrap('<span id="weight_now"><input id="weight_now_corr" class="weight_corr_input" type="text" value="' + weight_now + '" size=15 style="height: 30px !important;"/></span>')
			$('#weight_target').contents().unwrap().wrap('<span id="weight_target"><input id="weight_target_corr" class="weight_corr_input" type="text" value="' + weight_target + '" size=15 style="height: 30px !important;"/></span>')
		})
		
		$(document).on('click', '#weight_corr_cancel', ()=> {
			var weight_start = $('#weight_start').text()
			var weight_now = $('#weight_now').text()
			var weight_target = $('#weight_target').text()
			
			$('#weight_corr_cancel').remove()
			$('#weight_corr_fix').text('수정하기')
			$('#weight_corr_fix').attr('id', 'weight_corr')								
			
			$('.weight_corr_input').remove()
			$('#weight_start').append('<span id="weight_start">' + weight_start + '</span>')
			$('#weight_now').append('<span id="weight_now">' + weight_now + '</span>')
			$('#weight_target').append('<span id="weight_target">' + weight_target + '</span>')
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
					nickname : `${userInfo.nickname}`,
					name : `${userInfo.name}`,										
					access : `${userInfo.access}`
				},
				dataType: "text",
				
				success: function(res) {
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
		<!-- 몸무게 스크립 끝 -->
		
		<!-- 도넛 차트 스크립트 시작 -->
		<% List<Exercise> exerciseList = (List<Exercise>)session.getAttribute("exerciseList"); %>
		<% 
		   List<Integer> feedCntList = new ArrayList<>();
		
		   for(int i = 0; i < exerciseList.size(); i++){
		   	   int feedCount = (int)session.getAttribute("feedchart" + i);
		   	   
		   	   feedCntList.add(feedCount);
		   }
		   
		   System.out.println(feedCntList);
		   System.out.println(exerciseList.size());		   
		%>
		
		// 도넛형 차트
		var exerciseList = '<%= exerciseList %>'		
		
		var exName_Split = exerciseList.split(', ')
		
		var exName_List = function() {
			var ex_List = []
        	
        	for(let i = 0; i < exName_Split.length; i++) {
        		if(i == 0) {
        			var exerciseName = exName_Split[i].substring(18, exName_Split[i].length - 1)
        			ex_List.push(exerciseName)
        		}
        		else if(i == exName_Split.length - 1) {
        			var exerciseName = exName_Split[i].substring(17, exName_Split[i].length - 2)
        			ex_List.push(exerciseName)
        		}
        		else {
        			var exerciseName = exName_Split[i].substring(17, exName_Split[i].length - 1)
        			ex_List.push(exerciseName)
        		}        		
        	}
        	
          	return ex_List
       	}
		
		var ctx2 = document.getElementById('myChart2')
		
		var myPieChart = new Chart(ctx2, {
			type: 'pie',
			data: {
				labels: exName_List(),
				datasets: [
					{
						label: exName_List(),
						backgroundColor: ['red', 'yellow', 'blue', 'green', 'pupple', 'black'],
						data: <%= feedCntList %>
					}
				],
			},
			
			options: {}
		})
		<!-- 도넛 차트 스크립트 끝 -->
	</script>	

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