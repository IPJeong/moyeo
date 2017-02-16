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
					<span class="fa fa-user"></span> ${dto.seller_id}
				</h3>
				<div class="text-center" id="user_image" style="margin-left: -15%">
					<img src="${dto.bc_path}/${dto.bc_name}"
						class="img-thumbnail" style="width: 200px; height: 200px;" onclick="window.open(this.src)" hspace="0"/>
						
					<a href="#" onclick="window.open('${dto.bc_path}/${dto.bc_name}')"><span class="fa fa-tag"></span>확대하기</a>
				</div>
			</div>
			<div class="panel-body form-group-separated">

				<div class="form-group">
					<div class="col-md-12 col-xs-12"></div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">전화번호</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.tel}" style="width: 300px;"
							class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">주소</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.address}" class="form-control"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">상호명</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.comp_name}" class="form-control"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">은행</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.bank}" class="form-control"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">계좌번호</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.account_number }" class="form-control"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">예금주</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.depositor}" class="form-control"
							style="width: 300px" pattern="yyyy-MM-dd" />
							
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">예금주</label>
					<div class="col-md-9 col-xs-7">
						<textarea class="form-control" style="height:200px; width:300px;">${dto.reason}</textarea>
							
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12 col-xs-12" style="width: 520px">
						<a onclick="if(confirm('판매승인을 하시겠습니까?'))
                     		window.location='/moyeo/one/sellerSuccess?seller_id=${dto.seller_id}&pageNum=${pageNum}'"
							class="btn btn-danger btn-block btn-rounded" data-toggle="modal"
							data-target="#modal_change_password">판매승인</a>
						
						<a onclick="if(confirm('판매거절을 하시겠습니까?'))
                     		window.location='/moyeo/one/sellerRefuse?seller_id=${dto.seller_id}&pageNum=${pageNum}'"
							class="btn btn-danger btn-block btn-rounded" data-toggle="modal"
							data-target="#modal_change_password">판매거절</a>
					</div>
				</div>

			</div>
		</div>
	</form>

</div>