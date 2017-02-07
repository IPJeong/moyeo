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
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${open_dto.group_name}</a></li>
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
						<a><h3>모임일정</h3></a>
					</div>
				</div>
				<div class="panel-body padding-0"
					style="text-align: center; font-size: 25px;">

					<div class="chart-hodler"
						style="width: 950px; height: 830px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 20px">

						<form action="moimRegisterPro?group_num=${group_num}" name="register">
							<div class="chart-holder"
								style="width: 870px; height: 780px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 20px; margin-left: 40px">
								<img
									src="/moyeo/resources/resource/assets/images/gallery/calendar.jpg"
									width="250px" height="200px"
									style="position: relative; left: -290px; magin: 5px 5px; text-align: left;">
								<p style="margin-top: -130px">
									<input type="hidden" name="map" value=""> 
									<input
										type="text" name="meeting_title" placeholder="모임 이름을 입력하세요."
										maxlength="30" style="width: 500px; font-size: 18px; margin-left: 230px; height: 40px; margin-top: -70px"
										required>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									일자 : <input type="date" name="meeting_date" style="width: 350px; font-size: 18px; height: 40px; margin-left: 0px; margin-top:"0" required><br>
<!-- 									일자 : <input type="text" class="form-control datepicker" style="width: 350px; font-size: 18px; height: 40px; margin-left: 0px; margin-top: 30px;" value="2015-08-04" required> -->
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									시간 : <input type="time" name="meeting_time"
											style="width: 350px; font-size: 18px; height: 40px; margin-left: 0px; margin-top: 30px"
											required> 
										<input type="button" name="meeting_loc" class="btn btn-default"
											value="클릭하여 모임 장소를 선택해주세요."
											style="width: 550px; border-color: #dcacac; font-size: 18px; height: 40px; margin-left: 20px; margin-top: 30px;"
											onclick="window.open('moimRegisterMap','','menubar=no, toolbar=no, width=800, height=450, left=450, top=270')"
											required> <br> 
										<input type="text"
											name="loc_detail" maxlength="40" placeholder="모임장소에 대한 설명을 입력해주세요."
											style="width: 550px; font-size: 18px; height: 40px; margin-left: 10px; margin-top: 30px;"
											required> <br> 
										<input type="number" min="0" max="99999999" 
											name="meeting_cost" placeholder="참석비용을 입력하세요.(숫자만 입력가능)"
											style="width: 550px; font-size: 18px; height: 40px; margin-left: 50px; margin-top: 30px;"
											required> 원 <br> 
										<input type="number" min="0" max="99999" 
											name="meeting_pernum" placeholder="정원을 입력하세요.(숫자만 입력가능)"
											style="width: 550px; font-size: 18px; height: 40px; margin-left: 50px; margin-top: 30px;"
											required> 명 <br>
										<textarea class="input" rows="10" cols="40"
											name="meeting_detail" maxlength="50" placeholder="모임에 대한 설명을 입력해주세요."
											style="width: 800px; font-size: 18px; height: 200px; margin-left: 7px; margin-top: 30px;"
											required></textarea>
											</p>

								<input type="submit" value="모임만들기" class="btn btn-info" 
									style="margin-left: 0px; margin-top: 10px; width: 100px; height: 35px; font-size: 13px;">
								<input type="reset" value="취소" class="btn btn-default"
									style="margin-left: 0px; margin-top: 10px; width: 100px; height: 35px; font-size: 13px;"
									onclick="window.location='moimSchedule?group_num=${group_num}'">
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