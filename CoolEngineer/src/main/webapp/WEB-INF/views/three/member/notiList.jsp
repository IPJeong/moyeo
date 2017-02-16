<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.panel-default .panel-heading, .panel-primary .panel-heading, .panel-success .panel-heading, .panel-info .panel-heading, .panel-warning .panel-heading, .panel-danger .panel-heading {
    background: linear-gradient( to left, #4DB6AC, #80CBC4 ,#B2DFDB, #E0F2F1);    
}

</style>

</head>

<script>
      document.body.style.overflow='hidden';  
      if (navigator.userAgent.indexOf('Chrome')>-1) {  
			    window.resizeTo(800, 450);   
      }
    </script>

<body class="x-dashboard">
	<!-- START PAGE CONTAINER -->
	

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
						<div class="col-md-4" style="margin:0px;padding:0px;padding-left:90%;">							
							<button type="button" class="btn btn-default" onclick="window.close()">닫기</button>
						</div>						
					</div>						
					<div class="panel-body panel-body-table" style="margin-top:51px;">
						<table class="table table-striped table-hover">	
							<thead>
								<tr>
									<th style="width:80%">알림내용</th>
									<th style="width:20%">알림날짜</th>																	
								</tr>
							</thead>						
							<tbody>								
								<c:if test="${cnt > 0}">
									<c:forEach var="dto" items="${dtos}">
										<tr>
											<td>
											${dto.noti_content}
											</td>
											<td>											
											<fmt:formatDate type="both" pattern="yy-MM-dd"
												value="${dto.noti_date}"/>
											</td>																				
										</tr>
									</c:forEach>
								</c:if>																															
							</tbody>
						</table>
					</div>
					<div class="col-md-12">
						<ul
							class="pagination pagination-sm pull-right push-down-10 push-up-10">
							<c:if test="${cnt > 0}">
								<!-- 처음[◀◀] 이전[◀]-->
								<c:if test="${startPage > pageBlock}">
									<li><a href="notiList">«</a></li>
									<li><a href="notiList?pageNum=${startPage - pageBlock}">‹</a></li>
								</c:if>
				
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<li class="active"><a href="#">${i}</a></li>
									</c:if>
									<c:if test="${i != currentPage}">
										<li><a href="notiList?pageNum=${i}">${i}</a></li>
									</c:if>
								</c:forEach>
				
								<!-- 다음[▶] 끝[▶▶] -->
								<c:if test="${pageCount > endPage}">
									<li><a href="notiList?pageNum=${startPage + pageBlock}">›</a></li>
									<li><a href="notiList?pageNum=${pageCount}">»</a></li>
								</c:if>
							</c:if>
						</ul>
					</div>
				</div>
			
			</div>
		</div>
	</div>
	
	
	<!-- START SCRIPTS -->
	
	<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- THIS PAGE PLUGINS -->
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-timepicker.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-colorpicker.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-file-input.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-select.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
<!-- END THIS PAGE PLUGINS -->

<!-- START TEMPLATE -->
<script type="text/javascript"
	src="/moyeo/resources/resource/js/settings.js"></script>
	<script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>        
        <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script> 
</body>
</html>