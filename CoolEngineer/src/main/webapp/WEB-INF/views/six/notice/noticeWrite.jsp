<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../etc/header2.jsp"%>

<script type="text/javascript" 
src="/moyeo/resources/resource/js/notice.js"></script>

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
	<li><a href="../customerSupport/customerSupportMain.jsp">고객지원</a></li>
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
				<div class="table-responsive">
					<div id="content">
						<h2>
							<center>공지사항 등록</center>
						</h2>
						<form action="noticeWritePro" method="post" name="notice_writePro"
							onsubmit="return writeCheck();">

							<input type="hidden" name="noti_num" value="${noti_num}">

							<table align="center">
								<tr>
									<th
										style="border-left: 0px; border-color: #d8bbff; border-top: 3px #d8bbff solid;">
										<font size="3">작성자</font>
									</th>
									<td
										style="border-right: 0px; border-color: #d8bbff; border-top: 3px #d8bbff solid;">
										<input class="input" type="text" style="font-size: 1.5em;"
										name="manager_id" value="${manager_id}" readonly>
									</td>
								</tr>

								<tr>
									<th style="border-left: 0px; border-color: #d8bbff;"><font
										size="3"> 제목 </font></th>
									<td style="border-right: 0px; border-color: #d8bbff;"><input
										class="input" type="text" name="noti_title" maxlength="50"
										style="width: 100%; font-size: 1.5em;"></td>
								</tr>

								<tr>
									<th style="border-left: 0px; border-color: #d8bbff;"><font
										size="3"> 내용 </font></th>
									<td style="border-right: 0px; border-color: #d8bbff;"><textarea
											class="input" rows="10" cols="40" name="noti_content"
											style="width: 100%; height: 500px; font-size: 1.5em;"></textarea>
									</td>
								</tr>

								<tr>
									<th colspan="2"
										style="border-color: #d8bbff; border-right: 0px; border-left: 0px; border-bottom: 3px #d8bbff solid;">
										<input class="btn btn-info" style="font-size: 1.5em;"
										type="submit" value="작성"> <input class="btn btn-info"
										style="font-size: 1.5em; width: 68.5156px;" value="취소">
										<input class="btn btn-info" style="font-size: 1.5em;"
										type="button" value="목록" onclick="window.location = 'notice'">
									</th>
								</tr>
							</table>

						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../../etc/footer2.jsp"%>
