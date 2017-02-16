<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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

.none {
	height: 1px;
}

.item_information .item_title {
	font-family: gulim;
	font-size: 16px;
	color: #000000;
	font-weight: bold;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_subtitle {
	font-family: dotum;
	font-size: 11px;
	color: #999999;
	font-weight: normal;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_price {
	font-family: gulim;
	font-size: 13px;
	color: #4d4d4d;
	font-weight: bold;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_money {
	font-family: gulim;
	font-size: 14px;
	color: #fa7218;
	font-weight: bold;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_cash {
	font-family: dotum;
	font-size: 13px;
	color: #0066ff;
	font-weight: bold;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_limit {
	font-family: dotum;
	font-size: 13px;
	color: #4d4d4d;
	font-weight: bold;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_sale_limit {
	font-family: dotum;
	font-size: 13px;
	color: #4d4d4d;
	font-weight: normal;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_delivery_money {
	font-family: dotum;
	font-size: 13px;
	color: #4d4d4d;
	font-weight: bold;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_total_money {
	font-family: gulim;
	font-size: 15px;
	color: #000000;
	font-weight: bold;
	font-style: normal;
	text-decoration: none;
}

.relation_box .item_relation_title {
	font-family: dotum;
	font-size: 11px;
	color: #4d4d4d;
	font-weight: normal;
	font-style: normal;
	text-decoration: none;
}

.relation_box .item_relation_money {
	font-family: dotum;
	font-size: 11px;
	color: #fa7218;
	font-weight: normal;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_optiontitle {
	font-family: dotum;
	font-size: 11px;
	color: #4d4d4d;
	font-weight: normal;
	font-style: normal;
	text-decoration: none;
}

.item_information .item_optioncontent {
	width: 30%;
	padding: 5px 0;
	font-family: dotum;
	font-size: 11px;
	color: #000000;
	font-weight: normal;
	font-style: normal;
	text-decoration: none;
}

.item_information .help {
	font-family: dotum;
	font-size: 11px;
	color: #4d4d4d;
	font-weight: normal;
	font-style: normal;
	text-decoration: none;
}

/* 분류 */
.item_position .home {
	line-height: 14px;
	font-size: 11px;
	color: #9e9e9e;
	font-family: gulim, 굴림;
}

.item_position .off {
	line-height: 14px;
	font-size: 11px;
	color: #9e9e9e;
	font-family: gulim, 굴림;
}

.item_position .title {
	line-height: 14px;
	font-size: 11px;
	color: #9e9e9e;
	font-family: gulim, 굴림;
}

.item_position .code {
	line-height: 14px;
	font-size: 11px;
	color: #00a651;
	font-family: gulim, 굴림;
}

.item_next a {
	font-weight: bold;
	line-height: 14px;
	font-size: 11px;
	color: #9e9e9e;
	font-family: gulim, 굴림;
}

.item_next a:hover {
	font-weight: bold;
	line-height: 14px;
	font-size: 11px;
	color: #787878;
	font-family: gulim, 굴림;
}

/* 대표이미지 */
#image_default_zoom {
	display: block;
	border: 3px solid #e4e4e4
}

#image_default_zoom .on {
	border: 3px solid #018598
}

.cloud-zoom-big {
	border: 3px solid #018598
}

/* 상품 갤러리 */
.item_gallery .btn_prev {
	width: 10px;
	background: url('./skin/item/default/img/btn_prev.gif') no-repeat left
		center;
	cursor: pointer;
}

.item_gallery .btn_next {
	width: 10px;
	background: url('./skin/item/default/img/btn_next.gif') no-repeat right
		center;
	cursor: pointer;
}

.item_gallery .btn_prev_out {
	width: 10px;
}

.item_gallery .btn_next_out {
	width: 10px;
}

.gallery_thumb {
	margin: 0 auto;
}

.gallery_thumb li {
	list-style: none;
	font-size: 0px;
	line-height: 0px;
	padding: 0px;
}

.gallery_thumb li img {
	border: 3px solid #e4e4e4;
	cursor: pointer;
	margin: 0 3px 0 3px;
}

.gallery_thumb li .on {
	border: 3px solid #6e3a2a
}

/* 관련상품 */
#relation_data .btn_prev {
	width: 25px;
	background: url('./skin/item/default/img/btn_prev2.gif') no-repeat
		center center;
	cursor: pointer;
}

#relation_data .btn_next {
	width: 25px;
	background: url('./skin/item/default/img/btn_next2.gif') no-repeat
		center center;
	cursor: pointer;
}

#relation_data .btn_prev_out {
	width: 25px;
}

#relation_data .btn_next_out {
	width: 25px;
}

.relation_list div {
	margin: 0 18px 0 18px;
}

.relation_list li {
	list-style: none;
}

.relation_list li img {
	border: 1px solid #e4e4e4
}

.relation_list li .on {
	border: 1px solid #e4e4e4
}

/* 상품정보박스 */
.item_information .select {
	min-width: 200px;
	height: 18px;
	border: 1px solid #c1c1c1;
	background-color: #ffffe5;
}

.item_information .select {
	line-height: 14px;
	font-size: 12px;
	color: #333333;
	font-family: dotum, 돋움;
}

.item_information .select option {
	padding: 0px 3px 0px 3px;
	line-height: 20px;
	font-size: 12px;
	color: #333333;
	font-family: dotum, 돋움;
}

.item_information .input {
	width: 22px;
	height: 17px;
	border: 1px solid #cccccc;
	padding: 1px 3px 0px 3px;
}

.item_information .input {
	line-height: 17px;
	font-size: 12px;
	color: #363636;
	font-family: gulim, 굴림;
}

.item_information .order_title {
	font-weight: bold;
	line-height: 14px;
	font-size: 11px;
	color: #888888;
	font-family: dotum, 돋움;
}

.item_information .order_title2 {
	line-height: 14px;
	font-size: 12px;
	color: #888888;
	font-family: dotum, 돋움;
}

.item_information .order_limit {
	line-height: 14px;
	font-size: 11px;
	color: #393939;
	font-family: gulim, 굴림;
}

.item_information .order_money {
	font-weight: bold;
	line-height: 14px;
	font-size: 11px;
	color: #393939;
	font-family: gulim, 굴림;
}

.item_information .sns_box {
	border: 1px solid #eaeaea;
	width: 100%;
	height: 28px;
	background: url('./skin/item/default/img/sns_bg.gif') repeat-x;
}

/* 상품평 */
.item_reply .count {
	font-weight: bold;
	line-height: 14px;
	font-size: 11px;
	color: #419dae;
	font-family: dotum, 돋움;
}

.item_reply .title {
	line-height: 14px;
	font-size: 12px;
	color: #39393a;
	font-family: gulim, 굴림;
}

.item_reply .content {
	line-height: 15px;
	font-size: 12px;
	color: #707070;
	font-family: gulim, 굴림;
}

.item_reply .name {
	line-height: 14px;
	font-size: 11px;
	color: #707070;
	font-family: dotum, 돋움;
}

.item_reply .star0 {
	width: 85px;
	height: 18px;
	background: transparent url('./skin/item/default/img/reply_star.png')
		no-repeat;
}

.item_reply .star1 {
	width: 85px;
	height: 18px;
	background: transparent url('./skin/item/default/img/reply_star.png')
		no-repeat 0px -18px;
}

.item_reply .star2 {
	width: 85px;
	height: 18px;
	background: transparent url('./skin/item/default/img/reply_star.png')
		no-repeat 0px -36px;
}

.item_reply .star3 {
	width: 85px;
	height: 18px;
	background: transparent url('./skin/item/default/img/reply_star.png')
		no-repeat 0px -54px;
}

.item_reply .star4 {
	width: 85px;
	height: 18px;
	background: transparent url('./skin/item/default/img/reply_star.png')
		no-repeat 0px -72px;
}

.item_reply .star5 {
	width: 85px;
	height: 18px;
	background: transparent url('./skin/item/default/img/reply_star.png')
		no-repeat 0px -90px;
}

/* 상품문의 */
.item_qna .count {
	font-weight: bold;
	line-height: 14px;
	font-size: 11px;
	color: #419dae;
	font-family: dotum, 돋움;
}

.item_qna .category {
	line-height: 14px;
	font-size: 12px;
	color: #999999;
	font-family: gulim, 굴림;
}

.item_qna .title {
	line-height: 14px;
	font-size: 12px;
	color: #39393a;
	font-family: gulim, 굴림;
}

.item_qna .content {
	line-height: 15px;
	font-size: 12px;
	color: #707070;
	font-family: gulim, 굴림;
}

.item_qna .name {
	line-height: 14px;
	font-size: 11px;
	color: #707070;
	font-family: dotum, 돋움;
}

.item_qna .smile0 {
	width: 74px;
	height: 18px;
	background: transparent url('./skin/item/default/img/qna_smile.png')
		no-repeat;
}

.item_qna .smile1 {
	width: 74px;
	height: 18px;
	background: transparent url('./skin/item/default/img/qna_smile.png')
		no-repeat 0px -18px;
}

.list_option {
	border-top: 1px solid #ebebeb;
}

.list_option:first-child {
	border-top: 0;
}

.list_name {
	line-height: 30px;
	font-size: 11px;
	color: #898989;
	font-family: gulim, serif;
}

.list_limit {
	width: 100px;
	line-height: 30px;
	font-size: 11px;
	color: #898989;
	font-family: gulim, serif;
}

.list_limit td a {
	display: block;
}

.list_limit .list_input {
	width: 30px;
	height: 18px;
	border: 1px solid #cccccc;
	padding: 1px 3px 0px 3px;
}

.list_limit .list_input {
	line-height: 17px;
	font-size: 12px;
	color: #363636;
	font-family: gulim, 굴림;
}

.list_money {
	text-align: right;
	width: 80px;
	line-height: 30px;
	font-size: 11px;
	color: #5f5f5f;
	font-family: gulim, serif;
}

.list_del {
	text-align: right;
	width: 21px;
}

#cart_list {
	display: none;
}

.delivery_information p {
	line-height: 16px;
	font-size: 12px;
	color: #878787;
	font-family: gulim, 굴림;
}

.delivery_information p a {
	line-height: 16px;
	font-size: 12px;
	color: #878787;
	font-family: gulim, 굴림;
}

.refund_information p {
	line-height: 16px;
	font-size: 12px;
	color: #878787;
	font-family: gulim, 굴림;
}

.refund_information p a {
	line-height: 16px;
	font-size: 12px;
	color: #878787;
	font-family: gulim, 굴림;
}

#scrollbox {
	display: none;
	right: 0px;
	top: 0px;
	position: fixed;
	z-index: 9999;
	width: 80px;
	background-color: #ffffff;
}

#scrollbox .title {
	text-align: center;
	font-weight: bold;
	line-height: 24px;
	font-size: 11px;
	color: #848689;
	font-family: dotum, 돋움;
}

