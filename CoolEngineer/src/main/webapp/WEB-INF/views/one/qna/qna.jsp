<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.col-md-12 {
	width: 75%;
	margin: auto;
	float: none;
}

.panel.panel-default {
	margin: 30px;
}

.panel .panel-body {
	padding: 0px;
}

.col-md-6 {
	border-left-color: #F5F5F5;
	border-left-width: 1px;
	border-left-style: solid;
}

.x-content-footer {
	position: relative;
}

.x-dashboard .page-container .page-content {
	background: #F9FAFB;
}

table {
	width: 100%;
}

th {
	border: 1px solid #9d9fbc;
	background: #e5ecf1;
	text-align: center;
}

td {
	border: 1px solid #9d9fbc;
}

tr {
	height: 20px;
}

.num {
	width: 7%
}

.subject {
	width: 48%;
}

.writer {
	width: 10%
}

.announce {
	width: 15%;
}

.count {
	width: 10%;
}

.answer {
	width: 10%;
}

.x-dashboard .page-container .page-content {
	height: 837px;
}

.button {
	font-size: 15px;
	width: 100px;
	height: 30px;
	align: center;
	margin-left: 95%;
	margin-top: -20px"
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

				<!-- START BREADCRUMB -->
				<ul class="breadcrumb push-down-0">
					<li><a href="/moyeo/one/main/main.jsp">Home</a></li>
					<li><a
						href="/moyeo/one/customer-support/customer_support_main.jsp">고객지원</a></li>
					<li class="active">공지사항</li>
				</ul>
				<!-- END BREADCRUMB -->

				<div class="page-title">
					<h2>
						<span class="fa fa-users"></span> Q&A <small> 무엇이든 질문을
							하세요! </small>
					</h2>
				</div>

				<div class="row" style="display:block; float:left;">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="table-responsive" style="width:110%;">
									<table class="table table-bordered table-striped table-actions">
										<tr>
											<th align="center" class="num"><font size="4">글
													번호</font></th>
											<th align="center" class="subject"><font size="4">제목</font>
											</th>
											<th align="center" class="writer"><font size="4">작성자</font>
											</th>
											<th align="center" class="announce"><font size="4">작성일</font>
											</th>
											<th align="center" class="count"><font size="4">조회수</font>
											</th>
											<th align="center" class="answer"><font size="4">답변여부</font>
											</th>
										</tr>

										<c:if test="${cnt > 0}">
											<c:forEach var="dto" items="${dtos}">
												<tr>
													<td align="center"><font size="4"> ${number} </font> <c:set
															var="number" value="${number-1}" /></td>

													<td align="center"><font size="4"> <a
															href="/moyeo/one/qnaContentForm?qboard_num=${dto.qboard_num}&pageNum=${pageNum}&number=${number+1}">${dto.title}</a>
													</font></td>

													<td align="center"><font size="4">
															${dto.mem_id} </font></td>

													<td align="center"><font size="4"> <fmt:formatDate
																value="${dto.write_date}" type="both"
																pattern="yyyy-MM-dd HH:mm" />
													</font></td>

													<td align="center"><font size="4"> ${dto.hit} </font>
													</td>

													<c:if test="${dto.status == 'YES'}">
														<td align="center"><font style="color: blue" size="4">답변완료</font>
														</td>
													</c:if>

													<c:if test="${dto.status != 'YES'}">
														<td align="center"><font size="4"> 답변전 </font></td>
													</c:if>
											</c:forEach>
										</c:if>

									</table>
									<div align="center">
										<c:if test="${cnt > 0}">
											<!-- 처음[◀◀] 이전[◀] ▶-->
											<c:if test="${startPage > pageBlock}">
												<a href="/moyeo/one/qna">[◀◀]</a>
												<a href="/moyeo/one/qna?pageNum=${startPage - pageBlock}">[◀]</a>
											</c:if>

											<c:forEach var="i" begin="${startPage}" end="${endPage}">
												<c:if test="${i == currentPage}">
													<span><b>[${i}]</b></span>
												</c:if>

												<c:if test="${i != currentPage}">
													<a href="/moyeo/one/qna?pageNum=${i}">[${i}]</a>
												</c:if>
											</c:forEach>

											<!-- 다음블록[▶] 끝[▶▶]-->
											<c:if test="${pageCount > endPage}">
												<a href="/moyeo/one/qna?pageNum=${startPage + pageBlock}">[▶]</a>
												<a href="/moyeo/one/qna?pageNum=${pageCount}">[▶▶]</a>
											</c:if>
										</c:if>

										<c:if test="${cnt ==0}">
											<tr>
												<td colspan="6" align="center">게시판에 글이 없습니다.</td>
											</tr>
										</c:if>


									</div>
								</div>
							</div>
						</div>
						<a href="/moyeo/one/qnaWrite"><input type="button"
							class="button" value="글쓰기"></a>
						<ul
							class="pagination pagination-sm pull-right push-down-20 push-up-20"
							style="align: center;">

						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../etc/footer.jsp"%>
</body>
</html>
