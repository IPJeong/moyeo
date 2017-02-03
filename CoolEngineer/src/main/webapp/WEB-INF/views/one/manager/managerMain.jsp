<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../etc/header.jsp"%>

<div style="margin-left:10%">
<div class="col-md-22">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>관리자 관리</h3>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
			<img src="/moyeo/resources/resource/assets/images/gallery/host.jpg" style="margin-left:32%; width:250px; height:200px;">
			<br><br><br><br>
			<div>
				<button class="btn btn-primary btn-block" value="버튼" onclick="window.location='adminAppoint'">관리자 임명</button><br>
				<button class="btn btn-primary btn-block" value="버튼" onclick="window.location='adminDelete'">관리자 삭제</button>
			</div>
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 200px;"></div>
					
			</div>
		</div>
</div>

<div class="col-md-22">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>회원관리</h3>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<img src="/moyeo/resources/resource/assets/images/gallery/guest.png" style="margin-left:32%; width:250px; height:200px;">
				<br><br><br><br>
			<div>
				<button class="btn btn-primary btn-block" value="버튼" onclick="window.location='guestList'">회원 리스트 보기</button><br>
				<button class="btn btn-primary btn-block" value="버튼" onclick="window.location='guestList'">회원 강제 탈퇴</button>
			</div>
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 200px;"></div>
			</div>
		</div>
</div>
<br>

<div class="col-md-22">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>모임관리</h3>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
			<img src="/moyeo/resources/resource/assets/images/gallery/moim.png" style="margin-left:32%; width:250px; height:200px;">
			<br><br><br><br>
			<div>
				<button class="btn btn-primary btn-block" value="버튼" onclick="window.location='moimCheck'">모임조회</button><br>
				<button class="btn btn-primary btn-block" value="버튼">모임 강제탈퇴</button>
			</div>
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 200px;"></div>
			</div>
		</div>
</div>
<div class="col-md-22">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>관리자 알림</h3>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
			<img src="/moyeo/resources/resource/assets/images/gallery/notice.png" style="margin-left:32%; width:250px; height:200px;">
			<br><br><br><br>
			<div>
				<button class="btn btn-primary btn-block" value="버튼" onclick="window.location='moimReportHandleMain'">모임신고 내역</button><br>
				<button class="btn btn-primary btn-block" value="버튼">나중에</button>
			</div>
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 200px;"></div>
			</div>
		</div>
</div>
</div>

<%@ include file="../../etc/footer.jsp"%>  