
//모임후기 작성시 태그등록 펑션
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

//태그모임
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

//사진파일 확장자
function imgChk(extension) {
	var imgs = ['jpg', 'png', 'gif', 'bmp', 'rel', 'psd', 'pdd', 'tif', 'pdf', 'raw', 'pct', 'pic'];
	for(var i=0; i<imgs.length; i++){
		if(imgs[i] == extension.toLowerCase()){
			return true;
		}
	}
	return false;
}

//동영상파일 확장자
function videoChk(extension) {
	var vedios = ['mpg', 'mpeg', 'mpe', 'mp4'];
	for(var i=0; i<vedios.length; i++){
		if(vedios[i] == extension.toLowerCase()){
			return true;
		}
	}
	return false;
}

//모임후기를 가져오는 비동기통신(Ajax json type)
function getPost(postNum){	
	window.location='/moyeo/five/postDetail?post_num='+postNum;
}

//모임후기를 가져오는 비동기통신(Ajax json type)
function getPostDetail(postNum){	
	jQuery.ajax({
		type : "POST",
		url:"/moyeo/five/getPostDetail",
		async : true,
		dataType : "json",
		data:{				
			post_num : postNum				
		},
		success : function(data) {
			var mainImg = data.picDtos[0].pic_path + "/" + data.picDtos[0].pic_name;
			var im = '<section class="regular slider">';

			// 후기내용 삽입
			var content = '<h2>후기내용</h2>' + 
			'<p>' + data.dto.post_content + '</p>';

			// 대표사진데이터 삽입
			var mainImg = '<img style="margin: 30px auto; width: 350px; height: 350px;"  src="' + data.picDtos[0].pic_path + '/' + data.picDtos[0].pic_name + '">';

			// 사진데이터 삽입
			jQuery.each(data.picDtos,
					function(picDtoIndex, picDto){
				var fullPath = picDto.pic_path+'/'+picDto.pic_name;
				im += '<div>' +
				'<img style="width:120px; height:120px;" src="' + fullPath + '" onclick="changeMainImg(\''+ fullPath +'\')">' +
				'</div>';
			});

			// 동영상데이터 삽입
			jQuery.each(data.videoDtos,
					function(videoDtoIndex, videoDto){
				var fullPath = videoDto.video_path+'/'+videoDto.video_name;
				im += '<div>' +
				'<video style="width:120px; height:120px;" src="' + fullPath + '" onclick="changeMainVideo(\''+ fullPath +'\')">' +
				'</div>';
			});

			im += '</section>';
			// 모임후기 제목 설정
			$('#myModalLabel').html(data.dto.post_title);
			// 모임후기 내용 설정
			$('#post_content').html(content);
			// 모임후기 메인사진 설정
			$('#mainImg').html(mainImg);
			// 모임후기 사진설정
			$('#sliderDiv').html(im);
			// 이미지 슬라이드 설정
			var boo = true;
			setInterval(function(){
				if(boo){
					imgSlide();
					boo = false;
				}
			}, 200);
		},
		error : function(xhr) {
			alert("정보조회에 실패하였습니다.");
			alert("error html = " + xhr.statusText);
		}
	}); 
}


function imgSlide() {

	$(".regular").slick({
		dots: true,
		infinite: true,
		slidesToShow: 3,
		slidesToScroll: 3
	});
	$(".center").slick({
		dots: true,
		infinite: true,
		centerMode: true,
		slidesToShow: 3,
		slidesToScroll: 3
	});
	$(".variable").slick({
		dots: true,
		infinite: true,
		variableWidth: true
	});
}

//메인이미지 변경
function changeMainImg(fullPath) {
	var tag = '<img style="margin-left: 50px; margin-top:50px; width: 400px; height: 400px;" src="' + fullPath + '">';
	$('#mainImg').html(tag);
}

//메인동영상 변경
function changeMainVideo(fullPath) {
	var tag = '<video style="margin-left: 50px; margin-top:50px; width: 400px; height: 400px;" controls>' +
	'<source src="' + fullPath + '">' +  
	'</video>';
	$('#mainImg').html(tag);
}

//모임후기 삭제
function deletePost(num) {
	jQuery.ajax({
		type : "POST",
		url:"/moyeo/five/deletePost",
		async : true,
		dataType : "json",
		data:{				
			post_num : num				
		},
		success : function(data) {
			var cnt = data.cnt;
			if(cnt == 1) {
				alert('모임후기가 정상적으로 삭제되었습니다.');
				window.location='/moyeo/five/postList';
			}
		},
		error : function(xhr) {
			alert("모임후기 삭제에 실패하였습니다.");
			alert("error html = " + xhr.statusText);
		}
	}); 
}

