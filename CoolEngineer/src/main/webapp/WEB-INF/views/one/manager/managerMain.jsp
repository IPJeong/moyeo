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

<body class="x-dashboard">
	<!-- START PAGE CONTAINER -->

	<div class="page-container">

		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">

				<%@ include file="../../etc/header.jsp"%>

				<div style="margin-left: 24%;">
					<div class="col-md-22" style="width: 35%">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<h3>관리자 관리</h3>
									<span>설명</span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/host2.jpg"
									style="width: 472px; height: 200px;"> <br>
								<br>
								<br>
								<br>
								<div style="margin-left: 15%; margin-top: 5%">
									<c:if test="${sessionScope.authority=='02'}">
										<div style="">
											<span><button class="btn btn-primary btn-rounded"
													style="width: 150px;" value="버튼"
													onclick="window.location='adminAppoint'">
													<font size="3px;">관리자 임명</font>
												</button></span>
										</div>
										<div style="margin-left: 40%; margin-top: -7%;">
											<span><button class="btn btn-danger btn-rounded"
													style="width: 150px;" value="버튼"
													onclick="window.location='adminDelete'">
													<font size="3px" color="red"> 관리자 삭제 </font>
												</button></span>
										</div>
									</c:if>
									<c:if test="${sessionScope.authority=='08'}">
										<div style="">
											<span><button class="btn btn-primary btn-rounded"
													style="width: 150px;" value="버튼"
													onclick="window.location='adminAppoint'"
													disabled="disabled">
													<font size="3px;">관리자 임명</font>
												</button></span>
										</div>
										<div style="margin-left: 40%; margin-top: -7%;">
											<span><button class="btn btn-danger btn-rounded"
													value="버튼" style="width: 150px;"
													onclick="window.location='adminDelete'" disabled="disabled">
													<font size="3px" color="red">관리자 삭제</font>
												</button></span>
										</div>
									</c:if>
								</div>
								<div class="chart-holder" id="dashboard-bar-1"
									style="height: 200px;"></div>

							</div>
						</div>
					</div>

					<br>

					<div class="col-md-22" style="width: 35%">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<h3>관리자 알림</h3>
									<span>설명</span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/notice1.jpg"
									style="width: 472px; height: 200px;"> <br>
								<br>
								<br>
								<br>
								<div style="margin-left: 35%; margin-top: 5%">
									<div style="">
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼"
												onclick="window.location='moimReportHandleMain'">
												<font size="3px;">모임신고 내역</font>
											</button></span>
									</div>
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-22" style="width: 35%">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<h3>모임관리</h3>
									<span>설명</span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/group.jpg"
									style="width: 472px; height: 200px;"> <br>
								<br>
								<br>
								<br>
								<div style="margin-left: 35%; margin-top: 5%">
									<div>
										<span><button class="btn btn-primary btn-rounded"
												style="width: 150px;" value="버튼"
												onclick="window.location='moimCheck'">
												<font size="3px;">모임관리</font>
											</button></span>
									</div>
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-22" style="width: 35%">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<h3>회원관리</h3>
									<span>설명</span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/host1.jpg"
									style="width: 472px; height: 200px;"> <br>
								<br>
								<br> <br>
								<div style="margin-left: 15%; margin-top: 5%">
									
									<div>
											<span><button class="btn btn-primary btn-rounded"
													style="width: 150px;" value="버튼"
													onclick="window.location='guestList'">
													<font size="3px;">회원관리</font>
												</button></span>
										</div>
										<div style="margin-left: 40%; margin-top: -7%;">
											<span><button class="btn btn-primary btn-rounded"
													style="width: 150px;" value="버튼"
													onclick="window.location='seller'">
													<font size="3px"> 판매자관리 </font>
												</button></span>
									</div>
									
									
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- END PAGE CONTENT WRAPPER -->


		</div>
		<!-- END PAGE CONTENT -->
	</div>
	<!-- END PAGE CONTAINER -->
	<!-- START FOOTER -->

	<%@ include file="../../etc/footer.jsp"%>
	<!-- END FOOTER -->
</body>

</html>

