<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.col-md-3 {
	margin-left: 22%;
	width: 55%;
}
</style>

<script type="text/javascript">
	function delChk() {
		if (confirm("정말 삭제하시겠습니까?\n(답변이 달린 경우 함께 삭제됩니다.)")) {
			window.location = '/moyeo/one/qnaDeletePro?qboard_num=' + ${dto.qboard_num}+'&pageNum=' + ${pageNum};
			}
		}

	function delAnsChk(num) {
		if (confirm("정말 삭제하시겠습니까?")) {
			window.location = '/moyeo/one/qnaAnsDelPro?reply_num=' + num + '&pageNum=' + ${pageNum}+"&qboard_num=" + ${qboard_num}+"&number=" + ${number};
			//window.location='qnaAnsDelPro?reply_num='+${bdto.reply_num}+'&pageNum='+${pageNum};
		}
	}
</script>
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
					<form class="form-horizontal">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">
									<strong>Q&A</strong> 질문내용
								</h3>
								<ul class="panel-controls">
									<li><a href="#" class="panel-remove"><span
											class="fa fa-times"></span></a></li>
								</ul>
							</div>
							<div class="panel-body"></div>

							<div class="col-md-3">
								<div class="panel panel-default form-horizontal">
									<div class="panel-body">
										<h3>
											<span class="fa fa-info-circle"></span> Q&A 질문
										</h3>
										<p>등록한 질문을 확인하세요</p>
									</div>
									<div class="panel-body form-group-separated">
										<div class="form-group" style="width: 100%;">
											<label class="col-md-4 col-xs-5 control-label"
												style="width: 18%;">작성날짜</label>
											<div class="col-md-8 col-xs-7 line-height-30"
												style="width: 82%;">
												<fmt:formatDate value="${dto.write_date}" type="both"
													pattern="yyyy-MM-dd HH:mm" />
											</div>
										</div>

										<div class="form-group" style="width: 100%;">
											<label class="col-md-4 col-xs-5 control-label"
												style="width: 18%;">작성자</label>
											<div class="col-md-8 col-xs-7 line-height-30"
												style="width: 82%;">${dto.mem_id}</div>
										</div>

										<div class="form-group" style="width: 100%;">
											<label class="col-md-4 col-xs-5 control-label"
												style="width: 18%;">글제목</label>
											<div class="col-md-8 col-xs-7" style="width: 82%;">${dto.title}</div>
										</div>

										<div class="form-group" style="width: 100%;">
											<label class="col-md-4 col-xs-5 control-label"
												style="width: 18%;">글내용</label>
											<div class="col-md-8 col-xs-7 line-height-30"
												style="width: 82%;">${dto.content}</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-3"
								style="width: 50%; margin-left: 24%; background: #EAEAEA">
								<div class="panel panel-default form-horizontal">
									<div class="panel-body">
										<h3>
											<span class="fa fa-info-circle"></span> 답변
										</h3>
									</div>
									<c:forEach var="bdto" items="${bdtos}">
										<div class="panel-body form-group-separated"
											style="border: 2px solid black; margin-top: 5px;">
											<div class="form-group" style="width: 100%;">
												<label class="col-md-4 col-xs-5 control-label"
													style="width: 18%;">작성자</label>
												<div class="col-md-8 col-xs-7 line-height-30"
													style="width: 82%;">${bdto.manager_id}
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<fmt:formatDate value="${bdto.write_date}" type="both"
														pattern="yyyy-MM-dd HH:mm" />
													<input type="button" value="삭제" style="margin-left: 65%"
														onclick="delAnsChk('${bdto.reply_num}');">
												</div>
											</div>

											<div class="form-group" style="width: 100%;">
												<label class="col-md-4 col-xs-5 control-label"
													style="width: 18%;">답변내용</label>
												<div class="col-md-8 col-xs-7 line-height-30"
													style="width: 82%;">${bdto.reply_content}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>


							<div class="panel-footer">
								<div class="button">

									<c:if
										test="${sessionScope.authority=='02' || sessionScope.authority=='08'}">
										<input type="button" class="btn btn-primary pull-right"
											value="답글쓰기"
											onclick="window.location='qnaAnswerForm?qboard_num=${dto.qboard_num}&pageNum=${pageNum}&number=${number}'">

									</c:if>

									<c:if
										test="${mem_id==dto.mem_id || sessionScope.authority=='02' || sessionScope.authority=='08'}">
										<input type="button" class="btn btn-primary pull-right"
											value="삭제" onclick="delChk();">
									</c:if>


									<c:if test="${mem_id==dto.mem_id}">
										<input type="button" class="btn btn-primary pull-right"
											value="수정"
											onclick="window.location='qnaModifyForm?qboard_num=${dto.qboard_num}&pageNum=${pageNum}&number=${number}'">
									</c:if>

									<input type="button" class="btn btn-primary pull-right"
										value="목록" onclick="window.location='qna?pageNum=${pageNum}'">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%-- <div class="content-frame-body">

		<div class="panel panel-default" style="width: 50%; margin-left: 27%">
			<div class="panel-heading">
				<div class="pull-left">
					<!-- <img src="assets/images/users/user2.jpg" class="panel-title-image"
						alt="John Doe" /> -->
					<img src="${dto.propic_path}/${dto.propic_name}" class="panel-title-image"
						alt="John Doe" />
					
					<h3 class="panel-title">
						${dto.mem_id} <small>이메일부분</small>
					</h3>
				</div>
				<div class="pull-right">
					<button class="btn btn-default" onclick="window.location='qna?pageNum=${pageNum}'">목록</button>
				</div>
			</div>
			<div class="panel-body">
				<h3>
					${dto.title}<small class="pull-right text-muted"><span
						class="fa fa-clock-o"></span> ${dto.write_date}</small>
				</h3>

				<h4>${dto.content}</h4>
			</div>


			<div class="panel-heading"></div>


			<div class="col-md-3"
				style="width: 100%; margin-left: 0%; background: #EAEAEA">
				<div style="margin-top: 10%; height: 250px;">
								<!-- 메시지박스 시작 -->
		                        <div class="panel panel-default push-up-10">
		                            <div class="panel-body panel-body-search" id="msgBox" style="overflow: auto;">
		                            	<c:forEach var="replyDto" items="${replyDtos}">
				                            <div class="messages messages-img" id="reply${replyDto.postrep_num}">
					                            <div class="item">
					                                <div class="image">
