<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../etc/header2.jsp"%>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript">
//마이페이지 & 수정
$(document).ready(function() {
	var nameinput;
	var addinput;
	var emailinput;
	var telinput;
	
	$('#nameInBtn1').fadeToggle(0);
	$('#nameInBtn').click(function(){	
		nameinput = '<input type="hidden" name="pro1" value="o"/>' +
					'<input type="text" name="name" value="${dto.name}" class="form-control" required/>';		
		$('#nameInput').html(nameinput);
		$('#nameInBtn').fadeToggle(0);
		$('#nameInBtn1').fadeToggle(0);
	});
	
	$('#nameInBtn1').click(function(){	
		nameinput =	'<input type="hidden" name="pro1" value="x"/>' +
					'<input type="hidden" name="name" value="${dto.name}"/>'+ 
					'${dto.name}';		
		$('#nameInput').html(nameinput);
		$('#nameInBtn').fadeToggle(0);
		$('#nameInBtn1').fadeToggle(0);
	});	
	
	$('#addInBtn1').fadeToggle(0);
	$('#addInBtn').click(function(){	
		addinput = '<input type="hidden" name="pro2" value="o"/>' +
				'<select name="loc_category1" class="form-control select" style="color:#212121;" onchange="select_loc_category3()" required>' +
	     				'<option value="">선택하세요</option>' + 
				     	'<option value="서울특별시">서울특별시</option>' +
				        '<option value="부산광역시">부산광역시</option>' +
				        '<option value="인천광역시">인천광역시</option>' +
				        '<option value="대구광역시">대구광역시</option>' +
				        '<option value="대전광역시">대전광역시</option>' +
				        '<option value="광주광역시">광주광역시</option>' +
				        '<option value="울산광역시">울산광역시</option>' + 
				        '<option value="세종특별자치시">세종특별자치시</option>' + 
				        '<option value="경기도">경기도</option>' +
				        '<option value="강원도">강원도</option>' +
				        '<option value="충청북도">충청북도</option>' +
				        '<option value="충청남도">충청남도</option>' +
				        '<option value="경상북도">경상북도</option>' +
				        '<option value="경상남도">경상남도</option>' +
				        '<option value="전라북도">전라북도</option>' +
				        '<option value="전라남도">전라남도</option>' +
				        '<option value="제주특별자치도">제주특별자치도</option>' + 
				 '</select>'	+	                                  
				  '<select name="loc_category2" style="color:#212121;" class="form-control select" required>'  +
				  		'<option value="">선택하세요</option>' +
				  '</select>';
		$('#addInput').html(addinput);
		$('#addInBtn').fadeToggle(0);
		$('#addInBtn1').fadeToggle(0);
	});
	
	$('#addInBtn1').click(function(){	
		addinput =	'<input type="hidden" name="pro2" value="x"/>' +
					'<input type="hidden" name="address" value="${dto.address}"/>'+ 
					'${dto.address}';		
		$('#addInput').html(addinput);
		$('#addInBtn').fadeToggle(0);
		$('#addInBtn1').fadeToggle(0);
	});
	
	$('#emInBtn1').fadeToggle(0);
	$('#emInBtn').click(function(){	
		emailinput ='<input type="hidden" name="pro3" value="o"/>' + 
					'<input type="email" name="email" value="${dto.email}" class="form-control" required/>';		
		$('#emailInput').html(emailinput);
		$('#emInBtn').fadeToggle(0);
		$('#emInBtn1').fadeToggle(0);
	});
	
	$('#emInBtn1').click(function(){	
		emailinput ='<input type="hidden" name="pro3" value="x"/>' +
					'<input type="hidden" name="email" value="${dto.email}"/>'+ 
					'${dto.email}';		
		$('#emailInput').html(emailinput);
		$('#emInBtn').fadeToggle(0);
		$('#emInBtn1').fadeToggle(0);
	});	
	
	$('#telInBtn1').fadeToggle(0);
	$('#telInBtn').click(function(){	
		telinput = '<input type="hidden" name="pro4" value="o"/>' +
				   '<input type="text" name="tel" value="${dto.tel}" class="form-control" onkeyup="phoneChk2()" required/>';		
		$('#telInput').html(telinput);
		$('#telInBtn').fadeToggle(0);
		$('#telInBtn1').fadeToggle(0);
	});
	
	$('#telInBtn1').click(function(){	
		telinput =	'<input type="hidden" name="pro4" value="x"/>' +
					'<input type="hidden" name="tel" value="${dto.tel}"/>'+ 
					'${dto.tel}';		
		$('#telInput').html(telinput);
		$('#telInBtn').fadeToggle(0);
		$('#telInBtn1').fadeToggle(0);
	});	
	
	
	
});

