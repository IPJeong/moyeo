<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme" href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->

<div class="col-md-3 col-sm-4 col-xs-5" style="width:728px; margin-left:-3%">              
    <form action="#" class="form-horizontal">
    <div class="panel panel-default">                                
        <div class="panel-body">
            <h3><span class="fa fa-user"></span> ${dto.name }</h3>
            <p>${dto.mem_id}</p>
            <div class="text-center" id="user_image">
                <img src="${dto.propic_path}/${dto.propic_name}" class="img-thumbnail" style="width:200px; height:200px;"/>
            </div>                                    
        </div>
        <div class="panel-body form-group-separated">
            
            <div class="form-group">                                        
                <div class="col-md-12 col-xs-12">
                    <a href="#" class="btn btn-primary btn-block btn-rounded" data-toggle="modal" data-target="#modal_change_photo">Change Photo</a>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label">ID</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.mem_id}" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label">이름</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.name}" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label">전화번호</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.tel}" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label">이메일</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.email}" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label">주소</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.address }" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">
                <label class="col-md-3 col-xs-5 control-label">생년월일</label>
                <div class="col-md-9 col-xs-7">
                    <input type="text" value="${dto.birth }" class="form-control"/>
                </div>
            </div>
            
            <div class="form-group">                                        
                <div class="col-md-12 col-xs-12">
                    <a href="#" class="btn btn-danger btn-block btn-rounded" data-toggle="modal" data-target="#modal_change_password">회원 강퇴</a>
                </div>
            </div>
            
        </div>
    </div>
    </form>
                            
</div>