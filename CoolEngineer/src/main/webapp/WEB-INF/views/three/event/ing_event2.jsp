<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../etc/header2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fmt3" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:useBean id="today" class="java.util.Date" />
<jsp:useBean id="sysdate" class="java.util.Date" />
<fmt2:formatDate value="${today}" pattern="yyyy-MM-dd" var="today" />
<fmt3:formatDate value="${sysdate}" pattern="HH:mm:ss" var="sysdate" />
<script type="text/javascript"
	src="/moyeo/resources/customScript/five.js"></script>

<script type="text/javascript">


	function dateChk() { //시작일 선택시 종료일과 발표일 동기화
		if (eventInsertForm.startDate.value != eventInsertForm.endDate.value) {
			document.eventInsertForm.endDate.value = document.eventInsertForm.startDate.value;
			document.eventInsertForm.notiDate.value = document.eventInsertForm.startDate.value;
		}
		;
	}

	function dateChk2() { //종료일이 시작일보다 빠르지 않게, 종료일 선택시 발표일과 동기화
		if (eventInsertForm.endDate.value != eventInsertForm.notiDate.value) {
			document.eventInsertForm.notiDate.value = document.eventInsertForm.endDate.value;
		}
		;
		if (eventInsertForm.endDate.value < eventInsertForm.startDate.value) {
			alert("종료일이 시작일 보다 빠를수는 없습니다.");
			document.eventInsertForm.endDate.value = document.eventInsertForm.startDate.value;
			document.eventInsertForm.notiDate.value = document.eventInsertForm.startDate.value;
		}
	}

	function dateChk3() { //발표일이 종료일보다 빠르지 않게		
		if (eventInsertForm.notiDate.value < eventInsertForm.endDate.value) {
			alert("당첨자발표일이 종료일 보다 빠를수는 없습니다.");
			document.eventInsertForm.notiDate.value = document.eventInsertForm.endDate.value;
		}
	}

	function participate(id, eventNum) {
		if (id == null) {
			alert("로그인이 필요합니다.");
			window.location = "/moyeo/main/memberLoginForm";
		} else if (id != 'admin') {
			window.location = 'eParticipate?=' + eventNum;
		} else {
			alert("관리자는 참여할 수 없습니다.");
		}
	}
	
	function openPart(evNum) {
		var windowW = 300;  // 창의 가로 길이
        var windowH = 70;  // 창의 세로 길이
        var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);

		window.open('eventParticipants?event_num=' + evNum, 'evePart', 'width=450, height=550, left=' + left + 'top=' + top);
	}
	
	function chkWin(winNum) {
		var windowW = 300;  // 창의 가로 길이
        var windowH = 70;  // 창의 세로 길이
        var left = Math.ceil((window.screen.width - windowW)/2);
        var top = Math.ceil((window.screen.height - windowH)/2);

		window.open('chkWin?winning_num=' + winNum, 'win', 'width=450, height=550, left=' + left + 'top=' + top);
	}
</script>
<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="#">Home</a></li>
	<li class="active">이벤트</li>
</ul>
<!-- END BREADCRUMB -->


<!-- PAGE CONTENT TABBED -->
<div class="page-tabs">
	<a href="#first-tab">진행중인 이벤트</a> <a href="#second-tab" class="active">
		당첨자 발표</a>
</div>

