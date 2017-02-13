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
</head>

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<script type='text/javascript' src="/moyeo/resources/resource/js/plugins/icheck/icheck.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/scrolltotop/scrolltopcontrol.js"></script>

<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/morris/raphael-min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/morris/morris.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/rickshaw/d3.v3.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/rickshaw/rickshaw.min.js"></script>
<script type='text/javascript' src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
<script type='text/javascript' src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
<script type='text/javascript' src='/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/owl/owl.carousel.min.js"></script>

<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/moment.min.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/daterangepicker/daterangepicker.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->
<style>
.page-container .page-content .content-frame{
/* background:black; */
 background:#FFFFFF; 
}
.breadcrumb{
background:#C1F3FF;
}
</style> 
<script src="/moyeo/resources/customScript/main.js"></script>
<script>            
    document.getElementById('links').onclick = function (event) {
        event = event || window.event;
        var target = event.target || event.srcElement;
        var link = target.src ? target.parentNode : target;
        var options = {index: link, event: event,onclosed: function(){
                setTimeout(function(){
                    $("body").css("overflow","");
                },200);                        
            }};
        var links = this.getElementsByTagName('a');
        blueimp.Gallery(links, options);
    };
</script>

<!-- END SCRIPTS -->

<body class="x-dashboard">
	<!-- START PAGE CONTAINER -->
	
	<div class="page-container">

		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">	

			<%@ include file="../../etc/header.jsp"%>
 
        		 <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="/moyeo/main/home">Home</a></li>
                    <li class="active">사진</li>
                </ul>
               <!-- END BREADCRUMB -->                                             
                
                <!-- START CONTENT FRAME -->
                <div class="content-frame">   
                    
                    <!-- START CONTENT FRAME TOP -->
                    <div class="content-frame-top">                        
                        <div class="page-title">                    
                            <h2><span class="fa fa-image"></span> 모임후기 사진첩</h2>
                        </div>                                      
                        <div class="pull-right">                            
<!--                             <button class="btn btn-primary"><span class="fa fa-upload"></span> Upload</button> -->
<!--                             <button class="btn btn-default content-frame-right-toggle"><span class="fa fa-bars"></span></button> -->
                        </div>                         
                    </div>
                    
                    <!-- START CONTENT FRAME RIGHT -->
                    <div class="content-frame-right">
                    	<div id="titleForm" style="height:50px;">
                    		
                    	</div>                        
                        <div class="block push-up-10">
                            <div class="dropzone dropzone-mini" style="height:350px; overflow:auto;" id="contentForm">
								                            
                            </div>
                        </div>                        
                                        
                        <h4>태그:</h4>
                        <ul class="list-tags" id="listTags">
<!--                             <li><a href="#"><span class="fa fa-tag"></span> amet</a></li> -->
<!--                             <li><a href="#"><span class="fa fa-tag"></span> rutrum</a></li> -->
<!--                             <li><a href="#"><span class="fa fa-tag"></span> nunc</a></li> -->
<!--                             <li><a href="#"><span class="fa fa-tag"></span> tempor</a></li> -->
<!--                             <li><a href="#"><span class="fa fa-tag"></span> eros</a></li> -->
<!--                             <li><a href="#"><span class="fa fa-tag"></span> suspendisse</a></li> -->
<!--                             <li><a href="#"><span class="fa fa-tag"></span> dolor</a></li> -->
                        </ul>
                    </div>
                    <!-- END CONTENT FRAME RIGHT -->
                
                    <!-- START CONTENT FRAME BODY -->
                    <div class="content-frame-body content-frame-body-left">
                        
                        <div class="gallery" id="links">
                        	<c:forEach var="dto" items="${dtos}">
	                        	
	                        		<div class="gallery-item" >
		                        		<a href="${dto.pic_path}/${dto.pic_name}" title="모임후기 사진~" data-gallery>
			                                <div class="image">
			                                    	<img src="${dto.pic_path}/${dto.pic_name}" alt="모임후기 사진~" width="200px" height="150px"/>
			                                </div>
		                                </a>
		                                <button class="btn btn-info btn-rounded" style="margin-top: 5px; float:right;">
											<span class="fa fa-hand-o-right" onclick="return getPostDetails('${dto.post_num}')"></span>
										</button>
		                             </div>
	                                	
<!-- 	                                <div class="meta"> -->
<!-- 	                                    <strong>1Nature image 1</strong> -->
<!-- 	                                    <span>Description</span> -->
<!-- 	                                </div>                                 -->

                            </c:forEach>
                        </div>
                             
                        <div>
							<!-- 게시판 페이지 리스트 -->
						  	<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="margin-left: 30px; margin-right: 40%;">
								<c:if test="${cnt > 0}">
									<c:if test="${startPage > pageBlock}">
										<li class=""><a href="/moyeo/main/main_gallery?page_num=${startPage - pageBlock}"><font size="3"> «</font></a></li>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class=""><a href="#"><font size="3">${i}</font></a></li>
										</c:if>
										<c:if test="${i != currentPage}">
											<li class=""><a href="/moyeo/main/main_gallery?pageNum=${i}"><font size="3">${i}</font></a></li>
										</c:if>
									</c:forEach>
									<c:if test="${pageCount > endPage}">
										<li><a href="/moyeo/main/main_gallery?page_num${startPage + pageBlock}"><font size="3">»</font></a></li>
									</c:if>
								</c:if>
							</ul>
						</div>
                    </div>       
                    <!-- END CONTENT FRAME BODY -->
                </div>               
                <!-- END CONTENT FRAME -->
                                
                
            </div>            
            <!-- END PAGE CONTENT -->
        </div>
        <!-- END PAGE CONTAINER -->
        
        <!-- BLUEIMP GALLERY -->
        <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
            <div class="slides"></div>
            <h3 class="title"></h3>
            <a class="prev">‹</a>
            <a class="next">›</a>
            <a class="close">×</a>
            <a class="play-pause"></a>
            <ol class="indicator"></ol>
        </div>      
        <!-- END BLUEIMP GALLERY -->
        
        <!-- MESSAGE BOX-->
        <!-- <div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
            <div class="mb-container">
                <div class="mb-middle">
                    <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
                    <div class="mb-content">
                        <p>Are you sure you want to log out?</p>                    
                        <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
                    </div>
                    <div class="mb-footer">
                        <div class="pull-right">
                            <a href="pages-login.html" class="btn btn-success btn-lg">Yes</a>
                            <button class="btn btn-default btn-lg mb-control-close">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- END MESSAGE BOX-->
	</div>
 <%@ include file="../../etc/footer.jsp"%>
 </body>
 </html>            