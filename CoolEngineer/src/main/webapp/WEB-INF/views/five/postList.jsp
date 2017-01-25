<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	    
	     <!-- START RESPONSIVE TABLES -->
      <div style="margin-top:12px; width:1250px; height:860px;" class="panel panel-default">
          <div class="panel-heading">
              <h3 class="panel-title">모임후기 게시판</h3>
          </div>
          
          <div class="panel-body panel-body-table">

              <div class="table-responsive">
                  <table class="table table-bordered table-striped table-actions">
                      <thead>
                      	  <c:forEach var="dto" items="dtos">
	                          <tr>
	                              <th width="50">${number}</th>
	                              <c:set var="number" value="${number-1}"/>
	                              <th width="450px;">${dto.post_title}</th>
	                              <th width="150px;"><img alt="미리보기 화면입니다." src=""></th>
	                              <th width="100">조회수</th>
	                              <th width="100">좋아한 사람수</th>
	                              <th width="100">작성일</th>
	                              <th width="120">관리</th>
	                          </tr>
                          </c:forEach>
                      </thead>
                      <tbody>                                            
                          <tr id="trow_1">
                              <td class="text-center">1</td>
                              <td><strong>John Doe</strong></td>
                              <td><span class="label label-success">New</span></td>
                              <td><span class="label label-success">New</span></td>
                              <td>$430.20</td>
                              <td>24/09/2015</td>
                              <td>
                                  <button class="btn btn-default btn-rounded btn-condensed btn-sm"><span class="fa fa-pencil"></span></button>
                                  <button class="btn btn-danger btn-rounded btn-condensed btn-sm" onClick="delete_row('trow_1');"><span class="fa fa-times"></span></button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>                                

          </div>
      </div>                                                

        <!-- END RESPONSIVE TABLES -->
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