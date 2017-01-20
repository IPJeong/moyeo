<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<%@ include file="../etc/moim_header.jsp"%>

<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
		

	<!-- 모임페이지 사이드바 시작 -->
	<%@include file="../etc/moim_side.jsp" %>
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
				<form class="form-horizontal">
					<fieldset>
						<div class="form-group">
							<label for="" class="col-lg-2 control-label">아이디</label>
							<div class="col-lg-10">
								<h5>받아온 아이디값</h5>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-lg-2 control-label">제목</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="inputEmail"
									placeholder="">
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
							<label for="textArea" class="col-lg-2 control-label">Textarea</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="15" id="textArea"></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-default">Cancel</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>

		</div>
	</div>
</div>

<%@ include file="../etc/footer.jsp"%>