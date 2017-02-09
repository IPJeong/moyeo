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
	background: #e3f8ff;
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

	<c:if test = "${cnt == 0}">
		<!-- 작성 실패 -->
		<script type="text/javascript">
			alert("글 작성에 실패하였습니다. \n잠시후 다시 시도하세요!");
			history.back();
		</script>
	</c:if>
	
	<c:if test = "${cnt == 1}">
		<script type="text/javascript">
			alert("글이 작성되었습니다!");
		</script>
		
		<!-- 작성 성공 -->
		<c:redirect url="notice" />
	</c:if>

<%@ include file="../../etc/footer2.jsp"%>
