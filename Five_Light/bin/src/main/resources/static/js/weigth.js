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