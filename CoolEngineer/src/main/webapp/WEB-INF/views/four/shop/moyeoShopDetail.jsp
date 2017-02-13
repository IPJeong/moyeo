<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/header.jsp"%>

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
					<div>
							
						<!-- 가운데  -->	
						
										
							<!-- 상품 레이아웃 배열 시작 -->
<div style="padding:10px 30px 20px 30px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="360" valign="top">
<!-- 상품 이미지 start //-->
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr width="360" height="366">
    <td align="center" valign="middle"><div id="wrap" style="top:0px;z-index:9999;position:relative;"><a id="image_default_zoom" name="default" rel="zoomWidth:360, zoomHeight:360, adjustX:0, adjustY:0, position:'inside'" class="cloud-zoom" href="./data/item/2012-06-08/1935647224_e717d81d_d1.jpg" onclick="return false;" style="position: relative; display: block;"><img src="./data/thumb/item/360x360/1935647224_e717d81d_d1.jpg" border="0" id="image_default" alt="" style="display: block;"></a><div class="mousetrap" style="background-image: url(&quot;.&quot;); z-index: 999; position: absolute; width: 360px; height: 360px; left: 0px; top: 0px; cursor: move;"></div></div></td>
</tr>
</tbody></table>


<link rel="stylesheet" type="text/css" href="./css/cloud-zoom.css">
<script type="text/javascript" src="./js/cloud-zoom.1.0.2.min.js"></script>

<script type="text/javascript">
function cloudZoom()
{

    $('.cloud-zoom').CloudZoom();

}
</script>
<!-- 상품 이미지 end //-->
    </td>
    <td width="50"></td>
    <td valign="top" class="item_information">
<!-- 상품 정보 박스 start //-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td class="item_title">도너츠 (이미지 학습)</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="./data/icon/2011-11-08/1935647224_e4bc253a_i05.gif" width="36" height="15" border="0"><img src="./data/icon/2011-11-08/1935647224_5170ed9a_i07.gif" width="34" height="15" border="0"><img src="./data/icon/2011-11-08/1935647224_3a0fdfe5_i08.gif" width="34" height="15" border="0"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#cccccc" class="none">&nbsp;</td></tr>
</tbody></table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30">
    <td width="60" class="item_subtitle">판매가 :</td>
    <td class="item_money">1,000 원</td>
</tr>
<tr height="1" bgcolor="#f4f4f4"><td colspan="2"></td></tr>
<tr height="30">
    <td width="60" class="item_subtitle">적립금 :</td>
    <td class="item_cash">100 P</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#cccccc" class="none">&nbsp;</td></tr>
</tbody></table>



<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30">
    <td width="60" class="item_subtitle">배송비</td>
    <td class="item_delivery_money">2,500원</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#cccccc" class="none">&nbsp;</td></tr>
</tbody></table>

<div id="item_cart_data" style="display:none;"></div>
<form method="post" id="formItem" name="formItem" autocomplete="off">
<input type="hidden" name="url" value="http%3A%2F%2Fdmshop.kr%2Fitem.php%3Fid%3DY253066903">
<input type="hidden" name="m" value="">
<input type="hidden" name="cart_type" value="">
<input type="hidden" name="item_id" value="7">
<input type="hidden" id="cart_id" name="cart_id" value="">
<input type="hidden" id="order_start" name="order_start" value="">
<input type="submit" value="ok" disabled="" style="display:none;">
<script type="text/javascript">
var item_option_7_name = '초코';
var item_option_7_money = '0';
var item_option_7_limit = '100';
var item_option_8_name = '딸기';
var item_option_8_money = '0';
var item_option_8_limit = '50';
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td>
<div style="border:1px solid #eaeaea; background-color:#f4f4f4;">
<div style="padding:7px 10px 7px 10px;">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="50" class="order_title">옵션</td>
    <td><select id="order_option" name="order_option" class="select" onchange="orderOption(this.value);"><option value="">선택하세요.</option><option value="7">초코 : 남은수량 100개</option><option value="8">딸기 : 남은수량 50개</option></select></td>
</tr>
</tbody></table>
</div>
</div>
    </td>
</tr>
</tbody></table>

<div id="item_option_data"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="3"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td>
<div style="border:1px solid #eaeaea; background-color:#ffffff;">
<div style="padding:7px 10px 7px 10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td align="right">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td class="order_title2">금액 :</td>
    <td width="5"></td>
    <td class="item_total_money"><span id="order_total_money_view">1,000</span>원</td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>
</div>
</div>
    </td>
</tr>
</tbody></table>

</form>


</div>
							<!-- 상품 레이아웃 배열 마침-->
							
							<!-- 가운데  -->
								
			
						</div>
	
						<div style="text-align: center; float: right; margin-right: 5%;">
								<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
	
							<c:if test="${cnt > 0}">
				
								<c:if test="${startPage > pageBlock}">
									<li class=""><a href="moim_greeting_board?pageNum=${startPage - pageBlock}"><font
											size="3"> «</font></a></li>
								</c:if>
				
				
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">
										<li class=""><a href="#"><font size="3">${i}</font></a></li>
									</c:if>
				
									<c:if test="${i != currentPage}">
										<li class=""><a href="moim_greeting_board?pageNum=${i}"><font size="3">${i}</font></a></li>
									</c:if>
				
								</c:forEach>
								<c:if test="${pageCount > endPage}">
									<li><a href="moim_greeting_board?pageNum=${startPage + pageBlock}"><font
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
<!-- END ROW -->
</div>

<%@ include file="../../etc/footer.jsp"%>