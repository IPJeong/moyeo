<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="modModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- 제목을 입력하는 공간 -->
					제목 : <input type="text" id="mod_post_title">
				</div>
				<!-- 내용을 입력하는 공간 -->
				<div class="modal-body">
						<div>
							<!-- 후기내용이 삽입되는 부분 -->
							내용 : <input type="text" id="mod_post_content">					
						</div>
						<div>
							<!-- 태그내용이 삽입되는 부분 -->
							태그 : <input type="text" id="mod_post_tag">					
						</div>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
</body>
</html>