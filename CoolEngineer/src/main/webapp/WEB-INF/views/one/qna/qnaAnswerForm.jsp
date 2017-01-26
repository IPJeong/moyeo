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
	
	.col-md-3 {
		margin-left:37%;
	}
	
</style>
<script type="text/javascript">
	function delChk(){
		if(confirm("정말 삭제하시겠습니까?")){
			window.location='qnaDeletePro?qboard_num='+${dto.qboard_num}+'&pageNum='+${pageNum};
		} 
	}
</script>
</head>

<body>
	<div class="col-md-12">                      
	     <form class="form-horizontal" action="qnaAnswerPro" method="post">
	     
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
	         
	         <div class="col-md-3">
                <div class="panel panel-default form-horizontal">
                    <div class="panel-body">
                        <h3><span class="fa fa-info-circle"></span> Quick Info</h3>
                        <p>Some quick info about this user</p>
                    </div>
                    <div class="panel-body form-group-separated">                                    
                        <div class="form-group" style="width:100%;">
                            <label class="col-md-4 col-xs-5 control-label" style="width:18%;">작성날짜</label>
                            <div class="col-md-8 col-xs-7 line-height-30" style="width:82%;">${dto.write_date}</div>
                        </div>
                        <div class="form-group" style="width:100%;">
                            <label class="col-md-4 col-xs-5 control-label" style="width:18%;">작성자</label>
                            <div class="col-md-8 col-xs-7 line-height-30" style="width:82%;">${dto.mem_id}</div>
                        </div>
                        <div class="form-group" style="width:100%;">
                            <label class="col-md-4 col-xs-5 control-label" style="width:18%;">글제목</label>
                            <div class="col-md-8 col-xs-7" style="width:82%;" name="title">${dto.title}</div>
                        </div>
                        <div class="form-group" style="width:100%;">
                            <label class="col-md-4 col-xs-5 control-label" style="width:18%;">글내용</label>
                            <div class="col-md-8 col-xs-7 line-height-30" style="width:82%;">${dto.content}</div>
                        </div>
                                        
                    </div>              
                </div>    

                <div class="form-group" style="width:100%">
	                 <label class="col-md-3 col-xs-12 control-label" style="width:18%">답변</label>
	                 <div class="col-md-6 col-xs-12">                                            
	                     <textarea class="form-control" rows="15" name="reply_content" style="width:210%"></textarea>
	                     <span class="help-block">Default textarea field</span>
	                 </div>
	            </div>      
              </div>
              
	          <div class="panel-footer">
	         	<div class="button">
	             	<input type="reset" class="btn btn-primary pull-right" value="답변취소"
	             	       onclick="window.history.back();">
	      
	             	<input type="submit" class="btn btn-primary pull-right" value="답변하기">
	         	</div>
	          </div>
	     </div>
	     </form>           
    </div>
</body>
</html>


<%@ include file="../../etc/footer.jsp"%>  