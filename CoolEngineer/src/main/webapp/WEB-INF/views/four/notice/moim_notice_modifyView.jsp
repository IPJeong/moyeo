<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../../etc/moim_header.jsp"%>

<style>
@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features
		{
		width: 100%;
		background-color: #FBFBFB;
		padding: 0px 20px;
	}
}

@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open
		{
		display: block;
	}
}

@media (min-width: 1100px){
.col-md-56 {
    width: 60%;
    height: 870px;
}
}

.chart-holder {
	height: 100%;
}

.main {
	height: 100%;
}

.panel .panel-body {
	height: 100%;
	overflow: auto;
}

.col-md-25 {
	display: block;
}

li {
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}

@media (min-width: 992px){
.col-lg-2 {
    width: auto;
    }
}

</style>
<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="/moyeo/main/home">Home</a></li>
	<li><a href="/moyeo/six/category/category_hobby">모임</a></li>
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${open_dto.group_name}</a></li>
	<li class="active">모임공지 게시판</li>
</ul>
<!-- END BREADCRUMB -->
<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
	
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->

		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임공지 게시글 수정</h3>
					</div>
				</div>
	
				<br> <br> <br> <br> <br> <br> <br>
				<div style="width: 60%; margin-left: 180px;">
					
				<!-- 폼 태그 시작 -->
					
					
					
					<form action="moim_notice_modifypro" method="post" name="modifyform" class="form-horizontal">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<input type="hidden" name="group_noti_num" value="${num}">
						
						<fieldset>
							<div class="form-group">
								<label for="" class="col-lg-2 control-label">아이디</label>
								<div class="col-lg-10">
									<h5> ${sessionScope.mem_id} </h5>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-lg-2 control-label">제목</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" name="title" id="subject" placeholder="" value="${dto.group_noti_title}" required>
								</div>
								
							</div>
						<!-- 	<div class="form-group">
								<label for="" class="col-lg-2 control-label">첨부파일</label>
								<div class="col-lg-10">
									<button class="btn btn-default" type="submit">사진첨부</button>
									<button class="btn btn-default" type="submit">동영상첨부</button>
								</div>
							</div> -->
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">내용</label>
								<div class="col-lg-10">
									<textarea class="form-control" name="content" rows="15" id="textArea" required>${dto.group_noti_content}</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<input type="submit" class="btn btn-primary" value="수정">
									<input class="btn btn-default" type="button" value="목록보기"
				  				   onclick="window.location='moim_notice_board?=${pageNum}'">
								</div>
								
							</div>
						</fieldset>
					</form>
				<!-- 폼 태그 종료 -->
				</div>
			</div>
		</div>
	</div>
	<!-- END PHOTO BLOCK -->
</div>

<%@ include file="../../etc/footer.jsp"%>