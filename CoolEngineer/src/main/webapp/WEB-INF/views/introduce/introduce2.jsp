<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../etc/header.jsp"%>
         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li class="active">회사소개</li>
                </ul>
               <!-- END BREADCRUMB -->         
<div class="row">

	<div class="col-md-0">

		<form class="form-horizontal">

			<div class="panel panel-default tabs">
				<ul class="nav nav-tabs" role="tablist">
					<li><a href="#tab-first" role="tab"
						data-toggle="tab">회사소개</a></li>
					<li class="active"><a href="#tab-second" role="tab" data-toggle="tab">연혁</a></li>
					<li><a href="#tab-third" role="tab" data-toggle="tab">구성원</a></li>
				</ul>
				<div class="panel-body tab-content">
					<div class="tab-pane" id="tab-first">
						<img src="../../../resources/resource/assets/images/users/introduce.png"
							width="1000px">
					</div>
					<div class="tab-pane active" id="tab-second">
						<img src="../../../resources/resource/assets/images/users/introduce2.png"
							width="1000px">
					</div>
					<div class="tab-pane" id="tab-third">
						<img src="../../../resources/resource/assets/images/users/introduce3.png"
							width="1000px">
					</div>
				</div>
			</div>

		</form>

	</div>
</div>


<!-- END PAGE CONTENT WRAPPER -->

<!-- END PAGE CONTENT -->

<!-- END PAGE CONTAINER -->




<%@ include file="../etc/footer.jsp"%>


