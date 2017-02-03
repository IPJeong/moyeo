<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../etc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="../resources/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="../resources/js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- START THIS PAGE PLUGINS-->        
        <script type='text/javascript' src='../resources/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="../resources/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="../resources/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
		<!-- END THIS PAGE PLUGINS-->        

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="../resources/js/settings.js"></script>
        
        <script type="text/javascript" src="../resources/js/plugins.js"></script>        
        <script type="text/javascript" src="../resources/js/actions.js"></script>        
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
                    <li><a href="/moyeo/main/home">Home</a></li>
                    <li class="active">로그인</li>
                </ul>
               <!-- END BREADCRUMB -->                                                
       
<script>
	window.onload = function() {
	    document.loginform.beforeurl.value = document.referrer;
	 };
</script>


<div class="row">
	<div class="col-md-12">

		<div class="login-container login-v2">

			<div class="login-box animated fadeInDown">
				<div class="login-body">
					<div class="login-title">
						<h2><strong>환영합니다.</strong></h2> 
						<h3>로그인하고 새로운 모임을 찾아보세요.</h3>
					</div>
					<form action="memberLoginPro" class="form-horizontal" method="post" name="loginform">
						<input type="hidden" name="beforeurl" value="">
						<div class="form-group">
							<div class="col-md-12">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="fa fa-user"></span>
									</div>
									<input type="text" name="mem_id" class="form-control" placeholder="아이디 입력" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<div class="input-group">
									<div class="input-group-addon">
										<span class="fa fa-lock"></span>
									</div>
									<input type="password" name="passwd" class="form-control"
										placeholder="패스워드 입력" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-6">
								<a href="/moyeo/member/forgetpassword.jsp">비밀번호를 잃어버리셨나요?</a>
							</div>
							<div class="col-md-6 text-right">
								<a href="/moyeo/three/registration">회원가입을 해보세요.</a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-12">
								<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>

	</div>
</div>


<%@ include file="../etc/footer.jsp"%>