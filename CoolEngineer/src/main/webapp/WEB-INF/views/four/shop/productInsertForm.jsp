<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../../etc/header2.jsp"%>

<script src="/moyeo/resources/customScript/shop.js"></script>
<!-- <script type="text/javascript">
	function daetgul() {
		
			alert("댓글을 삭제해주세요.")
			return false;
		
	}
</script> -->
<style>
@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features
		{
		width: 100%;
		background-color: #FBFBFB;
		padding: 0px 20px;
	}
}

@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open
		{
		display: block;
	}
}

@media ( min-width : 1100px) {
	.col-md-56 {
		width: 60%;
		height: 870px;
	}
}

.chart-holder {
	height: 100%;
}

.main {
	height: 100%;
}

.panel .panel-body {
	height: 100%;
	overflow: scroll;
}

.col-md-25 {
	display: block;
}

li {
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}
</style>



<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">

		<!-- 모임페이지 사이드바 시작 -->

		<!-- 모임페이지 사이드바 종료 -->

		<!-- START PHOTO BLOCK -->



		<div class="col-md-56" style="margin-top: 10px; width: 400%">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모여 Shop에 오신 것을 환영합니다. ^^</h3>
					</div>
				</div>


				<div class="panel-body padding-0" style="font-size: 25px">
					<div class="chart-holder" id="dashboard-bar-1"
						style="height: 10px;">

						<!-- 메인 내용 시작 -->
						<br>
						<div class="content-frame-body content-frame-body-left"
							style="height: 819px;">
							<div style="margin: auto;">

								<form:form class="form-horizontal" name="rdnAddr"
									action="productInsertPro" method="post"
									modelAttribute="uploadForm" enctype="multipart/form-data">
									<table style="text-align: center;">
										<tr>
											<th colspan="2">제품 등록</th>
										</tr>

										<tr>
											<th><input type="button" name="likename"
												class="btn btn-info" value="제품 이름"></th>

											<td><input type="text" name="product_name"></td>
										</tr>

										<tr>
											<th><input type="button" name="likename"
												class="btn btn-info" value="제품 가격"></th>

											<td><input type="number" name="product_price"></td>
										</tr>

										<tr>
											<th><input type="button" name="likename"
												class="btn btn-info" value="제품  수량"></th>

											<td><input type="number" name="product_qty"></td>
										</tr>

										<tr>
											<th><input type="button" name="likename"
												class="btn btn-info" value="제품  설명"></th>

											<td><input type="text" name="product_detail"></td>

										</tr>

										<tr>
											<td>
												<div>
													<select name="shop_category1" id="shop_category1"
														class="form-control-1 select" style="width: 49%;"
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
													</select> <select name="shop_category2" id="shop_category2"
														class="form-control-1 select"
														style="width: 49%; margin-left: 0.35%;">
														<option value="">선택하세요</option>
													</select>
												</div>
											</td>
										</tr>

										<tr>
											<td>
												<div class="form-group">
													<div class="col-md-6 col-xs-12">
														<span class="help-block">사진을 선택하세요.</span>
														<div id="fileview">
															<input class="btn btn-warning btn-rounded" id="file0"
																type="file" name="files[0]" style="float: left;"
																onchange="chkType('file0')" required />
														</div>
													</div>
												</div>

											</td>
										</tr>

									</table>

									<input type="submit" value="제품 등록" class="btn btn-primary">
								</form:form>
							</div>

						</div>
						<!--메인내용 종료  -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<%@ include file="../../etc/footer2.jsp"%>