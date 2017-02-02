
//데이트형 타입으로 변환 (예. 2017년 2월 2월 -> 2017/2/2)
function toDate(timestamp) {
	var date = new Date(timestamp);
	var year = date.getFullYear();
	var month = date.getMonth();
	month = month+1;
	var day = date.getDate();
	var hour = date.getHours();
	var minutes = date.getMinutes();
	var fullDate = year+"년 "+month+"월 "+day+"일  " + hour + "시 " + minutes + "분 에 작성";
	return fullDate;
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