//모임후기 좋아요
function likePost(postnum, type) {
	jQuery.ajax({
		type : "POST",
		url:"/moyeo/five/likePost",
		async : true,
		dataType : "json",
		data:{				
			post_num : postnum,
			type : type
		},
		success : function(data) {
			var cnt = data.cnt;
			var type = data.type;
			var likeNum = data.likeNum;
			var post_num = data.post_num;
			var resultBtn;
			var resultLike;

			if(cnt == 1) {
				if(type == 1) {
					resultBtn = '<button class="btn btn-warning" id="listBtn" type="button" onclick="likePost(\''+post_num+'\', \'2\')">' + 
					'<i class="fa fa-thumbs-o-down"></i>&nbsp;좋아요 취소' + 
					'</button>';
				} else if(type == 2) {
					resultBtn = '<button class="btn btn-info" id="listBtn" type="button" onclick="likePost(\''+post_num+'\', \'1\')">' + 
					'<i class="fa fa-thumbs-o-up"></i>&nbsp;좋아요' + 
					'</button>';
				}
			}
			resultLike = '&nbsp; ' + likeNum + '명이 좋아합니다.';
			$('#divLikeBtn').html(resultBtn);
			$('#likeNum').html(resultLike);

		},
		error : function(xhr) {
			alert("모임후기 좋아하기를 실패하였습니다.");
			alert("error html = " + xhr.statusText);
		}
	}); 
}


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

function deleteReply(postrep_num) {
	jQuery.ajax({
		type : "POST",
		url:"/moyeo/five/deletePostReply",
		async : true,
		dataType : "json",
		data:{				
			postrep_num : postrep_num
		},
		success : function(data) {
			var cnt = data.cnt;
			if(cnt == 1) {
				var postrep_num = data.postrep_num;
				$('#reply'+postrep_num).remove();
				alert('댓글이 삭제되었습니다.');
			} else {
				alert('댓글 삭제에 실패했습니다.\n확인바랍니다.');
			}
		},
		error : function(xhr) {
			alert("댓글등록에 실패하였습니다. 서버오류");
			alert("error html = " + xhr.statusText);
		}
	});
	return false;
}

//모임후기 댓글등록(엔터키로 입력)
function keycheck(event) {
	if(event.keyCode == 13) {
		addPostReply();
	}
}
//모임후기 댓글등록
function addPostReply() {
	
	if($('#reply_content').val() == ''){
		alert('내용을 입력해주세요.');
		return false;
	}
	
	jQuery.ajax({
		type : "POST",
		url:"/moyeo/five/addPostReply",
		async : true,
		dataType : "json",
		data:{				
			post_num : $('#post_num').val(),
			reply_content : $('#reply_content').val()
		},
		success : function(data) {
			var fullDate = toDate(data.dto.write_date);
			if(data.cnt == 1) {
				var msg = '<div class="messages messages-img" id="reply' + data.dto.postrep_num + '">' +
				'<div class="item item-visible">' +
				'<div class="image">' +
				'<img src="'+data.dto.propic_path+'/'+data.dto.propic_name+'" alt="훈남입니다.">' +
				'</div>' +                                
				'<div class="text">' +
				'<div class="heading">' + 
				'<a href="#">' + data.dto.mem_id + '</a>' +
				'<span class="date">' + fullDate + '</span>' +
				'<i class="time"></i>' +
				'<span style="margin-left:120px;">' +
            	'<a href="" onclick="return deleteReply('+data.dto.postrep_num+')"><i class="fa fa-trash-o"></i>삭제</a>' +
            	'</span>' +
				'</div>' +                                    
				data.dto.reply_content + 
				'</div>' +
				'</div>' +
				'</div>';
				$('#msgBox').append(msg);
				$('#reply_content').val('');
				$('#reply_content').focus();
				$('#msgBox').scrollTop($('#msgBox').prop('scrollHeight'));
			} else {
				alert('댓글 등록을 실패했습니다. \n잠시후 다시 시도해 주세요.');
			}

		},
		error : function(xhr) {
			alert("댓글등록에 실패하였습니다. 서버오류");
			alert("error html = " + xhr.statusText);
		}
	}); 
}

function deleteReply(postrep_num) {
	jQuery.ajax({
		type : "POST",
		url:"/moyeo/five/deletePostReply",
		async : true,
		dataType : "json",
		data:{				
			postrep_num : postrep_num
		},
		success : function(data) {
			var cnt = data.cnt;
			if(cnt == 1) {
				var postrep_num = data.postrep_num;
				$('#reply'+postrep_num).remove();
				alert('댓글이 삭제되었습니다.');
			} else {
				alert('댓글 삭제에 실패했습니다.\n확인바랍니다.');
			}
		},
		error : function(xhr) {
			alert("댓글삭제에 실패하였습니다. 서버오류");
			alert("error html = " + xhr.statusText);
		}
	});
	return false;
}

function delPicture(gal_num, type) {
	jQuery.ajax({
		type : "POST",
		url : "/moyeo/five/deletePicture",
		async : true,
		dataType : "json",
		data : {
			gal_num : gal_num,
			type : type
		},
		success : function(data) {
			var cnt = data.cnt;
			if(cnt == 1) {
				alert('정사적으로 삭제되었습니다.');
			} else {
				alert('삭제에 실패했습니다.\n 잠시후 다시 시도해 주시기 바랍니다.');
			}
		},
		error : function(xhr) {
			alert("삭제에 실패하였습니다. 서버오류");
			alert("error html = " + xhr.statusText);
		}
	});
}

