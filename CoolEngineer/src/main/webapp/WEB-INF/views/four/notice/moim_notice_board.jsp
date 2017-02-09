<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/moim_header.jsp"%>

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
	overflow: auto;
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

</style>

<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="/moyeo/main/home">Home</a></li>
	<li><a href="/moyeo/six/category/category_hobby">모임</a></li>
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${open_dto.group_name}</a></li>
	<li class="active">모임공지 게시판</li>
</ul>
<!-- END BREADCRUMB -->

<!-- START ROW -->


<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->	

		<!-- START PHOTO BLOCK -->
		
		<!-- 중앙메인 페이지 -->
		<div class="col-md-56" style="margin-top:10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임공지 게시판</h3>
					</div>
				</div>
				<div class="panel-body padding-0" style="text-align:center; font-size: 25px" >
					<div class="chart-holder" id="dashboard-bar-1"
						style="height: 10px;">
						<br>
						<h2>모임공지 게시판</h2>
						<br>
						<form action="" name="">
							<div style="float:right; margin-right:5%;">
								<!-- 로그인 되어 있으면, -->
								<c:if test="${sessionScope.mem_id != null}">
								<input class="btn btn-default" value="글쓰기" type="button" onclick="location.href='moim_notice_write_form'">
								</c:if>
							</div>
						</form>		
						<br><br>
						<div>
							<table class="table table-striped table-hover" style="width:90%; margin-left:5%;">
								<thead>
									
								
									<tr class="info">
										<td  style="width: 5%">번호</td>
										<td  style="width: 35%">제목</td>
										<td  style="width: 7%">작성자</td>
										<td  style="width: 15%">작성일</td>
										<td  style="width: 8%">조회수</td>
									</tr>
								</thead>
								<tbody>
								
									<c:forEach var="dto" items="${dtos}">
										<tr>
											<td>${number}</td>
											<c:set var="number" value="${number-1}" /> 
											
											<td><a href="moim_notice_contentform?num=${dto.group_noti_num}&pageNum=${pageNum}&number=${number+1}"> ${dto.group_noti_title}</a></td>
											<td>${dto.mem_id}</td>
											
											
											<td> 
				  									<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.group_noti_date}" />
											</td>
											<td>${dto.hit}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						
						<div style="text-align:center; float:right; margin-right:5%;">  
						
						
						<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
	
							<c:if test="${cnt > 0}">
				
								<c:if test="${startPage > pageBlock}">
									<li class=""><a href="moim_notice_board?pageNum=${startPage - pageBlock}"><font
											size="3"> «</font></a></li>
								</c:if>
				
				
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<li class=""><a href="#"><font size="3">${i}</font></a></li>
									</c:if>
				
									<c:if test="${i != currentPage}">
										<li class=""><a href="moim_notice_board?pageNum=${i}"><font size="3">${i}</font></a></li>
									</c:if>
				
								</c:forEach>
								<c:if test="${pageCount > endPage}">
									<li><a href="moim_notice_board?pageNum=${startPage + pageBlock}"><font
											size="3">»</font></a></li>
								</c:if>
							</c:if>
						</ul>
							
						</div>   

					</div>
			</div>
		</div>
		
		<!-- 중앙메인 페이지  -->
		<!-- END PHOTO BLOCK -->
	</div>
</div>
</div>
<!-- END ROW -->

<%@ include file="../../etc/footer.jsp"%>