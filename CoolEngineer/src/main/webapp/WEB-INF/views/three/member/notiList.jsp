<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<!-- META SECTION -->
<title>MoYeo-새로운 만남의 시작</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" href="/moyeo/resources/resource/favicon.ico"
	type="image/x-icon" />
<!-- END META SECTION -->

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme"
	href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->
<style>

.panel {
	height: auto;
}

</style>
</head>
<script type="text/javascript">

function winChk() {	
	var winners = getElementsByName("mem_id");
	var conf = false;
	
	for(i=0; i<winners.length;  i++){
		  if(winners[i].checked == true){
			  conf=true;
		  }
	}
			  
	if (conf == true) {	
		if(confirm('이벤트 당첨자를 선정하시겠습니까?')) {
			
		} else {
			return false;
		}
	} else {
		alert('당첨자를 선정해주세요');
		return false;
	}
}

</script>

<body class="x-dashboard">
	<!-- START PAGE CONTAINER -->
	<script>
      document.body.style.overflow='hidden';  
      if (navigator.userAgent.indexOf('Chrome')>-1) {  
			    window.resizeTo(700, 450);   
      }
    </script>

	<div class="page-container">

		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">

				<div class="panel panel-default">					
					<div class="panel-heading col-md-12" style="height:51px;position:fixed;top:0px;left:0px;z-index:999;">
						<div class="col-md-8" style="margin:0px;padding:0px;">
							<h3 class="panel-title" style="color:#03A9F4"><strong>알림메세지</strong></h3>
						</div>
						<div class="col-md-4" style="margin:0px;padding:0px;padding-left:80%;">							
							<button type="button" class="btn btn-default" onclick="window.close()">닫기</button>
						</div>						
					</div>						
					<div class="panel-body panel-body-table" style="margin-top:51px;">
						<table class="table table-striped">	
							<thead>
								<tr>
									<th>No.</th>
									<th>아이디</th>																	
								</tr>
							</thead>						
							<tbody>								
								<c:if test="${cnt > 0}">
									<c:forEach var="dto" items="${dtos}">
										<tr>
											<td>
											${start}
											<c:set var="start" value="${start + 1}"/>
											</td>
											<td>											
											${dto.mem_id}
											</td>																				
										</tr>
									</c:forEach>
								</c:if>																															
							</tbody>
						</table>
					</div>
					
				</div>
			
			</div>
		</div>
	</div>
	
	
	<!-- START SCRIPTS -->
	
	<script src="/moyeo/resources/customScript/three.js" type="text/javascript"></script>
	<!-- START PLUGINS -->
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
	<!-- END PLUGINS -->

	<!-- START THIS PAGE PLUGINS-->
	<script type='text/javascript'
		src="/moyeo/resources/resource/js/plugins/icheck/icheck.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/scrolltotop/scrolltopcontrol.js"></script>

	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/morris/raphael-min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/morris/morris.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/rickshaw/d3.v3.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/rickshaw/rickshaw.min.js"></script>
	<script type='text/javascript'
		src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
	<script type='text/javascript'
		src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
	<script type='text/javascript'
		src='/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-file-input.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/owl/owl.carousel.min.js"></script>

	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/moment.min.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- END THIS PAGE PLUGINS-->

	<!-- START TEMPLATE -->
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/plugins.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/actions.js"></script>
	<script type="text/javascript"
		src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script>
	<!-- END TEMPLATE -->
	<!-- END SCRIPTS -->
</body>
</html>