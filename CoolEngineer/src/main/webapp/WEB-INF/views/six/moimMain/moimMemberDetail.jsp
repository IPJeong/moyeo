<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme" href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->

<div class="col-md-3 col-sm-4 col-xs-5" style="width:728px; margin-left:-3%">              
    <form action="#" class="form-horizontal">
    <div class="panel panel-default">                                
        <div class="panel-body">
            <h3><span class="fa fa-user"></span> ${dto.name}</h3>
            <div class="text-center" id="user_image">
                <img src="${dto.propic_path}/${dto.propic_name}" class="img-thumbnail" style="width:200px; height:200px;"/>
            </div>                                    
        </div>
        <div class="panel-body form-group-separated" style="border-bottom: 1px dashed #D5D5D5;">
      
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label" style="padding-left:30px;">ID</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.mem_id}" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label" style="padding-left:30px;">이름</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.name}" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label" style="padding-left:30px;">전화번호</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.tel}" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label" style="padding-left:30px;">이메일</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.email}" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label" style="padding-left:30px;">주소</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.address }" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label" style="padding-left:30px;">생년월일</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${birth}" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label" style="padding-left:30px;">최근 접속일</label>
                <div class="col-md-9 col-xs-7">
                    <c:if test="${lastConnect eq 'null'}">
                   		 <input type="text" value="접속기록이 없습니다" class="form-control"/>
              	 	</c:if> 
              	 	<c:if test="${lastConnect ne 'null'}">
              	 		 <input type="text" value="${lastConnect}" class="form-control"/>
              	 	</c:if>
                </div>
            </div>
   
        </div>
    </div>
    </form>
                            
</div>