<div class="page-content-wrap page-tabs-item" id="first-tab">
	<c:if test="${sessionScope.authority == '02' || sessionScope.authority == '08'}">
		<div class="form-group">
			<div class="col-md-6-3" style="width: 70%;">
				<div class="col-md-2" style="float: right;">
					<button class="btn btn-info btn-block" data-toggle="modal"
						data-target="#modal_change_password" data-backdrop="static">EVENT
						등록</button>
				</div>
			</div>
		</div>
	</c:if>
	<div class="col-md-6-3 " style="width: 70%;">
		<div class="col-md-12">
			<table style="width: 100%;">
				<thead>
					<tr>
						<th style="padding-top: 5px;"><h2>진행중인 이벤트</h2></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${cnt > 0}">
						<c:forEach var="dto" items="${dtos}">
							<%-- <c:forEach var="dto2" items="${dtos2}"> --%>
							<c:if test="${dto.ing == 'Ing'}">
								<tr>
									<td style="padding-top: 5px;">
										<div class="col-md-3"
											style="width: 25%; height: 180px; padding: 0px;">
											<div class="panel panel-default" style="width: 100%">
												<div class="panel-body" style="height: 100%">
													<div class="text-center" id="user_image"
														style="width: 100%; height: 100%; padding: 3px;">
														<a href="#" data-toggle="modal"
															data-target="#${dto.eventNum}"
															style="text-decoration: none;"> <img
															src="${dto.picPath}/${dto.picName}"
															style="width: 100%; height: 100%;">
														</a>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-8"
											style="width: 75%; height: 180px; padding: 0px; padding-left: 10px;">
											<div class="panel panel-default form-horizontal">
												<div class="panel-body"
													style="padding-left: 0px; height: 20%;">
													<div class="form-group" style="height: 100%;">
														<label class="col-md-12 col-xs-12"
															style="padding: 0px; padding-left: 10px;"><a
															href="#" data-toggle="modal"
															data-target="#${dto.eventNum}"
															style="text-decoration: none;">${dto.eventTitle}</a></label>
													</div>
												</div>
												<div class="panel-body form-group-separated"
													style="height: 80%;">
													<div class="form-group" style="height: 60%;">
														<label class="col-md-12 col-xs-12 line-height-15"
															style="max-height: 31px;">${dto.eventCon}</label>
													</div>
													<div class="form-group" style="height: 40%;">
														<label class="col-md-10 col-xs-12 line-height-15">기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간&nbsp;&nbsp;
															<fmt:formatDate type="both" pattern="yy-MM-dd"
																value="${dto.startDate}" />&nbsp;~ <fmt:formatDate
																type="both" pattern="yy-MM-dd" value="${dto.endDate}" /><br>당첨자발표&nbsp;&nbsp;
															<font color="#8BC34A"><fmt:formatDate type="both"
																	pattern="yy-MM-dd" value="${dto.notiDate}" /></font>
														</label>
														<c:if test="${sessionScope.authority == '02' || sessionScope.authority == '08'}">
															<div class="col-md-2" style="border:0px;">
																<button type="button" class="btn btn-success btn-block"
																	onclick="openPart(${dto.eventNum})">참여자</button>
															</div>
														</c:if>
													</div>
												</div>
											</div>
										</div> 
										<!-- 이벤트 상세 페이지 모달 -->
										<div class="modal animated fadeIn" id="${dto.eventNum}"
											tabindex="-1" role="dialog" aria-labelledby="smallModalHead"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content"
													style="max-height: 85%; border-width: 0px;">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">&times;</span><span
																class="sr-only">Close</span>
														</button>
														<h4 class="modal-title" id="smallModalHead"
															style="font-weight: bold;">${dto.eventTitle}</h4>
													</div>
													<div
														class="modal-body form-horizontal form-group-separated">
														<div class="form-group col-md-12" style="padding: 0px;">
															<div class="col-md-3" style="width: 30%">
																<div class="text-center" id="user_image"
																	style="width: 100%; height: 100%; padding: 3px;">
																	<img src="${dto.picPath}/${dto.picName}"
																		style="width: 100%; height: 100%;">
																</div>
															</div>
															<div class="col-md-9" style="width: 70%; padding: 0px;">
																<div class="form-group" style="height: 50%;">
																	<label class="col-md-12 col-xs-12 line-height-30">등록자
																		: ${dto.adminId}</label>
																</div>
																<div class="form-group" style="height: 50%;">
																	<label class="col-md-12 col-xs-12 line-height-15"
																		style="margin: 0px;">기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간&nbsp;&nbsp;
																		<fmt:formatDate type="both" pattern="yy-MM-dd"
																			value="${dto.startDate}" />&nbsp;~ <fmt:formatDate
																			type="both" pattern="yy-MM-dd" value="${dto.endDate}" /><br>당첨자발표&nbsp;&nbsp;
																		<font color="#8BC34A"><fmt:formatDate
																				type="both" pattern="yy-MM-dd"
																				value="${dto.notiDate}" /></font>
																	</label>
																</div>
															</div>
														</div>
														<div class="form-group col-md-12"
															style="padding: 5px; text-align: center;">
															<c:forEach var="dto2" items="${dtos2}">
																<c:if test="${dto2.eventNum2 == dto.eventNum}">
																	<div class="col-md-12">
																		<div class="col-md-8"
																			style="margin: auto; width: 80%; float: none;">
																			<img src="${dto2.picPath2}/${dto2.picName2}"
																				style="width: 100%;">
																		</div>
																	</div>
																</c:if>
															</c:forEach>
															${dto.eventCon}
														</div>
														<div class="modal-footer">
															<c:if test="${sessionScope.authority == '02' || sessionScope.authority == '08'}">
															<button type="button" class="btn btn-danger"
																onclick="window.location='eventParticipate?memid=${sessionScope.mem_id}&evenum=${dto.eventNum}'" disabled>참여</button>
															</c:if>
															<c:if test="${sessionScope.authority != '02' && sessionScope.authority != '08'}">
															<button type="button" class="btn btn-danger"
																onclick="window.location='eventParticipate?memid=${sessionScope.mem_id}&evenum=${dto.eventNum}'">참여</button>
															</c:if>
															<!--  -->
															<button type="button" class="btn btn-default"
																data-dismiss="modal">닫기</button>
														</div>
													</div>
												</div>
											</div>
										</div> <!-- 이벤트 상세 페이지 모달 -->
									</td>
								</tr>
							</c:if>
							<%-- </c:forEach> --%>
						</c:forEach>
					</c:if>
					<c:if test="${cnt == 0}">
						<tr>
							<td>
								<div class="col-md-3"
									style="width: 25%; height: 180px; padding: 0px;">
									<div class="panel panel-default" style="width: 100%">
										<div class="panel-body"
											style="padding: 3px; text-align: center;">
											<div class="text-center" id="user_image"
												style="height: 100%;">등록된 이벤트가 없습니다.</div>
										</div>
									</div>
								</div>
								<div class="col-md-8"
									style="width: 75%; height: 180px; padding: 0px; padding-left: 10px;">
									<div class="panel panel-default form-horizontal">
										<div class="panel-body"
											style="padding-left: 0px; height: 20%;">
											<div class="form-group" style="height: 100%;">
												<label class="col-md-12 col-xs-12"
													style="padding: 0px; padding-left: 10px;"></label>
											</div>
										</div>
										<div class="panel-body form-group-separated"
											style="height: 80%;">
											<div class="form-group" style="height: 60%;">
												<label class="col-md-12 col-xs-12 line-height-30"></label>
											</div>
											<div class="form-group" style="height: 40%;">
												<label class="col-md-12 col-xs-12 line-height-15"></label>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ul
					class="pagination pagination-sm pull-right push-down-10 push-up-10">
					<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] 이전[◀]-->
						<c:if test="${startPage > pageBlock}">
							<li><a href="ing_event">«</a></li>
							<li><a href="ing_event?pageNum=${startPage - pageBlock}">‹</a></li>
						</c:if>

						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li class="active"><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i != currentPage}">
								<li><a href="ing_event?pageNum=${i}">${i}</a></li>
							</c:if>
						</c:forEach>

						<!-- 다음[▶] 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">
							<li><a href="ing_event?pageNum=${startPage + pageBlock}">›</a></li>
							<li><a href="ing_event?pageNum=${pageCount}">»</a></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="page-content-wrap page-tabs-item active" id="second-tab">
	<div class="row">
		<div class="col-md-6-3">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th width="75%">제목</th>
									<th width="15%">발표일</th>
									<th width="10%">이벤트내용</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${cnt2 > 0}">
								<c:forEach var="dto3" items="${dtos3}">
								<tr>								
									<td><a href="#" onclick="chkWin(${dto3.winning_num})" style="color:black"><strong>[당첨자 발표]</strong> ${dto3.eventTitle} 당첨자 발표</a></td>
									<td><font color="#0D47A1"><fmt:formatDate type="both" pattern="yy-MM-dd" value="${dto3.regDate}"/></font></td>
									<td><button type="button" class="btn btn-primary"
										data-toggle="modal"
										data-target="#${dto3.eventNum}"
										style="text-decoration: none;">이벤트내용</button>
										<c:forEach var="dto4" items="${dtos4}">
											<c:if test="${dto4.eventNum == dto3.eventNum}">
												<div class="modal animated fadeIn" id="${dto3.eventNum}"
													tabindex="-1" role="dialog" aria-labelledby="smallModalHead"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content"
															style="max-height: 85%; border-width: 0px;">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">
																	<span aria-hidden="true">&times;</span><span
																		class="sr-only">Close</span>
																</button>
																<h4 class="modal-title" id="smallModalHead"
																	style="font-weight: bold;">${dto4.eventTitle}</h4>
															</div>
															<div
																class="modal-body form-horizontal form-group-separated">
																<div class="form-group col-md-12" style="padding: 0px;">
																	<div class="col-md-3" style="width: 30%">
																		<div class="text-center" id="user_image"
																			style="width: 100%; height: 100%; padding: 3px;">
																			<img src="${dto4.picPath}/${dto4.picName}"
																				style="width: 100%; height: 100%;">
																		</div>
																	</div>
																	<div class="col-md-9" style="width: 70%; padding: 0px;">
																		<div class="form-group" style="height: 50%;">
																			<label class="col-md-12 col-xs-12 line-height-30">등록자
																				: ${dto4.adminId}</label>
																		</div>
																		<div class="form-group" style="height: 50%;">
																			<label class="col-md-12 col-xs-12 line-height-15"
																				style="margin: 0px;">종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;
																					<font color="#8BC34A"><fmt:formatDate
																						type="both" pattern="yy-MM-dd"
																						value="${dto3.regDate}" /></font>
																			</label>
																		</div>
																	</div>
																</div>
																<div class="form-group col-md-12"
																	style="padding: 5px; text-align: center;">
																	<c:forEach var="dto5" items="${dtos5}">
																		<c:if test="${dto5.eventNum2 == dto4.eventNum}">
																			<div class="col-md-12">
																				<div class="col-md-8"
																					style="margin: auto; width: 80%; float: none;">
																					<img src="${dto5.picPath2}/${dto5.picName2}"
																						style="width: 100%;">
																				</div>
																			</div>
																		</c:if>
																	</c:forEach>
																	${dto4.eventCon}
																</div>
																<div class="modal-footer">				
																	<!--  -->
																	<button type="button" class="btn btn-default"
																		data-dismiss="modal">닫기</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</td>
								</tr>
							</c:forEach>
							</c:if>	
							</tbody>
						</table>
						<div class="row">
							<div class="col-md-12">
								<ul
									class="pagination pagination-sm pull-right push-down-10 push-up-10">
									<c:if test="${cnt2 > 0}">
										<!-- 처음[◀◀] 이전[◀]-->
										<c:if test="${startPage2 > pageBlock2}">
											<li><a href="ing_event2">«</a></li>
											<li><a href="ing_event2?pageNum2=${startPage2 - pageBlock2}">‹</a></li>
										</c:if>
				
										<c:forEach var="i" begin="${startPage2}" end="${endPage2}">
											<c:if test="${i == currentPage2}">
												<li class="active"><a href="#">${i}</a></li>
											</c:if>
											<c:if test="${i != currentPage2}">
												<li><a href="ing_event2?pageNum2=${i}">${i}</a></li>
											</c:if>
										</c:forEach>
				
										<!-- 다음[▶] 끝[▶▶] -->
										<c:if test="${pageCount2 > endPage2}">
											<li><a href="ing_event2?pageNum2=${startPage2 + pageBlock2}">›</a></li>
											<li><a href="ing_event2?pageNum2=${pageCount2}">»</a></li>
										</c:if>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달창 -->