#scrollbox .list {
	line-height: 17px;
	font-size: 11px;
	color: #787878;
	font-family: dotum, 돋움;
	letter-spacing: -1px;
}

#scrollbox .c1 {
	font-weight: bold;
	line-height: 17px;
	font-size: 11px;
	color: #666666;
	font-family: dotum, 돋움;
	letter-spacing: -1px;
}

#scrollbox .c2 {
	font-weight: bold;
	line-height: 17px;
	font-size: 11px;
	color: #ff3c00;
	font-family: dotum, 돋움;
	letter-spacing: -1px;
}

#scrollbox .title2 {
	cursor: pointer;
	text-align: center;
	font-weight: bold;
	line-height: 23px;
	font-size: 11px;
	color: #787878;
	font-family: dotum, 돋움;
}

#scrollbox .not {
	padding: 40px 0;
	text-align: center;
	line-height: 16px;
	font-size: 11px;
	color: #a6a6a6;
	font-family: dotum, 돋움;
}

#scrollbox_data1 {
	border-top: 1px solid #dbdbdb;
	display: none;
}

#scrollbox_data2 {
	border-bottom: 1px solid #dbdbdb;
	display: none;
}

#scrollbox_data3 {
	border-top: 1px solid #dbdbdb;
	display: none;
}

#scrollbox .count {
	font-weight: bold;
	line-height: 24px;
	font-size: 11px;
	color: #ff3c00;
	font-family: dotum, 돋움;
}

#scrollbox .text {
	line-height: 24px;
	font-size: 11px;
	color: #666666;
	font-family: dotum, 돋움;
}

#scrollbox .page {
	text-align: center;
	line-height: 12px;
	font-size: 11px;
	color: #666666;
	font-family: dotum, 돋움;
}

#scrollbox .thumb {
	position: relative;
	left: 0px;
	top: 0px;
	width: 62px;
	height: 62px;
}

#scrollbox .close {
	position: absolute;
	z-index: 2;
	right: 1px;
	top: 1px;
}

#scrollbox .image {
	position: absolute;
	z-index: 1;
	left: 0px;
	top: 0px;
}