<!-- 					                                    <img src="/moyeo/resources/resource/img/custom/manDef.jpg" alt="훈남입니다."> -->
					                                    <img src="${replyDto.propic_path}/${replyDto.propic_name}" alt="훈남입니다.">
					                                </div>                                
					                                <div class="text">
					                                    <div class="heading">
					                                        <a href="#">${replyDto.mem_id}</a>
					                                        <span class="date">${replyDto.write_date}</span>
					                                        <i class="time"></i>
					                                        <c:if test="${sessionScope.mem_id == replyDto.mem_id}">
						                                        <span style="margin-left:120px;">
						                                        	<a href="#" onclick="return deleteReply('${replyDto.postrep_num}')"><i class="fa fa-trash-o"></i>삭제</a>
						                                        </span>
					                                        </c:if>
					                                    </div>                                    
					                                    ${replyDto.reply_content}
					                                </div>
					                            </div>
					                        </div>   
				                        </c:forEach>                     
		                            </div>
		                            
	                              <div class="input-group">
	                              		<c:if test="${sessionScope.mem_id == null}">
	                                    <input type="text" class="form-control" placeholder="댓글을 남기려면 로그인해주세요." readonly="readonly">
	                                    </c:if>
	                                    <c:if test="${sessionScope.mem_id != null}">
	                                    <input type="text" id="reply_content" class="form-control" placeholder="댓글을 남겨보세요." onkeypress="keycheck(event);">
	                                    </c:if>
	                                    <div class="input-group-btn">
	                                        <button class="btn btn-default" onclick="addPostReply();">입력</button>
	                                    </div>
	                                </div>
		                        </div>
                        	    <!-- 메시지박스 끝 -->
						</div>
				<div class="panel panel-default form-horizontal">
					<div class="panel-body">
						<h3>
							<span class="fa fa-info-circle"></span> 답변
						</h3>
					</div>
					<c:forEach var="bdto" items="${bdtos}">
						<div class="panel-body form-group-separated"
							style="margin-top: 5px;">
							<div class="form-group" style="width: 100%;">
								<label class="col-md-4 col-xs-5 control-label"
									style="width: 18%;">작성자</label>
								<div class="col-md-8 col-xs-7 line-height-30"
									style="width: 82%;">${bdto.manager_id}
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<fmt:formatDate value="${bdto.write_date}" type="both"
										pattern="yyyy-MM-dd HH:mm" />
									<input type="button" value="삭제" style="margin-left: 65%"
										onclick="delAnsChk('${bdto.reply_num}');">
								</div>
							</div>

							<div class="form-group" style="width: 100%;">
								<label class="col-md-4 col-xs-5 control-label"
									style="width: 18%;">답변내용</label>
								<div class="col-md-8 col-xs-7 line-height-30"
									style="width: 82%;">${bdto.reply_content}</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div style="margin-top:72%">
			<div class="form-group push-up-20" style="margin-top:30%">
				<label>Quick Reply</label>
				<textarea class="form-control summernote_lite" rows="3"
					placeholder="Click to get editor"></textarea>
			</div>
			</div>
			<button class="btn btn-success pull-right">
				<span class="fa fa-mail-reply"></span> Post Reply
			</button>

		</div>
	</div> --%>
	<%@ include file="../../etc/footer.jsp"%>

	<!-- START PLUGINS -->
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
	<!-- END PLUGINS -->

	<!-- THIS PAGE PLUGINS -->
	<script type='text/javascript'
		src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
	<!-- END PAGE PLUGINS -->

	<!-- START TEMPLATE -->
	<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script> -->
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/actions.js"></script>

</body>

</html>


