<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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
									<td width="15%">아이디</td>
									<td width="60%">제목 : ${dto.group_noti_title}</td>
									<td width="25%" style="text-align:right;">조회수 : ${dto.hit}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="3" style="height:300px;">${dto.group_noti_content}</td>
								</tr>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
			<!-- END PHOTO BLOCK -->
		</div>
		<!-- END ROW -->
</div>
<%@ include file="../../etc/footer.jsp"%>