<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/moim_header.jsp"%>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script type="text/javascript">

function boardCategorySelect() {
 	var group_num = document.moimboardform.group_num.value;
 	var select = document.getElementsByName("board_category");

	for(var i=0; i<select.length; i++) {
		if (select[i].value == "") {
			/* window.location = "moimBoardManaging?group_num=" + group_num + "&board_category=모임공지"; */
			alert("조회할 게시판을 선택해주세요.");
			return false;
		} else if(select[i].value == "모임공지") {
			window.location = "moimBoardManaging?group_num=" + group_num + "&board_category=모임공지";
		} else if(select[i].value == "가입인사") {
			window.location = "moimBoardManaging?group_num=" + group_num + "&board_category=가입인사";
		} else if(select[i].value == "모임후기") {
			window.location = "moimBoardManaging?group_num=" + group_num + "&board_category=모임후기";
		}
	}
}

function deleteNoticeBoardArticle() {
	$('#group_noti_num').each(function(index) {
		if($(this).prop("checked")){
			document.forms['moimboardform'].action = "deleteNoticeBoardArticle"; 
			document.forms['moimboardform'].submit(); 
		} else {
			alert("항목을 체크하세요.");
			return false;
		}
	})
}

function deleteGreetingBoardArticle() {
	$('#greeting_num').each(function(index) {
		if($(this).prop("checked")){
			document.forms['moimboardform'].action = "deleteGreetingBoardArticle"; 
			document.forms['moimboardform'].submit(); 
		} else {
			alert("항목을 체크하세요.");
			return false;
		}
	})
}

