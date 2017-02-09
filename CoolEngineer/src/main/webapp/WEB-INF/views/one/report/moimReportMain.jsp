<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
.btn {
	margin-right: 26%;
}
</style>
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


				<div class="col-md-12">
					<form:form class="form-horizontal" action="moimReportPro"
						method="post" modelAttribute="uploadForm"
						enctype="multipart/form-data">
						<input type="hidden" name="group_num" value="${group_num}">
						<input type="hidden" name="group_name" value="${dto.group_name}">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<strong>모임신고</strong> 불순한 모임을 신고하세요!
								</h3>
								<ul class="panel-controls">
									<li><a href="#" class="panel-remove"><span
											class="fa fa-times"></span></a></li>
								</ul>
							</div>
							<div class="panel-body">

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">모임이름</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"><span
												class="fa fa-pencil"></span></span> <input type="text"
												class="form-control" value="${dto.group_name}" />
										</div>
										<span class="help-block">모임이름</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">신고제목</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"><span
												class="fa fa-pencil"></span></span> <input type="text"
												class="form-control" name="report_title" maxlength="40"
												required />
										</div>
										<span class="help-block">신고제목을 입력하세요.</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">신고내용</label>
									<div class="col-md-6 col-xs-12">
										<textarea class="form-control" rows="5" name="report_content"
											maxlength="1000" required></textarea>
										<span class="help-block">신고내용을 입력하세요.</span>
									</div>
								</div>


								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">사진</label>
									<div class="col-md-6 col-xs-12">
										<input type="file" class="fileinput btn-primary"
											name="files[0]" id="pic_path" title="Browse file" /> <span
											class="help-block">신고파일을 첨부하세요.</span>
									</div>
								</div>

							</div>
							<div class="panel-footer">
								<button class="btn btn-default">Clear Form</button>
								<input type="submit" class="btn btn-primary pull-right"
									value="글쓰기">
							</div>
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>

	<%@ include file="../../etc/footer.jsp"%>
</body>
</html>



