





$('#test').on('click',function(){
	$.ajax({
		url:'http://127.0.0.1:9005/test',
		type:'get',
		data:{
			"num1":1,
			"num2":2,
			"num3":3
		},
		
		success:function(res){
			alert('요청성공')
		},
		error: function (e) { alert('error!') }
	});
})
