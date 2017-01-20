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

<!-- START BREADCRUMB -->
   <ul class="breadcrumb push-down-0">
       <li><a href="../main/main.jsp">Home</a></li>
       <li><a href="../category/category_hobby.jsp">모임</a></li>
       <li><a href="../moim/moim_main.jsp">영등포 볼링</a></li>
       <li class="active">모임통계</li>
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
					<a href="../gallery/gallery.jsp"><h3>모임통계</h3></a>
				</div>
			</div>
			<div class="panel-body padding-0" style="text-align:center; font-size: 25px;">
				
				
		
		
					
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 600px;">
					
					<div class="chart-hodler" style="width:1200px; height:830px; border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; margin: 10px; margin-top: 20px"> 
						
						<div class="chart-holder" style="width:1000px; height:780px; border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; margin: 10px; margin-top: 20px; margin-left: 40px">
							
						</div>
					
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