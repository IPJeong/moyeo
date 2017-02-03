<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/moim_header.jsp"%>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script type="text/javascript">

function joinOK() {
	
	$('#request_num').each(function(index) {
		if($(this).prop("checked")){
			document.forms['moimjoinform'].action = "moimJoinOK"; 
			document.forms['moimjoinform'].submit(); 
		} else {
			alert("항목을 체크하세요.");
			return false;
		}
	})
}

function joinNO() {
	/* 
	$('.request_num').each(function(index) {
		if($(this).prop("checked")){
			document.forms['moimjoinform'].action = "moimJoinNO"; 
			document.forms['moimjoinform'].submit(); 
		}
	})
	 */
	$('#request_num').each(function(index) {
		if($(this).prop("checked")){
			document.forms['moimjoinform'].action = "moimJoinNO"; 
			document.forms['moimjoinform'].submit(); 
		} else {
			alert("항목을 체크하세요.");
			return false;
		}
	})
}

</script>

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
						<h3>가입신청 관리 페이지</h3>
					</div>
				</div>
				
			<br><br><br><br><br>
					<h2><center>가입신청 관리</center></h2>
			<br><br>		
					
			<div class="panel-body padding-0" style="text-align:center; font-size: 15px;" >
				<div class="chart-holder" id="dashboard-bar-1"
					style="height:70px; margin:15px;">
			
			
				<br><br><br>

				
				<div>
					<form name="moimjoinform">
						<input type="hidden" name="group_num" value="${group_num}">
						<div style="float:right; margin-right:5%;">
							<input type="button" class="btn btn-default" value="가입승인" onclick="return joinOK()">
							<input type="button" class="btn btn-default" value="가입거부" onclick="return joinNO()">
						</div>
						<br> <br>
						
						<div>
							<table class="table table-striped table-hover"
								style="width: 90%; margin-left: 5%;">
								<tr class="info">
									<td align="center" style="width:10%">선택</td>
									<td align="center" style="width:45%">아이디</td>
									<td align="center" style="width:30%">신청 날짜</td>
									<td align="center" style="width:15%">상태</td>
								</tr>
						<c:if test="${cnt > 0}">
							<c:forEach var="dtos" items="${dtos}">
								<tr style="border:0;">
									<td style="border:0;" align="center">
										<input type="checkbox" id="request_num" name="request_num" value="${dtos.request_num}">
									</td>
									<td style="border:0;">
										${dtos.mem_id}
									</td>
									<td style="border:0;" align="center">
										<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dtos.request_date}" />
									</td>	
									<td style="border:0;" align="center">
										${dtos.status}
									</td>	
								</tr>
							</c:forEach>
						</c:if>
						
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="4" align="center" style="height:40px">
										가입 신청한 사람이 없습니다.
									</td>
								</tr>
							</c:if>
							</table>
					 </div>
	
						
					    <div style="float:right; margin-right:50%;">	
							<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
			
								<c:if test="${cnt > 0}">
						
									<c:if test="${startPage > pageBlock}">
										<li class=""><a href="moimJoinManaging?group_num=${group_num}&pageNum=${startPage - pageBlock}"><font
													size="3"> «</font></a></li>
									</c:if>
						
						
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class=""><a href="#"><font size="3">${i}</font></a></li>
										</c:if>
						
										<c:if test="${i != currentPage}">
											<li class=""><a href="moimJoinManaging?group_num=${group_num}&pageNum=${i}"><font size="3">${i}</font></a></li>
										</c:if>
						
									</c:forEach>
									<c:if test="${pageCount > endPage}">
										<li><a href="moimJoinManaging?group_num=${group_num}&pageNum=${startPage + pageBlock}"><font
													size="3">»</font></a></li>
									</c:if>
								</c:if>
									
							</ul>
					  </div>
					
					</form>
					<br> <br>

				</div>
			</div>
				
				
				
			</div>
			<!-- END PHOTO BLOCK -->

		</div>
	</div>
<!-- END ROW -->
</div>

<%@ include file="../../etc/footer.jsp"%>