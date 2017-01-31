<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../../etc/moim_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features
		{
		width: 100%;
		background-color: #FBFBFB;
		padding: 0px 20px;
	}
}

@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open
		{
		display: block;
	}
}

@media ( min-width : 1100px) {
	.col-md-56 {
		width: 60%;
		height: 870px;
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
	overflow: scroll;
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		var weeks = document.getElementsByName("week");
		var days = document.getElementsByName("day");
		
		for(var i=0; i<weeks.length; i++) {
		
			var sDate = weeks[i].value;
			var yy = parseInt(sDate.substr(0, 4), 10); 
			var mm = parseInt(sDate.substr(5, 2), 10); 
			var dd = parseInt(sDate.substr(8), 10); 
			var d = new Date(yy,mm - 1, dd); 
			var weekday=new Array(7); weekday[0]="일"; weekday[1]="월"; weekday[2]="화"; weekday[3]="수"; weekday[4]="목"; weekday[5]="금"; weekday[6]="토"; 
			weeks[i].value = weekday[d.getDay()]+"요일"; 
			days[i].value = dd;
		
		}
	});
</script>
<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">

<!-- START LOGIN BLOCK -->
		<div class="col-md-51" style="height: 310px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임개요</h3>

					</div>
				</div>
				<div class="panel-body padding-0" style="height: 270px;">
					<div class="chart-holder" id="dashboard-line-1"
						style="height: 180px;">
						<center><img src="/moyeo/resources/resource/assets/images/gallery/pin.jpg"
							width="180px" height="130px" style="margin: auto;"><br>
						<font size="5">${group_name}</font></center>
						<br>
						<h3>
							<center>${group_inte1} -> ${group_inte2}</center>
						</h3>
						<center>
							<input type="button" style="margin-right:20px;" value="모임정보 수정" onclick="window.location='/moyeo/six/moimMain/moimModify?group_num=${group_num}'">
							<input type="button" style="margin-left:20px;" value="모임폐쇄" onclick="window.location='/moyeo/six/moimMain/moimDelete?group_num=${group_num}'">
						</center>

					</div>
				</div>
			</div>
		</div>
		<!-- END LOGIN BLOCK -->
		
			<!-- START RECOMMENDATION MEET BLOCK -->
		<div class="col-md-55" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>멤버리스트</h3>

					</div>
				</div>
				<div class="panel-body padding-0" style="height: 550px;">
					<div class="chart-holder" id="dashboard-line-1">
						<div class="main">
							<img src="/moyeo/resources/resource/assets/images/gallery/피카츄.png"
								width="150px" height="110px" style="magin: 5px 5px">피카츄 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[모임장]<br>
							<img src="/moyeo/resources/resource/assets/images/gallery/라이츄.png"
								width="150px" height="110px" style="magin: 5px 5px">라이츄 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
							<img src="/moyeo/resources/resource/assets/images/gallery/파이리.png"
								width="150px" height="110px" style="magin: 5px 5px">파이리 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
							<img src="/moyeo/resources/resource/assets/images/gallery/꼬부기.jpg"
								width="150px" height="110px" style="magin: 5px 5px">꼬부기 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END RECOMMENDATION MEET BLOCK -->

		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임일정</h3>
					</div>
				</div>
				<div class="panel-body padding-0"
					style="text-align: center; font-size: 25px;">
					<div class="chart-holder" id="dashboard-bar-1"
						style="height: 600px;">
					
						<div class="chart-hodler"
							style="width: 950px; height: 800px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 20px">
							<c:if test="${cnt > 0}">
							
								
								<c:forEach begin="0" end="${fn:length(dtos)-1}" varStatus="stat">
									<input type="hidden" name="meeting_num"
										value="${dtos[stat.index].meeting_num}">

									<div class="chart-holder"
										style="width: 750px; height: 180px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 30px; margin-left: 50px">
										<div style="width: 25%; height: 100%; float: left">
											<div style="width: 100%; height: 100%; magin: 5px 5px;">
												<form name="left" style="height: 100%;">
													<input type="text" name="week" value="${dtos[stat.index].meeting_date}"
														style="width: 100%; height: 25%; font-size: 130%; border: 0px; text-align: center; background: rgba(236, 181, 60, 0.82);">
													<input type="text" name="day" value=""
														style="width: 100%; height: 75%; text-align: center; font-size: 400%; color:black;">
												</form>
											</div>
										</div>

										<div style="width: 50%; height: 100%; float: left">
											<p style="text-align: left; margin-left: 20px; font-size: 20px; margin-top: 15px;"><font color="#1d1f21">모임명 :</font>
												${dtos[stat.index].meeting_title}</p>
											<p style="text-align: left; margin-left: 20px; font-size: 20px;"><font color="#1d1f21">일시 :</font>
												${dtos[stat.index].meeting_date}</p>
											<p style="text-align: left; margin-left: 20px; font-size: 20px;"><font color="#1d1f21">장소 :</font>
												${dtos[stat.index].loc_detail}</p>
											<p style="text-align: left; margin-left: 20px; font-size: 20px;"><font color="#1d1f21">인원 :</font> ${dtos2[stat.index]} /
												${dtos[stat.index].meeting_pernum}</p>
										</div>

										<div style="width: 25%; height: 100%; float: left">
