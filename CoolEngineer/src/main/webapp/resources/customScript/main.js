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
			
			var title = '<a href="/moyeo/five/postDetailView?group_num=' + data.postDto.group_num + '&post_num=' + data.postDto.post_num + '&search=dsearch"><h2><strong>' + data.postDto.post_title + '</strong></h2>';
			var content = '<h3>' + data.postDto.post_content + '</h3>';
			var tags = '';
			
			// 모임후기 제목 삽입
			$('#titleForm').html(title);
			// 모임후기 내용 삽입
			$('#contentForm').html(content);
			
			if(data.postDto.post_tags != null ) {
				// 사진데이터 삽입
				jQuery.each(data.postDto.post_tags,
						function(idx, post_tags) {
					tags += '<li><a href="#"><span class="fa fa-tag" style="color:#23527c;"></span><font color="#23527c" size="4px" style="font-weight: bold;">' + post_tags + '</font></a></li>';
				});
				// 모임후기 태그 삽입
				$('#listTags').html(tags);
			} else {
				$('#listTags').html('');
			}
			
			
			
			
		},
		error : function(xhr) {
			alert("모임후기 불러오기에 실패하였습니다. 서버오류");
			alert("error html = " + xhr.statusText);
		}
	});
	
}