<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../../etc/moim_header.jsp"%>

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
						style="width: 950px; height: 830px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 20px">

						<form action="moimScheduleModifyPro" name="register">
							<div class="chart-holder"
								style="width: 870px; height: 780px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 20px; margin-left: 40px">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/calendar.jpg"
									width="250px" height="200px"
									style="position: relative; left: -290px; magin: 5px 5px; text-align: left;">
								<p style="margin-top: -130px">
									<input type="hidden" name="map" value="${meeting_dto.meeting_loc}">
									<input type="hidden" name="meeting_num"
										value="${meeting_dto.meeting_num}"> <input type="text"
										name="meeting_title" value="${meeting_dto.meeting_title}"
										style="width: 500px; font-size: 18px; margin-left: 230px; height: 40px; margin-top: -70px"
										required>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									일자 : <input type="date" name="meeting_date" value="${date}"
										style="width: 350px; height: 40px; font-size: 18px; margin-left: 0px; margin-top: 0;"
										required><br>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									시간 : <input type="time" name="meeting_time" value="${time}"
											style="width: 350px; height: 40px; font-size: 18px; margin-left: 0px; margin-top: 30px"
											required> 
										<input type="button" name="meeting_loc"
											value="${meeting_dto.meeting_loc}"
											style="width: 550px; height: 40px; font-size: 18px; margin-left: 20px; margin-top: 30px;"
											onclick="window.open('moimRegisterMap','','menubar=no, toolbar=no, width=800, height=450, left=450, top=270')"
											required> <br> 
										<input type="text"
											name="loc_detail" value="${meeting_dto.loc_detail}"
											style="width: 550px; height: 40px; font-size: 18px; margin-left: 10px; margin-top: 30px;"
											required> 
										<input type="number" min="0" max="99999999" name="meeting_cost"
											value="${meeting_dto.meeting_cost}"
											style="width: 550px; height: 40px; font-size: 18px; margin-left: 50px; margin-top: 30px;"
											required> 원 <br>
										<input type="number" min="0" max="99999" 
											name="meeting_pernum" value="${meeting_dto.meeting_pernum}"
											style="width: 550px; height: 40px; font-size: 18px; margin-left: 50px; margin-top: 30px;"
											required> 명 <br>
										<textarea class="input" rows="10" cols="40"
											name="meeting_detail"
											style="width: 800px; height: 200px; font-size: 18px; margin-left: 7px; margin-top: 30px;"
											required>${meeting_dto.meeting_detail}</textarea>

								</p>

								<input type="submit" value="수정"
									style="margin-left: 0px; margin-top: 10px; width: 100px; height: 35px; font-size: 13px;">
								<input type="reset" value="취소"
									style="margin-left: 0px; margin-top: 10px; width: 100px; height: 35px; font-size: 13px;"
									onclick="window.location='moimScheduleDetail?group_num=${group_num}'">
							</div>
						</form>

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
<!-- END ROW -->

<%@ include file="../../etc/footer.jsp"%>