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

				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">판매자 관리</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive" style="width:70%; margin-left:15%;">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="width:3%">승인여부</th>
										<th style="width:7%;">아이디</th>
										<th style="width:12%;">전화번호</th>
										<th style="width:20%;">주소</th>
										<th style="width:15%;">상호명</th>
										<th style="width:15%">등록일</th>
										<th style="width:5%">상세보기</th>
									</tr>
								</thead>
								<c:forEach var="dto" items="${dtos}" begin="0">
								<tbody>
									<tr>
										<c:if test="${dto.recognition=='91'}">
										<td>신청대기</td>
										</c:if>
										<c:if test="${dto.recognition=='06'}">
										<td><font color="blue">신청승인</font></td>
										</c:if>
										<c:if test="${dto.recognition=='15'}">
										<td><font color="orange">신청거절</font></td>
										</c:if>
										<c:if test="${dto.recognition=='20'}">
										<td><font color="red">자격박탈</font></td>
										</c:if>
										<td>${dto.seller_id}</td>
										<td>${dto.tel}</td>
										<td>${dto.address}</td>
										<td>${dto.comp_name}</td>
										<td>${dto.reg_date}</td>
										<td><a href="" onclick="return getInfo('${dto.seller_id}', '${pageNum}')"><input type="button" value="상세보기"></a></td>
									</tr>
								</tbody>
								</c:forEach>
							</table>
							
						</div>
					</div>
					<div class="row">
					<div class="col-md-12">
						<ul class="pagination pagination-sm pull-right push-down-10 push-up-10" style="margin-right:5%;">
							<c:if test="${cnt > 0}">

								<li><a href="managerMain?authority=">목록으로</a></li>
								<!-- 처음[◀◀] 이전[◀]-->
								<c:if test="${startPage > pageBlock}">
									<li><a href="seller">«</a></li>
									<li><a href="seller?pageNum=${startPage - pageBlock}">‹</a></li>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<li class="active"><a href="#">${i}</a></li>
									</c:if>
									<c:if test="${i != currentPage}">
										<li><a href="seller?pageNum=${i}">${i}</a></li>
									</c:if>
								</c:forEach>

								<!-- 다음[▶] 끝[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<li><a href="seller?pageNum=${startPage + pageBlock}">›</a></li>
									<li><a href="seller?pageNum=${pageCount}">»</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
				</div>
				<script type="text/javascript">
					function getInfo(seller_id, pageNum) {
						window.open('sellerInform?seller_id=' + seller_id + '&pageNum=' + pageNum, 'sellerInform', 'menubar=no, width=540, height=800, top=100, left=500');
						return false;
					}

				</script>
				
				
			</div>
		</div>
	</div>
</body>
</html>
