<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
     <form class="form-horizontal">
     <div class="panel panel-default">
         <div class="panel-heading">
             <h3 class="panel-title"><strong>모임신고</strong> 불순한 모임을 신고하세요!</h3>
             <ul class="panel-controls">
                 <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
             </ul>
         </div>
         <div class="panel-body">
             <p>This is non libero bibendum, scelerisque arcu id, placerat nunc. Integer ullamcorper rutrum dui eget porta. Fusce enim dui, pulvinar a augue nec, dapibus hendrerit mauris. Praesent efficitur, elit non convallis faucibus, enim sapien suscipit mi, sit amet fringilla felis arcu id sem. Phasellus semper felis in odio convallis, et venenatis nisl posuere. Morbi non aliquet magna, a consectetur risus. Vivamus quis tellus eros. Nulla sagittis nisi sit amet orci consectetur laoreet. Vivamus volutpat erat ac vulputate laoreet. Phasellus eu ipsum massa.</p>
         </div>
         <div class="panel-body">                                                                        
             
             <div class="form-group">
                 <label class="col-md-3 col-xs-12 control-label">모임이름</label>
                 <div class="col-md-6 col-xs-12">                                            
                     <div class="input-group">
                         <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                         <input type="text" class="form-control"/>
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
                     <input type="file" class="fileinput btn-primary" name="pic_path" id="pic_path" title="Browse file" />
                     <span class="help-block">Input type file</span>
                 </div>
             </div>
             
         </div>
         <div class="panel-footer">
             <button class="btn btn-default">Clear Form</button>                                    
             <a href="../one/moimReportPro"><input type="button" class="btn btn-primary pull-right" value="글쓰기"></a>
         </div>
     </div>
     </form>
     
 </div>


</body>




<%@ include file="../../etc/footer.jsp"%>