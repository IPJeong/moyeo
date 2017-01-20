<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


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

<%@ include file="../etc/moim_header.jsp"%>
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
		
	<!-- 모임페이지 사이드바 시작 -->
	<%@include file="../etc/moim_side.jsp" %>
	<!-- 모임페이지 사이드바 종료 -->	

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top: 10px;">
		<div class="panel panel-default">

			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>게시글 관리</h3>
				</div>
			</div>

			<div class="panel-body padding-0"
				style="text-align: center; font-size: 15px;">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 70px; margin: 15px;">


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
								선택한 게시글을
								<button class="btn btn-default" type="submit">삭제</button>
							</div>
							<br> <br>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<td><input type="checkbox"
											class="input_check _chSelectAll" title="전체선택"></td>
										<td width="20%"><select class="form-control" id="select">
												<option value="">게시판 선택</option>
												<option value="">모임공지 게시판</option>
												<option value="">가입인사 게시판</option>
												<option value="">자유 게시판</option>
												<option value="">모임후기 게시판</option>
										</select></td>
										<td>제목</td>
										<td>작성자</td>
										<td>작성일</td>
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
	</div>
</div>
</div>
<%@ include file="../etc/footer.jsp"%>