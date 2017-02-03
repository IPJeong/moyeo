<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../etc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

</head>


<body>
 <div class="col-md-12">
   <form class="form-horizontal" action="adminAppointPro" method="post">
   <div class="panel panel-default">
       <div class="panel-heading">
           <h3 class="panel-title"><strong>관리자임명</strong></h3>
           <ul class="panel-controls">
               <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
           </ul>
       </div>

       <div class="panel-body form-group-separated">
           
           <div class="form-group">
               <label class="col-md-3 col-xs-12 control-label">관리자 아이디</label>
               <div class="col-md-6 col-xs-12">                                            
                   <div class="input-group">
                       <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                       <input type="text" class="form-control" name="manager_id"/>
                   </div>                                            
                   <span class="help-block">관리자 아이디를 입력하세요</span>
               </div>
           </div>
           
           <div class="form-group">                                        
               <label class="col-md-3 col-xs-12 control-label">비밀번호</label>
               <div class="col-md-6 col-xs-12">
                   <div class="input-group">
                       <span class="input-group-addon"><span class="fa fa-unlock-alt"></span></span>
                       <input type="password" class="form-control" name="passwd"/>
                   </div>            
                   <span class="help-block">비밀번호를 입력하세요</span>
               </div>
           </div>
           
           <div class="form-group">                                        
               <label class="col-md-3 col-xs-12 control-label">이름</label>
               <div class="col-md-6 col-xs-12">
                   <div class="input-group">
                       <span class="input-group-addon"><span class="fa fa-unlock-alt"></span></span>
                       <input type="text" class="form-control" name="name"/>
                   </div>            
                   <span class="help-block">이름을 입력하세요</span>
               </div>
           </div>
       </div>
       <div class="panel-footer">
           <button class="btn btn-default">Clear Form</button>                                    
           <button class="btn btn-primary pull-right" type="submit">관리자 생성</button>
       </div>
   </div>
   </form>
   
</div>
</body>


<%@ include file="../../etc/footer.jsp"%>