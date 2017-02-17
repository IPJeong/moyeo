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
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>Shop</h3>
									</div>
								</div>
								<div class="" style="height:830px; width:1200px; overflow:auto; ">
									<!-- 본문입력 -->
									
									
									
									
									
<script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="./js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="./js/jquery.simpletip-1.3.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.selectBox.min.js"></script>
<script type="text/javascript" src="./js/jcarousellite_1.0.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.banner.js"></script>
<script type="text/javascript" src="./js/shop.js"></script>
<script type="text/javascript" src="./js/showwindow.js"></script>
<script type="text/javascript" src="./js/showwindow2.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="./js/DD_belatedPNG_0.0.8a-min.js"></script>
<![endif]-->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('29856bc78cbfb5ed4f80bc189cb01054');
	function kakaoLink() {

		var label = "";
		var label_subject = $('meta[property="og:subject"]').attr('content');
		var label_url = $('meta[property="og:url"]').attr('content');

		if (label_subject) {
			label += label_subject;
		}
		if (label_url) {
			label += "\n" + label_url;
		}

		Kakao.Link.sendTalkLink({
			label : label,
		});

	}
</script>
</head>
<body>
	<style type="text/css">
body {
	background-color: #ffffff;
}

.layout_top {
	width: 1000px;
	margin: 0 auto;
}

.layout_left {
	float: left;
	width: 200px;
}

.layout_contents {
	width: 1000px;
	margin: 0 auto;
}

.layout_contents:after {
	display: block;
	clear: both;
	content: '';
}

.layout_main {
	float: left;
	width: 99%;
	margin-left: 10px;
}

.layout_bottom {
	position: relative;
	width: 1000px;
	margin: 0 auto;
}
</style>



		<div class="layout_main">

			<script type="text/javascript">
				$('.layout_top_bg').css({
					'height' : $('.layout_top').height() + 'px'
				});
			</script>
			<style type="text/css">
/* 분류 */
.order_position .home {
	line-height: 14px;
	font-size: 11px;
	color: #9e9e9e;
	font-family: gulim, 굴림;
}

.order_position .off {
	line-height: 14px;
	font-size: 11px;
	color: #9e9e9e;
	font-family: gulim, 굴림;
}

.order_top .bg {
	height: 79px;
	background: url('/moyeo/resources/resource/img/shop/top_bg.gif') repeat-x;
}

.order_title .bg1 {
	width: 2px;
	height: 30px;
	background: url('/moyeo/resources/resource/img/shop/title_bg1.gif') no-repeat;
}

.order_title .bg2 {
	height: 30px;
	background: url('/moyeo/resources/resource/img/shop/title_bg2.gif') repeat-x;
}

.order_title .bg3 {
	width: 2px;
	background: url('/moyeo/resources/resource/img/shop/title_bg3.gif') no-repeat;
}

.order_bank .t1 {
	font-weight: bold;
	line-height: 15px;
	font-size: 13px;
	color: #000000;
	font-family: gulim, 굴림;
}

.order_bank .t2 {
	font-weight: bold;
	line-height: 15px;
	font-size: 13px;
	color: #cc1414;
	font-family: gulim, 굴림;
}

.order_bank .t3 {
	line-height: 14px;
	font-size: 11px;
	color: #000000;
	font-family: dotum, 돋움;
}

.order_bank .t4 {
	line-height: 16px;
	font-size: 11px;
	color: #f26c4f;
	font-family: dotum, 돋움;
}

.order_bank a.t5 {
	line-height: 14px;
	font-size: 11px;
	color: #9e9e9e;
	font-family: gulim, 굴림;
}

.order_bank a.t5:hover {
	line-height: 14px;
	font-size: 11px;
	color: #787878;
	font-family: gulim, 굴림;
}

.order_bank .sms_bg {
	width: 164px;
	height: 154px;
	background: url('/moyeo/resources/resource/img/shop/sms_bg.gif') no-repeat;
}

.order_bank .sms_bg textarea {
	overflow: hidden;
	width: 100px;
	height: 88px;
	border: 0px;
	margin: auto;
	background-color: #d9f3ff;
	text-align: left;
}

.order_bank .sms_bg textarea {
	line-height: 14px;
	font-size: 12px;
	color: #000000;
	font-family: gulim, 굴림;
}

.order_bank .sms_bg .sms1 {
	line-height: 14px;
	font-size: 12px;
	color: #709bae;
	font-family: dotum, 돋움;
}

