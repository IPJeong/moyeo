<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- META SECTION -->
<title>MoYeo-새로운 만남의 시작</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" href="/moyeo/resources/resource/favicon.ico"
	type="image/x-icon" />
<!-- END META SECTION -->

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme"
	href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->

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
	height: 780px;
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

<
style
>
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
	height: 780px;
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
</style>
</head>

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<!-- <script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script> -->
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<!-- <script type='text/javascript'
	src="/moyeo/resources/resource/js/plugins/icheck/icheck.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/scrolltotop/scrolltopcontrol.js"></script> -->

<!-- <script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/morris/raphael-min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/morris/morris.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/rickshaw/d3.v3.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/rickshaw/rickshaw.min.js"></script>
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/owl/owl.carousel.min.js"></script> -->

<!-- <script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/moment.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/daterangepicker/daterangepicker.js"></script> -->
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<!-- <script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/actions.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script> -->

<script type="text/javascript">
	function chk() {
		if (document.guestListSearch.search_name.value.trim() == '') {
			alert("공백은 검색할 수 없습니다.");
			return false;
		}
	}
</script>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->

<body class="x-dashboard">
	<!-- START PAGE CONTAINER -->

	<div class="page-container">

		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">

				<%@ include file="../../etc/header.jsp"%>

				<!-- START BREADCRUMB -->
				<ul class="breadcrumb push-down-0">
					<li><a href="../main/main.jsp">Home</a></li>

					<li class="active">Shop</li>
				</ul>
				<!-- END BREADCRUMB -->

				<!-- START ROW -->


				<!-- 모임 사이드바 시작 -->
				<div class="row">
					<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
						<!-- START LOGIN BLOCK -->

						<!-- 모임페이지 사이드바 시작 -->
						<%@include file="../../etc/shop_side.jsp"%>
						<!-- 모임페이지 사이드바 종료 -->

						<!-- START PHOTO BLOCK -->
						<div class="col-md-56" style="margin-top: 10px;">
							<div class="panel panel-default" style="height:870px; width:1200px;">
								<div class="content-frame-body content-frame-body-left">
									<div class="pull-right push-up-10">
									</div>

									<div class="gallery">
										<c:if test="${sessionScope.mem_id != null}">
											<div style="margin-left:68%;">
												<input class="btn btn-primary" value="판매자 등록" type="button" onclick="location.href='/moyeo/six/shop/sellerRegister'">
												<input class="btn btn-primary" value="제품 등록" type="button" onclick="location.href='productInsertForm'">
												
												<button type="button" class="btn btn-primary">제품 수정</button>
												<button type="button" class="btn btn-primary">제품 삭제</button>
											</div>
										</c:if>
										<div>
										<c:forEach var="dto" items="${dtos}" begin="0">
										<a class="gallery-item" style="width:300px; height:200px; margin:30px;"
											href="/moyeo/six/shop/productDetail?product_num=${dto.product_num}"
											title="Nature Image 1" data-gallery>
											
												<img
													src="${dto.pic_path}/${dto.pic_name}"
													style="width:300px; height:200px;" />
										
										
								
											
											<div class="meta">
												<strong>${dto.product_name}</strong> 
												<span>${dto.product_price}원</span>
											</div>
										</a>
										</c:forEach>
										</div>
									</div>							
								</div>
							<div class="row">
							<div class="col-md-12">
								<ul
									class="pagination pagination-sm pull-right push-down-10 push-up-10">
									<c:if test="${cnt > 0}">

									
										<!-- 처음[◀◀] 이전[◀]-->
										<c:if test="${startPage > pageBlock}">
											<li><a href="moyeoShop">«</a></li>
											<li><a href="moyeoShop?pageNum=${startPage - pageBlock}">‹</a></li>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<li class="active"><a href="#">${i}</a></li>
											</c:if>
											<c:if test="${i != currentPage}">
												<li><a href="moyeoShop?pageNum=${i}">${i}</a></li>
											</c:if>
										</c:forEach>

										<!-- 다음[▶] 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<li><a href="moyeoShop?pageNum=${startPage + pageBlock}">›</a></li>
											<li><a href="moyeoShop?pageNum=${pageCount}">»</a></li>
										</c:if>
									</c:if>
								</ul>
							</div>
						</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 
	-->
		<!-- END ROW -->
	</div>

	<%@ include file="../../etc/footer2.jsp"%>