<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../etc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

<head>

</head>

<body>
	<form action="reportAnswerPro" method="post">
	<div class="timeline-item" style="width:50%; margin-left:25%;">
		
		<input type="hidden" name="report_num" value="${report_num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="number" value="${number}">
		<input type="hidden" name="manager_id" value="${manager_id}">
		
        <div class="timeline-item-content">
           
           <br><br>
           <div style="margin-top:15%">
           <div class="timeline-body">
           	   <font size="6" color="blue">모임번호 --- <a href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">${dto.group_num}</a> </font><br><br>
           	   <font size="5">${dto.report_title}</font>
               <img src="${dto.pic_path}/${dto.pic_name}" class="img-text" width="300" height="300" align="left" onclick="window.open(this.src)" alt="클릭하시면 사진이 커집니다." hspace="0"/>
               <br><br>
               	   <font size="3">${dto.report_content}</font>
               <ul class="list-tags" style="margin-left:12%">                                            
                   <li><a href="#" onclick="window.open('${dto.pic_path}/${dto.pic_name}')"><span class="fa fa-tag"></span> 확대하기</a></li>
               </ul>                                            
           </div>
           </div>
           <div class="timeline-body comments" style="margin-top:5%">
               <div class="comment-item" style="border:1px solid #8C8C8C">
                   <p class="comment-head">
                       <a href="#">${dto.manager_id}</a> <span class="text-muted">@bradpitt</span>
                   </p>
                   <p>${dto.sol_content}</p>
               </div>                                            
               <div class="comment-write">                                                
                   <textarea class="form-control" placeholder="Write a comment" rows="5" name="sol_content"></textarea>                                                
               </div>
           </div>                                        
           <div class="timeline-footer">
               <div class="pull-right">
                   <a href="moimReportHandleMain"><span class="fa fa-share">목록으로</span></a>
                   <input type="submit" value="답변달기">
               </div>
           </div>
       </div>
   </div> 
   </form>
</body>
</html>

<%@ include file="../../etc/footer.jsp"%>  