.order_bank .sms_bg .sms2 {
	line-height: 14px;
	font-size: 12px;
	color: #709bae;
	font-family: dotum, 돋움;
	letter-spacing: -1px;
}

.order_bank .input {
	width: 102px;
	height: 17px;
	border: 1px solid #c9c9c9;
	padding: 1px 3px 0px 3px;
}

.order_bank .input {
	line-height: 17px;
	font-size: 12px;
	color: #000000;
	font-family: dotum, 돋움;
}

.order_bank .help {
	line-height: 14px;
	font-size: 11px;
	color: #9e9e9e;
	font-family: dotum, 돋움;
}

.order_list .title {
	line-height: 16px;
	font-size: 12px;
	color: #000000;
	font-family: dotum, 돋움;
}

.order_list .option {
	line-height: 16px;
	font-size: 11px;
	color: #8b49c7;
	font-family: dotum, 돋움;
}

.order_list .money {
	line-height: 16px;
	font-size: 12px;
	color: #000000;
	font-family: dotum, 돋움;
}

.order_list .delivery1 {
	line-height: 18px;
	font-size: 11px;
	color: #959595;
	font-family: dotum, 돋움;
}

.order_list .delivery2 {
	line-height: 18px;
	font-size: 12px;
	color: #000000;
	font-family: dotum, 돋움;
}

.order_list .limit {
	line-height: 16px;
	font-size: 12px;
	color: #555555;
	font-family: dotum, 돋움;
}

.order_list .coupon {
	line-height: 16px;
	font-size: 12px;
	color: #000000;
	font-family: dotum, 돋움;
}

.order_list .coupon_msg {
	line-height: 16px;
	font-size: 12px;
	color: #fe6e1a;
	font-family: dotum, 돋움;
}

.order_list .total {
	font-weight: bold;
	line-height: 16px;
	font-size: 12px;
	color: #000000;
	font-family: dotum, 돋움;
}

.order_list .line_w {
	height: 1px;
	background-color: #d6d6d6;
}

.order_list .line_h {
	width: 1px;
	background-color: #efefef;
}

.order_bank_title .bg {
	height: 35px;
	background: url('/moyeo/resources/resource/img/shop/title_bg.gif') repeat-x;
}

.order_addr_title .bg {
	height: 35px;
	background: url('/moyeo/resources/resource/img/shop/title_bg.gif') repeat-x;
}

.order_pay_title .bg {
	height: 35px;
	background: url('/moyeo/resources/resource/img/shop/title_bg.gif') repeat-x;
}

.order_addr .text {
	line-height: 19px;
	font-size: 12px;
	color: #787878;
	font-family: dotum, 돋움;
}

.order_pay .pay_bg {
	width: 250px;
	height: 50px;
	background: url('/moyeo/resources/resource/img/shop/pay_bg.gif') no-repeat;
}

.order_pay .money {
	font-weight: bold;
	line-height: 28px;
	font-size: 26px;
	color: #ffffff;
	font-family: Tahoma, dotum, gulim;
}

.order_pay .title {
	line-height: 14px;
	font-size: 12px;
	color: #727272;
	font-family: dotum, 돋움;
}

.order_pay .title2 {
	line-height: 14px;
	font-size: 12px;
	color: #000000;
	font-family: dotum, 돋움;
}

.order_pay .m1 {
	font-weight: bold;
	line-height: 14px;
	font-size: 12px;
	color: #727272;
	font-family: dotum, 돋움;
}

.order_pay .m2 {
	line-height: 14px;
	font-size: 12px;
	color: #727272;
	font-family: dotum, 돋움;
}

.order_pay .m3 {
	line-height: 14px;
	font-size: 12px;
	color: #fe6e1a;
	font-family: dotum, 돋움;
}

.order_pay .m4 {
	font-weight: bold;
	line-height: 14px;
	font-size: 12px;
	color: #006aff;
	font-family: dotum, 돋움;
}

