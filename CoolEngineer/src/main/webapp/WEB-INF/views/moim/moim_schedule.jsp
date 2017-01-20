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

@media ( min-width : 1100px) {
	.col-md-55 {
		width: 100%;
		height: 550px;
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

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li><a href="../category/category_hobby.jsp">모임</a></li>
                    <li><a href="../moim/moim_main.jsp">영등포 볼링</a></li>
                    <li class="active">모임 일정</li>
                </ul>
               <!-- END BREADCRUMB -->   

<!-- START ROW -->
<div class="row">
	<!-- 모임페이지 사이드바 시작 -->
	<%@include file="../etc/moim_side.jsp" %>
	<!-- 모임페이지 사이드바 종료 -->	

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top:10px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<a href="../gallery/gallery.jsp"><h3>모임일정</h3></a>
				</div>
			</div>
			
			<div class="panel-body padding-0"
				style="text-align: center; font-size: 25px;">
				<div class="chart-hodler"
					style="width: 1200px; height: 600px; margin-top: 0px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 20px">
					<img src="../../../resources/resource/assets/images/gallery/bowling.jpg"
						width="600px" height="250px" style="margin-right: 600px"><br>

				</div>


				<p style="margin-left: 650px; margin-top: -120px;">
					<a href="../moim/moim_cheif_member.jsp"><input type="button"
						value="모임원관리"></a> <input type="button" value="일정관리">
					<input type="button" value="지역설정">
				</p>
				<br>

				<div class="panel-heading" style="margin-top: 30px">
					<h3>XENO_B.C - 영등포 볼링</h3>
				</div>

				<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;">

					<div class="chart-hodler"
						style="width: 1200px; height: 480px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 90px">
						<div class="chart-holder"
							style="width: 1000px; height: 180px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 30px; margin-left: 50px">
							<img src="../../../resources/resource/assets/images/gallery/calendar.jpg"
								width="180x" height="130px"
								style="magin: 5px 5px; margin-right: 800px">
							<p style="margin-top: -80px">시간 일정 장소</p>
							<input type="button" value="참석"
								style="margin-left: 900px; margin-top: 10px">
						</div>

						<div class="chart-holder"
							style="width: 1000px; height: 180px; border-bottom: 3px solid #D5D5D5; border-top: 3px solid #D5D5D5; border-left: 3px solid #D5D5D5; border-right: 3px solid #D5D5D5; margin: 10px; margin-top: 30px; margin-left: 50px">
							<img src="../../../resources/resource/assets/images/gallery/calendar.jpg"
								width="180x" height="130px"
								style="magin: 5px 5px; margin-right: 800px">
							<p style="margin-top: -80px">시간 일정 장소</p>
							<input type="button" value="참석"
								style="margin-left: 900px; margin-top: 10px">
						</div>
						<a href="../moim/moim_register.jsp"><input type="button"
							value="모임등록" style="margin-left: 400px"></a> <a
							href="../moim/moim_schedule_detail.jsp"
							style="margin-left: 350px;"> + 더 보기</a>
					</div>
				</div>

			</div>
			<div id="aba" style="text-align: right"></div>
		</div>
	</div>
	<!-- END PHOTO BLOCK -->

</div>
<!-- END ROW -->

<%@ include file="../etc/footer.jsp"%>