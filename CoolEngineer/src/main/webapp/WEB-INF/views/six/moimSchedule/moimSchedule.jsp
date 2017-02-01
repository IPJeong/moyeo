<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../../etc/moim_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	.col-md-55 {
		width: 100%;
		height: 550px;
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

<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="/moyeo/main/home">Home</a></li>
	<li><a href="/moyeo/six/category/category_hobby">모임</a></li>
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${group_name}</a></li>
	<li class="active">모임 일정</li>
</ul>
<!-- END BREADCRUMB -->

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
						<h3>모임일정</h3>
					</div>
				</div>
				<div class="panel-body padding-0"
					style="text-align: center; font-size: 25px;">
					<div class="chart-hodler"
						style="width: 97%; height: 260px; margin-top: 0px; /* border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; */ margin: 10px; margin-top: 20px">
						<div style="height: 100%;">
							<img
								src="${main_pic_pathB}/${main_pic_nameB}"
								width="55%" height="240px" style="float: left;">
							<div style="width: 40%; height: 200px; float: left;"><br>${dto.group_intro}</div>
						
							<div style="width:40%; height:45px; float:left;">
								
									<a href="../moim/moim_cheif_member.jsp">
										<input type="button"
											value="모임원관리"
											style="width: 26%; height: 40px; font-size: 13px;">
									</a> 
									<a href="../moim/moim_schedule.jsp">
										<input type="button"
											value="일정관리"
											style="width: 26%; height: 40px; font-size: 13px;">
									</a> 
									<a>
										<input type="button" 
											value="지역설정"
											style="width: 26%; height: 40px; font-size: 13px;">
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
							style="width: 860px; height: 480px; margin: 10px; margin-top: 65px">
							<c:if test="${cnt > 0}">

								<c:forEach var="dto" items="${dtos}" begin="0" end="1">
									<input type="hidden" name="meeting_num"
										value="${dto.meeting_num}">




									<div class="chart-holder"
										style="width: 680px; height: 180px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 30px; margin-left: 50px">
										<div style="width: 25%; height: 100%; float: left">
											<div style="width: 100%; height: 100%; magin: 5px 5px;">
												<form name="left" style="height: 100%;">
													<input type="text" name="week" value="${dto.meeting_date}"
														style="width: 100%; height: 25%; font-size: 130%; border: 0px; text-align: center; background: rgba(236, 181, 60, 0.82);">
													<input type="text" name="day" value=""
														style="width: 100%; height: 75%; text-align: center; font-size: 400%; color: black;">
												</form>
											</div>
										</div>

										<div style="width: 50%; height: 100%; float: left">
											<p
												style="text-align: left; margin-top: 15px; margin-left: 20px; font-size: 20px;">
												<font color="#1d1f21">모임명 :</font> ${dto.meeting_title}
											</p>
											<p
												style="text-align: left; margin-left: 20px; font-size: 20px;">
												<font color="#1d1f21">일시 :</font> ${dto.meeting_date}
											</p>
											<p
												style="text-align: left; margin-left: 20px; font-size: 20px;">
												<font color="#1d1f21">장소 :</font> ${dto.loc_detail}
											</p>
											<p
												style="text-align: left; margin-left: 20px; font-size: 20px;">
												<font color="#1d1f21">목표인원 :</font> ${dto.meeting_pernum}
											</p>
										</div>

										<input type="button" value="상세보기"
											style="width: 100px; height: 40px; font-size: 13px; position: absolute; left: 610px; margin-top: 15px;"
											onclick="window.open('moimScheduleContents?meeting_num='+${dto.meeting_num},'', 'menubar=no, toolbar=no, width=950, height=450, left=300, top=100')"><br>
										
									</div>
								</c:forEach>
							</c:if>

							<a href="../moimSchedule/moimRegister?group_num=${group_num}"
								style="position: relative; align: center;"><input
								type="button" value="모임만들기"
								style="width: 100px; height: 35px; font-size: 15px;"></a> <a
								href="../moimSchedule/moimScheduleDetail?group_num=${group_num}"
								style="position: relative; left: 350px; font-size: 17px;"> +
								더 보기</a>
						</div>
					</div>

				</div>
				<div id="aba" style="text-align: right"></div>
			</div>
		</div>
		<!-- END PHOTO BLOCK -->
	</div>
</div>
<!-- END ROW -->

<%@ include file="../../etc/footer.jsp"%>