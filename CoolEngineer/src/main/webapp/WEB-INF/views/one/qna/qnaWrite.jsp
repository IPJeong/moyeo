<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../etc/header.jsp"%>

<head>
	<title>Q&A작성 양식</title>
	
<style>
	.btn {
		margin-right:26%;
	}
</style>
</head>

<body>
<div class="col-md-12">                   
    <form class="form-horizontal" action="qnaWritePro" method="post">
    	<input type="hidden" name="qboard_num" value="${qboard_num}">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><strong>Q&A</strong> 궁금한 사항을 물어보세요!</h3>
            <ul class="panel-controls">
                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
            </ul>
        </div>
        <div class="panel-body">
            <p>양우진 닥쳐</p>
        </div>
        <div class="panel-body">                                                                        
            
            
            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">질문제목</label>
                <div class="col-md-6 col-xs-12">                                            
                    <div class="input-group">
                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                        <input type="text" name="title" class="form-control"/>
                    </div>                                            
                    <span class="help-block">질문제목을 입력하세요.</span>
                </div>
            </div>
            
            
            <div class="form-group">
                <label class="col-md-3 col-xs-12 control-label">질문내용</label>
                <div class="col-md-6 col-xs-12">                                            
                    <textarea class="form-control" name="content" rows="30" style="line-height:10px;"></textarea>
                    <span class="help-block">질문내용을 입력하세요.</span>
                </div>
            </div>
            


        </div>
        <div class="panel-footer">
            <button class="btn btn-default">Clear Form</button>                                    
            <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
        </div>
    </div>
    </form>
    
</div>	

</body>

<%@ include file="../../etc/footer.jsp"%>  
