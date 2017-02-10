<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../etc/moim_header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<style>
@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features
		{
		width: 100%;
		background-color: #FBFBFB;
		padding: 0px 20px;
	}
}

@media ( min-width : 1100px) {
	.col-md-56 {
		width: 60%;
		height: 870px;
	}
}

@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open
		{
		display: block;
	}
}

.chart-holder {
	height: 100%;
}

.main {
	height: 100%;
}

.panel .panel-body {
	height: 100%;
	overflow: auto;
}

.col-md-25 {
	display: block;
}

li {
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}

img {
	margin: 10px 10px 10px 10px;
}


</style>

<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="../main/main.jsp">Home</a></li>
	<li><a href="../category/category_hobby">모임</a></li>
	<li class="active">${open_dto.group_name}</li>

</ul>
<!-- END BREADCRUMB -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/moyeo/resources/customScript/six.js"></script>

<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">

		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->

		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임소개</h3>
					</div>
					<div class="panel-title-box" style="float:right;">
						<c:if test="${favo_cnt == 0}">
							<button id="fav" type="button" class="btn btn-default btn-rounded"><i class="fa fa-heart-o"></i>관심모임</button>
						</c:if>
						<c:if test="${favo_cnt == 1}">
							<button id="fav" type="button" class="btn btn-default btn-rounded"><i class="fa fa-heart" style="color:red;"></i>관심모임</button>
						</c:if>
					</div>
				</div>
				<div class="panel-body padding-0"
					style="text-align: center; font-size: 25px;">
					<div class="chart-hodler"
						style="width: 97%; height: 260px; margin-top: 0px; /* border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; */ margin: 10px; margin-top: 20px">
						<div style="height: 100%;">
							<div style="width:50%;"><img
								src="${main_pic_path}/${main_pic_name}"
								width="100%" height="240px" style="float: left;">
							</div>
							<div style="width: 47%; height: 200px; float: left;"><br>${open_dto.group_intro}
							</div>
							<div style="width: 47%; height: 45px; float: left;">
								<c:if test="${group_per == 1}">
									<input type="button" class="btn btn-warning"
										value="사진등록"
										style="width: 20%; height: 40px; font-size: 13px" onclick="window.open('moimAddImageb','','menubar=no, toolbar=no, width=450, height=170, left=950, top=150')"> 
								</c:if>
								
								<c:if test="${group_per == 4}">
									<a href="../../two/moimJoinForm?group_num=${group_num}">
									<input type="button" class="btn btn-warning"
										value="모임가입"
										style="width: 20%; height: 40px; font-size: 13px"></a> 
								</c:if>	
								
								<c:if test="${group_per != 4}">
									<a
										href="../../two/moimWithdraw?group_num=${group_num}">
									<input type="button" class="btn btn-warning"
										value="모임탈퇴"
										style="width: 20%; height: 40px; font-size: 13px"></a> 
								</c:if>
							
								<a>
								<input class="btn btn-warning"	type="button" value="모임신고" onclick="window.location='/moyeo/one/moimReportMain?group_num='+${group_num}" style="width: 20%; height: 40px; font-size: 13px">
								</a>
							</div>
						</div>
					</div>
					
					<div class="panel-heading" style="">
						<h3>${dto.group_name}</h3>
					</div>

					<div class="chart-holder" id="dashboard-bar-1"
						style="height: 10px;">

						<div class="chart-hodler"
							style="width: 97%; height: 420px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px ; margin-top: 65px">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>공지사항 게시판</h3>
									</div>
								</div>
								<div class="" style="text-align: center; font-size: 25px; ">
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 10px; margin-top:10px;">
										<div>
										<br>
											<table class="table table-striped table-hover" style="width: 90%; margin-left: 5%;">
												<thead>
													<tr class="info">
														<td style="width: 5%">번호</td>
														<td style="width: 35%">제목</td>
														<td style="width: 7%">작성자</td>
														<td style="width: 15%">작성일</td>
														<td style="width: 8%">조회수</td>
													</tr>
												</thead>
												<tbody>
													<c:if test="${fn:length(dtos) > 0}">
														<c:forEach var="dto" items="${dtos}">
															<tr>
																<td>${number}</td>
																<c:set var="number" value="${number-1}" />
					
																<td><a
																	href="/moyeo/four/moim_notice_contentform?num=${dto.group_noti_num}&pageNum=${pageNum}&number=${number+1}">
																		${dto.group_noti_title}</a></td>
																<td>${dto.mem_id}</td>
					
																<td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.group_noti_date}" />
																</td>
																<td>${dto.hit}</td>
															</tr>
														</c:forEach>
													</c:if>
													<c:if test="${fn:length(dtos) == 0}">
														<tr>
															<td colspan="5" rowspan="3">
																<h3>아직 등록된 공지사항이 없습니다. 공지사항을 등록해 보세요.</h3>
															</td>
													</c:if>
												</tbody>
											</table>
										</div>

										<div class="" style="text-align: center; font-size: 15px">
											<div class="chart-holder" id="dashboard-bar-1"
												style="height: 15px; margin-left: 5%">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="aba" style="text-align: right"></div>
				</div>
			</div>
			<!-- END PHOTO BLOCK -->

			<!-- START MOVIE BLOCK -->

			<!-- END MOVIE BLOCK -->

			<!-- START REALTIME MEET BLOCK -->

			<!-- END REALTIME MEET BLOCK -->

			<!-- START RECOMMENDATION LOCATION BLOCK -->

			<!-- END RECOMMENDATION LOCATION BLOCK -->

			<!-- START EVENT BLOCK -->

			<!-- END EVENT BLOCK -->

			<!-- START ADVERTISE BLOCK -->

			<!-- END ADVERTISE BLOCK -->

			<!-- START REVIEW BLOCK -->

			<!-- END REVIEW BLOCK -->
		</div>
	</div>
</div>
<!-- END ROW -->

<%@ include file="../../etc/footer.jsp"%>