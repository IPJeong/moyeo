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
					
						<div>
							
							
						
										
							<!-- 상품 레이아웃 배열 -->
								
							<!-- 상품 레이아웃 배열 -->
<div class="layout_main">

<script type="text/javascript">
$('.layout_top_bg').css( { 'height': $('.layout_top').height()+'px' } );
</script>
<style type="text/css">
.item_information .item_title {font-family:gulim;font-size:16px;color:#000000;font-weight:bold;font-style:normal;text-decoration:none;}
.item_information .item_subtitle {font-family:dotum;font-size:11px;color:#999999;font-weight:normal;font-style:normal;text-decoration:none;}
.item_information .item_price {font-family:gulim;font-size:13px;color:#4d4d4d;font-weight:bold;font-style:normal;text-decoration:none;}
.item_information .item_money {font-family:gulim;font-size:14px;color:#fa7218;font-weight:bold;font-style:normal;text-decoration:none;}
.item_information .item_cash {font-family:dotum;font-size:13px;color:#0066ff;font-weight:bold;font-style:normal;text-decoration:none;}
.item_information .item_limit {font-family:dotum;font-size:13px;color:#4d4d4d;font-weight:bold;font-style:normal;text-decoration:none;}
.item_information .item_sale_limit {font-family:dotum;font-size:13px;color:#4d4d4d;font-weight:normal;font-style:normal;text-decoration:none;}
.item_information .item_delivery_money {font-family:dotum;font-size:13px;color:#4d4d4d;font-weight:bold;font-style:normal;text-decoration:none;}
.item_information .item_total_money {font-family:gulim;font-size:15px;color:#000000;font-weight:bold;font-style:normal;text-decoration:none;}
.relation_box .item_relation_title {font-family:dotum;font-size:11px;color:#4d4d4d;font-weight:normal;font-style:normal;text-decoration:none;}
.relation_box .item_relation_money {font-family:dotum;font-size:11px;color:#fa7218;font-weight:normal;font-style:normal;text-decoration:none;}
.item_information .item_optiontitle {font-family:dotum;font-size:11px;color:#4d4d4d;font-weight:normal;font-style:normal;text-decoration:none;}
.item_information .item_optioncontent {width:30%; padding:5px 0;font-family:dotum;font-size:11px;color:#000000;font-weight:normal;font-style:normal;text-decoration:none;}
.item_information .help {font-family:dotum;font-size:11px;color:#4d4d4d;font-weight:normal;font-style:normal;text-decoration:none;}
</style>

<style type="text/css">
/* 분류 */
.item_position .home {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}
.item_position .off {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}
.item_position .title {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}
.item_position .code {line-height:14px; font-size:11px; color:#00a651; font-family:gulim,굴림;}

.item_next a {font-weight:bold; line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}
.item_next a:hover {font-weight:bold; line-height:14px; font-size:11px; color:#787878; font-family:gulim,굴림;}

/* 대표이미지 */
#image_default_zoom {display:block; border:3px solid #e4e4e4}
#image_default_zoom .on {border:3px solid #018598}

.cloud-zoom-big {border:3px solid #018598}

/* 상품 갤러리 */
.item_gallery .btn_prev {width:10px; background:url('./skin/item/default/img/btn_prev.gif') no-repeat left center; cursor:pointer;}
.item_gallery .btn_next {width:10px; background:url('./skin/item/default/img/btn_next.gif') no-repeat right center; cursor:pointer;}
.item_gallery .btn_prev_out {width:10px;}
.item_gallery .btn_next_out {width:10px;}

.gallery_thumb {margin:0 auto;}
.gallery_thumb li {list-style:none; font-size:0px; line-height:0px; padding:0px;}
.gallery_thumb li img {border:3px solid #e4e4e4; cursor:pointer; margin:0 3px 0 3px;}
.gallery_thumb li .on {border:3px solid #6e3a2a}

/* 관련상품 */
#relation_data .btn_prev {width:25px; background:url('./skin/item/default/img/btn_prev2.gif') no-repeat center center; cursor:pointer;}
#relation_data .btn_next {width:25px; background:url('./skin/item/default/img/btn_next2.gif') no-repeat center center; cursor:pointer;}
#relation_data .btn_prev_out {width:25px;}
#relation_data .btn_next_out {width:25px;}

.relation_list div {margin:0 18px 0 18px;}
.relation_list li {list-style:none;}
.relation_list li img {border:1px solid #e4e4e4}
.relation_list li .on {border:1px solid #e4e4e4}

/* 상품정보박스 */
.item_information .select {min-width:200px; height:18px; border:1px solid #c1c1c1; background-color:#ffffe5;}
.item_information .select {line-height:14px; font-size:12px; color:#333333; font-family:dotum,돋움;}
.item_information .select option {padding:0px 3px 0px 3px; line-height:20px; font-size:12px; color:#333333; font-family:dotum,돋움;}

.item_information .input {width:22px; height:17px; border:1px solid #cccccc; padding:1px 3px 0px 3px;}
.item_information .input {line-height:17px; font-size:12px; color:#363636; font-family:gulim,굴림;}

.item_information .order_title {font-weight:bold; line-height:14px; font-size:11px; color:#888888; font-family:dotum,돋움;}
.item_information .order_title2 {line-height:14px; font-size:12px; color:#888888; font-family:dotum,돋움;}
.item_information .order_limit {line-height:14px; font-size:11px; color:#393939; font-family:gulim,굴림;}
.item_information .order_money {font-weight:bold; line-height:14px; font-size:11px; color:#393939; font-family:gulim,굴림;}
.item_information .sns_box {border:1px solid #eaeaea; width:100%; height:28px; background:url('./skin/item/default/img/sns_bg.gif') repeat-x;}

/* 상품안내 탭*/
.item_view .tab_use1_off {width:141px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat 0px 0px;}
.item_view .tab_use1_on {width:141px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat 0px -32px;}
.item_view .tab_use2_off {width:141px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat -141px 0px;}
.item_view .tab_use2_on {width:141px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat -141px -32px;}
.item_view .tab_use3_off {width:141px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat -282px 0px;}
.item_view .tab_use3_on {width:141px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat -282px -32px;}
.item_view .tab_use4_off {width:141px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat -423px 0px;}
.item_view .tab_use4_on {width:141px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat -423px -32px;}
.item_view .tab_use5_off {width:142px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat -564px 0px;}
.item_view .tab_use5_on {width:142px; height:32px; background:url('./skin/item/default/img/tab.gif') no-repeat -564px -32px;}
.item_view .tab_bg {height:32px; background:url('./skin/item/default/img/tab_bg.gif') repeat-x;}
.item_view .tab_side {width:1px; height:32px; background:url('./skin/item/default/img/tab_side.gif') no-repeat;}

.item_view .tab_count1 {padding:0 0 0 87px; font-weight:bold; line-height:14px; font-size:11px; color:#393939; font-family:dotum,돋움;}
.item_view .tab_count2 {padding:3px 0 0 87px; font-weight:bold; line-height:14px; font-size:11px; color:#419dae; font-family:dotum,돋움;}

.item_view .pointer {cursor:pointer;}

/* 상품평 */
.item_reply .count {font-weight:bold; line-height:14px; font-size:11px; color:#419dae; font-family:dotum,돋움;}
.item_reply .title {line-height:14px; font-size:12px; color:#39393a; font-family:gulim,굴림;}
.item_reply .content {line-height:15px; font-size:12px; color:#707070; font-family:gulim,굴림;}
.item_reply .name {line-height:14px; font-size:11px; color:#707070; font-family:dotum,돋움;}

.item_reply .star0 {width:85px; height:18px; background:transparent url('./skin/item/default/img/reply_star.png') no-repeat;}
.item_reply .star1 {width:85px; height:18px; background:transparent url('./skin/item/default/img/reply_star.png') no-repeat 0px -18px;}
.item_reply .star2 {width:85px; height:18px; background:transparent url('./skin/item/default/img/reply_star.png') no-repeat 0px -36px;}
.item_reply .star3 {width:85px; height:18px; background:transparent url('./skin/item/default/img/reply_star.png') no-repeat 0px -54px;}
.item_reply .star4 {width:85px; height:18px; background:transparent url('./skin/item/default/img/reply_star.png') no-repeat 0px -72px;}
.item_reply .star5 {width:85px; height:18px; background:transparent url('./skin/item/default/img/reply_star.png') no-repeat 0px -90px;}

/* 상품문의 */
.item_qna .count {font-weight:bold; line-height:14px; font-size:11px; color:#419dae; font-family:dotum,돋움;}
.item_qna .category {line-height:14px; font-size:12px; color:#999999; font-family:gulim,굴림;}
.item_qna .title {line-height:14px; font-size:12px; color:#39393a; font-family:gulim,굴림;}
.item_qna .content {line-height:15px; font-size:12px; color:#707070; font-family:gulim,굴림;}
.item_qna .name {line-height:14px; font-size:11px; color:#707070; font-family:dotum,돋움;}

.item_qna .smile0 {width:74px; height:18px; background:transparent url('./skin/item/default/img/qna_smile.png') no-repeat;}
.item_qna .smile1 {width:74px; height:18px; background:transparent url('./skin/item/default/img/qna_smile.png') no-repeat 0px -18px;}
</style>

<!--[if IE 6]>
<script type="text/javascript">
/* IE6 PNG 배경투명 */
DD_belatedPNG.fix('.star0');
DD_belatedPNG.fix('.star1');
DD_belatedPNG.fix('.star2');
DD_belatedPNG.fix('.star3');
DD_belatedPNG.fix('.star4');
DD_belatedPNG.fix('.star5');
DD_belatedPNG.fix('.smile0');
DD_belatedPNG.fix('.smile1');
</script>
<![endif]-->

<script type="text/javascript">
function itemGallery(id, upload_mode)
{

    shopOpen(shop_path+"/item_gallery.php?id="+id+"&upload_mode="+upload_mode, "galleryOpen", "width=950, height=670, scrollbars=yes");

}
</script>

<div style="border:1px solid #efefef; background-color:#ffffff;">


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody>
</tbody></table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" class="item_next">
<tbody><tr height="20">
    <td>&nbsp;</td>
    <td width="1" bgcolor="#efefef"></td>
    <td width="60" align="center"><a href="#" onclick="alert('이전상품이 없습니다.'); return false;">이전상품</a></td>
    <td width="1" bgcolor="#efefef"></td>
    <td width="2"></td>
    <td width="1" bgcolor="#efefef"></td>
    <td width="60" align="center"><a href="#" onclick="alert('다음상품이 없습니다.'); return false;">다음상품</a></td>
    <td width="1" bgcolor="#efefef"></td>
    <td width="5"></td>
</tr>
<tr height="1">
    <td></td>
    <td bgcolor="#efefef"></td>
    <td bgcolor="#efefef"></td>
    <td bgcolor="#efefef"></td>
    <td></td>
    <td bgcolor="#efefef"></td>
    <td bgcolor="#efefef"></td>
    <td bgcolor="#efefef"></td>
    <td></td>
</tr>
</tbody></table>

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

<input type="hidden" id="item_option_id" name="item_option_id" value="">
<input type="hidden" id="order_total_money" name="order_total_money" value="0">
</form>

<style type="text/css">
.list_option {border-top:1px solid #ebebeb;}
.list_option:first-child {border-top:0;}
.list_name {line-height:30px; font-size:11px; color:#898989; font-family:gulim,serif;}
.list_limit {width:100px; line-height:30px; font-size:11px; color:#898989; font-family:gulim,serif;}
.list_limit td a {display:block;}
.list_limit .list_input {width:30px; height:18px; border:1px solid #cccccc; padding:1px 3px 0px 3px;}
.list_limit .list_input {line-height:17px; font-size:12px; color:#363636; font-family:gulim,굴림;}
.list_money {text-align:right; width:80px; line-height:30px; font-size:11px; color:#5f5f5f; font-family:gulim,serif;}
.list_del {text-align:right; width:21px;}

#cart_list {display:none;}
</style>

<div id="cart_list"></div>

<script type="text/javascript">
// 옵션 사용여부
var item_option_mode = "1";
var item_option_num = 0;

// 옵션 선택
function orderOption(item_option_id)
{


    item_option_num++;
    // 옵션 사용
    if (item_option_mode == '1') {

        if (document.getElementById("order_option").value == '') {

            return false;

        }

    }

    var html = "";
    html += "<div id='list_option_"+item_option_num+"' class='list_option'>";
    html += "<input rel='option_id' type='hidden' name='list_option_id[]' value='"+item_option_id+"' />";
    html += "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
    html += "<tr>";
    html += "<td class='list_name'>"+eval("item_option_"+item_option_id+"_name")+"</td>";
    html += "<td class='list_limit' align='right'>";

    html += "<table border='0' cellspacing='0' cellpadding='0' align='right'>";
    html += "<tr>";
    html += "<td><input rel='option_limit' type='text' name='list_order_limit[]' class='list_input' value='1' onkeyup='orderCheck();' onblur='orderCheck();' /></td>";
    html += "<td width='2'></td>";
    html += "<td>";
    html += "<a href='#' onclick=\"listOrderLimit('"+item_option_num+"','plus'); return false;\"><img src='./skin/item/default/img/list_limit_plus.png' border='0'></a>";
    html += "<a href='#' onclick=\"listOrderLimit('"+item_option_num+"','minus'); return false;\"><img src='./skin/item/default/img/list_limit_minus.png' border='0'></a>";
    html += "</td>";
    html += "</tr>";
    html += "</table>";

    html += "</td>";
    html += "<td class='list_money'><span rel='option_money' data-option_money='"+eval("item_option_"+item_option_id+"_money")+"'>"+shopNumberFormat(String(eval("item_option_"+item_option_id+"_money")))+"</span>원</td>";
    html += "<td class='list_del'><a href='#' onclick=\"listOrderDel('"+item_option_num+"'); return false;\"><img src='./skin/item/default/img/list_option_del.png' border='0'></a></td>";
    html += "</tr>";
    html += "</table>";
    html += "</div>";

    $('#item_option_data').html($('#item_option_data').html()+html);

    orderCheck();
    return false;

}

// 주문 삭제
function listOrderDel(item_option_num)
{

    $('#list_option_'+item_option_num).html('').hide();

    orderCheck();

}

// 주문 수량
function listOrderLimit(item_option_num, mode)
{

    var item_money = parseInt("1000");
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

    var item_option_money = (item_money * item_option_limit) + (eval("item_option_"+item_option_id+"_money") * (item_option_limit));

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
function orderCheck()
{

    var item_money = parseInt("1000");

    // 옵션 사용
    if (item_option_mode == '1') {

        var order_total_money = 0;

        $('#item_option_data .list_option').each(function() {

            var obj_option_id = $(this).find('input[rel="option_id"]');

            if (obj_option_id.val()) {

                var obj_option_limit = $(this).find('input[rel="option_limit"]');
                var obj_option_money = $(this).find('span[rel="option_money"]');

                var item_option_limit = parseInt(obj_option_limit.val());

                if (item_option_limit > 0) {

                    var item_option_money = (item_money * item_option_limit) + (parseInt(obj_option_money.attr('data-option_money')) * (item_option_limit));

                    obj_option_money.text(shopNumberFormat(String(item_option_money)));
                    obj_option_limit.attr('value', item_option_limit);

                    order_total_money += item_option_money;

                } else {

                    obj_option_limit.val('1');
                    obj_option_limit.attr('value', 1);
                    obj_option_money.text(shopNumberFormat(String(obj_option_money.attr('data-option_money'))));

                    alert("수량을 입력하세요.");
                    obj_option_limit.focus();
                    return false;

                }

            }

        });

    } else {

        var item_option_money = parseInt(0);
        var item_option_limit = parseInt("0");

        var order_limit = parseInt(document.getElementById("order_limit").value);

        if (order_limit <= '0') {

            alert("수량을 1개 이상으로 입력하여 주시기 바랍니다.");
            document.getElementById("order_limit").value = "1";
            orderCheck();
            return false;

        }

        if (!shopNumeric(document.getElementById("order_limit").value)) {

            alert("숫자만 입력하여 주세요.");
            document.getElementById("order_limit").value = "1";
            orderCheck();
            return false;

        }

        // 주문 수량 초과
        if (order_limit > item_option_limit && item_option_limit) {

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

        var order_money = (item_money * order_limit) + (item_option_money * order_limit);
        var order_total_money = parseInt(order_money);

        // 마이너스이면
        if (order_total_money < 0) {

            alert("금액이 마이너스 입니다.\n\n주문 옵션을 다시 확인하시기 바랍니다.");
            document.getElementById("order_limit").value = "1";
            //orderCheck();
            return false;

        }

    }

    document.getElementById("order_total_money").value = order_total_money;
    document.getElementById("order_total_money_view").innerHTML = shopNumberFormat(String(order_total_money));

}

function itemOrder()
{

    // 옵션 사용
    if (item_option_mode == '1') {

        var order_item_count = 0;
        $('#item_option_data .list_option').each(function() {

            var obj_option_id = $(this).find('input[rel="option_id"]');

            if (obj_option_id.val()) {

                var obj_option_limit = $(this).find('input[rel="option_limit"]');

                if (obj_option_limit.val() <= 0) {

                    alert("옵션을 먼저 선택하세요.");
                    return false;

                }

                order_item_count++;

            }

        });

        if (!order_item_count) {

            alert("옵션을 먼저 선택하세요.");
            return false;

        }

        var f = document.formItem;

        var item_id = f.item_id.value;

        f.m.value = "item_option_array";
        f.cart_type.value = "order";

        var string = $('#formItem').serialize();

        $.post("http://dmshop.kr/cart_update.php", string , function(data) {

            $("#item_cart_data").html(data);

            orderPage('opt');

        });

    } else {
    // 무옵션

        var f = document.formItem;

        f.m.value = "";

        var item_id = f.item_id.value;

        if (f.order_option) {

            var order_option = f.order_option.value;

        } else {

            var order_option = "";

        }

        var order_limit = f.order_limit.value;
        var item_option_limit = parseInt("0");

        if (!item_option_limit) {

            alert("재고가 없습니다.");
            return false;

        }

        $('#order_start').val('');

        $.post("http://dmshop.kr/cart_update.php", {"item_id" : item_id, "order_option" : order_option, "order_limit" : order_limit, "cart_type" : "order"}, function(data) {

            $("#item_cart_data").html(data);

            orderPage('one');

        });

    }

}

function orderPage(type)
{

    if (type == 'one') {

        if ($('#order_start').val() == '') { return false; }

        var f = document.formItem;

        f.m.value = "";
        f.cart_type.value = "order";

        f.action = "http://dmshop.kr/order.php";
        f.submit();

    } else {

        var f = document.formCartList;

        f.action = "http://dmshop.kr/order.php";
        f.submit();

    }

}

function itemCart()
{

    // 옵션 사용
    if (item_option_mode == '1') {

        var order_item_count = 0;
        $('#item_option_data .list_option').each(function() {

            var obj_option_id = $(this).find('input[rel="option_id"]');

            if (obj_option_id.val()) {

                var obj_option_limit = $(this).find('input[rel="option_limit"]');

                if (obj_option_limit.val() <= 0) {

                    alert("옵션을 먼저 선택하세요.");
                    return false;

                }

                order_item_count++;

            }

        });

        if (!order_item_count) {

            alert("옵션을 먼저 선택하세요.");
            return false;

        }

        var f = document.formItem;

        var item_id = f.item_id.value;

        f.m.value = "item_option_array";
        f.cart_type.value = "cart";

        var string = $('#formItem').serialize();

        $.post("http://dmshop.kr/cart_update.php", string , function(data) {

            $("#item_cart_data").html(data);

        });

    } else {

        var f = document.formItem;
        var order_option = "";
        f.m.value = "";

        $.post("http://dmshop.kr/cart_update.php", {"item_id" : f.item_id.value, "order_option" : order_option, "order_limit" : f.order_limit.value, "cart_type" : "cart"}, function(data) {

            $("#item_cart_data").html(data);

        });

    }

}

function itemFavorite()
{

    // 옵션 사용
    if (item_option_mode == '1') {

        var order_item_count = 0;
        $('#item_option_data .list_option').each(function() {

            var obj_option_id = $(this).find('input[rel="option_id"]');

            if (obj_option_id.val()) {

                var obj_option_limit = $(this).find('input[rel="option_limit"]');

                if (obj_option_limit.val() <= 0) {

                    alert("옵션을 먼저 선택하세요.");
                    return false;

                }

                order_item_count++;

            }

        });

        if (!order_item_count) {

            alert("옵션을 먼저 선택하세요.");
            return false;

        }

        var f = document.formItem;

        var item_id = f.item_id.value;

        f.m.value = "item_option_array";
        f.cart_type.value = "item";

        var string = $('#formItem').serialize();

        $.post("http://dmshop.kr/favorite_update.php", string , function(data) {

            $("#item_cart_data").html(data);

        });

    } else {

        var f = document.formItem;

        f.m.value = "";

        $.post("http://dmshop.kr/favorite_update.php", {"item_id" : f.item_id.value, "order_option" : "", "order_limit" : f.order_limit.value, "cart_type" : "item"}, function(data) {

            $("#item_cart_data").html(data);

        });

    }

}
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="3"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
<td height="1" bgcolor="#f4f4f4" class="none">
<a href="#" onclick="itemOrder(); return false;"><button type="button" class="btn btn-info">구매하기 </button></a>
<a href="#" onclick="itemCart(); return false;"><button type="button" class="btn btn-warning">장바구니 </button></a>
</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td>
<div class="sns_box">
<div style="padding:5px 10px 5px 10px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="40"></td>
    <td align="right">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
<td><a href="https://twitter.com/intent/tweet?url=http%3A%2F%2Fdmshop.kr%2Fitem.php%3Fid%3DY253066903&amp;text=%EB%8F%84%EB%84%88%EC%B8%A0+%28%EC%9D%B4%EB%AF%B8%EC%A7%80+%ED%95%99%EC%8A%B5%29" target="_blank" title="트위터 퍼가기"><img src="./skin/item/default/img/sns_twitter.png" border="0"></a></td><td width="4"></td><td><a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fdmshop.kr%2Fitem.php%3Fid%3DY253066903" target="_blank" title="페이스북 퍼가기"><img src="./skin/item/default/img/sns_facebook.png" border="0"></a></td><td width="4"></td><td><a href="https://story.kakao.com/share?url=http%3A%2F%2Fdmshop.kr%2Fitem.php%3Fid%3DY253066903" target="_blank" title="카카오스토리 퍼가기"><img src="./skin/item/default/img/sns_kakaostory.png" border="0"></a></td><td width="4"></td><td><a href="#" onclick="orderPopupSms('item_code=Y253066903'); return false;"><img src="./skin/item/default/img/sns_email.gif" border="0"></a></td><td width="4"></td></tr>
</tbody></table>
    </td>
</tr>
</tbody></table>
</div>
</div>
    </td>
</tr>
</tbody></table>
<!-- 상품 정보 박스 end //-->
    </td>
</tr>
</tbody></table>
</div>
</div>

<!-- 관련상품 start //-->
<!-- 관련상품 end //-->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="border:1px solid #efefef; background-color:#ffffff;">
<!-- 상세정보 start //-->
<a name="item_view"></a>
<div style="padding:15px 15px 15px 15px;" class="item_view">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr class="tab_bg">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="141" onclick="shopMove('#item_view'); return false;" class="tab_use1_on pointer"></td>
    <td width="141" onclick="shopMove('#item_delivery'); return false;" class="tab_use2_off pointer"></td>
    <td width="141" onclick="shopMove('#item_refund'); return false;" class="tab_use3_off pointer"></td>
    <td width="141" onclick="shopMove('#item_reply'); return false;" class="tab_use4_off pointer"></td>
    <td width="142" onclick="shopMove('#item_qna'); return false;" class="tab_use5_off pointer"></td>
</tr>
</tbody></table>
    </td>
    <td class="tab_side"></td>
</tr>
</tbody></table>

<!-- 상품 요약안내 start //-->
<!-- 상품 요약안내 end //-->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="150">
    <td>
<p>상품 목록에서는 빨간색의 딸기 도너츠가 보일텐데,<br></p><p><br></p><p>상품페이지에서는 갈색의 초코 도너츠가 보일 겁니다.</p><p><br></p><p>이는 관리자 모드에서 상품 등록시, "대표 이미지"와 "기본 상품목록 이미지"를 각 다르게 첨부하였기 때문 입니다.</p><p><br></p><p><br></p><p><br></p><p>일반적으로 사진을 다르게 첨부하는것은 번거로운 일이기 때문에</p><p><br></p><p>디엠샵의 기본 설정값은 대표이미지로 부터, 기본상품목록 / 기획전 목록의 이미지를 자동 생성하기 위해</p><p><br></p><p>"대표 이지미로 부터 자동생성" 으로 선택되어 있습니다.</p><p><br></p><p><br></p><p>이러한 선택 값을 "다른 이미지 직접입력"으로 바꾸고</p><p><br></p><p>다른 이미지를 첨부하시면 각각 첨부된 이미지가 해당 페이지에서 보여지게 됩니다.<br></p></td>
</tr>
</tbody></table>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#efefef" class="none">&nbsp;</td></tr>
</tbody></table>
<!-- 상세정보 end //-->

<!-- 배송안내 start //-->
<a name="item_delivery"></a>
<div style="padding:15px 15px 15px 15px;" class="item_view">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr class="tab_bg">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="141" onclick="shopMove('#item_view'); return false;" class="tab_use1_off pointer"><div class="tab_count1"> 상품안내 </div></td>
    <td width="141" onclick="shopMove('#item_delivery'); return false;" class="tab_use2_on pointer"><div class="tab_count1"> 배송안내 </div></td>
    <td width="141" onclick="shopMove('#item_refund'); return false;" class="tab_use3_off pointer"><div class="tab_count1"> 환불규정 </div></td>
    <td width="141" onclick="shopMove('#item_reply'); return false;" class="tab_use4_off pointer"><div class="tab_count1">상품평 </div></td>
    <td width="142" onclick="shopMove('#item_qna'); return false;" class="tab_use5_off pointer"><div class="tab_count1">구매후기 </div></td>
</tr>
</tbody></table>
    </td>
    <td class="tab_side"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="150">
    <td><style type="text/css">.delivery_information p {line-height:16px; font-size:12px; color:#878787; font-family:gulim,굴림;} .delivery_information p a {line-height:16px; font-size:12px; color:#878787; font-family:gulim,굴림;}</style>
<div class="delivery_information">
<div style="margin-top:10px; border:1px solid #e0e0e0;">
<div style="padding:20px; border:4px solid #f2f2f2;">
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="9"></td><td><button type="button" class="btn btn-default">상품배송안내</button></td></tr></tbody></table><table style="margin-top:10px; border-top:2px solid #f4f4f4;" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr height="30"><td></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="55"></td><td valign="top" width="90"><p style="margin-top:5px;"><button type="button" class="btn btn-default">상품발송</button></p></td><td valign="top"><p>저희 쇼핑몰은 <font color="#436fca">평일 오후 4시 이전 결제완료건에 한하여, 당일 발송</font>을 원칙으로 합니다.<br>단, 주문상품의 입고지연 및 주문제작 상품 경우, 발송기간이 2~3일 가량 지연될 수 있습니다.</p><p style="margin-top:10px; font-weight:bold;">평일(월~금) 주문건 오후 4시 이전 결제건</p><p>당일 발송. 오후 6시 상품 출고</p><p style="margin-top:10px; font-weight:bold;">평일(월~금) 주문건 오후 4시 이후 결제건</p><p>익일 발송. 다음날 오후 6시 상품 출고</p><p style="margin-top:10px; font-weight:bold;">토/일/공휴일 결제건</p><p>다음 영업일 기준 오후 6시 상품 출고</p></td></tr></tbody></table><table style="margin-top:25px; border-top:1px solid #f4f4f4;" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr height="30"><td></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="55"></td><td valign="top" width="90"><p style="margin-top:5px;"><button type="button" class="btn btn-default">배송기간</button></p></td><td valign="top"><p>배송기간은 상품발송일로 부터, <font color="#436fca">택배사의 사정에 따라 1일~4일 가량</font> 소요될 수 있습니다.</p><p>주말/공휴일을 포함하거나, 도선산간 지역일 경우 추가적인 배송지연이 발생할 수 있습니다.</p></td></tr></tbody></table><table style="margin-top:25px; border-top:1px solid #f4f4f4;" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr height="30"><td></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="55"></td><td valign="top" width="90"><p style="margin-top:5px;"><button type="button" class="btn btn-default">배송요금</button></p></td><td valign="top"><p>5만원 이하 결제건 : <b>배송비 2,500원</b> (주문 결제시, 부담)</p><p>5만원 이상 결제건 : <b>무료 배송</b></p><p style="margin-top:10px;">단, 아래와 같은 경우 별도의 추가 배송비(도선료)가 발생 됩니다.</p><p style="margin-left:5px;">- 도서산간/제주도 : 추가요금 500원</p><p style="margin-left:5px;"> - 국내 기타/섬 지역 : 4,500원</p><p style="margin-left:5px;"> - 해외 발송 : 전화문의</p></td></tr></tbody></table><table style="margin-top:25px; border-top:1px solid #f4f4f4;" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr height="30"><td></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="55"></td><td valign="top" width="90"><p style="margin-top:10px;"><button type="button" class="btn btn-default">배송조회</button></p></td><td valign="top"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td valign="top"></td><td width="20"></td><td valign="top"><p style="margin-top:25px; font-weight:bold;">우체국 택배</p><p>홈페이지 : <a href="http://parcel.epost.go.kr/" target="_blank">http://parcel.epost.go.kr/</a></p><p>전화문의 : 1588-1300</p><p>상담시간 : 평일 09:00 ~ 18:00</p></td></tr></tbody></table><table style="margin-top:10px;" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td><p>배송조회는 택배사의 홈페이지 또는 전화문의를 이용 하시거나,<br>쇼핑몰 내 마이페이지 &gt; 배송조회를 통해 확인하실 수 있습니다.</p></td></tr></tbody></table></td></tr></tbody></table><table border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr height="25"><td></td></tr></tbody></table>
</div>
</div>
</div></td>
</tr>
</tbody></table>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#efefef" class="none">&nbsp;</td></tr>
</tbody></table>
<!-- 배송안내 end //-->

<!-- 환불규정 start //-->
<a name="item_refund"></a>
<div style="padding:15px 15px 15px 15px;" class="item_view">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr class="tab_bg">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
   <td width="141" onclick="shopMove('#item_view'); return false;" class="tab_use1_off pointer"><div class="tab_count1"> 상품안내 </div></td>
    <td width="141" onclick="shopMove('#item_delivery'); return false;" class="tab_use2_on pointer"><div class="tab_count1"> 배송안내 </div></td>
    <td width="141" onclick="shopMove('#item_refund'); return false;" class="tab_use3_off pointer"><div class="tab_count1"> 환불규정 </div></td>
    <td width="141" onclick="shopMove('#item_reply'); return false;" class="tab_use4_off pointer"><div class="tab_count1">상품평 </div></td>
    <td width="142" onclick="shopMove('#item_qna'); return false;" class="tab_use5_off pointer"><div class="tab_count1">구매후기 </div></td>
</tr>
</tbody></table>
    </td>
    <td class="tab_side"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="150">
    <td><style type="text/css">.refund_information p {line-height:16px; font-size:12px; color:#878787; font-family:gulim,굴림;} .refund_information p a {line-height:16px; font-size:12px; color:#878787; font-family:gulim,굴림;}</style>
<div class="refund_information">
<div style="margin-top:10px; border:1px solid #e0e0e0;">
<div style="padding:20px 0 30px 0; border:4px solid #f2f2f2;">
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="30"></td><td><img src="/image/shop/public/policy01.gif"></td></tr></tbody></table>
<table style="margin-top:10px; border-top:2px solid #f4f4f4;" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr height="30"><td></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td align="right" valign="top" width="135"><p style="margin-top:5px;"><img src="/image/shop/public/policy02.gif"></p></td><td width="30"></td><td valign="top"><p>저희 쇼핑몰은 판매자의 과실 또는 소비자의 과실로 발생되는 상품의 교환, 환불(반품) 서비스를<br>소비자 보호법에 의거하여 상품수령로 부터 7일 이내에 요청하실 수 있습니다.</p><p style="margin-top:10px; font-weight:bold;">주문취소 접수</p><p>상품 주문 후, 배송준비 전 단계에서 마이페이지를 통해서 [주문취소]접수가능</p><p style="margin-top:10px; font-weight:bold;">상품교환 접수</p><p>상품 수령 후, 마이페이지에서 [상품수령]버튼 클릭 후 [교환신청]버튼을 클릭하여 접수가능</p><p style="margin-top:10px; font-weight:bold;">환불/반품 접수</p><p>상품 수령 후, 마이페이지에서 [상품수령]버튼 클릭 후 [환불신청]버튼을 클릭하여 접수가능</p></td></tr></tbody></table><table style="margin-top:25px; border-top:1px solid #f4f4f4;" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr height="30"><td></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td align="right" valign="top" width="135"><p style="margin-top:5px;"><img src="/image/shop/public/policy03.gif"></p></td><td width="30"></td><td valign="top"><p>판매자의 과실로인한 상품 교환 및 환불시에는 <b>왕복 배송요금 5,000원을 판매자가 부담</b> 합니다.</p><p>판매자의 과실에 해당하는 사유는 다음과 같습니다.</p><p style="margin-top:10px;">- 오배송 : 주문상품과 다른 상품, 주문옵션과 다른 옵션의 상품이 배송되었을 때</p><p>- 제품불량 : 제품의 하자 또는 사용 및 외관상 결함이 있을 때</p><p>- 허위광고 : 쇼핑몰의 제품 안내문구와, 차이가 있을 때</p><p>※ 예외규정 : 모니터상의 제품사진과 실제품의 미세한 색상 또는 규격의 차이</p><p style="margin-left:75px;">상품 상세정보를 통해 사전에 안내된 경우 등</p></td></tr></tbody></table><table style="margin-top:25px; border-top:1px solid #f4f4f4;" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr height="30"><td></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td align="right" valign="top" width="135"><p style="margin-top:5px;"><img src="/image/shop/public/policy04.gif"></p></td><td width="30"></td><td valign="top"><p>소비자의 과실로인한 상품 교환 및 환불시에는 <b>왕복 배송요금 5,000원을 소비자가 부담</b> 합니다.</p><p>소비자의 과실에 해당하는 사유는 다음과 같습니다.</p><p style="margin-top:10px;">- 단순변심 : 판매자 과실에 해당하는 사유하지 않는 사유로 교환 및 환불을 요청할 때</p><p>- 주문오류 : 소비자가 실수로 상품 및 주문옵션을 잘못 입력하였을 때</p><p>- 판매자 과실의 예외규정에 명시된 항목</p></td></tr></tbody></table><table style="margin-top:25px; border-top:1px solid #f4f4f4;" border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr height="30"><td></td></tr></tbody></table>
<table border="0" cellpadding="0" cellspacing="0"><tbody><tr><td align="right" valign="top" width="135"><p style="margin-top:5px;"><img src="/image/shop/public/policy05.gif"></p></td><td width="30"></td><td valign="top"><p>상품 수령 후, 반품/교환 요청 시 아래의 사유에 해당할 경우, 판매자는 소비자 보호법에 의거하여<br>반품 및 교환을 거절할 수 있으니, 반드시 확인 하시기 바랍니다.</p><p style="margin-top:10px;">- 소비자에게 책임 있는 사유로 상품이 멸실 또는 훼손된 경우</p><p>- 소비자의 개봉 또는 사용흔적 등으로 인하여, 새 상품으로서의 가치가 훼손된 경우</p><p>- 상품 수령일로 부터 반품 및 교환접수 기간이 경과하였을 경우</p><p>- 무단복제를 목적으로 상품을 구입하였을 경우</p><p>- 그 외 주문제작, 해외 직배송 등의 사유로 반품/교환 불가 상품으로 사전 명시된 상품일 경우</p></td></tr></tbody></table>
</div>
</div>
</div></td>
</tr>
</tbody></table>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#efefef" class="none">&nbsp;</td></tr>
</tbody></table>
<!-- 환불규정 end //-->

<!-- 상품평 start //-->
<a name="item_reply"></a>
<div style="padding:15px 15px 15px 15px;" class="item_view item_reply">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr class="tab_bg">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="141" onclick="shopMove('#item_view'); return false;" class="tab_use1_off pointer"><div class="tab_count1"> 상품안내 </div></td>
    <td width="141" onclick="shopMove('#item_delivery'); return false;" class="tab_use2_on pointer"><div class="tab_count1"> 배송안내 </div></td>
    <td width="141" onclick="shopMove('#item_refund'); return false;" class="tab_use3_off pointer"><div class="tab_count1"> 환불규정 </div></td>
    <td width="141" onclick="shopMove('#item_reply'); return false;" class="tab_use4_off pointer"><div class="tab_count1">상품평 </div></td>
    <td width="142" onclick="shopMove('#item_qna'); return false;" class="tab_use5_off pointer"><div class="tab_count1">구매후기 </div></td>
</tr>
</tbody></table>
    </td>
    <td class="tab_side"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><div id="reply_data"><meta http-equiv="content-type" content="text/html; charset=utf-8"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="200" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="8"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="./skin/item/default/img/reply_title.gif"></td>
    <td width="4"></td>
    <td><span class="count down1">(0)</span></td>
</tr>
</tbody></table>
    </td>
    <td align="right" valign="top"><a href="#" onclick="replyWrite('item', '', '7', '', '1'); return false;"><button type="button" class="btn btn-info">상품평 작성 </button></a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#efefef" class="none">&nbsp;</td></tr>
</tbody></table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="150">
    <td align="center" class="content">등록된 상품평이 없습니다.</td>
</tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="50"></td></tr> 
</tbody></table></div></td>
</tr>
</tbody></table>
</div>

<script type="text/javascript">
function replyWrite(page_id, m, item_id, reply_id, page)
{

    shopOpen("./reply_write.php?page_id="+page_id+"&m="+m+"&item_id="+item_id+"&reply_id="+reply_id+"&page="+page, "shopReply", "width=620, height=750, scrollbars=yes");

}

function replyLoading(item_id, page)
{

    $.post("./reply.php", {"item_id" : item_id, "page" : page}, function(data) {

        $("#reply_data").html(data);

    });

}

function replyView(reply_id)
{

    if ($("#reply_data .reply_"+reply_id).is(":hidden")) {

        $("#reply_data .reply_"+reply_id).slideDown("slow");

    } else {

        $("#reply_data .reply_"+reply_id).hide();

    }

}

function replyDelete(page_id, m, item_id, reply_id, page)
{

    if (confirm("삭제하시겠습니까?")) {

        $.post("./reply_write_update.php", {"page_id" : page_id, "m" : m, "item_id" : item_id, "reply_id" : reply_id, "page" : page}, function(data) {

            $("#reply_data").html(data);

        });

    }

}

function replyPassword(page_id, m, item_id, reply_id, page)
{

    shopOpen("./reply_password.php?page_id="+page_id+"&m="+m+"&item_id="+item_id+"&reply_id="+reply_id+"&page="+page, "shopReplyPassword", "width=620, height=750, scrollbars=yes");

}
</script>

<script type="text/javascript">
$(document).ready(function() { replyLoading('7', '1'); });
</script>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#efefef" class="none">&nbsp;</td></tr>
</tbody></table>
<!-- 상품평 end //-->

<!-- 상품문의 start //-->
<a name="item_qna"></a>
<div style="padding:15px 15px 15px 15px;" class="item_view item_qna">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr class="tab_bg">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="141" onclick="shopMove('#item_view'); return false;"><div class="tab_count1"> 상품안내 </div></td>
    <td width="141" onclick="shopMove('#item_delivery'); return false;" class="tab_use2_on pointer"><div class="tab_count1"> 배송안내 </div></td>
    <td width="141" onclick="shopMove('#item_refund'); return false;" class="tab_use3_off pointer"><div class="tab_count1"> 환불규정 </div></td>
    <td width="141" onclick="shopMove('#item_reply'); return false;" class="tab_use4_off pointer"><div class="tab_count1">상품평 </div></td>
    <td width="142" onclick="shopMove('#item_qna'); return false;" class="tab_use5_off pointer"><div class="tab_count1">구매후기 </div></td>
</tr>
</tbody></table>
    </td>
    <td class="tab_side"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><div id="qna_data"><meta http-equiv="content-type" content="text/html; charset=utf-8"><table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="200" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="8"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td> <button type="button" class="btn btn-info">상품 문의 </button> </td>
    <td width="4"></td>
    <td><span class="count down1">(0)</span></td>
</tr>
</tbody></table>
    </td>
    <td align="right" valign="top"><a href="#" onclick="qnaWrite('item', '', '7', '', '1'); return false;"><img src="./skin/item/default/img/qna_write.gif" border="0"></a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#efefef" class="none">&nbsp;</td></tr>
</tbody></table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="150">
    <td align="center" class="content">등록된 상품문의가 없습니다.</td>
</tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="50"></td></tr> 
</tbody></table></div></td>
</tr>
</tbody></table>
</div>

<script type="text/javascript">
function qnaWrite(page_id, m, item_id, qna_id, page)
{

    shopOpen("./qna_write.php?page_id="+page_id+"&m="+m+"&item_id="+item_id+"&qna_id="+qna_id+"&page="+page, "shopQna", "width=620, height=720, scrollbars=yes");

}

function qnaLoading(item_id, page)
{

    $.post("./qna.php", {"item_id" : item_id, "page" : page}, function(data) {

        $("#qna_data").html(data);

    });

}

function qnaView(qna_id)
{

    if ($("#qna_data .qna_"+qna_id).is(":hidden")) {

        $("#qna_data .qna_"+qna_id).slideDown("slow");

    } else {

        $("#qna_data .qna_"+qna_id).hide();

    }

}

function qnaDelete(page_id, m, item_id, qna_id, page)
{

    if (confirm("삭제하시겠습니까?")) {

        $.post("./qna_write_update.php", {"page_id" : page_id, "m" : m, "item_id" : item_id, "qna_id" : qna_id, "page" : page}, function(data) {

            $("#qna_data").html(data);

        });

    }

}

function qnaPassword(page_id, m, item_id, qna_id, page)
{

    shopOpen("./qna_password.php?page_id="+page_id+"&m="+m+"&item_id="+item_id+"&qna_id="+qna_id+"&page="+page, "shopQnaPassword", "width=620, height=720, scrollbars=yes");

}
</script>

<script type="text/javascript">
$(document).ready(function() { qnaLoading('7', '1'); });
</script>
<!-- 상품문의 end //-->
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="20"></td></tr>
</tbody></table>

<script type="text/javascript">
window.onload=function() { shopResizeImage(750); }
</script>
<style type="text/css">
#scrollbox {display:none; right:0px; top:0px; position:fixed; z-index:9999; width:80px; background-color:#ffffff;}
#scrollbox .title {text-align:center; font-weight:bold; line-height:24px; font-size:11px; color:#848689; font-family:dotum,돋움;}
#scrollbox .list {line-height:17px; font-size:11px; color:#787878; font-family:dotum,돋움; letter-spacing:-1px;}
#scrollbox .c1 {font-weight:bold; line-height:17px; font-size:11px; color:#666666; font-family:dotum,돋움; letter-spacing:-1px;}
#scrollbox .c2 {font-weight:bold; line-height:17px; font-size:11px; color:#ff3c00; font-family:dotum,돋움; letter-spacing:-1px;}

#scrollbox .title2 {cursor:pointer; text-align:center; font-weight:bold; line-height:23px; font-size:11px; color:#787878; font-family:dotum,돋움;}
#scrollbox .not {padding:40px 0; text-align:center; line-height:16px; font-size:11px; color:#a6a6a6; font-family:dotum,돋움;}

#scrollbox_data1 {border-top:1px solid #dbdbdb; display:none;}
#scrollbox_data2 {border-bottom:1px solid #dbdbdb; display:none;}
#scrollbox_data3 {border-top:1px solid #dbdbdb; display:none;}

#scrollbox .count {font-weight:bold; line-height:24px; font-size:11px; color:#ff3c00; font-family:dotum,돋움;}
#scrollbox .text {line-height:24px; font-size:11px; color:#666666; font-family:dotum,돋움;}
#scrollbox .page {text-align:center; line-height:12px; font-size:11px; color:#666666; font-family:dotum,돋움;}

#scrollbox .thumb {position:relative; left:0px; top:0px; width:62px; height:62px;}
#scrollbox .close {position:absolute; z-index:2; right:1px; top:1px;}
#scrollbox .image {position:absolute; z-index:1; left:0px; top:0px;}
#scrollbox .image img {border:1px solid #c5c5c5;}
#scrollbox .image .on {border:1px solid #ff3c00;}

#scrollbox .top {cursor:pointer; text-align:center; font-weight:bold; line-height:21px; font-size:11px; color:#a5a5a5; font-family:dotum,돋움;}
#scrollbox .top img {position:relative; overflow:hidden; left:0; top:-2px;}
</style>

<div id="scrollbox_data" style="display:none;"></div>


<div style="border:2px solid #d4d4d4;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="24" bgcolor="#dbdbdb">
    <td class="title">내 쇼핑정보</td>
</tr>
</tbody></table>

<div style="padding:7px 0px 5px 6px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><a href="http://dmshop.kr/coupon.php" class="list">보유쿠폰 (<span class="">0</span>)</a></td>
</tr>
<tr>
    <td><a href="http://dmshop.kr/favorite.php" class="list">관심상품 (<span class="">0</span>)</a></td>
</tr>
<tr>
    <td><a href="http://dmshop.kr/order_list.php" class="list">주문내역 (<span class="">0</span>)</a></td>
</tr>
</tbody></table>
</div>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="3"><td></td></tr>
</tbody></table>

<div style="border:1px solid #dbdbdb;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="data1_title">
<tbody><tr height="23" bgcolor="#f6f6f8">
    <td class="title2">인기상품</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><div id="scrollbox_data1" style="display: block;"><meta http-equiv="content-type" content="text/html; charset=utf-8"><div style="padding:3px 8px 0 8px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="24">
    <td align="right"><span class="count">16</span> <span class="text">건</span></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="12">
    <td width="11"><a href="#" onclick="scrollboxDataLoad('1', '1', 'no'); return false;"><img src="../../../skin/scrollbox/default/img/btn_prev.gif" border="0"></a></td>
    <td class="page"><b>1</b>/6</td>
    <td width="11"><a href="#" onclick="scrollboxDataLoad('1', '2', 'no'); return false;"><img src="../../../skin/scrollbox/default/img/btn_next.gif" border="0"></a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="3"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><div class="thumb"><div class="close"></div><div class="image"><a href="../../../item.php?id=Y848100408"><img src="../../../data/thumb/item/60x60/1935647224_bcb14092_IMG_1674.jpg" border="0"></a></div></div></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><div class="thumb"><div class="close"></div><div class="image"><a href="../../../item.php?id=I313584044"><img src="../../../data/thumb/item/60x60/1935647224_e113e31c_m08.jpg" border="0"></a></div></div></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><div class="thumb"><div class="close"></div><div class="image"><a href="../../../item.php?id=Y253066903"><img src="../../../data/thumb/item/60x60/1935647224_e717d81d_d1.jpg" border="0"></a></div></div></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>
</div>


</div></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#dbdbdb" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="data2_title">
<tbody><tr height="23" bgcolor="#f6f6f8">
    <td class="title2">최근본상품</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#dbdbdb" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><div id="scrollbox_data2"></div></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="data3_title">
<tbody><tr height="23" bgcolor="#f6f6f8">
    <td class="title2">장바구니</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><div id="scrollbox_data3"></div></td>
</tr>
</tbody></table>
</div>

<div style="border-left:1px solid #f6f6f8; border-right:1px solid #f6f6f8; border-bottom:1px solid #f6f6f8;">
<div style="border-left:1px solid #dbdbdb; border-right:1px solid #dbdbdb; border-bottom:1px solid #dbdbdb;" class="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="21">
    <td>TOP <img src="./skin/scrollbox/default/img/top.gif"></td>
</tr>
</tbody></table>
</div>
</div>
</div>

<script type="text/javascript">
var dmshop_scrollbox_path = "./skin/scrollbox/default";
var scrollbox_top = 170;
</script>

<!--[if IE 6]>
<script type="text/javascript">
$("#scrollbox").css({'position':'absolute'});

$(document).ready(function() {

    var quickTop = $("#scrollbox").position().top;

    $(window).scroll(function() {

        var winTop = $(window).scrollTop();

        $("#scrollbox").animate({'top': parseInt($(".layout_contents").position().top + scrollbox_top + winTop + quickTop) + 'px'}, 0);

    });

});
</script>
<![endif]-->

<script type="text/javascript" src="./skin/scrollbox/default/scrollbox.js"></script></div>
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