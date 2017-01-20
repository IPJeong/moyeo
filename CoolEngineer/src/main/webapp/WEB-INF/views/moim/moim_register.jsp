<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../etc/moim_header.jsp"%>

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

@media (min-width: 1100px){
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

<!-- START ROW -->
<div class="row">
	<!-- 모임페이지 사이드바 시작 -->
	<%@include file="../etc/moim_side.jsp" %>
	<!-- 모임페이지 사이드바 종료 -->	

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top: 10px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<a href="../gallery/gallery.jsp"><h3>모임일정</h3></a>
				</div>
			</div>
			<div class="panel-body padding-0"
				style="text-align: center; font-size: 25px;">





				<div class="chart-holder" id="dashboard-bar-1" style="height: 600px;">

					<div class="chart-hodler"
						style="width: 1100px; height: 830px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 20px">


						<div class="chart-holder"
							style="width: 1000px; height: 780px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 20px; margin-left: 40px">
							<img src="../../../resources/resource/assets/images/gallery/calendar.jpg"
								width="300px" height="200px"
								style="magin: 5px 5px; margin-right: 800px">
							<p style="margin-top: -80px">
								<input type="text" placeholder="정모 이름을 입력하세요."
									style="width: 500px; margin-left: 200px; margin-top: -130px">
								<input type="text" placeholder="2017년 1월 31일 화요일"
									style="width: 500px; margin-left: 200px; margin-top: -60px">
								<input type="text" placeholder="오후 7:00"
									style="width: 500px; margin-left: 200px; margin-top: 10px">
								<input type="text" placeholder="정모 장소를 정해주세요."
									style="width: 800px; margin-left: 50px; margin-top: 50px;">
								<input type="text" placeholder="모임비 15000원"
									style="width: 800px; margin-left: 50px; margin-top: 40px;">
								<input type="text" placeholder="정원(4명 ~ 20명)"
									style="width: 800px; margin-left: 50px; margin-top: 40px;">
							</p>
							<br>
							<br>
							<br>
							<br>
							<br>
							<br> <input type="button" value="정모만들기"
								style="margin-left: 0px; margin-top: 10px; width: 500px;">
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
<!-- END ROW -->

<%@ include file="../etc/footer.jsp"%>