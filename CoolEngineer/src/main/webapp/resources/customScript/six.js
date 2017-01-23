
// 모임후기 작성시 태그등록 펑션
function tagVals(event) {
	
	var keycode = event.keyCode;
	
	if(keycode == 188) {
		
		alert('enent 발생');
		
		var input = "<input type='text' name='post_tag' value='" + $('#post_tag').val(); + "'>";
		var tagDiv = document.getElementById("tagDiv");
		tagDiv.innerHTML = tagDiv.innerHTML + input;
		
		$('#post_tag').val('');
	}
	
}