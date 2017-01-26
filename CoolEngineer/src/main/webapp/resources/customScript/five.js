
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

// 태그모임
$(document).ready(function() {
    //add more file components if Add is clicked
    $('#addFile').click(function() {
        var fileIndex = $('#fileview').children().length;      
        $('#fileview').append('<input class="btn btn-warning btn-rounded" id="file'+fileIndex+'" type="file" name="files[' + fileIndex + ']" onchange="chkType(\'file'+fileIndex+'\')"/>');
    });     
});

//모임후기 사진파일, 동영상 파일 등록시 파일타입 체크
function chkType(id) {

	var fileName = $("#"+id).val();
	var extension = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();
	
	var isOk = false;
	isOk = imgChk(extension);
	if(!isOk){
		isOk = videoChk(extension);
	}
	if(!isOk){
		alert("이미지 파일 혹은 동영상 파일 형식만 등록 가능합니다.");
		$("#"+id).val("");
	}
}

function imgChk(extension) {
	var imgs = ['jpg', 'png', 'gif', 'bmp', 'rel', 'psd', 'pdd', 'tif', 'pdf', 'raw', 'pct', 'pic'];
	for(var i=0; i<imgs.length; i++){
		if(imgs[i] == extension){
			return true;
		}
	}
	return false;
}

function videoChk(extension) {
	var vedios = ['mpg', 'mpeg', 'mpe', 'wmv', 'asf', 'asx', 'flv', 'rm', 'mov', 'dat'];
	for(var i=0; i<vedios.length; i++){
		if(vedios[i] == extension){
			return true;
		}
	}
	return false;
}



