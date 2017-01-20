<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../etc/header.jsp"%>

    <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="../../../resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../../../resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- START THIS PAGE PLUGINS-->        
        <script type='text/javascript' src='../../../resources/resource/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="../../../resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="../../../resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
		<!-- END THIS PAGE PLUGINS-->        

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="../../../resources/resource/js/settings.js"></script>
        
        <script type="text/javascript" src="../../../resources/resource/js/plugins.js"></script>        
        <script type="text/javascript" src="../../../resources/resource/js/actions.js"></script>        
        <!-- END TEMPLATE -->

    <!-- END SCRIPTS -->     


<style>


.x-dashboard .page-container .page-content{
	background: #efeeee;
}
.x-content-footer{
	position:relative;
}
</style>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li class="active">로그인</li>
                </ul>
               <!-- END BREADCRUMB -->                                                
       



<div class="row">
	<div class="col-md-12">

		<div class="login-container login-v2">

			<div class="login-box animated fadeInDown">
				<div class="login-body">
					<div class="login-title">
						<strong>Welcome</strong>, Please login.
					</div>
					<form action="index.html" class="form-horizontal" method="post">
						<div class="form-group">
							<div class="col-md-12">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="fa fa-user"></span>
									</div>
									<input type="text" class="form-control" placeholder="Username" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="fa fa-lock"></span>
									</div>
									<input type="password" class="form-control"
										placeholder="Password" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-6">
								<a href="../member/forgetpassword.jsp">Forgot your password?</a>
							</div>
							<div class="col-md-6 text-right">
								<a href="../member/registration.jsp">Create an account</a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<button class="btn btn-primary btn-lg btn-block">Login</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>
</div>







<%@ include file="../etc/footer.jsp"%>