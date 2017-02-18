<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript">


</script>
<div class="col-md-6 page-title"></div>

<div class="col-md-10 " style="margin: auto; float: none;">
<div class="col-md-4" style="width:500px; margin-left:-50%;">
	
	<form:form action="changeMyInfo" name="myPage" class="form-horizontal"
		onsubmit="return chgMyInfo();">
		<div class="panel panel-default">
			<div class="panel-body" style="height:300px;">
				<div class="col-md-12" style="margin: 0px; padding: 0px;">
					<div class="col-md-6"
						style="margin: 0px; padding: 0px; width: 60%;">
						<h3>
							<span class="fa fa-user"></span> ID : ${dto.seller_id}
						</h3>
						
					</div>
					<div class="col-md-6"
						style="margin: 0px; padding: 0px; width: 40%;">
						
					</div>
				</div>
				<div class="text-center" id="user_image">
					<img src="${dto.bc_path}/${dto.bc_name}"
						class="img-thumbnail" style="width: 250px; height:240px;" />
				</div>
			</div>
			<div class="panel-body form-group-separated" style="height:500px;">

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">아이디</label>
					<div class="col-md-9 col-xs-6">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div id="nameInput">
										<input type="hidden" name="pro1" value="x" /> <input
											type="hidden" name="name" value="" /> 
									</div>
									${dto.seller_id}
								</th>
								<th style="width: 20%">
									
								</th>
							</tr>
						</table>
					</div>

				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">전화번호</label>
					<div class="col-md-9 col-xs-7">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div class="col-md-12" style="padding: 0px;" id="addInput">
										<input type="hidden" name="pro2" value="x" /> <input
											type="hidden" name="address" value="" />
									</div>
									${dto.tel}
								</th>
								<th style="width: 20%">
									
								</th>
							</tr>
						</table>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">주소</label>
					<div class="col-md-9 col-xs-7">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div id="emailInput">
										<input type="hidden" name="pro3" value="x" /> <input
											type="hidden" name="email" value="" />
									</div>
									${dto.address}
								</th>
								<th style="width: 20%">
									
								</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">상호명</label>
					<div class="col-md-9 col-xs-7">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div id="telInput">
										<input type="hidden" name="pro4" value="x" /> <input
											type="hidden" name="tel" value="" /> 
									</div>
									${dto.comp_name}
								</th>
								<th style="width: 20%">
									
								</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">예금주</label>
					<div class="col-md-9 col-xs-7">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div id="telInput">
										<input type="hidden" name="pro4" value="x" /> <input
											type="hidden" name="tel" value="" /> 
									</div>
									${dto.depositor}
								</th>
								<th style="width: 20%">
									
								</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">계좌번호</label>
					<div class="col-md-9 col-xs-7">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div id="telInput">
										<input type="hidden" name="pro4" value="x" /> <input
											type="hidden" name="tel" value="" /> 
									</div>
									${dto.account_number}
								</th>
								<th style="width: 20%">
									
								</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-8" style="margin: auto; float: none;">
						<div class="col-md-6"
							style="margin: 0px; padding: 0px; padding-right: 2px; padding-bottom: 5px; border: 0px;">
							<button type="button" class="btn btn-primary col-md-12"
								id="chnInfo" style="width:300px;" onclick="window.location='/moyeo/two/sellerModifyForm?seller_id=${seller_id}'">정보수정</button>
						</div>
						
					</div>
				</div>
				<div class="form-group" style="float: none;">
					<div class="col-md-8" style="margin: auto; float: none;">
						<a href="#" onclick="notiList()" class="btn btn-success btn-block" style="width:300px;">제품수정</a>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	</div>
</div>



<!-- 모달 -->
<div class="modal animated fadeIn" id="modal_change_photo" tabindex="-1"
	role="dialog" aria-labelledby="smallModalHead" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="smallModalHead">프로필 사진 변경</h4>
			</div>

			<div class="modal-body">
				<div class="text-center" id="user_image">
					<img src=""
						class="img-thumbnail" style="width: 70%;" />
				</div>
			</div>

			<form:form class="form-horizontal" action="changeProImg"
				method="post" name="changeProImg" modelAttribute="uploadForm"
				enctype="multipart/form-data" onsubmit="changeProImg();">
				<div class="modal-body form-horizontal form-group-separated">
					<div class="form-group">
						<label class="col-md-4 control-label">New Photo</label>
						<div class="col-md-8">
							<input type="file" class="fileinput btn-info" name="files[0]"
								id="cp_photo" data-filename-placement="inside" title="사진 선택">
							<label class="check" style="margin-left: 20px"><input
								type="checkbox" class="icheckbox" name="noImg"
								value="" />프로필 사진 선택 안함</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" id="cp_accept">사진변경</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</form:form>
		</div>
	</div>
</div>
<!-- 비밀번호 모달 -->
<div class="modal animated fadeIn" id="modal_change_pw" tabindex="-1"
	role="dialog" aria-labelledby="smallModalHead" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="smallModalHead">비밀번호 변경</h4>
			</div>
			<form:form class="form-horizontal" action="changePw" method="post"
				name="proPwCng">
				<div class="modal-body form-horizontal form-group-separated">
					<div class="form-group">
						<label class="col-md-4 control-label">현재 비밀번호</label>
						<div class="col-md-4">
							<input type="password" name="passwd" class="form-control"
								onkeyup="curPwChk()" required />
						</div>
						<div class="col-md-4" id="curPwChk" style="border: 0px;"></div>
					</div>
					<div class="form-group">
						<label class="col-md-4 control-label">새 비밀번호</label>
						<div class="col-md-4">
							<input type="password" name="password" class="form-control"
								onkeyup="passChk2()" required />
						</div>
						<div class="col-md-4" id="proPwChk2" style="border: 0px;"></div>

					</div>
					<div class="form-group">
						<label class="col-md-4 control-label">비밀번호 확인</label>
						<div class="col-md-4">
							<input type="password" name="re_password" class="form-control"
								onkeyup="passChk2()" required />
						</div>
						<div class="col-md-4" id="proPwChk" style="border: 0px;"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" id="proPwSub"
						disabled>비밀번호변경</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</form:form>
		</div>
	</div>
</div>

<!-- 회원탈퇴 모달 -->
<div class="modal animated fadeIn" id="modal_delete" tabindex="-1"
	role="dialog" aria-labelledby="smallModalHead" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="smallModalHead">회원탈퇴</h4>
			</div>
			<form:form class="form-horizontal" action="delMem" method="post"
				name="deleteMem" onsubmit="return chkDel();">
				<div class="modal-body form-horizontal form-group-separated">
					<div class="form-group">
						<label class="col-md-4 control-label">비밀번호</label>
						<div class="col-md-4">
							<input type="password" name="passwd" class="form-control"
								onkeyup="curPwChk2()" required />
						</div>
						<div class="col-md-4" id="curPwChk2" style="border: 0px;"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-success" id="delSub" disabled>회원탈퇴</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</form:form>
		</div>
	</div>
</div>


<script src="/moyeo/resources/customScript/three.js"
	type="text/javascript"></script>



<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- THIS PAGE PLUGINS -->
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-timepicker.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-colorpicker.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-file-input.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-select.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
<!-- END THIS PAGE PLUGINS -->

<!-- START TEMPLATE -->
<script type="text/javascript"
	src="/moyeo/resources/resource/js/settings.js"></script>