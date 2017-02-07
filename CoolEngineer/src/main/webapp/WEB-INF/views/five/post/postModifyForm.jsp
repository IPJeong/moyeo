<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="../../etc/moim_header.jsp" %>
<head>        
   <!-- META SECTION -->
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   
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
	overflow: auto;
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
 
<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="/moyeo/main/main">Home</a></li>
	<li><a href="/moyeo/category/category_hobby">모임</a></li>
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${open_dto.group_name}</a></li>
	<li class="active">모임동영상</li>
</ul>
<!-- END BREADCRUMB --> 
    
    <!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
    
	    <%@include file="../../etc/moim_side.jsp" %>
	    <!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">     
	           <form:form class="form-horizontal" action="modifyPostPro" method="post" modelAttribute="uploadForm" enctype="multipart/form-data">
	               <input type="hidden" name="post_num" value="${postDto.post_num}">
	               <input type="hidden" name="pageNum" value="${pageNum}">
	               <div class="panel panel-default">
	                   <div class="panel-heading">
	                       <h3 class="panel-title"><strong>모임후기 수정</strong></h3>
	                   </div>
	                   <div class="panel-body" >                                                                        
	                       <div style="float:left; width:65%; height:600px; margin-bottom:30px; margin-top:30px; overflow:auto;">
	                       		<div class="form-group">
		                           <label class="col-md-3 col-xs-12 control-label">제목</label>
		                           <div class="col-md-6 col-xs-12">                                            
		                               <div class="input-group">
		                                   <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
		                                   <input type="text" class="form-control" name="post_title" maxlength="30" value="${postDto.post_title}" required/>
		                               </div>                                            
		                           </div>
		                       </div>
	                       
		                       <div class="form-group">
		                           <label class="col-md-3 col-xs-12 control-label">후기내용</label>
		                           <div class="col-md-6 col-xs-12">                                            
		                               <textarea class="form-control" rows="20" name="post_content" maxlength="1000" required>${postDto.post_content}</textarea>
		                           </div>
		                       </div>
	                       
		                       <div class="form-group">
		                           <label class="col-md-3 col-xs-12 control-label">태그</label>
		                           <div class="col-md-6 col-xs-12">                                                                                            
		                               <input type="text" class="tagsinput" name="post_tag" value="${postDto.post_tag}"/>
		                           </div>
		                       </div>
	                       
		                       <div class="form-group">
		                           <label class="col-md-3 col-xs-12 control-label">첨부파일</label>
		                           <input class="btn btn-info btn-rounded" id="addFile" type="button" value="파일추가" />
		                           <div class="col-md-6 col-xs-12">
		                           	   <span class="help-block">사진 & 동영상을 추가해보세요.</span>
		                           	   <div id="fileview">
		                               		<input class="btn btn-warning btn-rounded" id="file0" type="file" name="files[0]" onchange="chkType('file0')" />
		                               </div>
		                           </div>
		                       </div>
	                       </div>
	                       
	                       <div style="float:left; width:30%; height:500px; margin-top:40px;">
	                       		<div>
	                       			<h3>이미지 수정</h3>
	                       		</div>
	                       		<div style="overflow:auto; margin-top:20px; height:450px;">
			                       	<table>
			                       		<c:forEach var="picDto" items="${picDtos}">
			                       			<tr>
			                       				<td>
			                       					<input type="hidden" name="pic_name" value="${picDto.pic_name}" videoName>
			                       					<img src="${picDto.pic_path}/${picDto.pic_name}" style="width:220px; height:220px;">
			                       				</td>
			                       				<td>
			                       					<select class="form-control" style="margin-left:10px; width:50px;" name="pic_deletes">
			                       						<option value="0">유지</option>
			                       						<option value="${picDto.pic_num}">삭제</option>
			                       					</select>
			                       				</td>
			                       			</tr>
			                       		</c:forEach>
			                       		<c:forEach var="videoDto" items="${videoDtos}">
			                       			<tr>
			                       				<td>
			                       					<input type="hidden" name="video_name" value="${videoDto.video_name}">
			                       					<video style="width:160px; height:160px;" controls>
			                       						<source src="${videoDto.video_path}/${videoDto.video_name}" >
			                       					</video>
			                       				</td>
			                       				<td>
			                       					<select class="form-control" style="margin-left:10px; width:50px;" name="video_deletes">
			                       						<option value="0">유지</option>
			                       						<option value="${videoDto.video_num}">삭제</option>
			                       					</select>
			                       				</td>
			                       			</tr>
			                       		</c:forEach>
			                       	</table>
		                       	</div>
		                   </div>
	                   </div>
	               </div>
	               <div class="panel-footer">
	                       <button class="btn btn-default" type="button" onclick="window.location='postList'">취소</button>                                    
	                       <button class="btn btn-primary pull-right" type="submit">수정</button>
                   </div>
          		</form:form>
             </div>
         </div>                    
     </div>
 </div>          
 
              
    <!-- START SCRIPTS -->
		<!-- TART PLUGINS -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>                
        
        <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
		
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js"></script>                
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-file-input.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        <!-- END TEMPLATE -->
        
        <script type="text/javascript" src="/moyeo/resources/customScript/five.js"></script>
    <!-- END SCRIPTS -->                   
    </body>
</html>