<!-- 이벤트 등록 -->
<div class="modal animated fadeIn" id="modal_change_password"
	tabindex="-1" role="dialog" aria-labelledby="smallModalHead"
	aria-hidden="true" style="border-width: 0px;">
	<div class="modal-dialog">
		<div class="modal-content" style="border-width: 0px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="smallModalHead">EVENT 등록</h4>
			</div>
			<form:form class="form-horizontal" action="eventInsert" method="post"
				name="eventInsertForm" modelAttribute="uploadForm"
				enctype="multipart/form-data">
				<div class="modal-body form-horizontal form-group-separated">
					<div class="form-group">
						<label class="col-md-3 control-label">이벤트제목</label>
						<div class="col-md-9">
							<input type="text" class="form-control" name="eventTitle"
								required />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">이벤트내용</label>
						<div class="col-md-9">
							<textarea class="form-control" name="eventCon"
								style="height: 100px; resize: none;" required></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">이벤트기간</label>
						<div class="col-md-5">
							<div class="input-group">
								<input type="text" class="form-control datepicker"
									name="startDate" value="${today}" onchange="dateChk();"
									required /> <span class="input-group-addon add-on"
									style="line-height: 0px; vertical-align: middle;"> - </span> <input
									type="text" class="form-control datepicker" name="endDate"
									value="${today}" onchange="dateChk2();" required />
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">당첨자발표</label>
						<div class="col-md-9">
							<input type="text" class="form-control datepicker"
								name="notiDate" value="${today}" onchange="dateChk3();" required />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">썸네일</label>
						<div class="col-md-9">
							<input type="file" id="filename1" name="files[0]"
								onchange="chkType('files[0]')" required />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">이벤트내용</label>
						<div class="col-md-9">
							<input type="file" id="filename2" name="files[1]"
								onchange="chkType('files[1]')" required />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</form:form>
		</div>
	</div>
</div>
<!-- 이벤트 등록 끝 -->
<!-- 모달창 끝 -->
<!-- END PAGE CONTENT TABBED -->

<%@ include file="../../etc/footer2.jsp"%>
