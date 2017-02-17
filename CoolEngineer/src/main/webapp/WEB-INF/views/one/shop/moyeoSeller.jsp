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
						<div>
						<c:if test="${recognition == '06'}">
						<%@include file="../../etc/shop_seller_side.jsp"%>
						<!-- 모임페이지 사이드바 종료 -->
						</c:if>
						
						<c:if test="${recognition == '15' || recognition == '91' || recognition eq null}">
						<%@include file="../../etc/shop_seller_side2.jsp"%>
						<!-- 모임페이지 사이드바 종료 -->
						</c:if>
						<!-- START PHOTO BLOCK -->
						
						</div>
					</div>
					<br><br><br>
					<div style="width:100%">
					<div class="col-md-22" style="width:27%; height:380px;">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box" >
									<h3>판매자등록</h3>
								</div>
							</div>
							<div class="panel-body padding-0">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/seller2.jpg"
									style="width: 483px; height: 235px;"> <br>
								<br>
								<br>
								<br>
								<div style="margin-left: 35%; margin-top: 5%">
									<div>
										<c:if test="${recognition == '06'}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='/moyeo/six/shop/sellerRegister'" disabled="disabled">
												<font size="3px;">판매자등록</font>
											 </button></span>
										</c:if>
										
										<c:if test="${recognition == '15' || recognition eq null}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='/moyeo/six/shop/sellerRegister'">
												<font size="3px;">판매자등록</font>
											 </button></span>
										</c:if>
										
										<c:if test="${recognition == '91'}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='/moyeo/six/shop/sellerRegister'">
												<font size="3px;">판매자등록</font>
											 </button></span>
										</c:if>
									</div>
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-22" style="width:27%; height:380px;">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<h3>제품등록</h3>
								</div>
							</div>
							<div class="panel-body padding-0">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/product.png"
									style="width: 483px; height: 235px;"> <br>
								<br>
								<br>
								<br>
								<div style="margin-left: 35%; margin-top: 5%">
									<div>
										<c:if test="${recognition == '06'}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='/moyeo/one/productInsertForm'">
												<font size="3px;">제품등록</font>
											 </button></span>
										</c:if>
										
										<c:if test="${recognition == '15' || recognition eq null}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='/moyeo/one/productInsertForm'" disabled="disabled">
												<font size="3px;">제품등록</font>
											 </button></span>
										</c:if>
										
										<c:if test="${recognition == '91'}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='/moyeo/one/productInsertForm'" disabled="disabled">
												<font size="3px;">제품등록</font>
											 </button></span>
										</c:if>
									</div>
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-22" style="width:27%; height:380px; margin-top:50px;">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<h3>제품관리</h3>
								</div>
							</div>
							<div class="panel-body padding-0">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/adjust3.jpg"
									style="width:483px; height:235px;"> <br>
								<br>
								<br>
								<br>
								<div style="margin-left: 35%; margin-top: 5%">
									<div>
										<c:if test="${recognition == '06'}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='productManage?seller_id=${seller_id}'">
												<font size="3px;">제품관리</font>
											 </button></span>
										</c:if>
											
										<c:if test="${recognition == '15' || recognition eq null }">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" disabled="disabled">
												<font size="3px;">제품수정</font>
											 </button></span>
										</c:if>
										
										<c:if test="${recognition == '91'}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='#''" disabled="disabled">
												<font size="3px;">제품수정</font>
											 </button></span>
										</c:if>
										
									</div>
									
									
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-md-22" style="width:27%; height:380px; margin-top:50px;">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<h3>재고관리</h3>
								</div>
							</div>
							<div class="panel-body padding-0">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/stock.png"
									style="width: 483px; height: 235px;"> <br>
								<br>
								<br>
								<br>
								<div style="margin-left: 35%; margin-top: 5%">
									<div>
										<c:if test="${recognition == '06'}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼">
												<font size="3px;">재고관리</font>
											 </button></span>
										</c:if>
										
										<c:if test="${recognition == '15' || recognition eq null}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='#''" disabled="disabled">
												<font size="3px;">재고관리</font>
											 </button></span>
										</c:if>
										
										<c:if test="${recognition == '91'}">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼" onclick="window.location='#''" disabled="disabled">
												<font size="3px;">재고관리</font>
											 </button></span>
										</c:if>
									</div>
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
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