.order_help .title {
	line-height: 14px;
	font-size: 11px;
	color: #9e9e9e;
	font-family: dotum, 돋움;
}
</style>

			<script type="text/javascript" src="/moyeo/resources/resource/img/shop/order.js"></script>

			<div id="order_ok_update" style="display: none;"></div>

			<div style="border: 1px solid #efefef; background-color: #f7f7f7;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="order_position">
					<tbody>
						<tr height="30">
							<td width="10"></td>
							<td>
								<table border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td><a href="" class="home">홈</a></td>
											<td width="20" align="center"><img
												src="/moyeo/resources/resource/img/shop/arrow.gif" class="up1"></td>
											<td><span class="off">주문결과 확인</span></td>
										</tr>
									</tbody>
								</table>
							</td>
							<td width="10"></td>
						</tr>
					</tbody>
				</table>
			</div>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr height="10">
						<td></td>
					</tr>
				</tbody>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="order_top">
				<tbody>
					<tr>
						<td width="4"><img
							src="/moyeo/resources/resource/img/shop/top_bg_side1.gif"></td>
						<td width="599"><img
							src="/moyeo/resources/resource/img/shop/top_bg_title2.gif"></td>
						<td class="bg none">&nbsp;</td>
						<td width="4"><img
							src="/moyeo/resources/resource/img/shop/top_bg_side2.gif"></td>
					</tr>
				</tbody>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr height="50">
						<td></td>
					</tr>
				</tbody>
			</table>

			<table border="0" cellspacing="0" cellpadding="0" class="auto" align="center">
				<tbody>
					<tr>
						<td><img src="/moyeo/resources/resource/img/shop/order_msg5.gif"></td>
					</tr>
				</tbody>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr height="50">
						<td></td>
					</tr>
				</tbody>
			</table>

			<div style="height:1px; background:#efefef;" class="none">&nbsp;</div>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr height="10">
						<td></td>
					</tr>
				</tbody>
			</table>

			<!-- 무통장/가상계좌 start //-->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="order_bank_title">
				<tbody>
					<tr>
						<td width="5"><img
							src="/moyeo/resources/resource/img/shop/title_side1.gif"></td>
						<td class="bg" align="center"><img
							src="/moyeo/resources/resource/img/shop/title_bank_5.gif"></td>
						<td width="5"><img
							src="/moyeo/resources/resource/img/shop/title_side2.gif"></td>
					</tr>
				</tbody>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="order_bank">
				<tbody>
					<tr>
						<td width="1" bgcolor="#d6d6d6"></td>
						<td valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td width="30"></td>
										<td valign="top">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="30">
														<td></td>
													</tr>
												</tbody>
											</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td width="10"><img
															src="/moyeo/resources/resource/img/shop/arrow4.gif"></td>
														<td width="100"><img
															src="/moyeo/resources/resource/img/shop/order_bank_name.gif"></td>
														<td class="t1">신한은행</td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>


											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td width="10"><img
															src="/moyeo/resources/resource/img/shop/arrow4.gif"></td>
														<td width="100"><img
															src="/moyeo/resources/resource/img/shop/order_bank_code.gif"></td>
														<td class="t1">752-436-739113</td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td width="10"><img
															src="/moyeo/resources/resource/img/shop/arrow4.gif"></td>
														<td width="100"><img
															src="/moyeo/resources/resource/img/shop/order_bank_holder.gif"></td>
														<td class="t1">양우진</td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td width="10"><img
															src="/moyeo/resources/resource/img/shop/arrow4.gif"></td>
														<td width="100"><img
															src="/moyeo/resources/resource/img/shop/order_dep_name2.gif"></td>
														<td class="t1">김대식</td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="1" bgcolor="#ebebeb">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td width="10"><img
															src="/moyeo/resources/resource/img/shop/arrow4.gif"></td>
														<td width="100"><img
															src="/moyeo/resources/resource/img/shop/order_bank_pay_money.gif"></td>
														<td class="t2">3,500 원</td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td></td>
													</tr>
												</tbody>
											</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="20">
														<td></td>
													</tr>
												</tbody>
											</table>


											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="10">
														<td width="10"></td>
														<td class="t4">5일 이내, 미 입금시 본 주문건은 자동으로 취소 됩니다.</td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="30"></td>
									</tr>
								</tbody>
							</table>

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr height="45">
										<td></td>
									</tr>
								</tbody>
							</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td height="20" bgcolor="#f7f7f7" class="none">&nbsp;</td>
									</tr>
								</tbody>
							</table>

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr bgcolor="#f7f7f7">
										<td width="50"></td>
										<td valign="top">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td><img
															src="/moyeo/resources/resource/img/shop/internet_bank.gif"></td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="20"></td>
										<td width="1" bgcolor="#d9d9d9"></td>
										<td width="20"></td>
										<td valign="top">
											<table border="0" cellspacing="0" cellpadding="0">
												<tbody>
													<tr>
														<td width="100"><a href="http://www.kbstar.com/"
															target="_blank" class="t5">KB국민은행</a></td>
														<td width="100"><a href="http://www.hanabank.com/"
															target="_blank" class="t5">하나은행</a></td>
														<td width="100"><a href="http://www.nonghyup.com/"
															target="_blank" class="t5">농협</a></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="3">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table border="0" cellspacing="0" cellpadding="0">
												<tbody>
													<tr>
														<td width="100"><a href="http://www.wooribank.com/"
															target="_blank" class="t5">우리은행</a></td>
														<td width="100"><a href="http://www.keb.co.kr/"
															target="_blank" class="t5">외환은행</a></td>
														<td width="100"><a href="http://www.kfcc.co.kr/"
															target="_blank" class="t5">새마을금고</a></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="3">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table border="0" cellspacing="0" cellpadding="0">
												<tbody>
													<tr>
														<td width="100"><a href="http://www.shinhan.com/"
															target="_blank" class="t5">신한은행</a></td>
														<td width="100"><a href="http://www.scfirstbank.com/"
															target="_blank" class="t5">SC제일은행</a></td>
														<td width="100"><a href="http://www.epostbank.go.kr/"
															target="_blank" class="t5">우체국</a></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="3">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table border="0" cellspacing="0" cellpadding="0">
												<tbody>
													<tr>
														<td width="100"><a href="http://www.ibk.co.kr/"
															target="_blank" class="t5">기업은행</a></td>
														<td width="100"><a href="http://www.citibank.co.kr/"
															target="_blank" class="t5">씨티은행</a></td>
														<td width="100"><a href="http://www.kdb.co.kr/"
															target="_blank" class="t5">산업은행</a></td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td height="20" bgcolor="#f7f7f7" class="none">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td width="1" bgcolor="#d6d6d6"></td>
					</tr>
				</tbody>
			</table>

			<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

			<!-- 무통장/가상계좌 end //-->

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr height="10">
						<td></td>
					</tr>
				</tbody>
			</table>

			<!-- 타이틀 start //-->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="order_title">
				<tbody>
					<tr>
						<td class="bg1"></td>
						<td class="bg2">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr height="30">
										<td width="6"></td>
										<td align="center"><img
											src="/moyeo/resources/resource/img/shop/title_item2.gif"></td>
										<td width="1"></td>
										<td width="60" align="center"><img
											src="/moyeo/resources/resource/img/shop/title_limit.gif"></td>
										<td width="1"></td>
										<td width="90" align="center"><img
											src="/moyeo/resources/resource/img/shop/title_money.gif"></td>
										<td width="1"></td>
										<td width="90" align="center"><img
											src="/moyeo/resources/resource/img/shop/title_coupon.gif"></td>
										<td width="1"></td>
										<td width="90" align="center"><img
											src="/moyeo/resources/resource/img/shop/title_total.gif"></td>
										<td width="1"></td>
										<td width="90" align="center"><img
											src="/moyeo/resources/resource/img/shop/title_delivery.gif"></td>
									</tr>
								</tbody>
							</table>
						</td>
						<td class="bg3"></td>
					</tr>
				</tbody>
			</table>
			<!-- 타이틀 end //-->

			<!-- 리스트 start //-->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="order_list">
				<colgroup>
					<col width="6">
					<col width="">
					<col width="1">
					<col width="60">
					<col width="1">
					<col width="110">
					<col width="1">
					<col width="90">
					<col width="1">
					<col width="90">
					<col width="1">
					<col width="90">
				</colgroup>
				<tbody>
					<tr>
						<td></td>
						<td valign="top" style="padding: 15px 0 15px 0;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td width="84" valign="top"><div
												style="border: 1px solid #e0e0e0;">
												<a href="http://dmshop.kr/item.php?id=Y848100408"><img
													src="./data/thumb/item/82x82/1935647224_bcb14092_IMG_1674.jpg"
													width="82" height="82" border="0"></a>
											</div></td>
										<td width="15"></td>
										<td>
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td><a href="http://dmshop.kr/item.php?id=Y848100408"
															class="title">소품 (갤러리 학습)</a></td>
													</tr>
												</tbody>
											</table>


											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr height="8">
														<td></td>
													</tr>
												</tbody>
											</table>

											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td><a href="http://dmshop.kr/item.php?id=Y848100408"
															target="_blank"><img
																src="/moyeo/resources/resource/img/shop/blank.gif" border="0"></a></td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="20"></td>
									</tr>
								</tbody>
							</table>
						</td>
						<td class="line_h"></td>
						<td class="limit" align="center">1</td>
						<td class="line_h"></td>
						<td class="money" align="center">1,000 원</td>
						<td class="line_h"></td>
						<td align="center">
							<table border="0" cellspacing="0" cellpadding="0" class="auto">
								<tbody>
									<tr>
										<td class="coupon">없음</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td class="line_h"></td>
						<td class="total" align="center">3,500 원</td>
						<td class="line_h"></td>
						<td class="money" align="center"><span class="delivery2">2,500
								원<br>묶음배송불가
						</span></td>
					</tr>
					<tr>
						<td colspan="12" class="line_w"></td>
					</tr>
				</tbody>
			</table>
			<!-- 리스트 end //-->

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr height="10">
						<td></td>
					</tr>
				</tbody>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td valign="top">
							<!-- 배송지정보 start //-->
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="order_addr_title">
								<tbody>
									<tr>
										<td width="5"><img
											src="/moyeo/resources/resource/img/shop/title_side1.gif"></td>
										<td class="bg" align="center"><img
											src="/moyeo/resources/resource/img/shop/title_rec.gif"></td>
										<td width="5"><img
											src="/moyeo/resources/resource/img/shop/title_side2.gif"></td>
									</tr>
								</tbody>
							</table>

							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="order_addr">
								<tbody>
									<tr height="310">
										<td width="1" bgcolor="#d6d6d6"></td>
										<td valign="top">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td width="30"></td>
														<td valign="top">
															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="30">
																		<td></td>
																	</tr>
																</tbody>
															</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>


															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr>
																		<td width="10"><img
																			src="/moyeo/resources/resource/img/shop/arrow4.gif"></td>
																		<td width="100"><img
																			src="/moyeo/resources/resource/img/shop/order_rec_name.gif"></td>
																		<td class="text">김대식</td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>


															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr>
																		<td width="10"><img
																			src="/moyeo/resources/resource/img/shop/arrow4.gif"></td>
																		<td width="100"><img
																			src="/moyeo/resources/resource/img/shop/order_addr.gif"></td>
																		<td class="text">(우:04991)서울특별시 광진구 능동로 210 (7호선
																			어린이대공원역)<br>102
																		</td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>


															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr>
																		<td width="10"><img
																			src="/moyeo/resources/resource/img/shop/arrow4.gif"></td>
																		<td width="100"><img
																			src="/moyeo/resources/resource/img/shop/order_mobile.gif"></td>
																		<td class="text">010-123-1231 / 031-123-123</td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>


															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr>
																		<td width="10"><img
																			src="/moyeo/resources/resource/img/shop/arrow4.gif"></td>
																		<td width="100"><img
																			src="/moyeo/resources/resource/img/shop/order_memo.gif"></td>
																		<td class="text"></td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

			<div style="height:1px; background:#ebebeb;" class="none">&nbsp;</div>


															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="30">
																		<td></td>
																	</tr>
																</tbody>
															</table>
														</td>
														<td width="30"></td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="1" bgcolor="#d6d6d6"></td>
									</tr>
								</tbody>
							</table>

			<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

						</td>
						<td width="2"></td>
						<td width="314" valign="top">
							<!-- 결제정보 start //-->
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="order_pay_title">
								<tbody>
									<tr>
										<td width="5"><img
											src="/moyeo/resources/resource/img/shop/title_side1.gif"></td>
										<td class="bg" align="center"><img
											src="/moyeo/resources/resource/img/shop/title_payment.gif"></td>
										<td width="5"><img
											src="/moyeo/resources/resource/img/shop/title_side2.gif"></td>
									</tr>
								</tbody>
							</table>

							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="order_pay">
								<tbody>
									<tr height="310">
										<td width="1" bgcolor="#d6d6d6"></td>
										<td valign="top">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tbody>
													<tr>
														<td width="32"></td>
														<td valign="top">
															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="30">
																		<td></td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr>
																		<td><img
																			src="/moyeo/resources/resource/img/shop/title_money_ok.gif"></td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

															<table width="250" border="0" cellspacing="0"
																cellpadding="0" class="pay_bg">
																<tbody>
																	<tr>
																		<td align="center"><span class="money">3,500
																				원</span></td>
																	</tr>
																</tbody>
															</table>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

															<div style="border: 2px solid #d6d6d6;">
																<table width="100%" border="0" cellspacing="0"
																	cellpadding="0">
																	<tbody>
																		<tr height="31">
																			<td width="12" bgcolor="#f4f4f4"></td>
																			<td width="73" bgcolor="#f4f4f4" class="title">상품금액</td>
																			<td align="right" class="m1">1,000 원</td>
																			<td width="10"></td>
																		</tr>
																		<tr>
																			<td colspan="4" height="1" bgcolor="#d6d6d6"></td>
																		</tr>
																		<tr height="31">
																			<td width="12" bgcolor="#f4f4f4"></td>
																			<td width="73" bgcolor="#f4f4f4" class="title">배송비</td>
																			<td align="right" class="m2">2,500 원</td>
																			<td width="10"></td>
																		</tr>
																		<tr>
																			<td colspan="4" height="1" bgcolor="#d6d6d6"></td>
																		</tr>
																		<tr height="31">
																			<td width="12" bgcolor="#f4f4f4"></td>
																			<td width="73" bgcolor="#f4f4f4" class="title">할인금액</td>
																			<td align="right" class="m3">0 원</td>
																			<td width="10"></td>
																		</tr>
																		<tr>
																			<td colspan="4" height="1" bgcolor="#d6d6d6"></td>
																		</tr>
																		<tr height="31">
																			<td width="12" bgcolor="#f4f4f4"></td>
																			<td width="73" bgcolor="#f4f4f4" class="title">적립금
																				할인</td>
																			<td align="right" class="m3">0 원</td>
																			<td width="10"></td>
																		</tr>
																		<tr>
																			<td colspan="4" height="1" bgcolor="#d6d6d6"></td>
																		</tr>
																	</tbody>
																</table>
															</div>

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr height="10">
																		<td></td>
																	</tr>
																</tbody>
															</table>

															<div style="border: 2px solid #cbd8e9;">
																<table width="100%" border="0" cellspacing="0"
																	cellpadding="0">
																	<tbody>
																		<tr height="31">
																			<td width="12" bgcolor="#dbeaff"></td>
																			<td width="73" bgcolor="#dbeaff" class="title2">결제수단</td>
																			<td bgcolor="#eff5ff" align="right" class="m4">무통장
																				입금</td>
																			<td width="10" bgcolor="#eff5ff"></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</td>
														<td width="32"></td>
													</tr>
												</tbody>
											</table>
										</td>
										<td width="1" bgcolor="#d6d6d6"></td>
									</tr>
								</tbody>
							</table>

			<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

						</td>
					</tr>
				</tbody>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr height="10">
						<td></td>
					</tr>
				</tbody>
			</table>

			<div style="height:2px; background:#6b6b6b;" class="none">&nbsp;</div>


			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr height="30">
						<td></td>
					</tr>
				</tbody>
			</table>

			<table border="0" cellspacing="0" cellpadding="0" class="auto" align="center">
				<tbody>
					<tr>
						<td><a href="/moyeo/one/moyeoShop"><img
								src="/moyeo/resources/resource/img/shop/home.gif" border="0"></a></td>
						<td width="5"></td>
						<td><a href="http://dmshop.kr/mypage.php"><img
								src="/moyeo/resources/resource/img/shop/mypage.gif" border="0"></a></td>
					</tr>
				</tbody>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr height="50">
						<td></td>
					</tr>
				</tbody>
			</table>

			<table border="0" cellspacing="0" cellpadding="0" align="center"
				class="auto order_help">
				<tbody>
					<tr>
						<td>
							<div style="padding: 20px 68px; border: 1px solid #d6d6d6;">
								<table border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td><img src="/moyeo/resources/resource/img/shop/dot.gif"
												class="up1"></td>
											<td width="5"></td>
											<td class="title">주문하신 상품은 마이페이지에서 확인/수정 하실 수 있습니다.</td>
										</tr>
									</tbody>
								</table>

							</div>
						</td>
					</tr>
				</tbody>
			</table>

			<table border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td height="50"></td>
					</tr>
				</tbody>
			</table>
		</div>
			
									
									
									
									
									
									
									
									
									
									<!-- 본문끝 -->					
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














