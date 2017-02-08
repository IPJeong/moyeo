//데이트형 타입으로 변환 (예. 2017년 2월 2월 -> 2017/2/2)
function toDate(timestamp) {
	var date = new Date(timestamp);
	var year = date.getFullYear();
	var month = date.getMonth();
	month = month+1;
	var day = date.getDate();
	var hour = date.getHours();
	var minutes = date.getMinutes();
	var fullDate = year+"년 "+month+"월 "+day+"일  " + hour + ":" + minutes;
	return fullDate;
}

// 시간형 타입으로 변환(예. 11시 10분 -> 11:10)
function toTime(timestamp) {
	var date = new Date(timestamp);
	var hour = date.getHours();
	var minutes = date.getMinutes();
	var seconds = date.getSeconds();
	var fullTime = hour + "시 " + minutes +"분";
	return fullTime;
}

function timestampToDateLoad() {
	// 댓글 상자의 스크롤을 내려주는 기능
	$('#msgBox').scrollTop($('#msgBox').prop('scrollHeight'));
	// 날짜타입을 변환해주는 기능
	$('.date').each(function(index) {
		var text = $(this).text();
		$(this).text(toDate(text));
	});
}

//채팅내용입력(엔터키로 입력)
function keycheck(event) {
	if(event.keyCode == 13) {
		addChat();
	}
}
//채팅내용 입력
function addChat() {
	setInterval(300); 

	jQuery.ajax({
		type : "POST",
		url:"/moyeo/six/moimChat/addChat",
		async : true,
		dataType : "json",
		data:{				
			chat_room_num : $('#chat_num').val(),
			msg_content : $('#msg_content').val()
			
		},
		success : function(data) {
			var fullDate = toDate(data.dto.msg_date);
			if(data.cnt == 1) {
				$('#msg_content').val('');
				$('#msg_content').focus();
				$('#msgBox').scrollTop($('#msgBox').prop('scrollHeight'));
			} 
		},
	
	}); 
}
$(document).ready(function(){
	$('#fav').click(function(){
		jQuery.ajax({
			type : "POST",
			url:"/moyeo/six/moimMain/favorite",
			async : true,
			dataType : "json",
			data:{	
				
			},
			success : function(data) {
				if(data.checkCnt == 0) {
					var favorite = '<i class="fa fa-heart" style="color:red;"></i>관심모임'
					$('#fav').html(favorite);
				} else {
					var favorite = '<i class="fa fa-heart-o"></i>관심모임'
					$('#fav').html(favorite);
				} 
				
			},
		
		}); 
	});
});


