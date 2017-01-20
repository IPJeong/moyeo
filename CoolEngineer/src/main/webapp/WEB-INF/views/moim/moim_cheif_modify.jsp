<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../etc/moim_header.jsp"%>

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
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li><a href="../category/category_hobby.jsp">모임</a></li>
                    <li><a href="../moim/moim_main.jsp">영등포 볼링</a></li>
                    <li class="active">모임관리</li>
                </ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top:10px; margin-left:10%;">
		<!-- START LOGIN BLOCK -->
		<div class="col-md-51" style="height: 310px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임 정보</h3>
					</div>
				</div>
				<div class="panel-body padding-0"  style="height:270px;">
					<div class="chart-holder" id="dashboard-line-1"
						style="height: 180px;">
						<img src="../../../resources/resource/assets/images/gallery/pin.jpg" width="180px"
							height="130px" style="magin: 5px 5px"><font size="3">XENO_B.C
							- 영등포 볼링</font><br> <br> <br>
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
		<!-- START RECOMMENDATION MEET BLOCK -->
		<div class="col-md-55" style="margin-top:10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>멤버리스트</h3>
					</div>
				</div>
				<div class="panel-body padding-0" style="height:550px;">
					<div class="chart-holder" id="dashboard-line-1">
						<div class="main">
						<img src="../../../resources/resource/assets/images/gallery/피카츄.png" width="150px"
							height="110px" style="magin: 5px 5px">피카츄 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[모임장]<br>
						<img src="../../../resources/resource/assets/images/gallery/라이츄.png" width="150px"
							height="110px" style="magin: 5px 5px">라이츄 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
						<img src="../../../resources/resource/assets/images/gallery/파이리.png" width="150px"
							height="110px" style="magin: 5px 5px">파이리 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
						<img src="../../../resources/resource/assets/images/gallery/꼬부기.jpg" width="150px"
							height="110px" style="magin: 5px 5px">꼬부기 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- END LOGIN BLOCK -->


	<!-- START SEARCH BLOCK -->

	<!-- END SEARCH BLOCK -->

	<!-- START NOTICE BLOCK -->

	<!-- END NOTICE BLOCK -->

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top:10px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>모임정보 수정</h3>
				</div>
			</div>

			<br> <br> <br> <br> <br> <br> <br>
			<div style="width: 60%; margin-left: 180px;">
			
				<form class="form-horizontal">
					<fieldset>
						<div class="form-group">
							<label for="inputEmail" class="col-lg-2 control-label">Email</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="inputEmail"
									placeholder="Email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword" class="col-lg-2 control-label">Password</label>
							<div class="col-lg-10">
								<input type="password" class="form-control" id="inputPassword"
									placeholder="Password">
								<div class="checkbox">
									<label> <input type="checkbox"> Checkbox
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="textArea" class="col-lg-2 control-label">Textarea</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="3" id="textArea"></textarea>
								<span class="help-block">A longer block of help text that
									breaks onto a new line and may extend beyond one line.</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">Radios</label>
							<div class="col-lg-10">
								<div class="radio">
									<label> <input type="radio" name="optionsRadios"
										id="optionsRadios1" value="option1" checked=""> Option
										one is this
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="optionsRadios"
										id="optionsRadios2" value="option2"> Option two can be
										something else
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="select" class="col-lg-2 control-label">Selects</label>
							<div class="col-lg-10">
								<select class="form-control" id="select">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select> <br> <select multiple="" class="form-control">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
								</select>
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

	<!-- END PHOTO BLOCK -->





	<!-- END RECOMMENDATION MEET BLOCK -->


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