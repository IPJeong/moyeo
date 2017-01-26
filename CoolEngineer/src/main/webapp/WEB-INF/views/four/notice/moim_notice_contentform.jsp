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

</style>

  <ul class="breadcrumb push-down-0">
      <li><a href="../main/main.jsp">Home</a></li>
      <li><a href="../category/category_hobby.jsp">모임</a></li>
      <li><a href="../moim/moim_main.jsp">중앙2팀</a></li>
      <li><a href="../moim/moim_main.jsp">모임공지 게시판</a></li>
      <li class="active">게시글 보기</li>
  </ul>

<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top:10px; margin-left:10%;">
	
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->

		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top:10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>게시글 보기</h3>
					</div>
				</div>
				<br><br><br><br>
				<div style="width:80%; margin-left:7%;">
	
					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								<td width="10%">아이디</td>
								<td width="40%">제목 : ${dto.group_noti_title}</td>
								<td width="17%">
				  					<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.group_noti_date}" />
								</td>
								<td width="15%">조회수 : ${dto.hit}</td>
							</tr>
						
						</thead>
						<tbody>
						
						
						
							<tr>
								<td colspan="4" style="height:300px;">${dto.group_noti_content}</td>
							</tr>
						</tbody>
							
						</table>
					
					
				
					<div style="float:right; margin-right:5%;">
								<input class="btn btn-default" value="수정" type="button" onclick="location.href='moim_notice_modifyView?num=${dto.group_noti_num}&pageNum=${pageNum}'">
								<input class="btn btn-default" value="삭제" type="button"  onclick="location.href='moim_notice_delete?num=${dto.group_noti_num}&pageNum=${pageNum}'">
								<input class="btn btn-default" value="목록" type="button" onclick="location.href='moim_notice_board'">
					</div>	 
				</div>				
				
		<!-- 중앙 -->	
				<!-- <div style="width:80%; margin-left:7%;">
					<table class="table table-striped table-hover ">	
						<tr>
							<td width="10%">아이디</td>
							<td width="5%">|</td>
							<td width="85%">댓글 내용</td>
						</tr>
					</table>
						
					<form class="form-horizontal">
						<fieldset>
							   <div class="form-group">
							   <div class="col-lg-10" style="width:89%">
									<textarea class="form-control" rows="1" id="textArea"></textarea>
								</div>
								<div class="col-lg-10" style="width:10%">
									<button type="submit" class="btn btn-primary" style="float:right;">댓글입력</button>
								</div>
							</div>
						 </fieldset>
					</form>				
				</div>	 -->
			</div>
		</div>
	</div>
</div>

<%@ include file="../../etc/footer.jsp"%>