<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../../etc/header2.jsp"%>

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
	src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/highlight/jquery.highlight-4.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>

<script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/faq.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/jquery-1.12.4.js"></script>
<!-- END TEMPLATE -->

<script type="text/javascript">
	
	$(function(){
		$("#fade > #button").fadeToggle(0);
		$("#fadeButton > #modifyButton").click(function() {
			$("#fade > #button").fadeToggle(200);
		});		
	});
	
	$(function(){
		$("#fade > #button2").fadeToggle(0);
		$("#dfadeButton > #deleteButton").click(function() {
			$("#fade > #button2").fadeToggle(200);
		});		
	});
	
	$(function(){
		$("#fade2 > #button3").fadeToggle(0);
		$("#dCtgfadeButton > #deleteCtgButton").click(function() {
			$("#fade2 > #button3").fadeToggle(200);
		});		
	});
</script>
<style>
.btn-success:active, .btn-success:active:focus {
	background-color: #9bb2be;
	border-color: #9bb2be;
}

.btn-success {
	background-color: white;
	border-color: #c5c4c6;
	color: #82a3b9;
}

.btn-success:hover {
	background-color: #a0b5c1;
	border-color: #a8d5f8;
	color: white;
}

.col-md-3 {
	width: 43%;
	margin: 0;
}

.col-md-4 {
	width: 43%;
}

.col-md-5 {
	width: 90%;
	margin: auto;
}

.col-md-8 {
	width: 50%;
}

.col-md-12 {
	
}

.input-group {
	width: 100%;
}

