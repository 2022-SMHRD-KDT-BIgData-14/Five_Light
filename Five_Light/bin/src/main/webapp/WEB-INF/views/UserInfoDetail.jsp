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
	<!-- 페이징 스크립트 -->
	<script type="text/javascript">
		(function(window){
	    'use strict';

	    // This function will contain all our code
	    function lignePaginate(){
	        var _lignePaginate = {};

	        _lignePaginate.init = function(el, options = {numberPerPage: 10,goBar:false,pageCounter:true},filter = [{el: null}]
	        ){
	            setTableEl(el);
	            initTable(_lignePaginate.getEl());
	            checkIsTableNull();
	            setOptions(options);
	            setConstNumberPerPage(options.numberPerPage);
	            setFilterOptions(filter);
	            launchPaginate();
	        }
	        
	        var settings = {
	            el:null,
	            table:null,
	            numberPerPage:10,
	            constNumberPerPage:10,
	            numberOfPages:0,
	            goBar:false,
	            pageCounter:true,
	            hasPagination:true,
	        };

	        var filterSettings = {
	            el:null,
	            filterBox:null,
	            trs:null,
	        }

	        /**
	         * Setters private
	         **/

	        var setConstNumberPerPage = function(number){
	            settings.constNumberPerPage = number;
	        }
	        var setNumberPerPage = function(number){
	            settings.numberPerPage = number;
	        }

	        var initTable = function(el){
	            if(el.indexOf('#') > -1 ){
	                settings.table = document.getElementById(el.replace('#','').trim());
	            }else if(el.indexOf('.') > -1  ){
	                settings.table = document.querySelector(el);
	            }
	        }

	        var iniFilter = function(el){
	            if(el.indexOf('#') > -1 ){
	                filterSettings.filterBox = document.getElementById(el.replace('#','').trim());
	            }else if(el.indexOf('.') > -1  ){
	                filterSettings.filterBox = document.querySelector(el);
	            }
	        }

	        var setTableEl = function(el){
	            settings.el = el;
	        }

	        var setFilterOptions = function (filterOptions) {
	            if(filterOptions.el != null){
	                setFilterEl(filterOptions.el);
	                iniFilter(filterSettings.el);
	                checkIsFilterBoxNull();
	                setFunctionInFilterBox();
	            }
	        }

	        var setFilterEl = function(el){
	            filterSettings.el = el;
	        }

	        var setFunctionInFilterBox = function(){
	            filterSettings.filterBox.setAttribute('onkeyup','paginate.filter()')
	        }

	        var setGoBar = function(value){
	            settings.goBar = value;
	        }

	        var setPageCounter = function(value){
	            settings.pageCounter = value;
	        }

	        _lignePaginate.getEl = function(){
	            return settings.el;
	        }
	        _lignePaginate.getTable = function(){
	            return settings.table;
	        }
	        _lignePaginate.getNumberPerPage = function(){
	            return settings.numberPerPage;
	        }

	        _lignePaginate.getConstNumberPerPage = function(){
	            return settings.constNumberPerPage;
	        }

	        var table,tr = [],pageCount,numberPerPage,th;

	        var setOptions = function(options){
	            if(options.numberPerPage != settings.numberPerPage){
	                setNumberPerPage(options.numberPerPage);
	            }

	            if(typeof options.goBar === 'boolean')
	                setGoBar(options.goBar);

	            if(typeof options.pageCounter === 'boolean')
	                setPageCounter(options.pageCounter);
	        }

	        var checkIsTableNull = function(){
	            if(settings.table == null){
	                throw new Error('Element ' + _lignePaginate.getEl() + ' no exits');
	            }
	        }

	        var checkIsFilterBoxNull = function(){
	            if(filterSettings.filterBox == null){
	                throw new Error('Element ' + _lignePaginate.getEl() + ' no exits');
	            }
	        }

	        var paginateAlreadyExists = function() {
	            let paginate = document.querySelector('div.paginate');
	            if(paginate != null)
	                removePaginate(paginate);
	        }

	        var removePaginate = function(element){
	            element.parentNode.removeChild(element);
	        }

	        var hiddenPaginateControls = function(){
	            document.querySelector('.paginate_controls').style.visibility = 'hidden';
	        }

	        var showPaginatecontrols = function(){
	            document.querySelector('.paginate_controls').style.visibility = 'unset';
	        }

	        // (numberOfPage): número de páginas, (currentPage): página actual, la página seleccionada ..
	        var pageButtons = function(numberOfPage,currentPage) {
	            
	            let	prevDisabled = (currentPage == 1)?"disabled":"";
	            let nextDisabled = (currentPage == numberOfPage)?"disabled":"";

	            let buttons = "<input type='button' value='<<' class='paginate_control_prev' onclick='paginate.sort("+(currentPage - 1)+")' "+prevDisabled+">";
	            let buttonNumberOfPage = "<input type='button' value='" + currentPage + ' - ' + numberOfPage + "' disabled>";

	            for (let $i=1; $i<=numberOfPage;$i++){
	                if(numberOfPage > 5){
	                    buttons += paginationMoreThatTenPage($i,numberOfPage);
	                }else{
	                    buttons += "<input type='button' id='id"+$i+"'value='"+$i+"' onclick='paginate.sort("+$i+")'>";
	                }
	            }

	            let nextButton = "<input type='button' value='>>' class='paginate_control_next' onclick='paginate.sort("+(currentPage + 1)+")' "+nextDisabled+">";
	            buttons +=  nextButton;

	            if(settings.pageCounter)
	                buttons += buttonNumberOfPage;

	            if(settings.goBar)
	                buttons += addGoToPage();

	            return buttons;
	        }
	        
	        var paginationMoreThatTenPage = function(iterator,numberOfPage){

	            let referenceForTheLast = numberOfPage - 1;
	            let middleValue = '...';

	            if(iterator > referenceForTheLast || iterator <5){
	                return "<input type='button' id='id"+iterator+"'value='"+iterator+"' onclick='paginate.sort("+iterator+")'>";
	            }else if((iterator + 1) == numberOfPage) {
	                return middleValue + "<input type='button' id='id"+iterator+"'value='"+iterator+"' style='display: none' onclick='paginate.sort("+iterator+")'>";
	            }else {
	                return "<input type='button' id='id"+iterator+"'value='"+iterator+"' style='display: none' onclick='paginate.sort("+iterator+")'>";
	            }
	        }

	        var addGoToPage = function(){
	            let inputBox = "<input type='number' id='paginate_page_to_go' value='1' min='1' max='"+ settings.numberOfPages +"'>";
	            let goButton = "<input type='button' id='paginate-go-button' value='Go' onclick='paginate.goToPage()'>  ";
	            return inputBox + goButton;
	        }

	        _lignePaginate.goToPage = function(){
	            let page = document.getElementById("paginate_page_to_go").value;
	            _lignePaginate.sort(page);
	        }

	        var launchPaginate = function(){
	            paginateAlreadyExists();
	            table = settings.table;
	            numberPerPage = settings.numberPerPage;
	            let rowCount = table.rows.length;
	            // obtener el nombre de la etiqueta de la primera celda (en la primera fila)
	            let firstRow = table.rows[0].firstElementChild.tagName;
	            // Verificando si la tabla tiene encaebzado
	            let hasHead = (firstRow === "TH");
	            // contadores de bucles, para comenzar a contar desde las filas [1] (2da fila) si la primera fila tiene una etiqueta de encabezado
	            let $i,$ii,$j = (hasHead)?1:0;
	            // contiene la primera fila si tiene un (<th>) y nada si (<td>)
	            th = (hasHead?table.rows[(0)].outerHTML:"");
	            pageCount = Math.ceil(rowCount / numberPerPage);
	            settings.numberOfPages = pageCount;

	            if (pageCount > 1) {
	                settings.hasPagination = true;
	                for ($i = $j,$ii = 0; $i < rowCount; $i++, $ii++)
	                    tr[$ii] = table.rows[$i].outerHTML;
	                // Contenedor de los botones "paginate_controls"
	                table.insertAdjacentHTML("afterend","<div id='buttons' class='paginate paginate_controls'></div");
	                // Inicializando la tabla en la pagina 1
	                _lignePaginate.sort(1);
	            }else{
	                settings.hasPagination = false;
	            }
	        };

	        _lignePaginate.sort = function(selectedPageNumber) {
	            let rows = th,startPoint = ((settings.numberPerPage * selectedPageNumber)-settings.numberPerPage);
	            for (let $i = startPoint; $i < (startPoint+settings.numberPerPage) && $i < tr.length; $i++)
	                rows += tr[$i];

	            table.innerHTML = rows;
	            document.getElementById("buttons").innerHTML = pageButtons(pageCount,selectedPageNumber);
	            document.getElementById("id"+selectedPageNumber).classList.add('active');
	         
	            document.getElementById("id"+selectedPageNumber).style.display = 'unset';
	        }

	        _lignePaginate.filter = function() {
	            if(settings.hasPagination){
	                setNumberPerPage(9999);
	                _lignePaginate.sort(1);
	                hiddenPaginateControls();
	            }
	            const filter = document.querySelector(filterSettings.el).value.toUpperCase();
	            const trs = document.querySelectorAll( settings.el + ' tr:not(.header)');
	            trs.forEach(tr => tr.style.display = [...tr.children].find(td => td.innerHTML.toUpperCase().includes(filter)) ? '' : 'none');

	            if(filter.length == 0 && settings.hasPagination){
	                setNumberPerPage(_lignePaginate.getConstNumberPerPage());
	                _lignePaginate.sort(1);
	                showPaginatecontrols();
	            }

	        }

	        return _lignePaginate;
	    }

		    if(typeof(window.paginate) === 'undefined'){
		        window.paginate = lignePaginate();
		    }
		})(window);
	</script>
	<!-- 페이징 스크립트 -->
	
