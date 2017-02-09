<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- META SECTION -->
<title>MoYeo-새로운 만남의 시작</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" href="/moyeo/resources/resource/favicon.ico" type="image/x-icon" />
<!-- END META SECTION -->

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme" href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->
</head>

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<script type='text/javascript' src="/moyeo/resources/resource/js/plugins/icheck/icheck.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/scrolltotop/scrolltopcontrol.js"></script>

<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/morris/raphael-min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/morris/morris.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/rickshaw/d3.v3.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/rickshaw/rickshaw.min.js"></script>
<script type='text/javascript' src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
<script type='text/javascript' src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
<script type='text/javascript' src='/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/owl/owl.carousel.min.js"></script>

<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/moment.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/daterangepicker/daterangepicker.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->

<body class="x-dashboard">
	<!-- START PAGE CONTAINER -->
	
	<div class="page-container">

		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap"> --%>

				<!-- TOP BAR START -->
				<div class="x-content-tabs">
					<ul>
						<li><a href="/moyeo/three/ing_event"><span class="fa fa-bell">이벤트</span><span>이벤트</span></a></li>
						<li><a href="/moyeo/six/cusSupMain"><span class="fa fa-envelope">고객지원</span><span>고객지원</span></a></li>
						<c:if test="${sessionScope.mem_id == null && sessionScope.manager_id == null}">
							<li><a href="/moyeo/three/registration"><span class="fa fa-save">회원가입</span><span>회원가입</span></a></li>
							<li><a href="/moyeo/main/memberLoginForm"><span class="fa fa-plus">로그인</span><span>로그인</span></a></li>
						</c:if>
						<c:if test="${sessionScope.mem_id != null || sessionScope.manager_id != null}" >
							<li><a href="/moyeo/three/myPage"><span class="fa fa-save"></span>${sessionScope.mem_id == null ? sessionScope.manager_id : sessionScope.mem_id}님</a></li>
							<li><a href="/moyeo/main/memberLogout"><span class="fa fa-save"></span>로그아웃</a></li>
						</c:if>
					</ul>
				</div>
				<!-- TOP BAR END -->

				<!-- MENU BAR START -->
				<div class="x-hnavigation">
					<div class="x-hnavigation-logo">
						<a href="/moyeo/main/home">MoYeo</a>
					</div>
					<ul>
						<li class=""><a href="/moyeo/main/home">Home</a></li>
						<li class="xn-openable"><a href="#">회사소개</a>
							<ul>
								<li><a href="/moyeo/main/introduce/introduce"><span class="glyphicon glyphicon-user"></span> 회사소개 </a></li>
								<li><a href="/moyeo/main/introduce/introduce2"><span
										class="fa fa-building-o"></span> 연혁 </a></li>
								<li><a href="/moyeo/main/introduce/introduce3"><span class="fa fa-group"></span> 구성원
								</a></li>
							</ul></li>
						<li class="xn-openable"><a href="#">모임</a>
							<ul>
								<li><a href="/moyeo/six/category/category_hobby"><span class="fa fa-caret-right"></span> 관심사별 </a></li>
								<li><a href="/moyeo/six/category/category_location"><span class="fa fa-caret-right"></span>
										지역별 </a></li>
								<li><a href="/moyeo/six/category/category_scale"><span class="fa fa-caret-right"></span>
										규모별 </a></li>
							</ul></li>
						<!-- <li class="xn-openable"><a href="#">잠깐모여</a>
							<ul>								
								<li><a><span class="fa fa-caret-right"></span>
										지역별</a></li>
								<li><a><span class="fa fa-caret-right"></span>
										관심사별</a></li>								
								<li><a><span class="fa fa-caret-right"></span>
										시간대별 </a></li>
							</ul></li> -->
						<li class="xn-openable"><a href="/moyeo/four/moyeoShop">샵</a></li>
						<li class="xn-openable"><a href="#">추천장소</a>
							<ul>
								<li><a href="/moyeo/two/placeMainLoc"><span class="fa fa-caret-right"></span> 지역별</a></li>
								<li><a href="/moyeo/two/placeMainRecpla"><span class="fa fa-caret-right"></span>관심사별</a></li>
							</ul>
						</li>
					</ul>

					<div class="x-features">
						<div class="x-features-nav-open">
							<span class="fa fa-bars"></span>
						</div>
						<div class="pull-right"></div>
					</div>
				</div>
				<!-- MENU BAR END -->
						<!-- MENU BAR END -->
