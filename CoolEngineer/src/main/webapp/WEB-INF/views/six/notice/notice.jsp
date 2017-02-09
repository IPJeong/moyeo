<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../etc/header2.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.col-md-12 {
	width: 75%;
	margin: auto;
	float: none;
}

.panel.panel-default {
	margin: 30px;
}

.panel .panel-body {
	padding: 0px;
}

.col-md-6 {
	border-left-color: #F5F5F5;
	border-left-width: 1px;
	border-left-style: solid;
}

.x-content-footer {
	position: relative;
}

.x-dashboard .page-container .page-content {
	background: #F9FAFB;
}

table {
	width: 100%;
	border-color: black;
}

th {
	border: 1px solid;
	background: #e5ecf1;
	text-align: center;
	border-color: black;
}

td {
	border: 1px solid black;
}

tr {
	height: 20px;
}

.subject {
	width: 75%;
}

.announce {
	width: 15%;
}

.count {
	width: 10%;
}

.x-dashboard .page-container .page-content {
	height: 837px;
}

.panel {
	background-color: #b8c8cd;
}

.table>thead>tr>th {
	background-color: #b8c8cd;
}

.panel {
	float: none;
}

.table>thead>tr>th {
	background-color: #eae1f3;
}

.table > thead:first-child > tr:first-child > th {
	border-top:3px;
}
</style>



<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="../../main/home">Home</a></li>
	<li><a href="../../customerSupport/customerSupportMain">고객지원</a></li>
	<li class="active">공지사항</li>
</ul>
<!-- END BREADCRUMB -->

<div class="page-title">
	<h2>
		<span class="fa fa-exclamation-circle"></span> 공지사항 <small>NOTICE</small>
		<br>
		<br> &nbsp;&nbsp;<small>모여의 서비스 신규, 업데이트 및 새로운 소식을
			알려드립니다.</small>
	</h2>
</div>

<div class="row" style="float:left; width:100%; background:#F9FAFB;">
	<div class="col-md-12">
		<div class="panel panel-default" style="border-top:0px;">
			<div class="panel-body">

				<br>
				<div class="table-responsive">
					<table class="table">
						<thead style="border-top:3px;">
							<tr>
								<th class="subject" style="border-color: #d8bbff; border-top:3px;"><font size="3">제 목</font></th>
								<th class="announce" style="border-color: #d8bbff;"><font
									size="3">등록일</font></th>
								<th class="count" style="border-color: #d8bbff;"><font
									size="3">조회수</font></th>
							</tr>
						</thead>
						<tbody>
							<!-- 게시글이 있으면 -->
							<c:if test="${cnt > 0}">
								<c:forEach var="dto" items="${dtos}">
									<tr>
										<td style="border-color: #d8bbff;"><a
											href="noticeContent?noti_num=${dto.noti_num}&pageNum=${pageNum}&number=${number+1}"><font
												size="3"> ${dto.noti_title}</font> </a></td>

										<td align="center" style="border-color: #d8bbff;"><font
											size="3"><fmt:formatDate type="both"
													pattern="yyyy-MM-dd" value="${dto.noti_date}" /></font></td>

										<td align="center" style="border-color: #d8bbff;"><font
											size="3">${dto.noti_hit}</font></td>
									</tr>
								</c:forEach>
							</c:if>

							<!-- 게시글이 없으면 -->
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="3" align="center" style="height: 40px"><font
										size="3">게시판에 글이 없습니다. 글을 작성해 주세요.!!</font></td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<input class="btn btn-info" style="font-size: 1.5em;" type="button"
			value="글쓰기" onclick="window.location='noticeWrite'">

		<ul
			class="pagination pagination-sm pull-right push-down-20 push-up-20"
			style="align: center;">

			<c:if test="${cnt > 0}">

				<c:if test="${startPage > pageBlock}">
					<li class=""><a href="notice?pageNum=${startPage - pageBlock}"><font
							size="3"> «</font></a></li>
				</c:if>


				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<li class=""><a href="#"><font size="3">${i}</font></a></li>
					</c:if>

					<c:if test="${i != currentPage}">
						<li class=""><a href="notice?pageNum=${i}"><font size="3">${i}</font></a></li>
					</c:if>

				</c:forEach>
				<c:if test="${pageCount > endPage}">
					<li><a href="notice?pageNum=${startPage + pageBlock}"><font
							size="3">»</font></a></li>
				</c:if>
			</c:if>
		</ul>

	</div>
</div>

<%@ include file="../../etc/footer2.jsp"%>