function notiList(memid) {
	
	var windowW = 300;  // 창의 가로 길이
    var windowH = 70;  // 창의 세로 길이
    var left = Math.ceil((window.screen.width - windowW)/2);
    var top = Math.ceil((window.screen.height - windowH)/2);

	window.open('notiList?memid=' + memid, 'notiWindow', 'width=700, height=450, left=' + left + 'top=' + top);
	
}
</script>
<div class="col-md-6 page-title"></div>

<div class="col-md-10 " style="margin: auto; float: none;">
<div class="col-md-4">
	<h2 style="margin: auto;">
		<span class="fa fa-cogs"></span> 마이페이지
	</h2>
	<br>
	<form:form action="changeMyInfo" name="myPage" class="form-horizontal"
		onsubmit="return chgMyInfo();">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="col-md-12" style="margin: 0px; padding: 0px;">
					<div class="col-md-6"
						style="margin: 0px; padding: 0px; width: 60%;">
						<h3>
							<span class="fa fa-user"></span> ID : ${dto.mem_id}
						</h3>
						<p style="margin: 0px;">
							가입일 |
							<fmt:formatDate type="both" pattern="yyyy-MM-dd"
								value="${dto.joinDate}" />
						</p>
						<p>
							생일 |
							<fmt:formatDate type="both" pattern="yyyy-MM-dd"
								value="${dto.birth}" />
						</p>
					</div>
					<div class="col-md-6"
						style="margin: 0px; padding: 0px; width: 40%;">
						<div class="col-md-6"
							style="margin: 0px; padding: 0px; padding-left: 3px;">
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#modal_change_pw" style="width: 100%;padding:2px;font-size:100%;">비밀번호변경</button>
						</div>
						<div class="col-md-6"
							style="margin: 0px; padding: 0px; padding-left: 3px;">
							<button type="button" class="btn btn-warning" data-toggle="modal"
								data-target="#modal_delete" style="width: 100%;padding:2px;font-size:100%;">회원탈퇴</button>
						</div>
					</div>
				</div>
				<div class="text-center" id="user_image">
					<img src="${dto.proPicPath}/${dto.proPicName}"
						class="img-thumbnail" style="width: 250px;" />
				</div>
			</div>
			<div class="panel-body form-group-separated">

				<div class="form-group" style="float: none;">
					<div class="col-md-8" style="margin: auto; float: none;">
						<a href="#" class="btn btn-info btn-block " data-toggle="modal"
							data-target="#modal_change_photo">프로필사진 바꾸기</a>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">NAME</label>
					<div class="col-md-9 col-xs-6">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div id="nameInput">
										<input type="hidden" name="pro1" value="x" /> <input
											type="hidden" name="name" value="${dto.name}" /> ${dto.name}
									</div>
								</th>
								<th style="width: 20%">
									<div id="nameBtn">
										<button type="button" id="nameInBtn" class="btn btn-default">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
										<button type="button" id="nameInBtn1" class="btn btn-default">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</div>
								</th>
							</tr>
						</table>
					</div>

				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">ADDRESS</label>
					<div class="col-md-9 col-xs-7">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div class="col-md-12" style="padding: 0px;" id="addInput">
										<input type="hidden" name="pro2" value="x" /> <input
											type="hidden" name="address" value="${dto.address}" />
										${dto.address}
									</div>
								</th>
								<th style="width: 20%">
									<button type="button" class="btn btn-default" id="addInBtn">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
									<button type="button" class="btn btn-default" id="addInBtn1">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
								</th>
							</tr>
						</table>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">E-mail</label>
					<div class="col-md-9 col-xs-7">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div id="emailInput">
										<input type="hidden" name="pro3" value="x" /> <input
											type="hidden" name="email" value="${dto.email}" />
										${dto.email}
									</div>
								</th>
								<th style="width: 20%">
									<button type="button" class="btn btn-default" id="emInBtn">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
									<button type="button" class="btn btn-default" id="emInBtn1">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
								</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label">TEL</label>
					<div class="col-md-9 col-xs-7">
						<table style="width: 100%">
							<tr>
								<th style="width: 80%">
									<div id="telInput">
										<input type="hidden" name="pro4" value="x" /> <input
											type="hidden" name="tel" value="${dto.tel}" /> ${dto.tel}
									</div>
									<div id="telMsg"></div>
								</th>
								<th style="width: 20%">
									<button type="button" class="btn btn-default" id="telInBtn">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
									<button type="button" class="btn btn-default" id="telInBtn1">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
								</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-8" style="margin: auto; float: none;">
						<div class="col-md-6"
							style="margin: 0px; padding: 0px; padding-right: 2px; padding-bottom: 5px; border: 0px;">
							<button type="submit" class="btn btn-primary col-md-12"
								id="chnInfo">회원정보수정</button>
						</div>
						<div class="col-md-6"
							style="margin: 0px; padding: 0px; padding-left: 2px; padding-bottom: 10px; border: 0px;">
							<button type="reset" class="btn btn-default col-md-12">초기화</button>
						</div>
					</div>
				</div>
				<div class="form-group" style="float: none;">
					<div class="col-md-8" style="margin: auto; float: none;">
						<a href="#" onclick="notiList(${dto.mem_id})" class="btn btn-success btn-block">알림메세지</a>
						<div style="color:#FFEBEE;						
									border:1px solid #F44336;
									font-size: 100%;
								    width: 1.5em;height:1.5em;
								    border-radius: 50%;			    
								    display: inline-block;								    
									 background-color:#F44336;
									 position: absolute;left:60%;top:25%;z-index:2;
									 padding-left: 2px;
									 ">23</div>
					</div>
				</div>
			</div>
		</div>
	</form:form>
	</div>
	<div class="col-md-8 " style="padding: 0px;">
		<h2>
			<span class="fa fa-github"></span> 가입한 모임
		</h2>
		<div class="panel-body panel-body-table">
			<table class="table table-bordered" style="border: 1px solid #E0E0E0">
				<thead>
					<tr>
						<th>모임 이름</th>
						<th>모임 관심사</th>
						<th>모임 지역</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${cnt > 0}">
						<c:forEach var="dto2" items="${dtos}">
							<tr>
								<td><a
									href="/moyeo/six/moimMain/moimMain?group_num=${dto2.group_num}">${dto2.group_name}</a></td>
								<td>${dto2.group_inte1}- ${dto2.group_inte2}</td>
								<td>${dto2.group_location}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div class="col-md-12">
		<ul
			class="pagination pagination-sm pull-right push-down-10 push-up-10">
			<c:if test="${cnt > 0}">
				<!-- 처음[◀◀] 이전[◀]-->
				<c:if test="${startPage > pageBlock}">
					<li><a href="myPage">«</a></li>
					<li><a href="myPage?pageNum=${startPage - pageBlock}">‹</a></li>
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:if test="${i == currentPage}">
						<li class="active"><a href="#">${i}</a></li>
					</c:if>
					<c:if test="${i != currentPage}">
						<li><a href="myPage?pageNum=${i}">${i}</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음[▶] 끝[▶▶] -->
				<c:if test="${pageCount > endPage}">
					<li><a href="myPage?pageNum=${startPage + pageBlock}">›</a></li>
					<li><a href="myPage?pageNum=${pageCount}">»</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
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
					<img src="${dto.proPicPath}/${dto.proPicName}"
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
								value="${dto.gender}" />프로필 사진 선택 안함</label>
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