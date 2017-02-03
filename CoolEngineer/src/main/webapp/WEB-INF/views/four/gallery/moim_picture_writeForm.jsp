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
	overflow: scroll;
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
   <ul class="breadcrumb push-down-0">
      <li><a href="../main/main.jsp">Home</a></li>
      <li><a href="../category/category_hobby.jsp">모임</a></li>
      <li><a href="../moim/moim_main.jsp">중앙2팀</a></li>
      <li><a href="../moim/moim_main.jsp">모임공지 게시판</a></li>
      <li class="active">글쓰기</li>
   </ul>
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
						<h3>글쓰기</h3>
					</div>
				</div>
	
				<br> <br> <br> <br> <br> <br> <br>
				<div style="width: 60%; margin-left: 180px;">
					
				<!-- 폼 태그 시작 -->
					
					
					
					<form action="moim_picture_writePro" method="post" name="writeform" class="form-horizontal">
						
						<input type="hidden" name="pic_num" value="${pic_num}">
						
						<fieldset>
							<div class="form-group">
								<label for="" class="col-lg-2 control-label">아이디</label>
								<div class="col-lg-10">
									<h5>${sessionScope.mem_id}</h5>
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-lg-2 control-label">제목</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" name="title" id="subject" placeholder="">
								</div>
								
							</div>
						   <div class="form-group">
								<label for="" class="col-lg-2 control-label">첨부파일</label>
								<div class="col-lg-10">
									<button class="btn btn-default" type="submit">사진첨부</button>
									<button class="btn btn-default" type="submit">동영상첨부</button>
								</div>
							</div>
							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">내용</label>
								<div class="col-lg-10">
									<textarea class="form-control" name="content" rows="15" id="textArea"></textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<input type="submit" class="btn btn-primary" value="글작성">
									<button type="reset" class="btn btn-default">작성취소</button>
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