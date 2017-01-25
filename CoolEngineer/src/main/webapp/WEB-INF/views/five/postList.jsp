<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>        
   <!-- META SECTION -->
   <title>Atlant - Responsive Bootstrap Admin Template</title>            
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   
   <link rel="icon" href="favicon.ico" type="image/x-icon" />
   <!-- END META SECTION -->
                   
   <!-- CSS INCLUDE -->        
   <link rel="stylesheet" type="text/css" id="theme" href="/moyeo/resources/resource/css/theme-default.css"/>
   <!-- EOF CSS INCLUDE -->
<style>
@media only screen and (max-width: 1010px) {
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features
	{
		width: 100%;
		background-color: #FBFBFB;
		padding: 0px 20px;
	}
}
@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open
	{
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
@media (min-width: 992px){
.col-lg-2 {
    width: auto;
    }
}

</style>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>
<body>
<%@include file="../etc/moim_header.jsp" %>
    
    <!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
    
	    <%@include file="../etc/moim_side.jsp" %>
	    <!-- START PHOTO BLOCK -->
		
		
		                
     </div>
 </div>          
              
    <!-- START SCRIPTS -->
<!--         START PLUGINS -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>                
        
        <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
		
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js"></script>                
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-file-input.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>        
        <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>        
        <!-- END TEMPLATE -->
        
        <script type="text/javascript" src="/moyeo/resources/customScript/five.js"></script>
    <!-- END SCRIPTS -->                   
    </body>
</html>