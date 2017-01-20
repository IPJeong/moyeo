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

@media (min-width: 1100px){
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
					<a href="../gallery/gallery.jsp"><h3>모임소개</h3></a>
				</div>
			</div>
			<div class="panel-body padding-0"
				style="text-align: center; font-size: 25px;">
				<div class="chart-hodler"
					style="width: 97%; height: 300px; margin-top: 0px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 20px">
					<img src="../../../resources/resource/assets/images/gallery/bowling.jpg"
						width="600px" height="250px" style="margin-right: 600px"><br>

					<p style="margin-left: 690px; margin-top: -120px;">
						<input type="button" value="모임가입"> <input type="button"
							value="모임탈퇴"> <input type="button" value="모임신고">
					</p>
					<br>

				</div>




				<div class="panel-heading" style="margin-top: 30px">
					<h3>XENO_B.C - 영등포 볼링</h3>
				</div>

				<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;">

					<div class="chart-hodler"
						style="width: 97%; height: 480px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 90px">
						게시판</div>
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