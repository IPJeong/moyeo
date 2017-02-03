<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../etc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
<div class="col-md-3" style="margin-left:36%; margin-top:1%">        
   <div class="panel panel-default">
       <div class="panel-body profile" style="background: url('assets/images/gallery/music-4.jpg') center center no-repeat;">
           <div class="profile-image">
               <img src="/moyeo/resources/resource/assets/images/gallery/박보영.jpg" alt="Nadia Ali" style="width:300px;" height="150px"/>
           </div>
           <div class="profile-data">
               <div class="profile-data-name">Nadia Ali</div>
               <div class="profile-data-title" style="color: #FFF;">Singer-Songwriter</div>
           </div>
                                         
       </div>                                
       <div class="panel-body">                                    
           <div class="row">

               <div class="col-md-6">
               	   <c:forEach var="dto" items="${dtos}">
                   <button class="btn btn-info btn-rounded btn-block" style="width:213%; margin-top:-25%"><span class="fa fa-check"></span>최고 관리자 : ${dto.name}</button>
               	   </c:forEach>
               </div>

           </div>
       </div>
       <c:forEach var="dto" items="${mdtos}">
       <div class="panel-body list-group border-bottom">
           <a href="#" class="list-group-item active"><span class="fa fa-coffee"></span>${dto.name}</a>
           <a href="#" class="list-group-item"><span class="fa fa-users"></span> ${dto.manager_id} <input type="button" class="btn btn-primary pull-right" value="삭제"></a>
       </div>
       </c:forEach>
   </div>                                            
</div>
</body>

<%@ include file="../../etc/footer.jsp"%>  