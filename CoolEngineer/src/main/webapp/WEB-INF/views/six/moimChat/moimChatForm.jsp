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
</style>
<c:if test="${check_cnt == 0}">
	<script type="text/javascript">
		alert("모임멤버만 이용가능합니다.");
		history.back();
	</script>
</c:if>


<c:if test="${check_cnt != 0}">
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
						<h3>모임채팅</h3>
					</div>
				</div>
				<div class="panel-body padding-0"
				style="text-align: center; font-size: 15px">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 70px; margin:15px;">
					
										<br><br><br><br><br>
						<h3><span style="color:red;"></span> 모임 채팅에 참여하시겠습니까?</h3>
						<br>
						<form action="moimChat" name="moinjoinform">
							<input type="hidden" name="group_num" value="${group_num}">
							<input type="hidden" name="mem_id" value="${mem_id}">
							<input type="hidden" name="chat_room_num" value="${chat_room_num}">
							
							<button type="submit" class="btn btn-info">&nbsp;&nbsp;예&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;
							<input type="button" class="btn btn-default" value="아니오" onclick='history.back();'>
						</form>
				</div>
			</div>
				
			</div>
			<!-- END PHOTO BLOCK -->

		</div>
</c:if>		
	</div>
<!-- END ROW -->
</div>

<%@ include file="../../etc/footer.jsp"%>