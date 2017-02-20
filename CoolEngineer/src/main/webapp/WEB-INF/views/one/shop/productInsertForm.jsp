
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- META SECTION -->
<title>MoYeo-새로운 만남의 시작</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" href="/moyeo/resources/resource/favicon.ico"
	type="image/x-icon" />
<!-- END META SECTION -->

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme"
	href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->

</head>

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<script type='text/javascript'
	src="/moyeo/resources/resource/js/plugins/icheck/icheck.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/scrolltotop/scrolltopcontrol.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/morris/raphael-min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/morris/morris.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/rickshaw/d3.v3.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/rickshaw/rickshaw.min.js"></script>
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/owl/owl.carousel.min.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/moment.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/daterangepicker/daterangepicker.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/actions.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->
<script src="/moyeo/resources/customScript/shop.js"></script>

<body class="x-dashboard" >
	<!-- START PAGE CONTAINER -->

	<div class="page-container">

		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">

				<%@ include file="../../etc/header.jsp"%>

				<div class="page-content-wrap">

					<div class="row">
						<div class="col-md-12" style="height:800px;">

							<form:form class="form-horizontal" name="rdnAddr" modelAttribute="uploadForm" action="productInsertPro" method="post" enctype="multipart/form-data">
								<div class="panel panel-default" style="height:800px;">
									<div class="panel-heading">
										<h3 class="panel-title">
											<strong>제품등록</strong>
										</h3>
									
									</div>
									
									<div class="panel-body">

										<div class="row">

											<div class="col-md-6" style="margin-left:17%;">

												<div class="form-group">
													<label class="col-md-3 control-label">제품 이름</label>
													<div class="col-md-9">
														<div class="input-group">
															<span class="input-group-addon"><span
																class="fa fa-info-circle"></span></span>
																 <input type="text" class="form-control" name="product_name"/>
														</div>
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label">제품 가격</label>
													<div class="col-md-9 col-xs-12">
														<div class="input-group">
															<span class="input-group-addon"><span
																class="fa fa-krw"></span></span> <input type="text"
																class="form-control" name="product_price"/>
														</div>
													
													</div>
												</div>
												
												<div class="form-group">
													<label class="col-md-3 control-label">제품 수량</label>
													<div class="col-md-9 col-xs-12">
														<div class="input-group">
															<span class="input-group-addon"><span
																class="fa fa-floppy-o"></span></span> <input type="number"
																class="form-control" name="product_qty"/>
														</div>
													
													</div>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label">제품 설명</label>
													<div class="col-md-9 col-xs-12">
														<textarea class="form-control" rows="5" name="product_detail"></textarea>
													
													</div>
												</div>
												
												<div class="form-group" style="margin-left:-1%;">
													<label class="col-md-3 control-label">카테고리</label>
													<select name="shop_category1" id="shop_category1"
														class="form-control-1 select" style="width:20%; margin-left:2%;"
														onchange="select_shop_category()" required>
														<option value="">선택하세요</option>
														<option value="브랜드패션">브랜드패션</option>
														<option value="의류/잡화">의류/잡화</option>
														<option value="뷰티">뷰티</option>
														<option value="레저/자동차">레저/자동차</option>
														<option value="식품">식품</option>
														<option value="출산/육아">출산/육아</option>
														<option value="생활/건강">생활/건강</option>
														<option value="가구/인테리어">가구/인테리어</option>
														<option value="디지털/가전/컴퓨터">디지털/가전/컴퓨터</option>
														<option value="도서/여행/e쿠폰">도서/여행/e쿠폰</option>
														<option value="취미/반려동물">취미/반려동물</option>
														<option value="해외직구">해외직구</option>
													</select> 
													<select name="shop_category2" id="shop_category2"
														class="form-control-1 select"
														style="width: 20%; margin-left: 0.35%;">
														<option value="">선택하세요</option>
													</select>
												</div>

												<div class="form-group">
													<label class="col-md-3 control-label">제품 사진(메인)</label>
													<div id="fileview">
														<input type="file" class="fileinput btn-primary"
															 name="files[0]" id="file0" title="Browse file" onchange="chkType('file0')" required/>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">제품 사진(상세)</label>
													<div id="fileview2">
														<input type="file" class="fileinput btn-primary"
															 name="files[1]" id="file1" title="Browse file" onchange="chkType('file0')" required/>
													</div>
												</div>
											</div>
										</div>

									</div>
									
										<input type="submit" class="btn btn-primary" style="margin-left:62%;" value="제품등록">
									
								</div>
							</form:form>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<%@ include file="../../etc/footer.jsp"%>
</body>
</html>
