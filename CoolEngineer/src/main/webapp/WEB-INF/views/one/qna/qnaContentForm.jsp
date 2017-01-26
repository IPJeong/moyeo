<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../etc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>
	<title>Q&A작성 양식</title>
	
<style>
	 .button {
		margin-right:47%;
	} 
	
	.col-md-3 {
		margin-left:22%;
		width:55%;		
	}
	
</style>
<script type="text/javascript">
	function delChk(){
		if(confirm("정말 삭제하시겠습니까?\n(답변이 달린 경우 함께 삭제됩니다.)")){
			window.location='/moyeo/one/qnaDeletePro?qboard_num='+${dto.qboard_num}+'&pageNum='+${pageNum};
		} 
	}
	
	function delAnsChk(num){
		if(confirm("정말 삭제하시겠습니까?")){
			window.location='/moyeo/one/qnaAnsDelPro?reply_num='+num+'&pageNum='+${pageNum}+"&qboard_num="+${qboard_num}+"&number="+${number};
			//window.location='qnaAnsDelPro?reply_num='+${bdto.reply_num}+'&pageNum='+${pageNum};
		} 
	}
</script>
</head>

<body>
	<div class="col-md-12">                      
	     <form class="form-horizontal">
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
                        <h3><span class="fa fa-info-circle"></span> Q&A 질문</h3>
                        <p>Some quick info about this user</p>
                    </div>
                    <div class="panel-body form-group-separated">     
                        <div class="form-group" style="width:100%;">
                            <label class="col-md-4 col-xs-5 control-label" style="width:18%;">작성날짜</label>
                            <div class="col-md-8 col-xs-7 line-height-30" style="width:82%;"><fmt:formatDate value="${dto.write_date}" type="both" pattern="yyyy-MM-dd HH:mm"/></div>
                        </div>
                       
                        <div class="form-group" style="width:100%;">
                            <label class="col-md-4 col-xs-5 control-label" style="width:18%;">작성자</label>
                            <div class="col-md-8 col-xs-7 line-height-30" style="width:82%;">${dto.mem_id}</div>
                        </div>
                        
                        <div class="form-group" style="width:100%;">
                            <label class="col-md-4 col-xs-5 control-label" style="width:18%;">글제목</label>
                            <div class="col-md-8 col-xs-7" style="width:82%;">${dto.title}</div>
                        </div>
                        
                        <div class="form-group" style="width:100%;">
                            <label class="col-md-4 col-xs-5 control-label" style="width:18%;">글내용</label>
                            <div class="col-md-8 col-xs-7 line-height-30" style="width:82%;">${dto.content}</div>
                        </div>  
                    </div>
                </div>          
              </div>
              
              <div class="col-md-3" style="width:50%; margin-left:24%; background:#EAEAEA" >
                <div class="panel panel-default form-horizontal">
                    <div class="panel-body">
                        <h3><span class="fa fa-info-circle"></span> 답변</h3>
                    </div>
                    <c:forEach var="bdto" items="${bdtos}">
                    <div class="panel-body form-group-separated" style="border: 2px solid black; margin-top: 5px;">                                    
                        <div class="form-group" style="width:100%;">
                        	<label class="col-md-4 col-xs-5 control-label" style="width:18%;">작성자</label>
                            <div class="col-md-8 col-xs-7 line-height-30" style="width:82%;">${bdto.manager_id} 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${bdto.write_date}" type="both" pattern="yyyy-MM-dd HH:mm"/> 
							<input type="button" value="삭제" style="margin-left:65%" onclick="delAnsChk('${bdto.reply_num}');">
							</div>
                        </div>
       
                        <div class="form-group" style="width:100%;">
                            <label class="col-md-4 col-xs-5 control-label" style="width:18%;">답변내용</label>
                            <div class="col-md-8 col-xs-7 line-height-30" style="width:82%;">${bdto.reply_content}</div>
                        </div>  
                    </div>
                    </c:forEach>
                </div>          
              </div>

              
	         <div class="panel-footer">
	         	<div class="button">
	         	
	         		<c:if test="${sessionScope.authority=='manager'}">
	         			<input type="button" class="btn btn-primary pull-right" value="답글쓰기"
	         			       onclick="window.location='qnaAnswerForm?qboard_num=${dto.qboard_num}&pageNum=${pageNum}&number=${number}'">
	         		</c:if>
	         		
	         		<c:if test="${sessionScope.mem_id==dto.mem_id}">
	             		<input type="button" class="btn btn-primary pull-right" value="삭제" onclick="delChk();">
	             	</c:if>
	             	
	             	<c:if test="${sessionScope.mem_id==dto.mem_id}"> 
	             		<input type="button" class="btn btn-primary pull-right" value="수정"
	             		  	 onclick="window.location='qnaModifyForm?qboard_num=${dto.qboard_num}&pageNum=${pageNum}&number=${number}'">                      
	         		</c:if>
	         			
	         			<input type="button" class="btn btn-primary pull-right" value="목록"
	         			       onclick="window.location='qna?pageNum=${pageNum}'">
	         	</div>
	         </div>
	     </div>
	     </form>           
    </div>
</body>
</html>


<%@ include file="../../etc/footer.jsp"%>  