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
	
	var askMemberBanish = confirm("정말 강제탈퇴 시키겠습니까?");
	
	if(document.moimmemberform.my_group_num.checked == true) {
		chk = true;
		
		if(askMemberBanish == true) {
			
		} else {
			return false;
		}
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
	<li><a href="/moyeo/main/home">Home</a></li>
	<li><a href="/moyeo/six/category/category_hobby">모임</a></li>
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${open_dto.group_name}</a></li>
	<li class="active">모임 관리</li>
</ul>
<!-- END BREADCRUMB -->  

<!-- START ROW -->
<c:if test="${sessionScope.group_per != 1}">
<script type="text/javascript">
	window.location='/moyeo/two/moimManagerLoginConfirm2?group_num=${group_num}';
</script>	
</c:if>

<!-- 모임 사이드바 시작 -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">

		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->
		
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임원 관리 페이지</h3>
					</div>
				</div>
				
			<br><br><br><br>
					<h2><center>모임원 관리</center></h2>	
			<br>
					
			<div class="panel panel-default" style="text-align:center; height:750px; font-size:15px;">
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
					<form name="moimmemberform" style="margin-top:-20px;">
						<input type="hidden" name="group_num" value="${group_num}">
						<div style="float:right; margin-right:5%;">
								해당 모임원을
								<input type="button" class="btn btn-default" value="등급변경" onclick="return moimMemberRank()">
								<input type="button" class="btn btn-default" value="강제탈퇴" onclick="return moimMemberBanish()">
						</div>
						<br> <br>
						
						<div>
						
						<c:if test="${cnt == 0}">
							<table class="table table-striped table-hover"
								style="width:90%; margin-left:5%;">
								<tr class="info">
									<td align="center" style="width:10%">선택</td>
									<td align="center" style="width:25%">아이디</td>
									<td align="center" style="width:15%">회원등급</td>
									<td align="center" style="width:15%">이름</td>
									<td align="center" style="width:20%">출생년도</td>
									<td align="center" style="width:15%">성별</td>
								</tr>
								<tr>
									<td colspan="6" align="center" style="height:40px">
										회원이 존재하지 않습니다.
									</td>
								</tr>
							</table>
						</c:if>
						
						<c:if test="${cnt > 0}">
							<table class="table table-striped table-hover"
								style="width:46%; float:left; margin-left:5%;">
								<tr class="info">
									<td align="center" style="width:25%">선택</td>
									<td align="center" style="width:45%">아이디</td>
									<td align="center" style="width:30%">회원등급</td>
								</tr>
							<c:forEach var="dtos" items="${dtos}">
								<tr style="border:0;">
									<td style="border:0;" align="center">
										<input type="radio" name="my_group_num" value="${dtos.my_group_num}">
									</td>
									<td style="border:0;">
										<a href="#" onclick="window.open('/moyeo/six/moimMain/moimMemberDetail?mem_id=${dtos.mem_id}&group_num=${dtos.group_num}', '모임멤버보기', 'width=700, height=700, top=100, left=500')">
											${dtos.mem_id}
										</a>
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
						</table>
					</c:if>
					
					<c:if test="${cnt > 0}">
							<table class="table table-striped table-hover"
								style="width:44%; float:right; margin-right:5%;">
								<tr class="info">
									<td align="center" style="width:30%">이름</td>
									<td align="center" style="width:40%">출생년도</td>
									<td align="center" style="width:30%">성별</td>
								</tr>
								<c:forEach var="mifdtos" items="${mifdtos}">
									<tr style="border:0;">
										<td style="border:0;">
											${mifdtos.name}
										</td>
										<td style="border:0;" align="center">
											<fmt:formatDate type="both" pattern="yyyy" value="${mifdtos.birth}" />
										</td>	
										<td style="border:0;" align="center">
											${mifdtos.gender}
										</td>	
									</tr>
								</c:forEach>
							</table>
				     	</c:if>
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

	</div>		
	</div>
</div>
<!-- END ROW -->
</div>

<%@ include file="../../etc/footer.jsp"%>