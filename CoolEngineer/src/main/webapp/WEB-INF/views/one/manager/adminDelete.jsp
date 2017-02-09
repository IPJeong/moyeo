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


				<div class="panel panel-default"
					style="width: 70%; margin-left: 15%;">
					<div class="panel-heading">
						<h3 class="panel-title">하위관리자 목록</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table">

								<tr style="border-bottom: 1px dash black;">
									<th
										style="color: black; size: 10px; border-bottom: 1px solid grey;">이름</th>
									<th style="color: black; border-bottom: 1px solid grey;">아이디</th>
									<th style="color: black; border-bottom: 1px solid grey;">비밀번호</th>
									<th style="color: black; border-bottom: 1px solid grey;">권한</th>
									<th style="color: black; border-bottom: 1px solid grey;">탈퇴처리</th>
								</tr>
								<c:forEach var="dto" items="${mdtos}">


									<tr style="border-bottom: 1px solid black;">
										<th style="width: 20%; border-bottom: 1px solid grey;">${dto.name}</th>
										<th style="width: 20%; border-bottom: 1px solid grey;">${dto.manager_id}</th>
										<th style="width: 20%; border-bottom: 1px solid grey;">${dto.passwd}</th>
										<c:set var="authority"
											value="${dto.authority == '08' ? 'Manager' : 'Master'}" />
										<th style="width: 20%; border-bottom: 1px solid grey;">${authority}</th>
										<th style="width: 20%; border-bottom: 1px solid grey;"><a
											onclick="if(confirm('정말 탈퇴처리를 하시겠습니까?')) 
        	   			window.location='/moyeo/one/adminDeletePro?manager_id=${dto.manager_id}&pageNum=${pageNum}'">
												<input type="button" style="width: 100%;"
												class="btn btn-primary pull-right" value="탈퇴처리">
										</a></th>
									</tr>

								</c:forEach>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<ul
								class="pagination pagination-sm pull-right push-down-10 push-up-10">
								<c:if test="${cnt > 0}">
									<li><a href="managerMain?authority=">목록으로</a></li>
									<!-- 처음[◀◀] 이전[◀]-->
									<c:if test="${startPage > pageBlock}">
										<li><a href="adminDelete">«</a></li>
										<li><a
											href="adminDelete?pageNum=${startPage - pageBlock}">‹</a></li>
									</c:if>

									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class="active"><a href="#">${i}</a></li>
										</c:if>
										<c:if test="${i != currentPage}">
											<li><a href="adminDelete?pageNum=${i}">${i}</a></li>
										</c:if>
									</c:forEach>

									<!-- 다음[▶] 끝[▶▶] -->
									<c:if test="${pageCount > endPage}">
										<li><a
											href="adminDelete?pageNum=${startPage + pageBlock}">›</a></li>
										<li><a href="adminDelete?pageNum=${pageCount}">»</a></li>
									</c:if>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../etc/footer.jsp"%>
</body>

</html>