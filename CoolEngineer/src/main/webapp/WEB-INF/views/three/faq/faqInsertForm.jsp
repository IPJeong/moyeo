<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../etc/header.jsp"%>
<div class="col-md-6-6">
	<div class="panel panel-default">
	    <div class="panel-body">
	        <h2>FAQ 입력</h2>
	        <form action="faqInsert" method="post" role="form" class="form-material">	            
	            <div class="form-group">  
                    <select class="form-control" id="InputFaqCtg" name="ctgName" required> 
                    	<option value=""></option>                       
                        <c:if test="${cnt > 0}">
							<c:forEach var="dto" items="${dtos}">								
                        		<option value="${dto.ctgName}">${dto.ctgName}</option>
                        	</c:forEach>
                        </c:if>                                            
                    </select>
                    <span class="form-bar"></span>
                    <label class="float-label" for="InputFaqCtg">카테고리</label>
                </div>
	            <div class="form-group">
	                <input type="text" class="form-control" id="InputFaqQ" name="faqTitle" required>                                            
	                <span class="form-bar"></span>
	                <label class="float-label" for="InputFaqQ">질문</label>
	            </div>
	             <div class="form-group">
	                <input type="text" class="form-control" id="InputFaqA" name="faqContent" required>                                            
	                <span class="form-bar"></span>
	                <label class="float-label" for="InputFaqA">답변</label>
	            </div>
	            <div class="panel-heading">
                	  <div class="form-group">
	                	  	<div class="col-md-6">
	                          	<button type="submit" class="btn btn-info btn-block">질문등록</button>
	                        </div>  
	                        <div class="col-md-6">
	                         	<button class="btn btn-warning btn-block" onclick="window.history.back();">취소</button>
	                    	</div>                                                                                     
                     </div>      
                </div>
	        </form>
	        
	    </div>
	</div>
</div>    

<%@ include file="../../etc/footer.jsp"%>