#scrollbox .image img {
	border: 1px solid #c5c5c5;
}

#scrollbox .image .on {
	border: 1px solid #ff3c00;
}

#scrollbox .top {
	cursor: pointer;
	text-align: center;
	font-weight: bold;
	line-height: 21px;
	font-size: 11px;
	color: #a5a5a5;
	font-family: dotum, 돋움;
}

#scrollbox .top img {
	position: relative;
	overflow: hidden;
	left: 0;
	top: -2px;
}
</style>
<script type="text/javascript">
// 주문 수량
function listOrderLimit(item_option_num, mode)
{

    var item_money = parseInt(document.getElementById("item_money").value);
    var item_option_id = $('#list_option_'+item_option_num).find('input[rel="option_id"]').val();
    var obj_option_limit = $('#list_option_'+item_option_num).find('input[rel="option_limit"]');

    if (!item_option_id) {
        return false;
    }

    if (mode == 'plus') {

        var item_option_limit = parseInt(obj_option_limit.val()) + 1;

    } else {

        var item_option_limit = parseInt(obj_option_limit.val()) - 1;

        if (item_option_limit <= 0) {

            obj_option_limit.focus();
            return false;

        }

    }

    obj_option_limit.val(item_option_limit);
    obj_option_limit.attr('value', item_option_limit);

    var item_option_money = (item_money * item_option_limit) + (eval("item_option_"+item_option_id+"_money") * (3));

    $('#list_option_'+item_option_num).find('span[rel="option_money"]').text(item_option_money);

    orderCheck();
    return false;

}

// 주문 수량
function orderLimit(mode)
{

    var order_limit = parseInt(document.getElementById("order_limit").value);

    if (mode == 'plus') {

        document.getElementById("order_limit").value = order_limit + 1;

    } else {

        document.getElementById("order_limit").value = order_limit - 1;

    }

    orderCheck();
    return false;

}

