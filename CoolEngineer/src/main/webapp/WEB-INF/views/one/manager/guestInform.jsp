<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme"
	href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->

<div class="col-md-3 col-sm-4 col-xs-5"
	style="width: 728px; margin-left: -3%; overflow: hidden">
	<form action="#" class="form-horizontal">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>
					<span class="fa fa-user"></span> ${dto.name }
				</h3>
				<p>${dto.mem_id}</p>
				<div class="text-center" id="user_image" style="margin-left: -24%">
					<img src="${dto.propic_path}/${dto.propic_name}"
						class="img-thumbnail" style="width: 200px; height: 200px;" />
				</div>
			</div>
			<div class="panel-body form-group-separated">

				<div class="form-group">
					<div class="col-md-12 col-xs-12"></div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">ID</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.mem_id}" style="width: 300px;"
							class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">이름</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.name}" class="form-control"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">전화번호</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.tel}" class="form-control"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">이메일</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.email}" class="form-control"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">주소</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.address }" class="form-control"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">생년월일</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.birth}" class="form-control"
							style="width: 300px" pattern="yyyy-MM-dd" />
							
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12 col-xs-12" style="width: 520px">
						<a
							onclick="if(confirm('정말 탈퇴처리를 하시겠습니까?\n탈퇴시킬 경우 해당 회원이 개설한 모임도 \n전부 삭제됩니다.'))
                     		window.location='/moyeo/one/guestDelete?mem_id=${dto.mem_id}&pageNum=${pageNum}&openType=${openType}'"
							class="btn btn-danger btn-block btn-rounded" data-toggle="modal"
							data-target="#modal_change_password">회원 강퇴</a>
					</div>
				</div>

			</div>
		</div>
	</form>

</div>