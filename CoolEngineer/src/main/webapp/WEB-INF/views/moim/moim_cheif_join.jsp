<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../etc/moim_header.jsp"%>

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
                    <li class="active">모임관리</li>
                </ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
		<!-- START LOGIN BLOCK -->
		<div class="col-md-51" style="height: 310px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임개요</h3>
						<span></span>
					</div>
				</div>
				<div class="panel-body padding-0" style="height: 270px;">
					<div class="chart-holder" id="dashboard-line-1"
						style="height: 200px;"></div>
				</div>
			</div>
		</div>
		<!-- END LOGIN BLOCK -->


		<!-- START SEARCH BLOCK -->

		<!-- END SEARCH BLOCK -->

		<!-- START NOTICE BLOCK -->

		<!-- END NOTICE BLOCK -->

		<!-- START RECOMMENDATION MEET BLOCK -->
		<div class="col-md-55" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>멤버리스트</h3>
						<span></span>
					</div>
				</div>
				<div class="panel-body padding-0" style="height: 550px;">
					<div class="chart-holder" id="dashboard-line-1">
						<div class="main">
							<img src="../../../resources/resource/assets/images/gallery/피카츄.png"
								width="150px" height="110px" style="magin: 5px 5px">피카츄 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[모임장]<br>
							<img src="../../../resources/resource/assets/images/gallery/라이츄.png"
								width="150px" height="110px" style="magin: 5px 5px">라이츄 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
							<img src="../../../resources/resource/assets/images/gallery/파이리.png"
								width="150px" height="110px" style="magin: 5px 5px">파이리 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
							<img src="../../../resources/resource/assets/images/gallery/꼬부기.jpg"
								width="150px" height="110px" style="magin: 5px 5px">꼬부기 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END RECOMMENDATION MEET BLOCK -->

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top: 10px;">
		<div class="panel panel-default">


			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>회원 관리</h3>
				</div>
			</div>
			
			<div class="panel-body padding-0" style="text-align:center; font-size: 15px;" >
				<div class="chart-holder" id="dashboard-bar-1"
					style="height:70px; margin:15px;">

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

				<br> <br>
				<div>
					<form action="" name="">
						<div style="float: right">
							<button class="btn btn-default" type="button">가입승인</button>
							<button class="btn btn-default" type="button">가입거부</button>
						</div>
						<br> <br>
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<td><input type="checkbox"
										class="input_check _chSelectAll" title="전체선택"></td>
									<td>신청번호</td>
									<td>아이디</td>
									<td>신청일</td>
									<td>상태</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" class="input_check"></td>
									<td>ㅇ</td>
									<td>ㅇ</td>
									<td>ㅇ</td>
									<td>ㅇ</td>
								</tr>
							</tbody>
						</table>
					</form>
					<br> <br>

					<div align="center">
						<table>
							<tr>
								<th><c:if test="${cnt > 0}">
										<!-- 처음[◀◀] 이전블록[◀]-->
										<c:if test="${startPage > pageBlock}">
											<a href="list.do">[◀◀]</a>
											<a href="list.do?pageNum=${startPage - pageBlock}">[◀] </a>
										</c:if>

										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage }">
												<span><b>[${i}]</b></span>
											</c:if>

											<c:if test="${i != currentPage}">
												<a href="list.do?pageNum=${i}">[${i}]</a>
											</c:if>
										</c:forEach>

										<!-- 다음블록[▶] 끝[▶▶]-->
										<c:if test="${pageCount > endPage}">
											<a href="list.do?pageNum=${startPage + pageBlock}">[▶]</a>
											<a href="list.do?pageNum=${pageCount}">[▶▶]</a>
										</c:if>
									</c:if></th>
							</tr>
						</table>
					</div>
				</div>
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