// 주문 체크
function orderCheck() {

   		var item_money = parseInt(document.getElementById("item_money").value);

        var item_option_money = parseInt(0);
        var item_option_limit = parseInt(document.getElementById("item_limit").value);

        var order_limit = parseInt(document.getElementById("order_limit").value);

        if (order_limit <= '0') {

            alert("수량을 1개 이상으로 입력하여 주시기 바랍니다.");
            document.getElementById("order_limit").value = "1";
            orderCheck();
            return false;

        }
	    var chkStyle = /\d/;
        if (!chkStyle.test(document.getElementById("order_limit").value)) {

            alert("숫자만 입력하여 주세요.");
            document.getElementById("order_limit").value = "1";
            orderCheck();
            return false;

        }

        // 주문 수량 초과
        if (order_limit > item_option_limit) {

            alert("주문수량이 재고수량보다 많습니다.");
            document.getElementById("order_limit").value = "1";

            // 옵션 사용
            if (item_option_mode == '1') {

                // 셀렉트 해제
                document.getElementById("order_option").value = '';

            }

            orderCheck();
            return false;

        }

        var order_money = (item_money * order_limit);
        var order_total_money = parseInt(order_money);
		
        // 마이너스이면
        if (order_total_money < 0) {

            alert("금액이 마이너스 입니다.\n\n주문 옵션을 다시 확인하시기 바랍니다.");
            document.getElementById("order_limit").value = "1";
            //orderCheck();
            return false;

        }

   

    document.getElementById("order_total_money").value = order_total_money;
    document.getElementById("order_total_money_view").innerHTML = String(order_total_money);
    
}
</script>








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
					<div class="chart-holder" id="dashboard-bar-1"
						style="height: 10px;">
						<!-- 본문시작 -->

						<div class="layout_main">

							<div
								style="border: 1px solid #efefef; background-color: #ffffff;">
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="item_position">
									<tbody>
										<tr height="30" bgcolor="#f7f7f7">
											<td width="10"></td>
											<td>
												<table border="0" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td><a href="#" class="home">홈</a></td>
															<td width="20" align="center"><img
																src="/moyeo/resources/resource/img/shop/arrow.gif"
																class="up1"></td>
															<td><a href="#" class="off">
																	${dto.product_cat1}</a></td>
															<td width="20" align="center"><img
																src="/moyeo/resources/resource/img/shop/arrow.gif"
																class="up1"></td>		
															<td><a href="#" class="off">
																	${dto.product_cat2}</a></td>	
														</tr>
													</tbody>
												</table>
											</td>
											<td width="130" align="right"><span class="title">상품번호
													:</span> <span class="code">${dto.product_num}</span></td>
											<td width="10"></td>
										</tr>
									</tbody>
								</table>

								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<td style="height: 1px;" bgcolor="#efefef" class="none">&nbsp;</td>
										</tr>
									</tbody>
								</table>

								<div style="padding: 10px 30px 20px 30px;">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td width="360" valign="top">
													<!-- 상품 이미지 start //-->
													<table border="0" cellspacing="0" cellpadding="0"
														class="auto">
														<tbody>
															<tr width="360" height="366">
																<td align="center" valign="middle">
																	<img src="${pic_dto.pic_path}/${pic_dto.pic_name}" width="360" height="366"> 
																</td>
															</tr>
														</tbody>
													</table> <!-- 상품 이미지 end //-->
												</td>
												<td width="50"></td>
												<td valign="top" class="item_information">
													<!-- 상품 정보 박스 start //-->
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td class="item_title" style="text-align:left;">${dto.product_name}</td>
															</tr>
														</tbody>
													</table>


													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td><img style="float:left;"
																	src="/moyeo/resources/resource/img/shop/1935647224_8310ce26_i03.gif"
																	width="26" height="15" border="0"></td>
															</tr>
														</tbody>
													</table>

													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr height="10">
																<td></td>
															</tr>
														</tbody>
													</table>


													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr height="30">
																<td width="60" class="item_subtitle">판매가 :</td>
																<td style="text-align:left;" class="item_money"><input type="text" id="item_money" value="${dto.product_price}" readonly style="padding-right:1px; border:0px; width:45px; text-align:right">원</td>
															</tr>
															<tr height="1" bgcolor="#f4f4f4">
																<td colspan="2"></td>
															</tr>
															<tr height="30">
																<td width="60" class="item_subtitle">적립금 :</td>
																<td style="text-align:left;" class="item_cash">${dto.product_price * 0.01}P</td>
															</tr>
														</tbody>
													</table>


													<table border="0" cellspacing="0" cellpadding="0">
														<tbody>
															<tr height="30">
																<td width="60" class="item_subtitle">재고수량 :</td>
																<td class="item_limit"><input type="text" id="item_limit" style="width:20px; border:0px;" readonly value="${dto.product_qty}">개</td>
															</tr>
														</tbody>
													</table>

													<table border="0" cellspacing="0" cellpadding="0">
														<tbody>
															<tr height="30">
																<td width="60" class="item_subtitle">배송비</td>
																<td class="item_delivery_money">2,500원</td>
															</tr>
														</tbody>
													</table>

													<div id="item_cart_data" style="display: none;"></div>

													<form method="post" id="formItem" name="formItem"
														action="buy">
														<input type="hidden" name="url"
															value="productDetail?product_num=${dto.product_num}">
														<input type="hidden" name="pic_path" value="${pic_dto.pic_path}"> <input
															type="hidden" name="pic_name" value="${pic_dto.pic_name}"> <input
															type="hidden" name="pic_type" value="${pic_dto.pic_type}"> <input
															type="hidden" name="product_price" value="${dto.product_price}"> <input
															type="hidden" name="product_num" value="${dto.product_num}"> <input
															type="hidden" name="product_name" value="${dto.product_name}"> 
															<input
															type="hidden" id="cart_id" name="cart_id" value="">
														<input type="hidden" id="order_start" name="order_start"
															value=""> <input type="submit" value="ok"
															disabled="" style="display: none;">


														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr>
																	<td>
																		<div
																			style="border: 1px solid #eaeaea; background-color: #ffffff;">
																			<div style="padding: 7px 10px 7px 10px;">
																				<table width="100%" border="0" cellspacing="0"
																					cellpadding="0">
																					<tbody>
																						<tr>
																							<td width="55" class="order_title">주문수량</td>
																							<td width="85">
																								<table border="0" cellspacing="0"
																									cellpadding="0">
																									<tbody>
																										<tr>
																											<td><input type="text" id="order_limit"
																												name="order_limit" class="input" value="1"
																												onkeyup="orderCheck();"></td>
																											<td width="2"></td>
																											<td class="order_limit">개</td>
																											<td width="5"></td>
																											<td><a href="#"
																												onclick="orderLimit('plus'); return false;"><img
																													src="/moyeo/resources/resource/img/shop/limit_plus.gif"
																													border="0"></a></td>
																											<td width="3"></td>
																											<td><a href="#"
																												onclick="orderLimit('minus'); return false;"><img
																													src="/moyeo/resources/resource/img/shop/limit_minus.gif"
																													border="0"></a></td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																							<td align="right">
																								<table border="0" cellspacing="0"
																									cellpadding="0">
																									<tbody>
																										<tr>
																											<td class="order_title2">금액 :</td>
																											<td width="5"></td>
																											<td class="item_total_"><span
																												id="order_total_money_view">${dto.product_price}</span>원</td>
																										</tr>
																									</tbody>
																								</table>
																							</td>
																						</tr>
																					</tbody>
																				</table>
																			</div>
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>

														<input type="hidden" id="item_option_id"
															name="item_option_id" value=""> <input
															type="hidden" id="order_total_money"
															name="order_total_money" value="0">
													


													<div id="cart_list"></div>


													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr height="20">
																<td></td>
															</tr>
														</tbody>
													</table>

													<table border="0" cellspacing="0" cellpadding="0">
														<tbody>
															<tr>
																<td><input type="submit" value="바로구매" style="background:rgb(34, 136, 155); color:white; font-size:13px; width:100px; height:42px;">
																</td>
																<td width="2"></td>
																<td><a href="#" onclick="itemCart(); return false;"><img
																		src="/moyeo/resources/resource/img/shop/item_cart.gif"
																		border="0" style="padding:3px;"></a></td>
																<td width="2"></td>

															</tr>
														</tbody>
													</table>
													</form>
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr height="20">
																<td></td>
															</tr>
														</tbody>
													</table>

													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tbody>
															<tr>
																<td>
																	<div class="sns_box">
																		<div style="padding: 5px 10px 5px 10px;">
																			<table width="100%" border="0" cellspacing="0"
																				cellpadding="0">
																				<tbody>
																					<tr>
																						<td width="40"><img
																							src="/moyeo/resources/resource/img/shop/title_sns.gif"></td>
																						<td align="right">
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><a
																											href="https://twitter.com/intent/tweet?url=http%3A%2F%2Flocalhost:8080/moyeo/six/shop/productDetail?product_num=${dto.product_num};text=${dto.product_name}"
																											target="_blank" title="트위터 퍼가기"><img
																												src="/moyeo/resources/resource/img/shop/sns_twitter.png"
																												border="0"></a></td>
																										<td width="4"></td>
																										<td><a
																											href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost:8080/moyeo/six/shop/productDetail?product_num=${dto.product_num}"
																											target="_blank" title="페이스북 퍼가기"><img
																												src="/moyeo/resources/resource/img/shop/sns_facebook.png"
																												border="0"></a></td>
																										<td width="4"></td>
																										<td><a
																											href="https://story.kakao.com/share?url=218.38.255.69/localhost:8080/moyeo/six/shop/productDetail?product_num=${dto.product_num}"
																											target="_blank" title="카카오스토리 퍼가기"><img
																												src="/moyeo/resources/resource/img/shop/sns_kakaostory.png"
																												border="0"></a></td>
																										<td width="4"></td>
																									</tr>
																								</tbody>
																							</table>
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</div>
																	</div>
																</td>
															</tr>
														</tbody>
													</table> <!-- 상품 정보 박스 end //-->
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<!-- 관련상품 start //-->
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr height="10">
										<td></td>
									</tr>
								</tbody>
							</table>

							<div
								style="border: 1px solid #efefef; background-color: #ffffff;">
								<div class="relation_box">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td bgcolor="#f4f4f4" width="137" align="center"><img
													src="/moyeo/resources/resource/img/shop/title_relation.gif"></td>
												<td width="1" bgcolor="#efefef"></td>
												<td><div style="padding: 20px 0;">
														<div id="relation_data">

															<table width="100%" border="0" cellspacing="0"
																cellpadding="0">
																<tbody>
																	<tr>
																		<td class="btn_prev_out"></td>
																		<td><div class="relation_list"
																				style="visibility: visible; overflow: hidden; position: relative; z-index: 2; left: 0px; width: 700px;">
																				<ul
																					style="margin: 0px; padding: 0px; position: relative; list-style-type: none; z-index: 1; width: 700px; left: 0px;">
																					<li
																						style="overflow: hidden; float: left; width: 116px; height: 118px;"><div
																							style="width: 80px;">
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><a
																											href="../../../item.php?id=J252641947"><img
																												src=/moyeo/resources/resource/img/shop/1935647224_397711a1_m07.jpg
																												" width="80" height="80" border="0"></a></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td height="5"></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><a
																											href="../../../item.php?id=J252641947"
																											class="item_relation_title">단가라 원피스</a></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td height="5"></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><span class="item_relation_money">25,000</span></td>
																									</tr>
																								</tbody>
																							</table>
																						</div></li>
																					<li
																						style="overflow: hidden; float: left; width: 116px; height: 118px;"><div
																							style="width: 80px;">
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><a
																											href="../../../item.php?id=X589981672"><img
																												src="/moyeo/resources/resource/img/shop/1935647224_188c59da_m06.jpg"
																												width="80" height="80" border="0"></a></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td height="5"></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><a
																											href="../../../item.php?id=X589981672"
																											class="item_relation_title">땡땡이 블라우스</a></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td height="5"></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><span class="item_relation_money">15,800</span></td>
																									</tr>
																								</tbody>
																							</table>
																						</div></li>
																					<li
																						style="overflow: hidden; float: left; width: 116px; height: 118px;"><div
																							style="width: 80px;">
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><a
																											href="../../../item.php?id=N768748935"><img
																												src="/moyeo/resources/resource/img/shop/1935647224_03f68276_m05.jpg"
																												width="80" height="80" border="0"></a></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td height="5"></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><a
																											href="../../../item.php?id=N768748935"
																											class="item_relation_title">리본블라우스</a></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td height="5"></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><span class="item_relation_money">20,000</span></td>
																									</tr>
																								</tbody>
																							</table>
																						</div></li>
																					<li
																						style="overflow: hidden; float: left; width: 116px; height: 118px;"><div
																							style="width: 80px;">
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><a
																											href="../../../item.php?id=O577892850"><img
																												src="/moyeo/resources/resource/img/shop/1935647224_4b57bae0_m04.jpg"
																												width="80" height="80" border="0"></a></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td height="5"></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><a
																											href="../../../item.php?id=O577892850"
																											class="item_relation_title">검은치마</a></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td height="5"></td>
																									</tr>
																								</tbody>
																							</table>
																							<table border="0" cellspacing="0" cellpadding="0">
																								<tbody>
																									<tr>
																										<td><span class="item_relation_money">6,000</span></td>
																									</tr>
																								</tbody>
																							</table>
																						</div></li>
																				</ul>
																			</div></td>
																		<td class="btn_next_out"></td>
																	</tr>
																</tbody>
															</table>

														</div>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>



							<!-- 관련상품 end //-->

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr height="10">
										<td></td>
									</tr>
								</tbody>
							</table>

							<div
								style="border: 1px solid #efefef; background-color: #ffffff;">
								<!-- 상세정보 start //-->
								<a name="item_view"></a>
								<div style="padding: 15px 15px 15px 15px;" class="item_view">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr class="tab_bg">
												<td>
													<table border="0" style="border-bottom: 2px #383d41"
														cellspacing="0" cellpadding="0">
														<tbody>
															<tr>
																<td width="200" height="40" bgcolor="#383d41"
																	onclick="shopMove('#item_view'); return false;"
																	class="tab_use1_on pointer"><a href="#item_view"><font size="2"
																	color="#ffffff">상세정보</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_delivery'); return false;"
																	class="active"><a href="#item_delivery"><font size="2" color="#656d78">배송안내</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_refund'); return false;"
																	class="tab_use3_off pointer"><a href="#item_refund"><font size="2" color="#656d78">환불규정</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_reply'); return false;"
																	class="tab_use4_off pointer"><a href="#item_reply"><font size="2" color="#656d78">상품평
																		0</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_qna'); return false;"
																	class="tab_use5_off pointer"><a href="#item_qna"><font size="2" color="#656d78">상품문의
																		0</font></a>
																</td>
															</tr>
														</tbody>
													</table>
										</td>
										<td class="tab_side"></td>
										</tr>
										</tbody>
									</table>

									<!-- 상품 요약안내 start //-->
									<!-- 상품 요약안내 end //-->

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr height="150">
												<td></td>
											</tr>
										</tbody>
									</table>
								</div>

								
								<div style="height:1px; width:100%; background:#efefef;" class="none">
								
								<!-- 상세정보 end //-->

								<!-- 배송안내 start //-->
								<a name="item_delivery"></a>
								<div style="padding: 15px 15px 15px 15px;" class="item_view">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr class="tab_bg">
												<td>
													<table border="0" cellspacing="0" cellpadding="0">
														<tbody>
															<tr>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_view'); return false;"
																	class="tab_use1_off pointer"><a href="#item_view"><font size="2" color="#656d78">상세정보</font></a></td>
																<td width="200" height="40" bgcolor="#383d41"
																	onclick="shopMove('#item_delivery'); return false;"
																	class="tab_use2_on pointer"><a href="#item_delivery"><font size="2"
																	color="#ffffff">배송안내</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_refund'); return false;"
																	class="tab_use3_off pointer"><a href="#item_refund"><font size="2" color="#656d78">환불규정</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_reply'); return false;"
																	class="tab_use4_off pointer"><a href="#item_reply"><font size="2" color="#656d78">상품평</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_qna'); return false;"
																	class="tab_use5_off pointer"><a href="#item_qna"><font size="2" color="#656d78">상품문의</font></a></td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="tab_side"></td>
											</tr>
										</tbody>
									</table>

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr height="150">
												<td>

													<div class="delivery_information">
														<div style="margin-top: 10px; border: 1px solid #e0e0e0;">
															<div style="padding: 20px; border: 4px solid #f2f2f2;">
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td width="9"></td>
																			<td><img
																				src="/moyeo/resources/resource/img/shop/parcel01.gif"></td>
																		</tr>
																	</tbody>
																</table>
																<table
																	style="margin-top: 10px; border-top: 2px solid #f4f4f4;"
																	border="0" cellpadding="0" cellspacing="0" width="100%">
																	<tbody>
																		<tr height="30">
																			<td></td>
																		</tr>
																	</tbody>
																</table>
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td width="55"></td>
																			<td valign="top" width="90"><p
																					style="margin-top: 5px; text-align: left;">
																					<img
																						src="/moyeo/resources/resource/img/shop/parcel02.gif">
																				</p></td>
																			<td valign="top"><p style="text-align:left;">
																					저희 쇼핑몰은 <font color="#436fca">평일 오후 4시 이전
																						결제완료건에 한하여, 당일 발송</font>을 원칙으로 합니다.<br>단, 주문상품의 입고지연
																					및 주문제작 상품 경우, 발송기간이 2~3일 가량 지연될 수 있습니다.
																				</p>
																				<p style="margin-top: 10px; text-align:left; font-weight: bold;">평일(월~금)
																					주문건 오후 4시 이전 결제건</p>
																				<p style="text-align:left;">당일 발송. 오후 6시 상품 출고</p>
																				<p style="margin-top: 10px; text-align:left; font-weight: bold;">평일(월~금)
																					주문건 오후 4시 이후 결제건</p>
																				<p style="text-align:left;">익일 발송. 다음날 오후 6시 상품 출고</p>
																				<p style="margin-top: 10px; text-align:left; font-weight: bold;">토/일/공휴일
																					결제건</p>
																				<p style="text-align:left;">다음 영업일 기준 오후 6시 상품 출고</p></td>
																		</tr>
																	</tbody>
																</table>
																<table
																	style="margin-top: 25px; border-top: 1px solid #f4f4f4;"
																	border="0" cellpadding="0" cellspacing="0" width="100%">
																	<tbody>
																		<tr height="30">
																			<td></td>
																		</tr>
																	</tbody>
																</table>
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td width="55"></td>
																			<td valign="top" width="90"><p
																					style="margin-top: 5px; text-align: left;">
																					<img
																						src="/moyeo/resources/resource/img/shop/parcel03.gif">
																				</p></td>
																			<td valign="top"><p style="text-align:left;">
																					배송기간은 상품발송일로 부터, <font color="#436fca">택배사의
																						사정에 따라 1일~4일 가량</font> 소요될 수 있습니다.
																				</p>
																				<p style="text-align:left;">주말/공휴일을 포함하거나, 도선산간 지역일 경우 추가적인 배송지연이 발생할 수
																					있습니다.</p></td>
																		</tr>
																	</tbody>
																</table>
																<table
																	style="margin-top: 25px; border-top: 1px solid #f4f4f4;"
																	border="0" cellpadding="0" cellspacing="0" width="100%">
																	<tbody>
																		<tr height="30">
																			<td></td>
																		</tr>
																	</tbody>
																</table>
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td width="55"></td>
																			<td valign="top" width="90"><p
																					style="margin-top: 5px; text-align: left;">
																					<img
																						src="/moyeo/resources/resource/img/shop/parcel04.gif">
																				</p></td>
																			<td valign="top"><p style="text-align:left;">
																					5만원 이하 결제건 : <b>배송비 2,500원</b> (주문 결제시, 부담)
																				</p>
																				<p style="text-align:left;">
																					5만원 이상 결제건 : <b>무료 배송</b>
																				</p>
																				<p style="margin-top: 10px; text-align:left;">단, 아래와 같은 경우 별도의 추가
																					배송비(도선료)가 발생 됩니다.</p>
																				<p style="margin-left: 5px; text-align:left;">- 도서산간/제주도 : 추가요금
																					500원</p>
																				<p style="margin-left: 5px; text-align:left;">- 국내 기타/섬 지역 :
																					4,500원</p>
																				<p style="margin-left: 5px; text-align:left;">- 해외 발송 : 전화문의</p></td>
																		</tr>
																	</tbody>
																</table>
																<table
																	style="margin-top: 25px; border-top: 1px solid #f4f4f4;"
																	border="0" cellpadding="0" cellspacing="0" width="100%">
																	<tbody>
																		<tr height="30">
																			<td></td>
																		</tr>
																	</tbody>
																</table>
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td width="55"></td>
																			<td valign="top" width="90"><p
																					style="margin-top: 10px; text-align: left;">
																					<img
																						src="/moyeo/resources/resource/img/shop/parcel05.gif">
																				</p></td>
																			<td valign="top"><table border="0"
																					cellpadding="0" cellspacing="0">
																					<tbody>
																						<tr>
																							<td valign="top"><img
																								src="/moyeo/resources/resource/img/shop/parcel06.gif"></td>
																							<td width="20"></td>
																							<td valign="top"><p
																									style="text-align:left; margin-top: 25px; font-weight: bold;">우체국
																									택배</p>
																								<p style="text-align:left;">
																									홈페이지 : <a href="http://parcel.epost.go.kr/"
																										target="_blank">http://parcel.epost.go.kr/</a>
																								</p>
																								<p style="text-align:left;">전화문의 : 1588-1300</p>
																								<p style="text-align:left;">상담시간 : 평일 09:00 ~ 18:00</p></td>
																						</tr>
																					</tbody>
																				</table>
																				<table style="margin-top: 10px;" border="0"
																					cellpadding="0" cellspacing="0">
																					<tbody>
																						<tr>
																							<td><p style="text-align:left;">
																									배송조회는 택배사의 홈페이지 또는 전화문의를 이용 하시거나,<br>쇼핑몰 내
																									마이페이지 &gt; 배송조회를 통해 확인하실 수 있습니다.
																								</p></td>
																						</tr>
																					</tbody>
																				</table></td>
																		</tr>
																	</tbody>
																</table>
																<table border="0" cellpadding="0" cellspacing="0"
																	width="100%">
																	<tbody>
																		<tr height="25">
																			<td></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>

								<div style="height:1px; width:100%; background:#efefef;" class="none">
								<!-- 배송안내 end //-->

								<!-- 환불규정 start //-->
								<a name="item_refund"></a>
								<div style="padding: 15px 15px 15px 15px;" class="item_view">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr class="tab_bg">
												<td>
													<table border="0" cellspacing="0" cellpadding="0">
														<tbody>
															<tr>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_view'); return false;"
																	class="tab_use1_off pointer"><a href="#item_view"><font size="2" color="#656d78">상세정보</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_delivery'); return false;"
																	class="tab_use2_off pointer"><a href="#item_delivery"><font size="2" color="#656d78">배송안내</font></a></td>
																<td width="200" height="40" bgcolor="#383d41"
																	onclick="shopMove('#item_refund'); return false;"
																	class="tab_use3_on pointer"><a href="#item_refund"><font size="2"
																	color="#ffffff">환불규정</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_reply'); return false;"
																	class="tab_use4_off pointer"><a href="#item_reply"><font size="2" color="#656d78">상품평</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_qna'); return false;"
																	class="tab_use5_off pointer"><a href="#item_qna"><font size="2" color="#656d78">상품문의</font></a></td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="tab_side"></td>
											</tr>
										</tbody>
									</table>

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr height="150">
												<td>

													<div class="refund_information">
														<div style="margin-top: 10px; border: 1px solid #e0e0e0;">
															<div
																style="padding: 20px 0 30px 0; border: 4px solid #f2f2f2;">
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td width="30"></td>
																			<td><img
																				src="/moyeo/resources/resource/img/shop/policy01.gif"></td>
																		</tr>
																	</tbody>
																</table>
																<table
																	style="margin-top: 10px; border-top: 2px solid #f4f4f4;"
																	border="0" cellpadding="0" cellspacing="0" width="100%">
																	<tbody>
																		<tr height="30">
																			<td></td>
																		</tr>
																	</tbody>
																</table>
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td align="right" valign="top" width="135"><p
																					style="margin-top: 5px;">
																					<img
																						src="/moyeo/resources/resource/img/shop/policy02.gif">
																				</p></td>
																			<td width="30"></td>
																			<td valign="top"><p style="text-align:left;">
																					저희 쇼핑몰은 판매자의 과실 또는 소비자의 과실로 발생되는 상품의 교환, 환불(반품)
																					서비스를<br>소비자 보호법에 의거하여 상품수령로 부터 7일 이내에 요청하실 수
																					있습니다.
																				</p>
																				<p style="text-align:left; margin-top: 10px; font-weight: bold;">주문취소
																					접수</p>
																				<p style="text-align:left;">상품 주문 후, 배송준비 전 단계에서 마이페이지를 통해서 [주문취소]접수가능</p>
																				<p style="text-align:left; margin-top: 10px; font-weight: bold;">상품교환
																					접수</p>
																				<p style="text-align:left;">상품 수령 후, 마이페이지에서 [상품수령]버튼 클릭 후 [교환신청]버튼을 클릭하여
																					접수가능</p>
																				<p style="text-align:left; margin-top: 10px; font-weight: bold;">환불/반품
																					접수</p>
																				<p style="text-align:left;">상품 수령 후, 마이페이지에서 [상품수령]버튼 클릭 후 [환불신청]버튼을 클릭하여
																					접수가능</p></td>
																		</tr>
																	</tbody>
																</table>
																<table
																	style="margin-top: 25px; border-top: 1px solid #f4f4f4;"
																	border="0" cellpadding="0" cellspacing="0" width="100%">
																	<tbody>
																		<tr height="30">
																			<td></td>
																		</tr>
																	</tbody>
																</table>
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td align="right" valign="top" width="135"><p
																					style="margin-top: 5px;">
																					<img
																						src="/moyeo/resources/resource/img/shop/policy03.gif">
																				</p></td>
																			<td width="30"></td>
																			<td valign="top"><p style="text-align:left;" >
																					판매자의 과실로인한 상품 교환 및 환불시에는 <b>왕복 배송요금 5,000원을
																						판매자가 부담</b> 합니다.
																				</p>
																				<p style="text-align:left;">판매자의 과실에 해당하는 사유는 다음과 같습니다.</p>
																				<p style="margin-top: 10px; text-align:left;">- 오배송 : 주문상품과 다른
																					상품, 주문옵션과 다른 옵션의 상품이 배송되었을 때</p>
																				<p style="text-align:left;">- 제품불량 : 제품의 하자 또는 사용 및 외관상 결함이 있을 때</p>
																				<p style="text-align:left;">- 허위광고 : 쇼핑몰의 제품 안내문구와, 차이가 있을 때</p>
																				<p style="text-align:left;">※ 예외규정 : 모니터상의 제품사진과 실제품의 미세한 색상 또는 규격의 차이</p>
																				<p style="margin-left: 75px; text-align:left;">상품 상세정보를 통해 사전에
																					안내된 경우 등</p></td>
																		</tr>
																	</tbody>
																</table>
																<table
																	style="margin-top: 25px; border-top: 1px solid #f4f4f4;"
																	border="0" cellpadding="0" cellspacing="0" width="100%">
																	<tbody>
																		<tr height="30">
																			<td></td>
																		</tr>
																	</tbody>
																</table>
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td align="right" valign="top" width="135"><p
																					style="margin-top: 5px;">
																					<img
																						src="/moyeo/resources/resource/img/shop/policy04.gif">
																				</p></td>
																			<td width="30"></td>
																			<td valign="top"><p style="text-align:left;">
																					소비자의 과실로인한 상품 교환 및 환불시에는 <b>왕복 배송요금 5,000원을
																						소비자가 부담</b> 합니다.
																				</p>
																				<p style="text-align:left;">소비자의 과실에 해당하는 사유는 다음과 같습니다.</p>
																				<p style="margin-top: 10px; text-align:left;">- 단순변심 : 판매자 과실에
																					해당하는 사유하지 않는 사유로 교환 및 환불을 요청할 때</p>
																				<p style="text-align:left;">- 주문오류 : 소비자가 실수로 상품 및 주문옵션을 잘못 입력하였을 때</p>
																				<p style="text-align:left;">- 판매자 과실의 예외규정에 명시된 항목</p></td>
																		</tr>
																	</tbody>
																</table>
																<table
																	style="margin-top: 25px; border-top: 1px solid #f4f4f4;"
																	border="0" cellpadding="0" cellspacing="0" width="100%">
																	<tbody>
																		<tr height="30">
																			<td></td>
																		</tr>
																	</tbody>
																</table>
																<table border="0" cellpadding="0" cellspacing="0">
																	<tbody>
																		<tr>
																			<td align="right" valign="top" width="135"><p
																					style="margin-top: 5px;">
																					<img
																						src="/moyeo/resources/resource/img/shop/policy05.gif">
																				</p></td>
																			<td width="30"></td>
																			<td valign="top"><p style="text-align:left;">
																					상품 수령 후, 반품/교환 요청 시 아래의 사유에 해당할 경우, 판매자는 소비자 보호법에
																					의거하여<br>반품 및 교환을 거절할 수 있으니, 반드시 확인 하시기 바랍니다.
																				</p>
																				<p style="margin-top: 10px; text-align:left;">- 소비자에게 책임 있는 사유로
																					상품이 멸실 또는 훼손된 경우</p>
																				<p style="text-align:left;">- 소비자의 개봉 또는 사용흔적 등으로 인하여, 새 상품으로서의 가치가 훼손된
																					경우</p>
																				<p style="text-align:left;">- 상품 수령일로 부터 반품 및 교환접수 기간이 경과하였을 경우</p>
																				<p style="text-align:left;">- 무단복제를 목적으로 상품을 구입하였을 경우</p>
																				<p style="text-align:left;">- 그 외 주문제작, 해외 직배송 등의 사유로 반품/교환 불가 상품으로 사전
																					명시된 상품일 경우</p></td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>

										<div style="height:1px; width:100%; background:#efefef;" class="none">
								<!-- 환불규정 end //-->

								<!-- 상품평 start //-->
								<a name="item_reply"></a>
								<div style="padding: 15px 15px 15px 15px;"
									class="item_view item_reply">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr class="tab_bg">
												<td>
													<table border="0" cellspacing="0" cellpadding="0"
														width="100%">
														<tbody>
															<tr>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_view'); return false;"
																	class="tab_use1_off pointer"><a href="#item_view"><font size="2" color="#656d78">상세정보</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_delivery'); return false;"
																	class="tab_use2_off pointer"><a href="#item_delivery"><font size="2" color="#656d78">배송안내</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_refund'); return false;"
																	class="tab_use3_off pointer"><a href="#item_refund"><font size="2" color="#656d78">환불규정</font></a></td>
																<td width="200" height="40" bgcolor="#383d41"
																	onclick="shopMove('#item_reply'); return false;"
																	class="tab_use4_on pointer"><a href="#item_reply"><font color="#ffffff"
																	size="2">상품평</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_qna'); return false;"
																	class="tab_use5_off pointer"><a href="#item_qna"><font size="2" color="#656d78">상품문의</font></a></td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="tab_side"></td>
											</tr>
										</tbody>
									</table>

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td><div id="reply_data">
														<meta http-equiv="content-type"
															content="text/html; charset=utf-8">
														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr height="20">
																	<td></td>
																</tr>
															</tbody>
														</table>

														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr>
																	<td width="200" valign="top">
																		<table width="100%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tbody>
																				<tr height="8">
																					<td></td>
																				</tr>
																			</tbody>
																		</table>

																		<table border="0" cellspacing="0" cellpadding="0">
																			<tbody>
																				<tr>
																					<td><img
																						src="/moyeo/resources/resource/img/shop/reply_title.gif"></td>
																					<td width="4"></td>
																					<td><span class="count down1">(0)</span></td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																	<td align="right" valign="top"><a href="#"
																		onclick="replyWrite('item', '', '17', '', '1'); return false;"><img
																			src="/moyeo/resources/resource/img/shop/reply_write.gif"
																			border="0"></a></td>
																</tr>
															</tbody>
														</table>

														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr height="10">
																	<td></td>
																</tr>
															</tbody>
														</table>


														<table style="height:1px;" width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr>
																			<td><div style="height:1px; width:100%; background:#efefef;" class="none"></div></td>
																</tr>
															</tbody>
														</table>


														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr height="150">
																	<td align="center" class="content">등록된 상품평이 없습니다.</td>
																</tr>
															</tbody>
														</table>

														<table border="0" cellspacing="0" cellpadding="0">
															<tbody>
																<tr>
																	<td height="50"></td>
																</tr>
															</tbody>
														</table>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>



								<div style="height:1px; width:100%; background:#efefef;" class="none">
								<!-- 상품평 end //-->

								<!-- 상품문의 start //-->
								<a name="item_qna"></a>
								<div style="padding: 15px 15px 15px 15px;"
									class="item_view item_qna">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr class="tab_bg">
												<td>
													<table border="0" cellspacing="0" cellpadding="0">
														<tbody>
															<tr>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_view'); return false;"
																	class="tab_use1_off pointer"><a href="#item_view"><font size="2" color="#656d78">상세정보</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_delivery'); return false;"
																	class="tab_use2_off pointer"><a href="#item_delivery"><font size="2" color="#656d78">배송안내</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_refund'); return false;"
																	class="tab_use3_off pointer"><a href="#item_refund"><font size="2" color="#656d78">환불규정</font></a></td>
																<td width="200" height="40" bgcolor="#f4f4f4"
																	onclick="shopMove('#item_reply'); return false;"
																	class="tab_use4_off pointer"><a href="#item_reply"><font size="2" color="#656d78">상품평</font></a></td>
																<td width="200" height="40" bgcolor="#383d41"
																	onclick="shopMove('#item_qna'); return false;"
																	class="tab_use5_on pointer"><a href="#item_qna"><font color="#ffffff"
																	size="2">상품문의</font></a></td>
															</tr>
														</tbody>
													</table>
												</td>
												<td class="tab_side"></td>
											</tr>
										</tbody>
									</table>

									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td><div id="qna_data">
														<meta http-equiv="content-type"
															content="text/html; charset=utf-8">
														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr height="20">
																	<td></td>
																</tr>
															</tbody>
														</table>

														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr>
																	<td width="200" valign="top">
																		<table width="100%" border="0" cellspacing="0"
																			cellpadding="0">
																			<tbody>
																				<tr height="8">
																					<td></td>
																				</tr>
																			</tbody>
																		</table>

																		<table border="0" cellspacing="0" cellpadding="0">
																			<tbody>
																				<tr>
																					<td><img
																						src="/moyeo/resources/resource/img/shop/qna_title.gif"></td>
																					<td width="4"></td>
																					<td><span class="count down1">(0)</span></td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																	<td align="right" valign="top"><a href="#"
																		onclick="qnaWrite('item', '', '17', '', '1'); return false;"><img
																			src="/moyeo/resources/resource/img/shop/qna_write.gif"
																			border="0"></a></td>
																</tr>
															</tbody>
														</table>

														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr height="10">
																	<td></td>
																</tr>
															</tbody>
														</table>


														<div style="height:1px; width:100%; background:#efefef;" class="none">


														<table width="100%" border="0" cellspacing="0"
															cellpadding="0">
															<tbody>
																<tr height="150">
																	<td align="center" class="content">등록된 상품문의가 없습니다.</td>
																</tr>
															</tbody>
														</table>

														<table border="0" cellspacing="0" cellpadding="0">
															<tbody>
																<tr>
																	<td height="50"></td>
																</tr>
															</tbody>
														</table>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>


								<!-- 상품문의 end //-->
							</div>

							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td height="20"></td>
									</tr>
								</tbody>
							</table>



							<div id="scrollbox_data" style="display: none;"></div>


						</div>
					</div>

					<!-- 본문끝 -->
				</div>
			</div>
		</div>
		<!-- END PHOTO BLOCK -->
	</div>
</div>
<!-- 
	-->
<!-- END ROW -->


<%@ include file="../../etc/footer2.jsp"%>