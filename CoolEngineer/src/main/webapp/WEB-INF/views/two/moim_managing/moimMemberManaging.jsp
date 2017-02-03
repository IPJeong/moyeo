<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/moim_header.jsp"%>

<script type="text/javascript">

function moimMemberRank() {
	var chk = false;
	
	if(document.moimmemberform.my_group_num.checked == true) {
		chk = true;
	}
	
	for(var i=0; i<document.moimmemberform.my_group_num.length; i++){
		if(document.moimmemberform.my_group_num[i].checked == true) {		
			chk = true;
			var my_group_num = document.moimmemberform.my_group_num.value;
			var group_num = document.moimmemberform.group_num.value;
			var url = "moimMemberRankForm?my_group_num="+ my_group_num + "&group_num=" + group_num;
			window.open(url, "", "menubar=no, width=500px, height=300px, top=350, left=700");
		}
	} 
	
	if(!chk) {
		alert("항목을 체크하세요.");
		return false;
	}
}

function moimMemberBanish() {
	var chk = false;
	
	if(document.moimmemberform.my_group_num.checked == true) {
		chk = true;
	}
	
	for(var i=0; i<document.moimmemberform.my_group_num.length; i++){
		if(document.moimmemberform.my_group_num[i].checked == true) {		
			chk = true;
			var my_group_num = document.moimmemberform.my_group_num.value;
			var group_num = document.moimmemberform.group_num.value;
			window.location = "moimMemberBanish?my_group_num="+ my_group_num + "&group_num=" + group_num;
		}
	} 
	
	if(!chk) {
		alert("항목을 체크하세요.");
		return false;
	}
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
						<h3>모임원 관리 페이지</h3>
					</div>
				</div>
				
			<br><br><br><br><br>
					<h2><center>모임원 관리</center></h2>
			<br>	
					
			<div class="panel-body padding-0" style="text-align:center; font-size: 15px;" >
				<div class="chart-holder" id="dashboard-bar-1"
					style="height:70px; margin:15px;">
			<!-- 
				<form class="navbar-form navbar-left" role="search">
					<select name="">
						<option value="mem_id">아이디</option>
						<option value="group_per">회원등급</option>
					</select>

					<div class="form-group">
						<input class="form-control" type="text" placeholder="Search">
					</div>
					<button class="btn btn-default" type="submit">입력</button>
				</form>
			 -->
				<br>
				
				
				
				<div>
					<form name="moimmemberform">
						<input type="hidden" name="group_num" value="${group_num}">
						<div style="float:right; margin-right:5%;">
								해당 모임원을
								<input type="button" class="btn btn-default" value="등급변경" onclick="return moimMemberRank()">
								<input type="button" class="btn btn-default" value="강제탈퇴" onclick="return moimMemberBanish()">
						</div>
						<br> <br>
						
						<div>
							<table class="table table-striped table-hover"
								style="width: 90%; margin-left: 5%;">
								<tr class="info">
									<td align="center" style="width:15%">선택</td>
									<td align="center" style="width:55%">아이디</td>
									<td align="center" style="width:30%">회원등급</td>
								</tr>
						<c:if test="${cnt > 0}">
							<c:forEach var="dtos" items="${dtos}">
								<tr style="border:0;">
									<td style="border:0;" align="center">
										<input type="radio" name="my_group_num" value="${dtos.my_group_num}">
									</td>
									<td style="border:0;">
										${dtos.mem_id}
									</td>
									<td style="border:0;" align="center">
										<c:if test="${dtos.group_per == 1}">
											모임장
										</c:if>
										<c:if test="${dtos.group_per == 2}">
											운영진
										</c:if>
										<c:if test="${dtos.group_per == 3}">
											모임원
										</c:if>
									</td>	
								</tr>
							</c:forEach>
						</c:if>

							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="3" align="center" style="height:40px">
										회원이 존재하지 않습니다.
									</td>
								</tr>
							</c:if>
							</table>
					 </div>
	
						
					    <div style="float:right; margin-right:50%;">	
							<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
			
								<c:if test="${cnt > 0}">
						
									<c:if test="${startPage > pageBlock}">
										<li class=""><a href="moimMemberManaging?group_num=${group_num}&pageNum=${startPage - pageBlock}"><font
													size="3"> «</font></a></li>
									</c:if>
						
						
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class=""><a href="#"><font size="3">${i}</font></a></li>
										</c:if>
						
										<c:if test="${i != currentPage}">
											<li class=""><a href="moimMemberManaging?group_num=${group_num}&pageNum=${i}"><font size="3">${i}</font></a></li>
										</c:if>
						
									</c:forEach>
									<c:if test="${pageCount > endPage}">
										<li><a href="moimMemberManaging?group_num=${group_num}&pageNum=${startPage + pageBlock}"><font
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