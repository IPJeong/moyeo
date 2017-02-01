
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
	var vedios = ['mpg', 'mpeg', 'mpe', 'wmv', 'asf', 'asx', 'flv', 'rm', 'mov', 'dat', 'avi', 'mp4'];
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

// 메인이미지 변경
function changeMainImg(fullPath) {
	var tag = '<img style="margin-left: 50px; margin-top:50px; width: 400px; height: 400px;" src="' + fullPath + '">';
	$('#mainImg').html(tag);
}

// 메인동영상 변경
function changeMainVideo(fullPath) {
	var tag = '<video style="margin-left: 50px; margin-top:50px; width: 400px; height: 400px;" controls>' +
			  '<source src="' + fullPath + '">' +  
			  '</video>';
	$('#mainImg').html(tag);
}

// 모임후기 수정
function modPost(num) {
	alert('실행');
	jQuery.ajax({
		type : "POST",
		url:"/moyeo/five/modifyPost",
		async : true,
		dataType : "json",
		data:{				
			post_num : num				
		},
		success : function(data) {
			$('#mod_post_title').val(data.postDto.post_title);
			$('#mod_post_content').val(data.postDto.post_content);
			$('#mod_post_tag').val(data.postDto.post_tag);
		},
		error : function(xhr) {
			alert("정보조회에 실패하였습니다.");
			alert("error html = " + xhr.statusText);
		}
	}); 
}

// 모임후기 삭제
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

// 모임후기 좋아요
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

//모임후기 댓글등록
function addPostReply() {
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
			
			if(data.cnt == 1) {
				var msg = '<div class="messages messages-img">' +
						   '<div class="item item-visible">' +
						   '<div class="image">' +
						   '<img src="assets/images/users/user.jpg" alt="Dmitry Ivaniuk">' +
						   '</div>' +                                
						   '<div class="text">' +
						   '<div class="heading">' + 
						   '<a href="#">Dmitry Ivaniuk</a>' +
						   '<span class="date">'+data.dto.write_date+'</span>' +
						   '<i class="date">08:39</i>' +
						   '</div>' +                                    
						     data.dto.reply_content + 
						   '</div>' +
						   '</div>' +
						   '</div>';
				$('#msgBox').append(msg);
				$('#replyText').val('');
				$('#replyText').focus();
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

// 모임후기 댓글등록(엔터키로 입력)
function keycheck(event) {
	if(event.keyCode == 13) {
		addPostReply();
	}
}