function deletePostBoardArticle() {
	$('#post_num').each(function(index) {
		if($(this).prop("checked")){
			document.forms['moimboardform'].action = "deletePostBoardArticle"; 
			document.forms['moimboardform'].submit(); 
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
	<li><a href="/moyeo/main/home">Home</a></li>
	<li><a href="/moyeo/six/category/category_hobby">모임</a></li>
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${group_name}</a></li>
	<li class="active">모임 관리</li>
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
						<h3>게시판 관리 페이지</h3>
					</div>
				</div>
				
			<br><br><br><br><br>
					<h2><center>게시판 관리</center></h2>
			<br><br>		
					
			<div class="panel-body padding-0" style="text-align:center; font-size: 15px;" >
				<div class="chart-holder" id="dashboard-bar-1"
					style="height:70px; margin:15px;">
			
			
				<br><br><br>

				
				<div>
					<form name="moimboardform">
						<input type="hidden" name="group_num" value="${group_num}">
						<div style="float:right; margin-right:5%;">
						<!-- 	선택한 게시글을
							<input type="submit" class="btn btn-default" value="삭제" onclick="return deleteArticle()"> -->
							<c:if test="${board_category == '모임공지'}">
								<input type="submit" class="btn btn-default" value="삭제" onclick="return deleteNoticeBoardArticle()">
							</c:if>
							<c:if test="${board_category == '가입인사'}">
								<input type="submit" class="btn btn-default" value="삭제" onclick="return deleteGreetingBoardArticle()">
							</c:if>
							<c:if test="${board_category == '모임후기'}">
								<input type="submit" class="btn btn-default" value="삭제" onclick="return deletePostBoardArticle()">
							</c:if>
						</div>
						<br> <br>
						
						<div>
							<table class="table table-striped table-hover"
								style="width: 90%; margin-left: 5%;">
								<tr class="info">
									<td align="center" style="width:10%;">선택</td>
									<td align="center" style="width:15%;">
										<select class="form-control" name="board_category" onchange="boardCategorySelect()">
											<option value="">게시판 선택</option>
											<option value="모임공지">모임공지</option>
											<option value="가입인사">가입인사</option>
											<option value="모임후기">모임후기</option>
										</select>
									</td>
									<td align="center" style="width:30%;">제목</td>
									<td align="center" style="width:15%;">작성자</td>
									<td align="center" style="width:15%;">날짜</td>
									<td align="center" style="width:15%;">조회수</td>
								</tr>
						<c:if test="${cnt > 0}">
							<c:forEach var="dtos" items="${dtos}">
								<tr style="border:0;">
									<td style="border:0;" align="center">
										<c:if test="${board_category == '모임공지'}">
											<input type="checkbox" id="group_noti_num" name="group_noti_num" value="${dtos.group_noti_num}">
										</c:if>
										<c:if test="${board_category == '가입인사'}">
											<input type="checkbox" id="greeting_num" name="greeting_num" value="${dtos.greeting_num}">
										</c:if>
										<c:if test="${board_category == '모임후기'}">
											<input type="checkbox" id="post_num" name="post_num" value="${dtos.post_num}">
										</c:if>
									</td>
									<td style="border:0;">
										<c:if test="${board_category == '모임공지'}">
											모임공지 게시판
										</c:if>
										<c:if test="${board_category == '가입인사'}">
											가입인사 게시판
										</c:if>
										<c:if test="${board_category == '모임후기'}">
											모임후기 게시판
										</c:if>
									</td>
									<td style="border:0;" align="center">
										<c:if test="${board_category == '모임공지'}">
											${dtos.group_noti_title}	
										</c:if>
										<c:if test="${board_category == '가입인사'}">
											${dtos.greeting_title}	
										</c:if>
										<c:if test="${board_category == '모임후기'}">
											${dtos.post_title}	
										</c:if>
									</td>	
									<td style="border:0;" align="center">
										<c:if test="${board_category == '모임공지'}">
											${dtos.mem_id}	
										</c:if>
										<c:if test="${board_category == '가입인사'}">
											${dtos.mem_id}	
										</c:if>
										<c:if test="${board_category == '모임후기'}">
											${dtos.mem_id}
										</c:if>			
									</td>
									<td style="border:0;" align="center">
										<c:if test="${board_category == '모임공지'}">
											<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dtos.group_noti_date}" />
										</c:if>
										<c:if test="${board_category == '가입인사'}">
											<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dtos.greeting_date}" />
										</c:if>
										<c:if test="${board_category == '모임후기'}">
											<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dtos.post_date}" />
										</c:if>
									</td>
									<td style="border:0;" align="center">
										<c:if test="${board_category == '모임공지'}">
											${dtos.hit}
										</c:if>
										<c:if test="${board_category == '가입인사'}">
											${dtos.greeting_hit}
										</c:if>
										<c:if test="${board_category == '모임후기'}">
											${dtos.post_hit}
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					
							<c:if test="${cnt == 0 && board_category == '모임공지'}">
								<tr>
									<td colspan="6" align="center" style="height:40px">
										모임공지 게시판에 작성된 게시글이 없습니다.
									</td>
								</tr>
							</c:if>
							<c:if test="${cnt == 0 && board_category == '가입인사'}">
								<tr>
									<td colspan="6" align="center" style="height:40px">
										가입인사 게시판에 작성된 게시글이 없습니다.
									</td>
								</tr>
							</c:if>
							<c:if test="${cnt == 0 && board_category == '모임후기'}">
								<tr>
									<td colspan="6" align="center" style="height:40px">
										모임후기 게시판에 작성된 게시글이 없습니다.
									</td>
								</tr>
							</c:if>
							</table>
					 </div>
	
						
					    <div style="float:right; margin-right:50%;">	
							<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
			
								<c:if test="${cnt > 0}">
						
									<c:if test="${startPage > pageBlock}">
										<li class=""><a href="moimBoardManaging?group_num=${group_num}&pageNum=${startPage - pageBlock}"><font
													size="3"> «</font></a></li>
									</c:if>
						
						
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class=""><a href="#"><font size="3">${i}</font></a></li>
										</c:if>
						
										<c:if test="${i != currentPage}">
											<li class=""><a href="moimBoardManaging?group_num=${group_num}&pageNum=${i}"><font size="3">${i}</font></a></li>
										</c:if>
						
									</c:forEach>
									<c:if test="${pageCount > endPage}">
										<li><a href="moimBoardManaging?group_num=${group_num}&pageNum=${startPage + pageBlock}"><font
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