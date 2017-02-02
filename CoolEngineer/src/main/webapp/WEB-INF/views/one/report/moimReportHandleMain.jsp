<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../etc/moim_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

<style>
.col-md-12 {
	width: 75%;
	margin: auto;
	float: none;
}

.panel.panel-default {
	margin: 30px;
}

.panel .panel-body {
	padding: 0px;
}

.col-md-6 {
	border-left-color: #F5F5F5;
	border-left-width: 1px;
	border-left-style: solid;
}

.x-content-footer {
	position: relative;
}

.x-dashboard .page-container .page-content {
	background: #e3f8ff;
}

table {
	width: 100%;
	
}

th {
	
	background: #EAEAEA;
    text-align: center;
}


td {
	border: 1px solid #9d9fbc;
}

tr {
	height: 20px;
}

.num {
	width: 7%
}
.subject {
	width: 48%;
}

.writer {
	width: 10%
}
.announce {
	width: 15%;
}

.count {
	width: 10%;
}

.answer {
	width: 10%;
}

.x-dashboard .page-container .page-content {
	height: 837px;
}

.button {
	font-size:15px;  
	width:100px;
	height:30px; 
	align:center; 
	margin-left: 95%; 
	margin-top:-20px"
}
</style>

</head>

<body>


<div class="row">
	<div class="panel panel-default" style="width:80%; margin-left:10%">
	     <div class="panel-heading">
	         <label class="check mail-checkall">
	             <input type="checkbox" class="icheckbox"/>
	         </label>
	         <div class="btn-group">
	             <button class="btn btn-default"><span class="fa fa-mail-reply"></span></button>
	             <button class="btn btn-default"><span class="fa fa-mail-reply-all"></span></button>
	             <button class="btn btn-default"><span class="fa fa-mail-forward"></span></button>
	         </div>
	         <div class="btn-group">
	             <button class="btn btn-default"><span class="fa fa-star"></span></button>                                    
	             <button class="btn btn-default"><span class="fa fa-flag"></span></button>
	         </div>                                
	         <button class="btn btn-default"><span class="fa fa-warning"></span></button>
	         <button class="btn btn-default"><span class="fa fa-trash-o"></span></button>                                                                    
	         <div class="pull-right" style="width: 150px;">
	           
	         </div>
	     </div>
	    <c:if test="${cnt > 0}">
		<c:forEach var="dto" items="${dtos}">
	     <div class="panel-body mail">      
	         <div class="mail-item">
	         	 <c:if test="${dto.sol_status == 'YES'}">
	             <div>
	             	<font style="color:blue">답변완료</font>
	             </div>
	             </c:if>
	             
	             <c:if test="${dto.sol_status != 'YES'}">
	             <div>
	             	답변전
	             </div>
	             </c:if>
	             
	             <div class="mail-user">${dto.mem_id}</div>                                    
	             	<a href="/moyeo/one/reportContentForm?report_num=${dto.report_num}&pageNum=${pageNum}&number=${number+1}" class="mail-text">${dto.report_title}</a>
	             <div class="mail-date">${dto.report_date }</div>
	             
	         </div>                                
	         
	     </div>
	     </c:forEach>
		 </c:if>
	     <div class="panel-footer">                                
	         <div class="btn-group">
	             <button class="btn btn-default"><span class="fa fa-mail-reply"></span></button>
	             <button class="btn btn-default"><span class="fa fa-mail-reply-all"></span></button>
	             <button class="btn btn-default"><span class="fa fa-mail-forward"></span></button>
	         </div>
	         <div class="btn-group">
	             <button class="btn btn-default"><span class="fa fa-star"></span></button>                                    
	             <button class="btn btn-default"><span class="fa fa-flag"></span></button>
	         </div>
	         
	         <button class="btn btn-default"><span class="fa fa-warning"></span></button>
	         <button class="btn btn-default"><span class="fa fa-trash-o"></span></button>                                    
	         
	         <ul class="pagination pagination-sm pull-right">
	         
	         	 <c:if test="${cnt > 0}">
	         	 	<c:if test="${startPage > pageBlock}">
						<li class="disabled"><a href="/moyeo/one/moimReportHandleMain">«</a></li>
						<li class="disables"><a href="/moyeo/one/moimReportHandleMain?pageNum=${startPage - pageBlock}">◀</a></li>
					</c:if>
				</c:if>
				
				<c:if test="${cnt ==0}">
					<tr>
						<td colspan="6" align="center">
							신고글이 없습니다.
						</td>
					</tr>
				</c:if>
				  
	         </ul>
	         
	         <table style="width:100%; align:center">
				<th align="center">
				<c:if test="${cnt > 0}">
				<!-- 처음[◀◀] 이전[◀] ▶-->
					<c:if test="${startPage > pageBlock}">
						<a href="/moyeo/one/moimReportHandleMain">[◀◀]</a>
						<a href="/moyeo/one/moimReportHandleMain?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}" >
							<span><b>[${i}]</b></span>
						</c:if>
						
						<c:if test="${i != currentPage}">
							<a href="/moyeo/one/moimReportHandleMain?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록[▶] 끝[▶▶]-->
					<c:if test="${pageCount > endPage}">
						<a href="/moyeo/one/moimReportHandleMain?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="/moyeo/one/moimReportHandleMain?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
				
				</th>
			</table>
	     </div>                            
	 </div>
	
</div>

</body>

<%@ include file="../../etc/footer.jsp"%>