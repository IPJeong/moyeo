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
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- 제목을 입력하는 공간 -->
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<!-- 내용을 입력하는 공간 -->
				<div class="modal-body">
					<div style="float: left; width: 55%; height: 100%;">
						<div style="margin: 50px auto; height: 40%;" id="mainImg">
							<!-- 사진&동영상 데이터 입력창 -->
						</div>
						<div style="width:80%;" id="sliderDiv">
							<!-- 슬라이드 이미지가 삽입되는 부분 -->
						</div>
					</div>
					<div style="float: left; width: 30%; height: 100%;">
						<div style="margin-top: 10%; height: 250px;" id="post_content">
							<!-- 후기내용이 삽입되는 부분 -->							
						</div>
						<div style="margin-top: 10%; height: 250px;">
							<h2>댓글</h2>
							<p>댓글이 삽입되는 곳입니다.</p>
							<!-- 댓글이 삽입되는 부분 -->
						</div>
					</div>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>
</body>
</html>