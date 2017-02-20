<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme"
	href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->

<div class="col-md-3 col-sm-4 col-xs-5"
	style="width: 728px; margin-left: -3%; overflow: hidden">
	<form action="productModifyPro" class="form-horizontal" method="post">
	<input type="hidden" name="product_num" value="${product_num}">
		<div class="panel panel-default" style="height:600px;">
			<%-- <div class="panel-body">
				
	
				<div class="text-center" id="user_image" style="margin-left: -24%">
					<img src="${dto.pic_path}/${dto.pic_name}"
						class="img-thumbnail" style="width: 200px; height: 200px;" />
				</div> 
			</div> --%>
			<div class="panel-body form-group-separated">

				<div class="form-group">
					<div class="col-md-12 col-xs-12"></div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">판매자</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.seller_id}" style="width: 300px;" readonly
							class="form-control" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">제품명</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.product_name}" class="form-control" name="product_name"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">제품 가격</label>
					<div class="col-md-9 col-xs-7">
						<input type="text" value="${dto.product_price}" class="form-control" name="product_price"
							style="width: 300px" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">제품 수량</label>
					<div class="col-md-9 col-xs-7">
						<input type="number" value="${dto.product_qty}" class="form-control" name="product_qty"
							style="width: 300px" />
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 col-xs-5 control-label" style="width: 200px">제품설명</label>
					<div class="col-md-9 col-xs-7">
						<textarea class="form-control" style="height:130px; width:300px;" name="product_detail"> ${dto.product_detail} </textarea>
					</div>
				</div>

				

				<%-- <div class="form-group">
					<div class="col-md-12 col-xs-12" style="width: 520px">
						<a
							onclick="if(confirm('정말 제품정보를 수정하시겠습니까?'))
                     		window.location='/moyeo/one/productModifyPro?seller_id=${dto.seller_id}&pageNum=${pageNum}'"
							class="btn btn-danger btn-block btn-rounded" data-toggle="modal"
							data-target="#modal_change_password">제품 수정</a>
					</div>
				</div>  --%>
				
				<div class="form-group">
					<div class="col-md-12 col-xs-12" style="width: 520px">
						<input type="submit" class="btn btn-danger btn-block btn-rounded" value="제품 수정">
					</div>
				</div> 

			</div>
		</div>
	</form>

</div>