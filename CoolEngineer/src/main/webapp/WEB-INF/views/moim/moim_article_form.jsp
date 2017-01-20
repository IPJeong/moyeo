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
.body {

	overflow: scroll;
	height: 780px;
	width: 100%;
	top: 10px;
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
			<div class="panel-heading" style="padding-top: 10px;">
				<div class="panel-title-box">
					<h3>게시글 보기</h3>
				</div>
			</div>
			
			<div class="body" style="padding-top: 30px;">
				<div style="width: 870px; margin-left: 80px;">
					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								<td width="15%">아이디</td>
								<td width="60%">제목 : subject</td>
								<td width="25%" style="text-align: right;">조회수 : click |
									좋아요 : like</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="3" style="height: 300px;">3</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div style="width: 870px; margin-left: 80px;">
					<table class="table table-striped table-hover ">
						<tr>
							<td width="10%">아이디</td>
							<td width="5%">|</td>
							<td width="85%">댓글 내용</td>
						</tr>
					</table>

					<form class="form-horizontal">
						<fieldset>
							<div class="form-group">
								<div class="col-lg-10" style="width: 89%">
									<textarea class="form-control" rows="1" id="textArea"></textarea>
								</div>
								<div class="col-lg-10" style="width: 10%">
									<button type="submit" class="btn btn-primary"
										style="float: right;">댓글입력</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>
</div>
	<%@ include file="../etc/footer.jsp"%>