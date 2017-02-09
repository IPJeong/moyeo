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
				<form name="guestGroupSearch" action="guestGroupSearch">
					<div class="panel panel-default">
						<div class="panel-heading">
							<div class="panel-title-box">
								<h3>회원관리</h3>
								<span>설명</span>
							</div>
						</div>

						<div style="margin-left: 83%; width: 15%">
							<div style="float: left; width: 200px; margin-right: 10px;">
								<input type="text" style="width: 100%" class="form-control"
									name="search_group" placeholder="검색할 모임을 입력하세요" />
							</div>
							<div style="float: left;">
								<input class="btn btn-primary" type="submit" value="검색">
							</div>
						</div>
						<c:forEach var="dto" items="${dtos}" begin="0">

							<div class="page-content-wrap" style="margin-left: 1%">
								<div class="row" style="float: left; width: 465px;">

									<div class="col-md-3"
										style="height: 300px; width: 100%; margin: 20px auto; overflow: hidden">
										<!-- CONTACT ITEM -->
										<div class="panel panel-default" style="height: 300px;">
											<div class="panel-body profile">
												<div class="profile-image" style="height: 50px;"></div>
												<div class="profile-data">
													<div class="profile-data-name" style="margin-top: -5%">
														<font size="4">${dto.group_name}</font>
													</div>
													<div class="profile-data-title">
														<font size="3">정원: ${dto.group_mem_cnt}</font>
													</div>
												</div>
												<div class="profile-controls form-group">
													<a href=""
														onclick="return getInfo('${dto.group_num}', '${pageNum}')"
														class="profile-control-left"> <span class="fa fa-info"
														style="margin-top: 5px"></span></a> <a href=""
														onclick="return getMember('${dto.group_num}', '${pageNum}')"
														class="profile-control-right"> <span
														class="glyphicon glyphicon-user" style="margin-top: 5px"></span></a>

												</div>
											</div>
											<div class="panel-body" style="">
												<div class="contact-info" style="">
													<p>
														<font size="3"><small>관심사1</small><br />${dto.group_inte1}</font>
													</p>
													<p>
														<font size="3"><small>관심사2</small><br />${dto.group_inte2}</font>
													</p>
													<p>
														<font size="3"><small>지역</small><br />${dto.group_location}</font>
													</p>
												</div>
											</div>
										</div>
										<!-- END CONTACT ITEM -->
									</div>

								</div>

							</div>
						</c:forEach>

						<div class="row">
							<div class="col-md-12">
								<ul
									class="pagination pagination-sm pull-right push-down-10 push-up-10">
									<c:if test="${cnt > 0}">
										<li><a href="managerMain?authority=">목록으로</a></li>
										<!-- 처음[◀◀] 이전[◀]-->
										<c:if test="${startPage > pageBlock}">
											<li><a href="moimCheck">«</a></li>
											<li><a href="moimCheck?pageNum=${startPage - pageBlock}">‹</a></li>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage}">
												<li class="active"><a href="#">${i}</a></li>
											</c:if>
											<c:if test="${i != currentPage}">
												<li><a href="moimCheck?pageNum=${i}">${i}</a></li>
											</c:if>
										</c:forEach>

										<!-- 다음[▶] 끝[▶▶] -->
										<c:if test="${pageCount > endPage}">
											<li><a href="moimCheck?pageNum=${startPage + pageBlock}">›</a></li>
											<li><a href="moimCheck?pageNum=${pageCount}">»</a></li>
										</c:if>
									</c:if>
								</ul>
							</div>
						</div>


						<script type="text/javascript">
							function getInfo(group_num, pageNum) {
								window.open('groupInform?group_num='+ group_num + '&pageNum='+ pageNum, 'groupInform','menubar=no, width=540, height=720, top=100, left=500');
								return false;
							}

							function getMember(group_num, pageNum) {
								window.open('groupMemberInform?group_num='+ group_num + '&pageNum='+ pageNum, 'groupMember','menubar=no width=540, height=600, top=100, left=500');
								return false;
							}

							/* function deleteInfo(mem_id) {
								if(confirm("정말 삭제하시겠습니까?")) {
									window.location='/moyeo/one/guestDelete?mem_id='+ mem_id;
								} else {
									return false;
								}
							} */
						</script>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../../etc/footer.jsp"%>
</body>
</html>
