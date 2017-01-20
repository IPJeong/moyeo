<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../etc/header.jsp"%>

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
	
}

th {
	border: 1px solid #9d9fbc;
	background: #e5ecf1;
    text-align: center;
}


td {
	border: 1px solid #9d9fbc;
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
</style>


<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="../main/main.jsp">Home</a></li>
	<li class="active">이벤트</li>
</ul>
<!-- END BREADCRUMB -->


<!-- PAGE CONTENT TABBED -->
<div class="page-tabs">
	<a href="#first-tab" class="active">진행중인 이벤트</a> <a href="#second-tab">당첨자
		발표</a>
</div>

<div class="page-content-wrap page-tabs-item active" id="first-tab">

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="form-group">
						<div class="col-md-3 col-xs-12 control-label">이벤트 사진</div>
						<div class="col-md-6 col-xs-12">

							<div class="subject">이벤트 제목: 떠나자</div>
							<div class="content">
								이벤트 내용<br> 블라블라<br>블라블라<br>블라블라<br>
							</div>
							<div class="period">기간: 2016.03.27~</div>
							<div class="announce">당첨자 발표: 2999.12.12</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="form-group">
						<div class="col-md-3 col-xs-12 control-label">이벤트 사진</div>
						<div class="col-md-6 col-xs-12">

							<div class="subject">이벤트 제목: 떠나자</div>
							<div class="content">
								이벤트 내용<br> 블라블라<br>블라블라<br>블라블라<br>
							</div>
							<div class="period">기간: 2016.03.27~</div>
							<div class="announce">당첨자 발표: 2999.12.12</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="form-group">
						<div class="col-md-3 col-xs-12 control-label">이벤트 사진</div>
						<div class="col-md-6 col-xs-12">
		
							<div class="subject">이벤트 제목: 떠나자</div>
							<div class="content">
								이벤트 내용<br> 블라블라<br>블라블라<br>블라블라<br>
							</div>
							<div class="period">기간: 2016.03.27~</div>
							<div class="announce">당첨자 발표: 2999.12.12</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>




<div class="page-content-wrap page-tabs-item" id="second-tab">

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					
						<table>
							<tr>
								<th align="center" class="subject"><font size="5">제목</font></td>
								<th align="center" class="announce"><font size="5">발표일</font></td>
								<th align="center" class="count"><font size="5">조회수</font></td>
							</tr>
							
							<tr>
								<td align="center" class="subject"><font size="5">1</font></td>
								<td align="center" class="announce"><font size="5">2</font></td>
								<td align="center" class="count"><font size="5">3</font></td>
							</tr>							
							
							<tr>
								<td align="center" class="subject"><font size="5">1</font></td>
								<td align="center" class="announce"><font size="5">2</font></td>
								<td align="center" class="count"><font size="5">3</font></td>
							</tr>							
							
							<tr>
								<td align="center" class="subject"><font size="5">1</font></td>
								<td align="center" class="announce"><font size="5">2</font></td>
								<td align="center" class="count"><font size="5">3</font></td>
							</tr>							
							
							<tr>
								<td align="center" class="subject"><font size="5">1</font></td>
								<td align="center" class="announce"><font size="5">2</font></td>
								<td align="center" class="count"><font size="5">3</font></td>
							</tr>							
							
							<tr>
								<td align="center" class="subject"><font size="5">1</font></td>
								<td align="center" class="announce"><font size="5">2</font></td>
								<td align="center" class="count"><font size="5">3</font></td>
							</tr>							
							
							<tr>
								<td align="center" class="subject"><font size="5">a</font></td>
								<td align="center" class="announce"><font size="5">b</font></td>
								<td align="center" class="count"><font size="5">c</font></td>
							</tr>							
							
							<tr>
								<td align="center" class="subject"><font size="5">d</font></td>
								<td align="center" class="announce"><font size="5">e</font></td>
								<td align="center" class="count"><font size="5">f</font></td>
							</tr>							
							
							<tr>
								<td align="center" class="subject"><font size="5">a</font></td>
								<td align="center" class="announce"><font size="5">b</font></td>
								<td align="center" class="count"><font size="5">c</font></td>
							</tr>							
							
							<tr>
								<td align="center" class="subject"><font size="5">e</font></td>
								<td align="center" class="announce"><font size="5">f</font></td>
								<td align="center" class="count"><font size="5">g</font></td>
							</tr>							
							
							<tr>
								<td align="center" class="subject"><font size="5">h</font></td>
								<td align="center" class="announce"><font size="5">i</font></td>
								<td align="center" class="count"><font size="5">j</font></td>
							</tr>
						</table>
								
				</div>
			</div>
						    <ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
                            <li class="disabled"><a href="#">«</a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                            <li><a href="#">7</a></li> 
                            <li><a href="#">8</a></li>
                            <li><a href="#">9</a></li>
                            <li><a href="#">10</a></li>                                       
                            <li><a href="#">»</a></li>
                      </ul>
		
		</div>
		

              		
	</div>
</div>

<div class="page-content-wrap page-tabs-item" id="third-tab">

	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">Third tab content</div>
			</div>
		</div>
	</div>

</div>

<!-- END PAGE CONTENT TABBED -->


<%@ include file="../etc/footer.jsp"%>