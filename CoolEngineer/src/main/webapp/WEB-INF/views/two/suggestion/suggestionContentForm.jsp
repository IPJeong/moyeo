<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../etc/header2.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function suggestionCheck() {
	var sug_status = document.suggestioncontentform.sug_status.value;
	
	if(sug_status == "Y") {
		alert("이미 처리한 건의사항입니다.");
		return false;
	}
}

</script>

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
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}

</style>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
					<li><a href="/moyeo/main/home">Home</a></li>
					<li><a href="/moyeo/six/cusSupMain">고객지원</a></li>
					<li class="active">건의사항</li>
				</ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->
<div class="row">
<c:if test="${dto.sug_status == 'N'}">
	<div class="col-md-56" style="margin-top:30px; margin-left:20%; height:730px;">
		<div class="panel panel-default">
			<div class="panel-heading" style="padding-top: 10px;">
				<div class="panel-title-box">
					<h3>건의사항 처리 페이지</h3>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div style="width:80%; margin-left:10%;">
					<br><br>
					<h3>&nbsp;건의사항 상세보기</h3>
					<br>
					<table class="table table-striped table-hover" style="padding-top:10px;">
						<tr>
							<td width="15%">아이디  : ${dto.mem_id}</td>
							<td width="60%">제목 :  ${dto.sug_title}</td>
							<td width="25%" style="text-align:right;">
								날짜 : <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.sug_date}" />
							</td>
						</tr>

						<tr>
							<td colspan="3" style="height: 300px;">${dto.sug_content}</td>
						</tr>
						
					</table>
				</div>
				
				<div style="float:right; margin-right:10%; margin-top:-15px;">
					<input type="button" class="btn btn-info" value="목록" onclick="window.location='suggestionList'">
				</div>
				
				<br><br>
						
				<div style="width:80%; margin-left:10%;">

					<form action="suggestionCheckPro" method="post" name="suggestioncontentform" class="form-horizontal" onsubmit="return suggestionCheck()">
						<input type="hidden" name="sug_status" value="${dto.sug_status}">
						<input type="hidden" name="sug_num" value="${dto.sug_num}">
						<div class="form-group">
							<h3>&nbsp;&nbsp;건의사항 처리 내용 입력</h3>
							<br>
							<div class="col-lg-10">
								<textarea class="form-control" rows="6" name="sol_content"></textarea>
							</div>
							<br><br>
						</div>
						<div class="col-lg-10">
							<button type="submit" class="btn btn-primary"
								style="float: right;">입력</button>
						</div>
					</form>
				</div>		
			</div>
		</div>
	</div>
</c:if>
<c:if test="${dto.sug_status == 'Y'}">
<!--<div class="col-md-56" style="margin-top:30px; margin-left:20%; height:650px;"> -->
	<div class="col-md-56" style="margin-top:10px; margin-left:20%; height:730px;">
		<div class="panel panel-default">
			<div class="panel-heading" style="padding-top: 10px;">
				<div class="panel-title-box">
					<h3>건의사항 상세보기 페이지</h3>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div style="width:80%; margin-left:10%;">
					<br><br>
					<h3>&nbsp;건의사항 상세보기</h3>
					<br>
					<table class="table table-striped table-hover" style="padding-top:10px;">
						<tr>
							<td width="15%">아이디  : ${dto.mem_id}</td>
							<td width="60%">제목 :  ${dto.sug_title}</td>
							<td width="25%" style="text-align:right;">
								날짜 : <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.sug_date}" />
							</td>
						</tr>

						<tr>
							<td colspan="3" style="height:300px;">${dto.sug_content}</td>
						</tr>
						
					</table>
				</div>

				<div style="float:right; margin-right:10%; margin-top:-15px;">
					<input type="button" class="btn btn-info" value="목록" onclick="window.location='suggestionList'">
				</div>
				
				<br><br>
				
				<div style="width:80%; margin-left:10%;">
					<h3>&nbsp;건의처리 내용</h3>
					<br>
					<table class="table table-striped table-hover" style="padding-top:10px; height:150px;">
						<tr>
							<td style="background:#fff6d5;">${dto.sol_content}</td>
						</tr>	
					</table>
				</div>
				
				
			</div>
		</div>
	</div>

</c:if>
</div>
<!-- END ROW -->

<%@ include file="../../etc/footer2.jsp"%>