</head>

<body>
	<!-- 관리자 로그인 -->

	<!-- 좌측 카테고리 -->
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		
		<aside id="colorlib-aside" role="complementary" class="boxShadow js-fullheight text-center">
			<div class="cotainer">
				<!-- 좌측 목록 페이지 로고 -->
				<div class="row">
					<div class="col-12">
						<div class="col-12 logo">
							<a href="UserInfo.jsp"><img src="images/logo.png"></a>
						</div>
		
						<!-- 좌측 로고 밑 닉네임 -->
						<% User info = (User)session.getAttribute("info"); %>
						<div id="nickCategory" class="row">
							<div id="nickname_1" class="col-12 userName" value="<%= info.getNickname() %>">
								<h3 id="user_nickname"><%= info.getName() %></h3>
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
						<!--좌측 목록 끝  -->
					</div>
				</div>
			</div>
		</aside>
	</div>		
	<!-- 좌측 카테고리 끝 -->

	<!-- 우측뷰   -->
	<div id="colorlib-main">
	<div class="hero-wrap hero-wrap-2 js-fullheight">
		<div class="js-fullheight justify-content-center align-items-center">
				<div class="container userTable">
					<div class="col-12">
						<!-- 회원목록 -->
							<div class="userTotal">
								<p>Total : ${userList.size()}명</p>
							</div>
		
						<div class="userTranScoll type1">
							<ul>
								<c:forEach var="userList" items="${userList}">
									<c:set var="i" value="${i + 1}" />
									<li class="userlistItem">
										<div class="userbtn rounded userTableDiv">
											<table class="userTableDetail">
												<tr>
													<td class="userTableNo">${i}.</td>
													<td class="userTableName"><a class="userTableNameA"
														href="/userInfoDetail.do?nickname=${userList.nickname}&nick=${userList.nickname}">${userList.name}</a></td>
													<td class="userTableDel"><button class="delLogo"
															onclick="return confirm('정말 삭제하시겠습니까??');">
															<img src="\images\userDel.png" alt="">
														</button></td>
												</tr>
											</table>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- 회원목록 끝 -->
		
					<div class="js-fullheight justify-content-center align-items-center">
						<div class="row">
							<!-- 파이차트 -->
							<div class="col-8 text text-center piemargin">
								<canvas id="myChart2"></canvas>
								<div id="trainingLike" class="card text-center ">
									<h3>${userInfo.name}님의 운동 선호도</h3>
								</div>
							</div>
							<!-- 파이차트 끝-->
		
							<!-- 몸무게 -->
							<div class="col-4">
								<div class="col-12">
									<div class="card flex-fill table11">
		
										<table class="table table-hover my-0 weightTable">
											<thead class="weightHead">
												<tr>
													<th><h5>[${userInfo.name}]님의 목표</h5></th>
													<th><button id="weight_corr" class="userbtn rounded">수정</button></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th>시작 몸무게</th>
													<td><span id="weight_start">${userInfo.weight_start}</span>
														<span>Kg</span></td>
												</tr>
												<tr>
													<th>현재 몸무게</th>
													<td><span id="weight_now">${userInfo.weight_now}</span>
														<span>Kg</span></td>
												</tr>
												<tr>
													<th>목표 몸무게</th>
													<td><span id="weight_target">${userInfo.weight_target}</span>
														<span>Kg</span></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- 몸무게 끝 -->
		
								<!-- 피드백 -->
								<div class="col-12">
									<div class="card flex-fill table22">
										<!-- <div class="container"> -->
										<div class="panel">
											<div class="body">
												<div class="input-group">
													<input type="hidden" id="searchBox" placeholder="Filtrar...">
												</div>
											</div>
										</div>
		
										<% List<Feedback> feedbackList = (List<Feedback>) session.getAttribute("feedbackList"); %>
										<table id="feedbacktable" class="table table-hover my-0 myTable">
											<tbody>
												<tr>
													<th colspan="2" class="weightHead"><h5>Feedback History</h5></th>
												</tr>
												<tr>
													<th>Date</th>
													<th>FeedBack</th>
												</tr>
		
												<% for (int i = 0; i < feedbackList.size(); i += 5) { %>
												<tr>
													<td><%=feedbackList.get(i).getFeed_date()%></td>
													<td class="d-none d-xl-table-cell">
														<span><a href="adminDetail.do?feed_number=<%=feedbackList.get(i).getFeed_num()%>">
														<%=feedbackList.get(i).getEx_name()%></a> </span>
													</td>
												</tr>
												<% } %>
											</tbody>
										</table>
									</div>
								</div>
							</div>
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
			
			$('#weight_corr').text('완료')
			$('#weight_corr').after('<button id="weight_corr_cancel" class="userbtn rounded">취소</button>')
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
			$('#weight_corr_fix').text('수정')
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
					$('#weight_corr_fix').text('수정')
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
			type: 'doughnut',
			data: {
				labels: exName_List(),
				datasets: [
					{
						label: exName_List(),
						backgroundColor: ['#FFA9B0', '#FDFA87', '#CCD1FF', '#A8C8F9', '#FFDDA6', '#B8F3B8'],
						data: <%= feedCntList %>
					}
				],
			},
			
			options: {
				scales: {		        	
				},
				
				legend: { // 범례
		        	position: 'bottom',
		            labels: {
		            	display: true,
		            	boxWidth: 22,
		            	fontSize: 17,
		            	fontFamily: 'the',							            	
		            	fontColor: 'black',
		                usePointStyle: false // 지정된 포인트 모양에 따라 범례 아이콘 생성							                
		            }
		        }
			}
		})
		<!-- 도넛 차트 스크립트 끝 -->
	</script>	

<script>
    let options = {
        numberPerPage:6, //Cantidad de datos por pagina
        goBar:true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
        pageCounter:true, //Contador de paginas, en cual estas, de cuantas paginas
    };
    let filterOptions = {
        el:'#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
    };
    paginate.init('.myTable',options,filterOptions);
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