<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../etc/header.jsp"%>
         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li class="active">모임</li>
                </ul>
               <!-- END BREADCRUMB -->            
               


<div class="row-1">

	<div class="col-md-0">

		<form class="form-horizontal">

			<div class="panel panel-default tabs">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#tab-first" role="tab"
						data-toggle="tab">관심사별</a></li>
					<li><a href="#tab-second" role="tab" data-toggle="tab">지역별</a></li>
					<li><a href="#tab-third" role="tab" data-toggle="tab">연령별</a></li>
				</ul>
				<div class="panel-body tab-content">
					<div class="tab-pane active" id="tab-first">
						<div class="col-md-13">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>관심사별</h3>										
									</div>
								</div>
								<div class="panel-body padding-0">
									<a href="../moim/moim_main.jsp"><h3>모임 예시- 중앙 2팀</h3></a>
								</div>
							</div>
						</div>						                   
					</div>
					
					<div class="tab-pane" id="tab-second">
						<div class="col-md-13">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>지역 별</h3>										
									</div>
								</div>
								<div class="panel-body padding-0">
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>
							</div>
						</div>					      
					</div>
					<div class="tab-pane" id="tab-third">
						<div class="col-md-13">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>연령 별</h3>										
									</div>
								</div>
								<div class="panel-body padding-0">
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>
							</div>
						</div>
								      
					</div>
				</div>
			</div>

		</form>

	</div>
</div>
<div class="col-md-6-1">
    <div class="input-group push-down-10">
        <span class="input-group-addon"><span class="fa fa-search"></span></span>
        <input type="text" class="form-control" placeholder="Keywords..."/>
        <div class="input-group-btn">
            <button class="btn btn-primary">Search</button>
        </div>
    </div>
</div> 
<div  class="col-md-14"> 
 	<div class="col-md-14-1">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>인기모임</h3>										
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<div class="col-md-14-2">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>추천장소</h3>										
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
</div>
<div class="col-md-13-1">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title-box">
				<h3>추천모임 리스트</h3>										
			</div>
		</div>
		<div class="panel-body padding-0">
			<div class="chart-holder" id="dashboard-bar-1"
				style="height: 200px;"></div>
		</div>
	</div>
</div>   


<!-- END PAGE CONTENT WRAPPER -->

<!-- END PAGE CONTENT -->

<!-- END PAGE CONTAINER -->




<%@ include file="../etc/footer.jsp"%>
