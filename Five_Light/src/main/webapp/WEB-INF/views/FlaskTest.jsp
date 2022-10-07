<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<button id="test" type="button">안녕?</button>
	
	<div class="flas_test"></div>
	
	<div class="flas_test2"></div>

	<script type="text/javascript">
		$('#test').on('click', function() {
			$.ajax({
				url : 'http://127.0.0.1:9005/test',
				data: {
					num1: 1,
					num2: 2,
					num3: 3
				},
				dataType: "text",
				
				success : function(res) {					
					$('.flas_test').append(res)
				},
				
				error : function(e) {
					alert('error!')
				}
			})
		})

		$('#test').on('click', function() {
			$.ajax({
				url : 'http://127.0.0.1:9005/test2',
				data : {
					str1 : "안녕하세요",
					str2 : "저는",
					str3 : "백성연입니다."
				},
				dataType: "text",
				
				success : function(res) {
					$('.flas_test2').append(res)
				},
				
				error : function(e) {
					alert('error!')
				}
			});
		})
	</script>
</body>
</html>