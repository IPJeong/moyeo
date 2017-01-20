<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../etc/moim_header.jsp"%>

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

.gallery .gallery-item {
	float: left;
	width: 25%;
	padding: 10px 5px 10px 5px;
	text-decoration: none;
}
</style>

<!-- START BREADCRUMB -->
  <ul class="breadcrumb push-down-0">
      <li><a href="../main/main.jsp">Home</a></li>
      <li><a href="../category/category_hobby.jsp">모임</a></li>
      <li><a href="../moim/moim_main.jsp">영등포 볼링</a></li>
      <li class="active">모임갤러리</li>
  </ul>
<!-- END BREADCRUMB -->  

<!-- START ROW -->
<div class="row">
	<!-- 모임페이지 사이드바 시작 -->
	<%@include file="../etc/moim_side.jsp" %>
	<!-- 모임페이지 사이드바 종료 -->	

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top: 10px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>사진보기</h3>
				</div>
			</div>
			<div class="panel-body padding-0"
				style="text-align: center; font-size: 25px">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 10px; width: 99%">

					<div class="content-frame-body content-frame-body-left">

						<div class="gallery" id="links">

							<a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/nature-1.jpg"
								title="Nature Image 1" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/nature-1.jpg"
										alt="Nature Image 1" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Nature image 1</strong> <span>Description</span>
								</div>
							</a> <a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/music-1.jpg"
								title="Music picture 1" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/music-1.jpg"
										alt="Music picture 1" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Music picture 1</strong> <span>Other description</span>
								</div>
							</a> <a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/girls-1.jpg"
								title="Girls Image 1" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/girls-1.jpg"
										alt="Girls Image 1" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Girls image 1</strong> <span>Description</span>
								</div>
							</a> <a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/nature-2.jpg"
								title="Nature Image 2" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/nature-2.jpg"
										alt="Nature Image 2" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Nature image 2</strong> <span>Description</span>
								</div>
							</a> <a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/space-1.jpg"
								title="Space picture 1" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/space-1.jpg"
										alt="Space picture 1" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Space picture 1</strong> <span>Other description</span>
								</div>
							</a> <a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/music-2.jpg"
								title="Music picture 2" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/music-2.jpg"
										alt="Music picture 2" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Music picture 2</strong> <span>Other description</span>
								</div>
							</a> <a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/nature-3.jpg"
								title="Nature Image 3" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/nature-3.jpg"
										alt="Nature Image 3" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Nature image 3</strong> <span>Description</span>
								</div>
							</a> <a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/girls-2.jpg"
								title="Girls Image 2" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/girls-2.jpg"
										alt="Girls Image 2" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Girls image 2</strong> <span>Description</span>
								</div>
							</a> <a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/girls-2.jpg"
								title="Girls Image 2" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/girls-2.jpg"
										alt="Girls Image 2" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Girls image 2</strong> <span>Description</span>
								</div>
							</a> <a class="gallery-item"
								href="../../../resources/resource/assets/images/gallery/girls-2.jpg"
								title="Girls Image 2" data-gallery>
								<div class="image">
									<img src="../../../resources/resource/assets/images/gallery/girls-2.jpg"
										alt="Girls Image 2" width="300px" height="200px" />
									<ul class="gallery-item-controls">
										<li><label class="check"><input type="checkbox"
												class="icheckbox" /></label></li>
										<li><span class="gallery-item-remove"><i
												class="fa fa-times"></i></span></li>
									</ul>
								</div>
								<div class="meta">
									<strong>Girls image 2</strong> <span>Description</span>
								</div>
							</a>
						</div>
						<div>
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
			</div>
		</div>
	</div>

	<!-- END PHOTO BLOCK -->
</div>
<!-- END ROW -->

<%@ include file="../etc/footer.jsp"%>