.profile {
	background: #e3dbd7;
}
</style>
				<!-- START BREADCRUMB -->
				<ul class="breadcrumb">
					<li><a href="../main/main.jsp">Home</a></li>
					<li class="active">고객지원</li>
				</ul>
				<!-- END BREADCRUMB -->

				<!-- PAGE TITLE -->
				<div class="page-title">
					<h2>
						<span class="fa fa-users"></span> 고객지원 <small>CUSTOMER
							CENTER</small>
					</h2>
				</div>
				<!-- END PAGE TITLE -->

				<!-- PAGE CONTENT WRAPPER -->
				<div class="page-content-wrap">

					<div class="row">
						<div class="col-md-12">

							<div class="panel panel-default">
								<div class="panel-body">
									<p>검색 후 문의가 해결되지 않으면 Q&A를 이용하세요.</p>
									<form class="form-horizontal">
										<div class="form-group">
											<div class="col-md-8" style="float: left">
												<div class="input-group">
													<div class="input-group-addon">
														<span class="fa fa-search"></span>
													</div>
													<input type="text" class="form-control"
														placeholder="문의 내용을 입력해주세요" />
													<div class="input-group-btn">
														<button class="btn btn-primary">Search</button>
													</div>
												</div>
											</div>
											<div class="col-md-4" style="float: left; top: -5px">
												<input type="button" class="btn btn-success btn-block"
													style="margin: 5px; float: left; width: 20%;" value="건의사항"
													onclick="window.location='/moyeo/two/suggestionInputForm'">
												
												<c:if test="${sessionScope.authority == '02' || sessionScope.authority == '08'}">
													<input type="button" class="btn btn-success btn-warning"
														style="margin: 5px; float: left; width: 20%;"
														value="건의사항확인"
														onclick="window.location='/moyeo/two/suggestionList'">
												</c:if>		
											</div>
										</div>
									</form>
								</div>
							</div>

						</div>
					</div>

					<div class="row" style="margin: auto;">
						<div class="col-md-3" style="margin-left: 100px;">
							<!-- CONTACT ITEM -->
							<div class="panel panel-default" style="height: 200px;">
								<div class="panel-body profile">
									<div class="profile-data">
										<div class="profile-data-name">
											<a href="/moyeo/three/faq/" style="font-size: 17px;">FAQ</a>
										</div>
									</div>
								</div>
								<div class="panel-body faq"
									style="text-size: 10px; height: 150px; overflow: auto;">
									<div class="contact-info">
										<c:forEach var="dto" items="${dtos2}" begin="0" end="3">
											<div class="faq-item" style="padding: 0px; margin: 0px;">
												<div class="faq-title" style="size: 5px;" id="fade">
													<span class="" style="left: -20px"></span><font size="2px" color="black"><b>${dto.faqTitle}</b></font>
												</div>
												<div class="faq-text" style="padding: 0px; margin: 0px;">
													<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.faqContent}</p>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>

							<!-- END CONTACT ITEM -->
						</div>

						<div class="col-md-3" style="margin: auto;">
							<!-- CONTACT ITEM -->
							<div class="panel panel-default" style="height: 200px;">
								<div class="panel-body profile">
									<div class="profile-data">
										<div class="profile-data-name">
											<a href="/moyeo/six/notice/notice" style="font-size: 17px;">공지사항</a>
										</div>

									</div>
								</div>
								<div class="panel-body" style="padding: 0px;">
									<div class="contact-info">
										<c:forEach var="dto" items="${dtos}" begin="0" end="4">

											<p style="margin: 9px; font-size: 13px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
													href="../six/notice/noticeContent?noti_num=${dto.noti_num}&pageNum=${pageNum}">
													<font color="black"><b>${dto.noti_title}</b></font> </a>
													<span style="float:right; margin-right:30px"><b>${fn:substring(dto.noti_date, 0, 10)}</b></span>
													
											</p>
										</c:forEach>
									</div>
								</div>
							</div>
							<!-- END CONTACT ITEM -->
						</div>

						<div class="col-md-3" style="margin-left: 100px;">
							<!-- CONTACT ITEM -->
							<div class="panel panel-default" style="height: 200px;">
								<div class="panel-body profile">
									<div class="profile-data">
										<div class="profile-data-name">
											<a href="/moyeo/one/qna/" style="font-size: 17px;">Q&A</a>
										</div>

									</div>
								</div>
								<div class="panel-body" style="padding: 0px;">
									<div class="contact-info">
										<c:forEach var="dto" items="${dtos3}" begin="0" end="4">

											<p style="margin: 9px; font-size: 13px;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
													href="../one/qnaContentForm?qboard_num=${dto.qboard_num}&pageNum=${pageNum}&number=${dto.qboard_num}">
													<font color="black"><b>${dto.title}</b></font> </a>
													<span style="float:right; margin-right:30px"><b>${fn:substring(dto.write_date, 0, 10)}</b></span>
													
													
													
											</p>
										</c:forEach>
									</div>
								</div>
							</div>
							<!-- END CONTACT ITEM -->
						</div>

						<div class="col-md-3" style="margin: auto;">
							<!-- CONTACT ITEM -->
							<div class="panel panel-default" style="height: 200px;">
								<div class="panel-body profile">
									<div class="profile-data">
										<div class="profile-data-name">
											<a href="/moyeo/three/ing_event" style="font-size: 17px;">이벤트</a>
										</div>

									</div>
								</div>
								<div class="panel-body" style="padding: 0px;">
									<div class="contact-info">
										<div class="contact-info">
											<c:forEach var="dto" items="${dtos4}" begin="0" end="4">
	
												<p style="margin: 9px; font-size: 13px;">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<font color="black"><b>${dto.eventTitle}</b></font>  
														<span style="float:right; margin-left:30px;"><font color="red"><b>당첨자발표 : ${fn:substring(dto.notiDate, 2, 10)}</b></font></span>	
														<span style="float:right;"><b>기간 : ${fn:substring(dto.startDate, 2, 10)}~${fn:substring(dto.endDate, 2, 10)}</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														
												</p>
											</c:forEach>
										</div>

									</div>
								</div>
							</div>
							<!-- END CONTACT ITEM -->
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../etc/footer.jsp"%>
</body>
</html>