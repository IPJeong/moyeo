<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../../etc/moim_header.jsp" %>

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

@media ( min-width : 1100px) {
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

.gallery .gallery-item {
	float: left;
	width: 25%;
	padding: 10px 5px 10px 5px;
	text-decoration: none;
}
</style>

<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="/moyeo/main/main">Home</a></li>
	<li><a href="/moyeo/category/category_hobby">모임</a></li>
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${open_dto.group_name}</a></li>
	<li class="active">모임동영상</li>
</ul>
<!-- END BREADCRUMB -->

<!-- START ROW -->
<div class="row">
	<!-- START PHOTO BLOCK -->
	<div class="col-md-50" style="margin-top: 10px;">
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->
	
		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>동영상보기</h3>
					</div>
				</div>
				<div class="content-frame-body content-frame-body-left">
					<div class="gallery" id="links">
						<c:forEach var="videoDto" items="${videoDtos}">
							<a class="gallery-item" href="${videoDto.video_path}/${videoDto.video_name}">
								<div>
									<video height="250px" width="100%" alt="Nature Image 1" controls>
										<source src="${videoDto.video_path}/${videoDto.video_name}">
									</video>
								</div>
								<div class="meta">
									<strong>Nature image 1</strong> <span>Description</span>
								</div>
							</a>
						</c:forEach>	
					</div>
					<ul
						class="pagination pagination-sm pull-right push-down-20 push-up-20">
						<li class="disabled"><a href="#">≪</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">≫</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- END PHOTO BLOCK -->
	</div>
</div>
<!-- END ROW -->

<%@ include file="../../etc/footer.jsp"%>