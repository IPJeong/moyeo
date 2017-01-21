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
    </head>
    <body>
    <%@include file="../etc/moim_header.jsp" %>
    
    <!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
    
    <%@include file="../etc/moim_side.jsp" %>
    <!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top: 10px;">
		<div class="panel panel-default">     
           <form class="form-horizontal">
               <div class="panel panel-default">
                   <div class="panel-heading">
                       <h3 class="panel-title"><strong>One Column</strong> Layout</h3>
                       <ul class="panel-controls">
                           <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                       </ul>
                   </div>
                   <div class="panel-body">
                       <p>This is non libero bibendum, scelerisque arcu id, placerat nunc. Integer ullamcorper rutrum dui eget porta. Fusce enim dui, pulvinar a augue nec, dapibus hendrerit mauris. Praesent efficitur, elit non convallis faucibus, enim sapien suscipit mi, sit amet fringilla felis arcu id sem. Phasellus semper felis in odio convallis, et venenatis nisl posuere. Morbi non aliquet magna, a consectetur risus. Vivamus quis tellus eros. Nulla sagittis nisi sit amet orci consectetur laoreet. Vivamus volutpat erat ac vulputate laoreet. Phasellus eu ipsum massa.</p>
                   </div>
                   <div class="panel-body">                                                                        
                       
                       <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Text Field</label>
                           <div class="col-md-6 col-xs-12">                                            
                               <div class="input-group">
                                   <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                   <input type="text" class="form-control"/>
                               </div>                                            
                               <span class="help-block">This is sample of text field</span>
                           </div>
                       </div>
                       
                       <div class="form-group">                                        
                           <label class="col-md-3 col-xs-12 control-label">Password</label>
                           <div class="col-md-6 col-xs-12">
                               <div class="input-group">
                                   <span class="input-group-addon"><span class="fa fa-unlock-alt"></span></span>
                                   <input type="password" class="form-control"/>
                               </div>            
                               <span class="help-block">Password field sample</span>
                           </div>
                       </div>
                       
                       <div class="form-group">                                        
                           <label class="col-md-3 col-xs-12 control-label">Datepicker</label>
                           <div class="col-md-6 col-xs-12">
                               <div class="input-group">
                                   <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                   <input type="text" class="form-control datepicker" value="2015-11-01">                                            
                               </div>
                               <span class="help-block">Click on input field to get datepicker</span>
                           </div>
                       </div>
                       
                       <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Textarea</label>
                           <div class="col-md-6 col-xs-12">                                            
                               <textarea class="form-control" rows="5"></textarea>
                               <span class="help-block">Default textarea field</span>
                           </div>
                       </div>
                       
                       <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Tags</label>
                           <div class="col-md-6 col-xs-12">                                                                                            
                               <input type="text" class="tagsinput" value="First,Second,Third"/>
                               <span class="help-block">Default textarea field</span>
                           </div>
                       </div>
                       
                       <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Select</label>
                           <div class="col-md-6 col-xs-12">                                                                                            
                               <select class="form-control select">
                                   <option>Option 1</option>
                                   <option>Option 2</option>
                                   <option>Option 3</option>
                                   <option>Option 4</option>
                                   <option>Option 5</option>
                               </select>
                               <span class="help-block">Select box example</span>
                           </div>
                       </div>
                       
                       <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">File</label>
                           <div class="col-md-6 col-xs-12">                                                                                                                                        
                               <input type="file" class="fileinput btn-primary" name="filename" id="filename" title="Browse file"/>
                               <span class="help-block">Input type file</span>
                           </div>
                       </div>
                       
                       <div class="form-group">
                           <label class="col-md-3 col-xs-12 control-label">Checkbox</label>
                           <div class="col-md-6 col-xs-12">                                                                                                                                        
                               <label class="check"><input type="checkbox" class="icheckbox" checked="checked"/> Checkbox title</label>
                               <span class="help-block">Checkbox sample, easy to use</span>
                           </div>
                       </div>

                   </div>
                   <div class="panel-footer">
                       <button class="btn btn-default">Clear Form</button>                                    
                       <button class="btn btn-primary pull-right">Submit</button>
                   </div>
               </div>
               </form>
              </div>
          </div>                    
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
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-select.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>        
        <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>        
        <!-- END TEMPLATE -->
    <!-- END SCRIPTS -->                   
    </body>
</html>