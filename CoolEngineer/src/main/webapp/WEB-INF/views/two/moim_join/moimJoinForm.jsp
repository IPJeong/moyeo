<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	height: 780px;
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
</style>

<c:if test="${cnt != 0}">
	<script type="text/javascript">
		alert("이미 가입된 모임입니다");
		history.back();
	</script>
</c:if>

<c:if test="${cnt == 0}">
<!-- START BREADCRUMB -->
   <ul class="breadcrumb push-down-0">
       <li><a href="../main/main.jsp">Home</a></li>
       <li><a href="../category/category_hobby.jsp">모임</a></li>
       <li><a href="../moim/moim_main.jsp">영등포 볼링</a></li>
       <li class="active">모임게시판</li>
   </ul>
<!-- END BREADCRUMB -->  

<!-- START ROW -->


<!-- 모임 사이드바 시작 -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
		<!-- START LOGIN BLOCK -->
	
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->
		
		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>가입신청 페이지</h3>
					</div>
				</div>
				<div class="panel-body padding-0"
				style="text-align: center; font-size: 15px">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 70px; margin:15px;">
					
					<br><br><br>
					<img src="/moyeo/resources/resource/assets/images/sw/join_greeting.png" width="900px" height="200px" align="center">
						
					<br><br><br><br><br>
						<h3><span style="color:red;">${dto.group_name}</span> 모임에 가입 신청하시겠습니까?</h3>
						<br><br><br>
						<form action="moimJoinPro" name="moinjoinform">
							<input type="hidden" name="group_num" value="${group_num}">
							<input type="hidden" name="mem_id" value="${mem_id}">
							
							<button type="submit" class="btn btn-info">&nbsp;&nbsp;예&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn btn-default" value="아니오" onclick='history.back();'>
						</form>
				</div>
			</div>
				
			</div>
			<!-- END PHOTO BLOCK -->

		</div>
	</div>
<!-- END ROW -->
</div>
</c:if>
<%@ include file="../../etc/footer.jsp"%>