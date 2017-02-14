<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/header2.jsp"%>

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

@media (min-width: 1100px){
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
	height: 780px;
	overflow: auto;
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

<!-- START BREADCRUMB -->
   <ul class="breadcrumb push-down-0">
       <li><a href="../main/main.jsp">Home</a></li>
       
       <li class="active">Shop</li>
   </ul>
<!-- END BREADCRUMB -->  

<!-- START ROW -->


<!-- 모임 사이드바 시작 -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
		<!-- START LOGIN BLOCK -->
	
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/shop_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->
		
		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>Shop</h3>
					</div>
				</div>
				<div class="panel-body padding-0"
					style="text-align: center; font-size: 25px">
					<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;">
						<br>
						<h2>모여 Shop에 오신 것을 환영합니다. ^^</h2>
						<br>
						<form action="" name="">
							<div style="float: right; margin-right: 5%;">
								<!-- 로그인 되어 있으면, -->
								<c:if test="${sessionScope.mem_id != null}">
								<input class="btn btn-primary" value="판매자 등록" type="button" onclick="location.href='/moyeo/six/shop/sellerRegister'">
								<input class="btn btn-primary" value="제품 등록" type="button" onclick="location.href='productInsertForm'">
								
								<button type="button" class="btn btn-primary">제품 수정</button>
								<button type="button" class="btn btn-primary">제품 삭제</button>
								</c:if>
								
							</div>
						</form>
						<br> <br>
						<div>
							
							
						
										
							<!-- 상품 레이아웃 배열 -->
								
							<!-- 상품 레이아웃 배열 -->
							<c:forEach var="dto" items="${dtos}">
								<!-- 상품 레이아웃 배열 -->
										 <div class="col-lg-12">
											<div class="row">
												<div class="col-lg-3">
													<div class="box">
														<div class="box-gray aligncenter">
															<h4>상품번호 : ${number}</h4>
															<c:set var="number" value="${number-1}" /> 
															<div class="icon">
															<i class="fa fa-desktop fa-3x"></i>
															</div>
															<p class="">
															<br>제품명 : ${dto.product_name}
															<br>가격: ${dto.product_price}원
															<br>제품설명 : ${product_detail}
															</p>
																
														</div>
														<div class="box-bottom">
															<a href="productDetail">클릭!</a>
														</div>
													</div>
												</div>
												<div class="col-lg-3">
													<div class="box">
														<div class="box-gray aligncenter">
															<h4>상품2</h4>
															<div class="icon">
															<i class="fa fa-pagelines fa-3x"></i>
															</div>
															<p class="">
															<br>상품 설명입니다. <br>가격: 얼마
															</p>
																
														</div>
														<div class="box-bottom">
															<a href="#">클릭!</a>
														</div>
													</div>
												</div>
												<div class="col-lg-3">
													<div class="box">
														<div class="box-gray aligncenter">
															<h4>상품3</h4>
															<div class="icon">
															<i class="fa fa-edit fa-3x"></i>
															</div>
															<p class="">
															<br>상품 설명입니다. <br>가격: 얼마
															</p>
																
														</div>
														<div class="box-bottom">
															<a href="#">클릭!</a>
														</div>
													</div>
												</div>
												<div class="col-lg-3">
													<div class="box">
														<div class="box-gray aligncenter">
															<h4>상품4</h4>
															<div class="icon">
															<i class="fa fa-code fa-3x"></i>
															</div>
															<p class="">
															<br>상품 설명입니다. <br>가격: 얼마
															</p>
																
														</div>
														<div class="box-bottom">
															<a href="#">클릭!</a>
														</div>
													</div>
												</div>
											</div>
										</div>
										
							</c:forEach>
							<!-- 상품 레이아웃 배열 -->
							
								
			
						</div>
	
						<div style="text-align: center; float: right; margin-right: 5%;">
								<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
	
							<c:if test="${cnt > 0}">
				
								<c:if test="${startPage > pageBlock}">
									<li class=""><a href="moyeoShop?pageNum=${startPage - pageBlock}"><font
											size="3"> «</font></a></li>
								</c:if>
				
				
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<li class=""><a href="#"><font size="3">${i}</font></a></li>
									</c:if>
				
									<c:if test="${i != currentPage}">
										<li class=""><a href="moyeoShop?pageNum=${i}"><font size="3">${i}</font></a></li>
									</c:if>
				
								</c:forEach>
								<c:if test="${pageCount > endPage}">
									<li><a href="moyeoShop?pageNum=${startPage + pageBlock}"><font
											size="3">»</font></a></li>
								</c:if>
							</c:if>
						</ul>
						</div>
					
					</div>
				</div>
			</div>
			<!-- END PHOTO BLOCK -->
		</div>
	</div>
	<!-- 
	-->
<!-- END ROW -->
</div>

<%@ include file="../../etc/footer2.jsp"%>