<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- META SECTION -->
<title>MoYeo-새로운 만남의 시작</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" href="/moyeo/resources/resource/favicon.ico" type="image/x-icon" />
<!-- END META SECTION -->
<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme" href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script> -->
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<!-- <script type='text/javascript' src="/moyeo/resources/resource/js/plugins/icheck/icheck.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/scrolltotop/scrolltopcontrol.js"></script> -->

<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/morris/raphael-min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/morris/morris.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/rickshaw/d3.v3.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/rickshaw/rickshaw.min.js"></script> -->
<!-- <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script> -->
<!-- <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script> -->
<!-- <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js'></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/owl/owl.carousel.min.js"></script> -->

<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/moment.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/daterangepicker/daterangepicker.js"></script> -->
<!-- END THIS PAGE PLUGINS -->

<!-- START TEMPLATE -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script> -->
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->	
<style>
li {
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}
</style>
<script src="/ajax/resources/request.js"></script>
</head>
<body class="x-dashboard">
	
	<div class="page-container">
	
		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">
			
				<%@ include file="../etc/header.jsp"%>
	
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
													<input type="text" name="mem_id" class="form-control" placeholder="아이디 입력" required>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-12">
												<div class="input-group">
													<div class="input-group-addon">
														<span class="fa fa-lock"></span>
													</div>
													<input type="password" name="passwd" class="form-control" placeholder="패스워드 입력"  required>
												</div>
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												<a href="/moyeo/three/forgetpassword">비밀번호를 잃어버리셨나요?</a>
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
			</div>
		</div>
	</div>		
<%@ include file="../etc/footer.jsp"%>
</body>
</html>