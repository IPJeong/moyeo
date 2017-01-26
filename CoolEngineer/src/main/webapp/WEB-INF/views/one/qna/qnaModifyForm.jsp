<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../etc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<title>Q&A작성 양식</title>
	
<style>
	 .button {
		margin-right:47%;
	} 
	
</style>
</head>

<body>
	<div class="col-md-12">                      
	     <form class="form-horizontal" action="/moyeo/one/qnaModifyPro" method="post">
	     
	     <input type="hidden" name="qboard_num" value="${qboard_num}">
	     <input type="hidden" name="pageNum" value="${pageNum}">
	     <input type="hidden" name="number" value="${number}">
	     
	     <div class="panel panel-default">
	         <div class="panel-heading">
	             <h3 class="panel-title"><strong>Separated</strong> Layout</h3>
	             <ul class="panel-controls">
	                 <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
	             </ul>
	         </div>
	         <div class="panel-body">
	             <p>Add class <code>.form-group-separated</code> to form wrapper to get rows separated</p>
	         </div>
	         <div class="panel-body form-group-separated">
	             
	             <div class="form-group">
	                 <label class="col-md-3 col-xs-12 control-label">작성날짜</label>
	                 <div class="col-md-6 col-xs-12">                                            
	                     <div class="input-group">
	                         <div class="col-md-8 col-xs-7 line-height-30" style="width:100%">${dto.write_date}</div>
	                     </div>                                           
	                 </div>
	             </div>
	             
	             <div class="form-group">
	                 <label class="col-md-3 col-xs-12 control-label">작성자</label>
	                 <div class="col-md-6 col-xs-12">                                            
	                     <div class="input-group">
	                         <div class="col-md-8 col-xs-7 line-height-30" style="width:100%;">${dto.mem_id}</div>
	                     </div>
	                 </div>
	             </div>
	             
	             <div class="form-group">
	                 <label class="col-md-3 col-xs-12 control-label">글제목</label>
	                 <div class="col-md-6 col-xs-12">                                            
	                     <div class="input-group">
	                         <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
	                         <input type="text" class="form-control" value="${dto.title}" name="title"/>
	                     </div>                                            
	                     <span class="help-block">This is sample of text field</span>
	                 </div>
	             </div>                               
	             
	             <div class="form-group">
	                 <label class="col-md-3 col-xs-12 control-label">내용</label>
	                 <div class="col-md-6 col-xs-12">                                            
	                     <textarea class="form-control" rows="15" name="content">${dto.content}</textarea>
	                     <span class="help-block">Default textarea field</span>
	                 </div>
	             </div>
	
	
	         </div>
	         <div class="panel-footer">
	         	<div class="button">
	             	<input type="reset" class="btn btn-primary pull-right" value="수정취소"
	             	       onclick="window.history.back();">
	             	<c:if test="${sessionScope.mem_id==dto.mem_id}">
	             	<input type="submit" class="btn btn-primary pull-right" value="수정하기">        
	         		</c:if>
	         	</div>
	         </div>
	     </div>
	     </form>           
    </div>
</body>
</html>


<%@ include file="../../etc/footer.jsp"%>  