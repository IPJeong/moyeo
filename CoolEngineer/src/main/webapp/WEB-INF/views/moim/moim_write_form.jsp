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

@media (min-width: 992px){
.col-lg-2 {
    width: auto;
    }
}

</style>

<%@ include file="../etc/moim_header.jsp"%>

<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
		<!-- START LOGIN BLOCK -->
		<div class="col-md-51" style="height: 310px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임개요</h3>

					</div>
				</div>
				<div class="panel-body padding-0" style="height: 270px;">
					<div class="chart-holder" id="dashboard-line-1"
						style="height: 180px;">
						<img src="/moyeo/resources/resource/assets/images/gallery/pin.jpg"
							width="180px" height="130px" style="magin: 5px 5px"><font
							size="3">XENO_B.C - 영등포 볼링</font><br> <br> <br>
						<h3>
							<center>스포츠/운동 -> 볼링</center>
						</h3>
						<center>
							<input type="button" value="모임정보 수정">
						</center>

					</div>
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

					</div>
				</div>
				<div class="panel-body padding-0" style="height: 550px;">
					<div class="chart-holder" id="dashboard-line-1">
						<div class="main">
							<img src="/moyeo/resources/resource/assets/images/gallery/피카츄.png"
								width="150px" height="110px" style="magin: 5px 5px">피카츄 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[모임장]<br>
							<img src="/moyeo/resources/resource/assets/images/gallery/라이츄.png"
								width="150px" height="110px" style="magin: 5px 5px">라이츄 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
							<img src="/moyeo/resources/resource/assets/images/gallery/파이리.png"
								width="150px" height="110px" style="magin: 5px 5px">파이리 <a
								href="#">[상세보기]</a><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
							<img src="/moyeo/resources/resource/assets/images/gallery/꼬부기.jpg"
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
					<h3>글쓰기</h3>
				</div>
			</div>

			<br> <br> <br> <br> <br> <br> <br>
			<div style="width: 60%; margin-left: 180px;">
				<form class="form-horizontal">
					<fieldset>
						<div class="form-group">
							<label for="" class="col-lg-2 control-label">아이디</label>
							<div class="col-lg-10">
								<h5>받아온 아이디값</h5>
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-lg-2 control-label">제목</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="inputEmail"
									placeholder="">
							</div>
						</div>
						<div class="form-group">
							<label for="" class="col-lg-2 control-label">첨부파일</label>
							<div class="col-lg-10">
								<button class="btn btn-default" type="submit">사진첨부</button>
								<button class="btn btn-default" type="submit">동영상첨부</button>
							</div>
						</div>
						<div class="form-group">
							<label for="textArea" class="col-lg-2 control-label">Textarea</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="15" id="textArea"></textarea>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-default">Cancel</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>

		</div>
	</div>
</div>

<%@ include file="../etc/footer.jsp"%>