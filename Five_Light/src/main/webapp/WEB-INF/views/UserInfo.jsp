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
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"></a>
		
		<aside id="colorlib-aside" role="complementary" class="boxShadow js-fullheight text-center">
			<div class="cotainer">
				<!-- 좌측 목록 페이지 로고 -->
				<div class="row">
					<div class="col-12 logo">
						<a href="UserInfo.jso"><img src="images/logo.png"></a>
					</div>
						
					<!-- 좌측 로고 밑 닉네임 -->
					<% User info = (User)session.getAttribute("info"); %>
            		<div class="row col-12 nickCategory">
            			<div id="nickname_1" class="col-8 userName" value="<%= info.getNickname() %>">
                			<p id="user_nickname"><%= info.getName() %></p>
                		</div>
              		</div>
					<!-- 좌측 로고 밑 닉네임 끝 -->

					<!-- 좌측 목록 -->
					<div class="col-12">
						<div class="main-menu">							
							<nav id="colorlib-main-menu" role="navigation" list-style=snone>
								<ul class="main-menu">
									<li><a href="userInfo.do">UserInfo</a></li>
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
		        </div>
	        </div>
	        <!--좌측 목록 끝  -->		
		</aside>
	</div>
	<!-- 좌측 카테고리 끝 -->	
		
	<!-- 우측 뷰  -->
	<div id="colorlib-main">
		<div class="container userTable">
			<div class="col-12">
				<!-- 회원목록 -->
        		<div class="userTotal">
        			<p>회원수 : ${userList.size()}명</p>
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
						                  	<td class="userTableName"><a class="userTableNameA" href="/userInfoDetail.do?nickname=${userList.nickname}&nick=${userList.nickname}">${userList.name}</a></td>
						                  	<td class="userTableDel"><button class="delLogo" onclick="return confirm('정말 삭제하시겠습니까??');"><img src="\images\userDel.png" alt=""></button></td>
						                </tr>
					            	</table>                
				                </div>
			                </li>
			            </c:forEach>
	                </ul>
	            </div>
            </div>
		                
			<!-- 인덱스 페이지 -->
			<div class="js-fullheight d-flex justify-content-center align-items-center">
				<div class="col-11 text text-center">
					<span class="desc">Challenge,</span><br>	
					<span class="desc">Versus Me,</span><br>
					<span class="desc">Training!</span>
					
					<div class="kakaoLogin">
			        	<img src="\images\logo.png" href="#" style="max-width: 100%">
			        </div>
		    	</div>							
			</div>
			<!-- 인덱스 페이지 끝 -->
		</div>		
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