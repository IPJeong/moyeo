<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../etc/moim_header.jsp"%>

<style>
@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features {
    width: 100%;
    background-color: #FBFBFB;
    padding: 0px 20px;
}
}

@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open {
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
float:left;
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
	<div class="col-md-56" style="margin-top:10px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<a href="../gallery/gallery.jsp"><h3>모임일정</h3></a>
				</div>
			</div>
			<div class="panel-body padding-0" style="text-align:center; font-size: 25px;">
					<div class="chart-holder" id="dashboard-bar-1"
					style="height: 600px;">
					
					<div class="chart-hodler" style="width:1100px; height:830px; border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; margin: 10px; margin-top: 20px"> 
						<div class="chart-holder" style="width:1000px; height:180px; border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; margin: 10px; margin-top: 30px; margin-left: 50px">
							<img src="../../../resources/resource/assets/images/gallery/calendar.jpg" width="180x" height="130px" style="magin:5px 5px; margin-right:800px">
							<p style="margin-top:-80px" >시간 일정 장소</p>
							<input type="button" value="참석" style="margin-left:900px; margin-top:10px">
						</div>
						
						<div class="chart-holder" style="width:1000px; height:180px; border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; margin: 10px; margin-top: 30px; margin-left: 50px">
							<img src="../../../resources/resource/assets/images/gallery/calendar.jpg" width="180x" height="130px" style="magin:5px 5px; margin-right:800px">
							<p style="margin-top:-80px" >시간 일정 장소</p>
							<input type="button" value="참석" style="margin-left:900px; margin-top:10px">
						</div>
						
						<div class="chart-holder" style="width:1000px; height:180px; border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; margin: 10px; margin-top: 30px; margin-left: 50px">
							<img src="../../../resources/resource/assets/images/gallery/calendar.jpg" width="180x" height="130px" style="magin:5px 5px; margin-right:800px">
							<p style="margin-top:-80px" >시간 일정 장소</p>
							<input type="button" value="참석" style="margin-left:900px; margin-top:10px">
						</div>
						<a href="../moim/moim_register.jsp"><input type="button" value="모임등록" style="margin-left:900px"></a>
						<p style="margin-top:50px"> 
						
							<a href="#"><<</a>
							<a href="#"><</a>
							<a href="#">1</a>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#">></a>
							<a href="#">>></a>
						</p>
					</div>
				</div>
				
			</div>
			<div id="aba" style="text-align:right">
			
			</div>
		</div>
	</div>
	<!-- END PHOTO BLOCK -->

</div>
<!-- END ROW -->

<%@ include file="../etc/footer.jsp"%>