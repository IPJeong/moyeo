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

<style>
.button {
	margin-right: 47%;
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
					<form class="form-horizontal" action="/moyeo/one/qnaModifyPro"
						method="post">

						<input type="hidden" name="qboard_num" value="${qboard_num}">
						<input type="hidden" name="pageNum" value="${pageNum}"> <input
							type="hidden" name="number" value="${number}">

						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<strong>Separated</strong> Layout
								</h3>
								<ul class="panel-controls">
									<li><a href="#" class="panel-remove"><span
											class="fa fa-times"></span></a></li>
								</ul>
							</div>
							<div class="panel-body">
								<p>
									Add class
									<code>.form-group-separated</code>
									to form wrapper to get rows separated
								</p>
							</div>
							<div class="panel-body form-group-separated">

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">작성날짜</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<div class="col-md-8 col-xs-7 line-height-30"
												style="width: 100%">${dto.write_date}</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">작성자</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<div class="col-md-8 col-xs-7 line-height-30"
												style="width: 100%;">${dto.mem_id}</div>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">글제목</label>
									<div class="col-md-6 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"><span
												class="fa fa-pencil"></span></span> <input type="text"
												class="form-control" value="${dto.title}" name="title" />
										</div>
										<span class="help-block">This is sample of text field</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-md-3 col-xs-12 control-label">내용</label>
									<div class="col-md-6 col-xs-12">
										<textarea class="form-control" rows="15" name="content">${dto.content}</textarea>
										<span class="help-block">Default textarea field</span>
									</div>
								</div>


							</div>
							<div class="panel-footer">
								<div class="button">
									<input type="reset" class="btn btn-primary pull-right"
										value="수정취소" onclick="window.history.back();">
									<c:if test="${sessionScope.mem_id==dto.mem_id}">
										<input type="submit" class="btn btn-primary pull-right"
											value="수정하기">
									</c:if>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../etc/footer.jsp"%>
</body>
</html>


