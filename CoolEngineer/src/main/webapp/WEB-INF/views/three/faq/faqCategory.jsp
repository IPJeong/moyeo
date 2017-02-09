<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../etc/header2.jsp"%>
<div class="col-md-6-6">
	<div class="panel panel-default">
	    <div class="panel-body">
	        <h2>카테고리 입력</h2>
	        <form action="faqCtgInput" method="post" class="form-material" name="faqInput">
	            <div class="form-group">
	                <input type="text" class="form-control" name="ctgName" id="InputCategory" required>                                            
	                <span class="form-bar"></span>
	                <label class="float-label" for="InputCategory">카테고리</label><br>
	                <div class="col-md-6">
                    	 <input type="submit" class="btn btn-primary btn-block" value="카테고리 생성">
                    </div>
                    <div class="col-md-6">
                         <button type="button" class="btn btn-info btn-block" onclick="window.location='/moyeo/three/faq';">취소</button>
                    </div>
	            </div>	            
	        </form>	        
	    </div>
	</div>
</div>    

<%@ include file="../../etc/footer2.jsp"%>