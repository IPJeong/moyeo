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
<div class="row">
	<!-- 모임페이지 사이드바 시작 -->
	<%@include file="../etc/moim_side.jsp" %>
	<!-- 모임페이지 사이드바 종료 -->	

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top:10px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>공지사항 게시판</h3>
				</div>
			</div>
			<div class="panel-body padding-0" style="text-align:center; font-size: 25px" >
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 10px;">
					<br>
					<h2>공지사항 게시판</h2>
					<br>
					<form action="" name="">
						<div style="float:right; margin-right:5%;">
							<button class="btn btn-default" type="submit">글쓰기</button>
						</div>
					</form>		
					<br><br>
					<div>
						<table class="table table-striped table-hover" style="width:90%; margin-left:5%;">
							<thead>
								<tr class="info">
									<td>번호</td>
									<td>제목</td>
									<td>작성자</td>
									<td>작성일</td>
									<td>조회수</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div style="text-align:center; float:right; margin-right:5%;">  
						<ul class="pagination pagination-sm pull-right push-down-20 push-up-20">
							<li class="disabled"><a href="#">≪</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>                                    
							<li><a href="#">≫</a></li>
						</ul>
					</div>   
					<div class="panel-body padding-0" style="text-align:center; font-size: 15px" >
						<div class="chart-holder" id="dashboard-bar-1"
							style="height:15px; margin-left:5%">
											
							<form class="navbar-form navbar-left" role="search">
								<select name="">
									<option value="1">ID</option>
									<option value="2">닉네임</option>
									<option value="3">IP</option>
								</select>
								
			       				<div class="form-group">
			        				<input class="form-control" type="text" placeholder="Search">
			        	  		</div>
			       					<button class="btn btn-default" type="submit">입력</button>
			     		    </form>
			     		</div>
	     		    </div>
				</div>
		</div>
	</div>
	<!-- END PHOTO BLOCK -->
	</div>
</div>
<!-- END ROW -->

<%@ include file="../etc/footer.jsp"%>