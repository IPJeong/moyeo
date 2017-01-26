<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../etc/header.jsp"%>

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
		<!-- START LOGIN BLOCK -->

		<!-- START RECOMMENDATION MEET BLOCK -->
	
	<!-- END LOGIN BLOCK -->


	<!-- START SEARCH BLOCK -->

	<!-- END SEARCH BLOCK -->

	<!-- START NOTICE BLOCK -->

	<!-- END NOTICE BLOCK -->

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top:30px; margin-bottom:30px; margin-left:20%; height:800px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>건의사항 입력</h3>
				</div>
			</div>

			<br> <br> <br> <br> <br> 
			<div style="width:80%;">
			
				<form action="/moyeo/two/suggestionInputPro" name="suggestioninputform" class="form-horizontal" style="margin-left:20%;">
					<fieldset>
						<legend>건의사항 입력</legend><br>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">건의제목</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" name="sug_title" maxlength="80"
									placeholder="" required>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">건의내용</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="17" name="sug_content" maxlength="2000" required></textarea>
								<span class="help-block"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">회신이메일</label>
							<div class="col-lg-10">
								<input type="email" class="form-control" name="re_email" maxlength="80"
									placeholder="" required>
							</div>
						</div>
						
						<br>
						
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">입력</button>
								<button type="reset" class="btn btn-default">다시 입력</button>
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

<%@ include file="../../etc/footer.jsp"%>