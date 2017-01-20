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
	<!-- START LOGIN BLOCK -->
		<div class="col-md-51" style="height: 310px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>모임개요</h3>
					<span></span>
				</div>
			</div>
				<div class="panel-body padding-0"  style="height:270px;">
				<div class="chart-holder" id="dashboard-line-1"
					style="height: 180px;"></div>
			</div>
		</div>
	</div>
	<!-- END LOGIN BLOCK -->


	<!-- START SEARCH BLOCK -->

	<!-- END SEARCH BLOCK -->

	<!-- START NOTICE BLOCK -->
	
	<!-- END NOTICE BLOCK -->

	<!-- START RECOMMENDATION MEET BLOCK -->
		<div class="col-md-55" style="margin-top:10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>멤버리스트</h3>
					</div>
				</div>
				<div class="panel-body padding-0" style="height:550px;">
					<div class="chart-holder" id="dashboard-line-1">
						<div class="main">
						<img src="../resources/assets/images/gallery/피카츄.png" width="150px"
							height="110px" style="magin: 5px 5px">피카츄 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[모임장]<br>
						<img src="../resources/assets/images/gallery/라이츄.png" width="150px"
							height="110px" style="magin: 5px 5px">라이츄 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
						<img src="../resources/assets/images/gallery/파이리.png" width="150px"
							height="110px" style="magin: 5px 5px">파이리 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
						<img src="../resources/assets/images/gallery/꼬부기.jpg" width="150px"
							height="110px" style="magin: 5px 5px">꼬부기 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END RECOMMENDATION MEET BLOCK -->

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
							<td width="60%">제목 : subject</td>
							<td width="25%" style="text-align:right;">조회수 : click | 좋아요 : like</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3" style="height:300px;">3</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="width:80%; margin-left:7%;">
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
			</div>	
		</div>
	</div>
	<!-- END PHOTO BLOCK -->

	<!-- START MOVIE BLOCK -->
	
	<!-- END MOVIE BLOCK -->

	<!-- START REALTIME MEET BLOCK -->

	<!-- END REALTIME MEET BLOCK -->

	<!-- START RECOMMENDATION LOCATION BLOCK -->

	<!-- END RECOMMENDATION LOCATION BLOCK -->

	<!-- START EVENT BLOCK -->

	<!-- END EVENT BLOCK -->

	<!-- START ADVERTISE BLOCK -->

	<!-- END ADVERTISE BLOCK -->

	<!-- START REVIEW BLOCK -->

	<!-- END REVIEW BLOCK -->
</div>
<!-- END ROW -->

<%@ include file="../etc/footer.jsp"%>