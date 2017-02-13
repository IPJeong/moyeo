<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type='text/javascript'
	src="/moyeo/resources/resource/js/plugins/icheck/icheck.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/scrolltotop/scrolltopcontrol.js"></script>

<script type="text/javascript"
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
	src="/moyeo/resources/resource/js/plugins/owl/owl.carousel.min.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/moment.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/daterangepicker/daterangepicker.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/actions.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->
<style>
.btn-primary {
	background-color: rgb(239, 238, 238);;
	border-color: #4e7aa2;
	color: #3c44ab;
}
a {
	text-decoration:none;
}

.panel-default .panel-heading {
	background-color: rgba(255, 152, 0, 0.31);
}

</style>
</head>
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
					<li><a href="/moyeo/main/home">Home</a></li>
					<li class="active">모임</li>
				</ul>
				<!-- END BREADCRUMB -->

				<div class="row-1">

					<div class="col-md-0">

						
							<div class="panel panel-default tabs">
								<ul class="nav nav-tabs" role="tablist">
									<li class="active"><a href="#tab-first" role="tab"
										data-toggle="tab">관심사별</a></li>
								</ul>

								<div class="col-md-6-1"
									style="width: 95%; height: 50px; margin: 20px 0px 5px 0px;">
									<div class="col-md-6" style="width: 20%; margin-left: 50px;">
										<input type="button" class="btn btn-info btn-rounded" style="width:150px; height:30px; font-size:12pt; margin-top:5px; margin-left:5px;"
											value="모임만들기" onclick="window.location='moimOpen'">
									</div>
									<form name="mainsearchfrom" action="/moyeo/two/mainSearch" onsubmit="return searchKeywordCheck();">
									<div class="input-group push-down-10"
										style="width: 40%; float: right;">
										<span class="input-group-addon"><span
											class="fa fa-search"></span></span> <input type="text"
											class="form-control" name="search_keyword" placeholder="Keywords..." />
										<div class="input-group-btn">
											<input type="hidden" name="search_radio1" value="gl1">
											<input type="submit" class="btn btn-primary" value="Search">
										</div>
									</div>
									</form>
								</div>


								<div class="panel-body tab-content">
									<div class="tab-pane active" id="tab-first">
										<div class="col-md-13" style="height: auto;">
											<div class="panel panel-default">
												<div class="panel-heading">
													<div class="panel-title-box">
														<h3>관심사별</h3>
													</div>
												</div>
												<div class="panel-body padding-0">

													<div style="width: 100%; height: 250px;">
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>아웃도어/여행&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=아웃도어/여행"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0"  style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos1}" begin="0" end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>운동/스포츠&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=운동/스포츠"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos2}" begin="0" end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>인문학/책/글&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=인문학/책/글"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos3}" begin="0" end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>외국/언어&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=외국/언어"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos4}" begin="0" end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>문화/공연&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=문화/공연"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos5}" begin="0" end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
													</div>
													<div style="width: 100%; height: 250px;">
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>음악/악기&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=음악/악기"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos6}" begin="0" end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>공예/만들기&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=공예/만들기"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos7}" begin="0" end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>댄스/무용&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=댄스/무용"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos8}" begin="0" end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>봉사활동&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=봉사활동"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos9}" begin="0" end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>사교/인맥&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=사교/인맥"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos10}" begin="0"
																		end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
													</div>
													<div style="width: 100%; height: 250px;">
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>차/오토바이&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=차/오토바이"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos11}" begin="0"
																		end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>사진&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=사진"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos12}" begin="0"
																		end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>야구관람&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=야구관람"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos13}" begin="0"
																		end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>게임/오락&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=게임/오락"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos14}" begin="0"
																		end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>요리/제조&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=요리/제조"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos15}" begin="0"
																		end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
													</div>
													<div style="width: 100%; height: 250px;">
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>반려동물&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=반려동물"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos16}" begin="0"
																		end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>가족/결혼&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=가족/결혼"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos17}" begin="0"
																		end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
															<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
																<div class="panel-title-box">
																	<h3>자유주제&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=관심사별&subject=자유주제"><font size="2">더보기</font></a></h3>
																</div>
															</div>
															<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
																<ul>
																	<c:forEach var="dto" items="${dtos18}" begin="0"
																		end="8">
																		<li
																			style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																			<a
																			href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																				${dto.group_name} </a>
																		</li>
																	</c:forEach>
																</ul>
															</div>
														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 0px solid #E5E5E5;">

														</div>
														<div class="panel panel-default"
															style="width: 19%; height: 100%; margin: 5px; float: left; border: 0px solid #E5E5E5;">

														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-14" style="width: 95%; height: auto;">
											<div class="panel panel-default">
												<div class="panel-heading">
													<div class="panel-title-box">
														<h3>인기모임&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=인기모임&subject=인기모임"><font size="2">더보기</font></a></h3>
													</div>
												</div>
												<div class="panel-body padding-0">
													<div class="chart-holder" id="dashboard-bar-1"
														style="height: 210px;">
														<c:forEach var="dto" items="${hotDtos}" begin="0" end="14" >
														<div class="panel-body padding-0" style="height:33px; width:480px; float:left; margin-bottom: 12px;">
															<ul>
																<li
																	style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
																	<a
																	href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																		<font size="3px">${dto.group_name}</font> <br> <font size="2em;"color="#a7adb5"><div style="float:right; margin-right:20px;">(${dto.group_inte1}-${dto.group_inte2} , ${dto.group_location})</div></font></a>
																</li>
															</ul>
														</div>
														</c:forEach>
													</div>
												</div>

											</div>
										</div>
										<div class="col-md-13-1" style="width: 93%; height: auto;">
											<div class="panel panel-default">
												<div class="panel-heading">
													<div class="panel-title-box">
														<h3>추천모임 리스트</h3>
													</div>
												</div>
												<div class="panel-body padding-0">
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
				<!-- END PAGE CONTENT WRAPPER -->

				<!-- END PAGE CONTENT -->

				<!-- END PAGE CONTAINER -->
			</div>
		</div>
	</div>

	<%@ include file="../../etc/footer.jsp"%>
</body>
</html>