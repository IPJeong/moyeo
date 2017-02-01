<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ include file="../../etc/moim_header.jsp"%>

<head>
	<title> 모임신고 작성</title>
	
	<style>
	.btn {
		margin-right:26%;
	}
</style>
</head>

<body>
<div class="col-md-12">
     <form:form class="form-horizontal" action="moimReportPro" method="post" modelAttribute="uploadForm" enctype="multipart/form-data">
     	<input type="hidden" name="group_num" value="${group_num}">
     <div class="panel panel-default">
         <div class="panel-heading">
             <h3 class="panel-title"><strong>모임신고</strong> 불순한 모임을 신고하세요!</h3>
             <ul class="panel-controls">
                 <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
             </ul>
         </div>
         <div class="panel-body">                                                                        
             
             <div class="form-group">
                 <label class="col-md-3 col-xs-12 control-label">모임이름</label>
                 <div class="col-md-6 col-xs-12">                                            
                     <div class="input-group">
                         <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                         <input type="text" class="form-control" value="${dto.group_name}"/>
                     </div>                                            
                     <span class="help-block">This is sample of text field</span>
                 </div>
             </div>
             
             <div class="form-group">
                 <label class="col-md-3 col-xs-12 control-label">신고제목</label>
                 <div class="col-md-6 col-xs-12">                                            
                     <div class="input-group">
                         <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                         <input type="text" class="form-control" name="report_title"/>
                     </div>                                            
                     <span class="help-block">This is sample of text field</span>
                 </div>
             </div>
             
             <div class="form-group">
                 <label class="col-md-3 col-xs-12 control-label">신고내용</label>
                 <div class="col-md-6 col-xs-12">                                            
                     <textarea class="form-control" rows="5" name="report_content"></textarea>
                     <span class="help-block">Default textarea field</span>
                 </div>
             </div>
             
             
             <div class="form-group">
                 <label class="col-md-3 col-xs-12 control-label">사진</label>
                 <div class="col-md-6 col-xs-12">                                                                                                                                        
                     <input type="file" class="fileinput btn-primary" name="files[0]" id="pic_path" title="Browse file" />
                     <span class="help-block">Input type file</span>
                 </div>
             </div>
             
         </div>
         <div class="panel-footer">
             <button class="btn btn-default">Clear Form</button>                                    
             <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
         </div>
     </div>
     </form:form>
     
 </div>


</body>




<%@ include file="../../etc/footer.jsp"%>