<!-- 											<script type="text/javascript">
												function del() {
													if(confirm("정말로 삭제하겠습니까?")) {
														location.replace('moinScheduleDelete?meeting_num='+${dto.meeting_num});
													} else {
														return; 
													}
												}
												
												function modify() {
													if(confirm("수정하시겠습니까?")) {
														location.replace('moimScheduleModify?meeting_num='+${dto.meeting_num});
													} else {
														return;
													}
												}
											</script>
 -->											<input type="button" value="상세보기"
												style="width: 100px; height: 40px; font-size: 13px; margin: 7px; margin-top: 15px; float:left; margin-left:50px;" onclick="window.open('moimScheduleContents?meeting_num='+${dtos[stat.index].meeting_num},'', 'menubar=no, toolbar=no, width=800, height=500, left=450, top=270')"> 
											<input
												type="button" value="모임수정" style="width: 100px; height: 40px; font-size: 13px; margin: 7px; float:left; margin-left:50px;"
												onclick="window.location='moimScheduleModify?meeting_num=${dtos[stat.index].meeting_num}&group_num=${group_num}'"> 
											<input type="button"
												value="모임삭제" style="width: 100px; height: 40px; font-size: 13px; margin: 7px; float:left; margin-left:50px;" onclick="window.location='moimScheduleDelete?meeting_num=${dtos[stat.index].meeting_num}'">

										</div>
										<c:if test ="${dtos3[stat.index] eq 1}">
											<input type="button" value="참석취소"
												style="background:rgba(149, 130, 206, 0.8); color:white; height: 40px; font-size: 13px; width: 100px; position: absolute; left: 830px; margin-top: 40px"
												onclick="window.location='moimScheduleCancel?meeting_num=${dtos[stat.index].meeting_num}'"
												>
										</c:if>
										<c:if test ="${dtos3[stat.index] eq 0}"> 							
											<c:if test ="${dtos2[stat.index] < dtos[stat.index].meeting_pernum}">
												<input type="button" value="참석"
													style="height: 40px; font-size: 13px; width: 100px; position: absolute; left: 830px; margin-top: 40px"
													onclick="window.location='moimScheduleJoin?meeting_num=${dtos[stat.index].meeting_num}&pageNum=${i}'">
											</c:if>
											<c:if test ="${dtos2[stat.index] >= dtos[stat.index].meeting_pernum}">
												<input type="button" value="마감"
													style="background:#d27373; color:white; height: 40px; font-size: 13px; width: 100px; position: absolute; left: 830px; margin-top: 40px"
													>
											</c:if>
										</c:if>
										<br>
										<input type="button" value="참석멤버 보기"
													style="height: 40px; font-size: 13px; width: 100px; position: absolute; left: 830px; margin-top: 60px"
													onclick="window.open('moimScheduleMember?meeting_num='+${dtos[stat.index].meeting_num},'', 'menubar=no, toolbar=no, width=800, height=500, left=450, top=270')">
										

									</div>
								</c:forEach>
						
							</c:if>

							<a href="moimRegister?group_num=${group_num}"><input type="button" value="모임만들기"
								style="width: 100px; height: 40px; font-size: 13px; left: 900px"></a>
							<p style="margin-top: 10px; width: 100%;">

								<c:if test="${cnt > 0}">

									<c:if test="${startPage > pageBlock}">
										<a href="moimScheduleDetail?pageNum=${startPage - pageBlock}"><font
											size="4"> «</font></a>
									</c:if>


									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<a href="moimScheduleDetail?pageNum=${i}"><font size="4">${i}</font></a>
										</c:if>

										<c:if test="${i != currentPage}">
											<a href="moimScheduleDetail?pageNum=${i}"><font size="4">${i}</font></a>
										</c:if>

									</c:forEach>
									<c:if test="${pageCount > endPage}">
										<a href="moimScheduleDetail?pageNum=${startPage + pageBlock}"><font
											size="4">»</font></a>
									</c:if>
								</c:if>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="aba" style="text-align: right"></div>
	</div>
</div>
<!-- END PHOTO BLOCK -->

<!-- END ROW -->

<%@ include file="../../etc/footer.jsp"%>