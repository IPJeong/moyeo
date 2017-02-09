<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme"
	href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->

<div class="col-md-3 col-sm-4 col-xs-5"
	style="width: 720px; height: 100%; margin-left: -3%; overflow: hidden;">
	<form action="#" class="form-horizontal">
		<div class="panel panel-default">
			<div class="panel-body">
				<h3>
					<span class="fa fa-user"></span> ${dto.group_name}
				</h3>
				<div class="text-center" id="user_image" style="margin-left: -22%">
					<img src="${pdto.main_pic_path}/${pdto.main_pic_name}"
						class="img-thumbnail" style="width: 200px; height: 200px;" />
				</div>
			</div>
			<div class="panel-body form-group-separated">

				<div class="form-group"></div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">정원</label>
					<div class="col-md-9 col-xs-7" style="width: 320px">
						<input type="text" value="${dto.group_mem_cnt}"
							class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">관심사1</label>
					<div class="col-md-9 col-xs-7" style="width: 320px">
						<input type="text" value="${dto.group_inte1}" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">관심사2</label>
					<div class="col-md-9 col-xs-7" style="width: 320px">
						<input type="text" value="${dto.group_inte2}" class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">지역</label>
					<div class="col-md-9 col-xs-7" style="width: 320px">
						<input type="text" value="${dto.group_location}"
							class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">모임소개</label>
					<div class="col-md-9 col-xs-7" style="width: 320px">
						<textarea class="form-control" style="height: 200px;"> ${dto.group_intro} </textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12 col-xs-12" style="width: 520px">
						<a href="#"
							onclick="if(confirm('정말 폐쇄처리를 하시겠습니까?'))
                    	     window.location='/moyeo/one/groupDelete?group_num=${dto.group_num}&pageNum=${pageNum}'"
							class="btn btn-danger btn-block btn-rounded" data-toggle="modal"
							data-target="#modal_change_password"> 모임폐쇄</a>
					</div>
				</div>

			</div>
		</div>
	</form>

</div>