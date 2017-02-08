<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../etc/header.jsp"%>

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
	height: 40px;
}

.panel {
	float: none;
}

.subject {
	width: 16%;
}

.announce {
	width: 16%;
}

.count {
	width: 16%;
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

.announce1 {
	width: 34%;
}

.count1 {
	width: 34%;
}

.table {
	border-left: 0px;
	border-right: 0px;
}
</style>



<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="../main/main.jsp">Home</a></li>
	<li><a href="../customerSupport/customerSupportMain">고객지원</a></li>
	<li class="active">공지사항</li>
</ul>
<!-- END BREADCRUMB -->

<div class="page-title">
	<h2>
		<span class="fa fa-exclamation-circle"></span> 공지사항 <small>NOTICE</small>
		<br> <br> &nbsp;&nbsp;<small>모여의 서비스 신규, 업데이트 및 새로운
			소식을 알려드립니다.</small>
	</h2>
</div>

<div class="row" style="float:left; width:100%; background:#F9FAFB;">
	<div class="col-md-12">
		<div class="panel panel-default" style="border-top:0px;">
			<div class="panel-body">

				<br>
				<div class="table-responsive" style="background: white;">
					<table class="table">
						<tr>
							<th class="subject"
								style="border-left: 0px; border-color: #d8bbff; border-top: 3px #d8bbff solid;"><font
								size="3">제목</font></th>
							<td class="subject_title" colspan="3"
								style="border-color: #d8bbff; border-right: 0px; border-top: 3px #d8bbff solid;"><font
								size="3">${dto.noti_title}</font>
							</td>
						</tr>

						<tr>
							<th class="announce"
								style="border-left: 0px; border-color: #d8bbff; border-bottom: 3px #d8bbff solid;"><font size="3">등록일</font></th>
							<td class="announce1" align="center"
								style="border-color: #d8bbff; border-bottom: 3px #d8bbff solid;"><font size="3"><fmt:formatDate type="both" pattern="yyyy-MM-dd"
										value="${dto.noti_date}" /></font></td>
							<th class="count"
								style="border-color: #d8bbff; border-bottom: 3px #d8bbff solid;"><font
								size="3">조회수</font></th>
							<td class="count1" align="center"
								style="border-color: #d8bbff; border-right: 0px; border-bottom: 3px #d8bbff solid;"><font
								size="3">${dto.noti_hit}</font></td>
						</tr>

					</table>
					<br><br>
					<div style="margin:10px 30px;"><font size="3">${dto.noti_content}</font></div>
					
					<br><br>
					<table>
						<tr>
							<td style="border: 0px;" align="center">
								<c:if test="${manager_id eq 'admin'}">
									<input class="btn btn-info" type="button" style="font-size: 1.5em;" value="글수정"
										onclick="window.location='noticeModify?noti_num=${dto.noti_num}&pageNum=${pageNum}'">
									<input class="btn btn-info" style="font-size: 1.5em;" type="button" value="글삭제"
										onclick="window.location='noticeDelete?noti_num=${dto.noti_num}&pageNum=${pageNum}'">
								</c:if> 
									<input class="btn btn-info" style="font-size: 1.5em;" type="button" value="목록보기"
								onclick="window.location='notice?pageNum=${pageNum}'">
							</td>
						</tr>

					</table>

				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../../etc/footer.jsp"%>
