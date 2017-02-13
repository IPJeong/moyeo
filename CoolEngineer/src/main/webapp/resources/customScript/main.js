// 모임후기 상세정보 조회
function getPostDetails(post_num) {
	
	jQuery.ajax({
		type : "POST",
		url : "/moyeo/main/main_postDetail",
		async : true,
		dataType : "json",
		data : {
			post_num : post_num
		},
		success : function(data) {
			
			var title = data.postDto.post_title;
			var content = data.postDto.post_content;
			var tags;
			
//			// 사진데이터 삽입
//			jQuery.each(data.postDto.post_tags,
//					function(idx, post_tags){
//				tags += '<li><a href="#"><span class="fa fa-tag"></span>' + post_tags[idx] + '</a></li>';
//			});
			
			// 모임후기 제목 삽입
			$('#titleForm').html(title);
			// 모임후기 내용 삽입
			$('#contentForm').html(content);
			// 모임후기 태그 삽입
//			$('#listTags').html(tags);
			
		},
		error : function(xhr) {
			alert("모임후기 불러오기에 실패하였습니다. 서버오류");
			alert("error html = " + xhr.statusText);
		}
	});
	
}