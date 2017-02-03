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
						<h3>모임채팅</h3>
					</div>
				</div>
				<div class="panel-body padding-0"
					style="text-align: center; font-size: 25px;">


				</div>
				<div id="aba" style="text-align: right"></div>
			</div>
		</div>
		<!-- END PHOTO BLOCK -->
	</div>
</div>
<!-- END ROW -->

<%@ include file="../../etc/footer.jsp"%>