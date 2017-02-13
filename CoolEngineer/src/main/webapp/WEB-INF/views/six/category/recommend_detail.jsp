<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
										data-toggle="tab">${category}</a></li>
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
														<h3>${subject}</h3>
													</div>
												</div>
												<div class="panel-body padding-0" style="height:800px; overflow:auto;">
										    	    <c:if test="${empty dtos}">
														<font size="3px">추천모임이 없습니다. 관심사나 관심지역을 변경해보세요.</font>
													</c:if>	
													<c:if test="${!empty dtos}">			
											            <c:forEach var="dto" items="${dtos}">
												            <c:if test="${dto.group_inte1 eq group_inte1 && dto.group_inte2 eq group_inte2 && dto.group_location eq group_location}">
													            <div style="margin-top:10px; margin-bottom:30px;">
														            <div class="info" style="float:left; margin-left:5%; width:15%; height:100px;">
															           	<img src="${dto.main_pic_path}/${dto.main_pic_name}" alt="모임 사진" style="width:70%; height:85px;"> 
																		<br>
																	</div>
																	<div style="width:80%; font-size:15px; height:100px;">
																	     <a href="../moimMain/moimMain?group_num=${dto.group_num}">
																	     	 <span style="color:black;">이름 : ${dto.group_name}</span>
																	     <br>
																		 소개 : ${dto.group_intro}<br>
																		 <span style="color:blue;">관심사 (${dto.group_inte1}, ${dto.group_inte2})</span>&nbsp;|&nbsp;<span style="color:green">지역 (${dto.group_location})</span>
																	     &nbsp;|&nbsp;<span style="color:red;">규모 (${dto.group_mem_cnt}명)</span><br>
																	     <span style="color:red;">개설일 : ${fn:substring(dto.reg_date, 0, 10)}</span>
																	     </a>
																	</div>
																</div>
													    	</c:if>
													    </c:forEach>
	   										            <c:forEach var="dto" items="${dtos}">
												            <c:if test="${dto.group_inte1 eq group_inte1 && dto.group_inte2 eq group_inte2 && dto.group_location ne group_location}">
													            <div style="margin-top:10px; margin-bottom:30px;">
														            <div class="info" style="float:left; margin-left:5%; width:15%; height:100px;">
															           	<img src="${dto.main_pic_path}/${dto.main_pic_name}" alt="모임 사진" style="width:70%; height:85px;"> 
																		<br>
																	</div>
																	<div style="width:80%; font-size:15px; height:100px;">
																	     <a href="../moimMain/moimMain?group_num=${dto.group_num}">
																	     	 <span style="color:black;">이름 : ${dto.group_name}</span>
																	     <br>
																		 소개 : ${dto.group_intro}<br>
																		 <span style="color:blue;">관심사 (${dto.group_inte1}, ${dto.group_inte2})</span>&nbsp;|&nbsp;<span style="color:green">지역 (${dto.group_location})</span>
																	     &nbsp;|&nbsp;<span style="color:red;">규모 (${dto.group_mem_cnt}명)</span><br>
																	     <span style="color:red;">개설일 : ${fn:substring(dto.reg_date, 0, 10)}</span>
																	     </a>
																	</div>
																</div>
													    	</c:if>
													    </c:forEach>
	   										            <c:forEach var="dto" items="${dtos}">
												            <c:if test="${dto.group_inte1 ne group_inte1 && dto.group_inte2 ne group_inte2 && dto.group_location eq group_location}">
													            <div style="margin-top:10px; margin-bottom:30px;">
														            <div class="info" style="float:left; margin-left:5%; width:15%; height:100px;">
															           	<img src="${dto.main_pic_path}/${dto.main_pic_name}" alt="모임 사진" style="width:70%; height:85px;"> 
																		<br>
																	</div>
																	<div style="width:80%; font-size:15px; height:100px;">
																	     <a href="../moimMain/moimMain?group_num=${dto.group_num}">
																	     	 <span style="color:black;">이름 : ${dto.group_name}</span>
																	     <br>
																		 소개 : ${dto.group_intro}<br>
																		 <span style="color:blue;">관심사 (${dto.group_inte1}, ${dto.group_inte2})</span>&nbsp;|&nbsp;<span style="color:green">지역 (${dto.group_location})</span>
																	     &nbsp;|&nbsp;<span style="color:red;">규모 (${dto.group_mem_cnt}명)</span><br>
																	     <span style="color:red;">개설일 : ${fn:substring(dto.reg_date, 0, 10)}</span>
																	     </a>
																	</div>
																</div>
													    	</c:if>
													    </c:forEach>
													 </c:if>  
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