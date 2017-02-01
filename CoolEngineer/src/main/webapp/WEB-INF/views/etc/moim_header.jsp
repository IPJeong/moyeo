<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
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
<script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->

<body class="x-dashboard">
	<!-- START PAGE CONTAINER -->
	<div class="page-container">

		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">

				<!-- TOP BAR START -->
				<div class="x-content-tabs">
					<ul>
						<li><a href="#main-tab"><span class="fa fa-bell">이벤트</span><span>이벤트</span></a></li>
						<li><a href="/moyeo/six/cusSupMain"><span class="fa fa-envelope">고객지원</span><span>고객지원</span></a></li>
						<c:if test="${sessionScope.mem_id == null }">
							<li><a href="/moyeo/main/member/registration"><span class="fa fa-save">회원가입</span><span>회원가입</span></a></li>
							<li><a href="/moyeo/main/memberLoginForm"><span class="fa fa-plus">로그인</span><span>로그인</span></a></li>
						</c:if>
						<c:if test="${sessionScope.mem_id != null }">
							<li><a href="/moyeo/main/member/registration"><span class="fa fa-save"></span>${sessionScope.mem_id} 님</a></li>
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
						<li class=""><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">Home</a></li>
						<li><a href="/moyeo/six/moimSchedule/moimSchedule?group_num=${group_num}">모임일정</a></li>
						<li class="xn-openable"><a>모임갤러리</a>
							<ul>
								<li><a href="/moyeo/moim/moim_picture?group_num=${group_num}"><span class="fa fa-caret-right"></span>사진보기</a></li>
								<li><a href="/moyeo/moim/moim_movie?group_num=${group_num}"><span class="fa fa-caret-right"></span>동영상보기</a></li>
							</ul>
						</li>
						<li class="xn-openable"><a>모임게시판</a>
							<ul>  
								<li><a href="/moyeo/four/moim_notice_board?group_num=${group_num}"><span class="fa fa-caret-right"></span>모임공지 게시판</a></li>
								<li><a href="/moyeo/four/moim_greeting_board?group_num=${group_num}"><span class="fa fa-caret-right"></span>가입인사 게시판</a></li>
								<li><a href="/moyeo/five/postList?group_num=${group_num}"><span class="fa fa-caret-right"></span>모임후기 게시판</a></li>
							</ul>
						</li>
						<li><a>모임채팅</a></li>
						<li><a href="/moyeo/main/moim/moim_stats?group_num=${group_num}">모임통계</a></li>
						<li class="xn-openable"><a>모임관리</a>
							<ul>
								<li><a href="/moyeo/moim/moim_cheif_modify?group_num=${group_num}"><span class="fa fa-caret-right"></span>모임정보관리</a></li>
								<li><a href="/moyeo/moim/moim_cheif_join?group_num=${group_num}"><span class="fa fa-caret-right"></span>가입신청관리</a></li>
								<li><a href="/moyeo/moim/moim_cheif_member?group_num=${group_num}"><span class="fa fa-caret-right"></span>모임원관리</a></li>
								<li><a href="/moyeo/moim/moim_cheif_board?group_num=${group_num}"><span class="fa fa-caret-right"></span>게시물관리</a></li>
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

        