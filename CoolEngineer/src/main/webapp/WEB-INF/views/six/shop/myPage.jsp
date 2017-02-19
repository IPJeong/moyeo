<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function(){

	if(document.getElementById("mileage").innerHTML != null) {
		var p0 = parseInt(document.getElementById("mileage").innerHTML);
		document.getElementById("mileage").innerHTML = shopNumberFormat(String(p0)) + " 원";
				
	}
	
	if(document.getElementById("money1").innerHTML != null) {
		var p1 = parseInt(document.getElementById("money1").innerHTML);
		document.getElementById("money1").innerHTML = shopNumberFormat(String(p1)) + " 원";
				
	}
	if(document.getElementById("money2").innerHTML != null) {
		
		var p2 = parseInt(document.getElementById("money2").innerHTML);
		document.getElementById("money2").innerHTML = shopNumberFormat(String(p2)) + " 원";
	}
	if(document.getElementById("money3").innerHTML != null) {
		
		var p3 = parseInt(document.getElementById("money3").innerHTML);
		document.getElementById("money3").innerHTML = shopNumberFormat(String(p3)) + " 원";
	}	
	if(document.getElementById("money4").innerHTML != null) {
			
		var p4 = parseInt(document.getElementById("money4").innerHTML);
		document.getElementById("money4").innerHTML = shopNumberFormat(String(p4)) + " 원";
	}
	if(document.getElementById("money4").innerHTML != null) {
		
		var p5 = parseInt(document.getElementById("money5").innerHTML);
		document.getElementById("money5").innerHTML = shopNumberFormat(String(p5)) + " 원";
	}
	if(document.getElementById("money6").innerHTML != null) {
		
		var p6 = parseInt(document.getElementById("money6").innerHTML);
		document.getElementById("money6").innerHTML = shopNumberFormat(String(p6)) + " 원";
	}
	if(document.getElementById("money7").innerHTML != null) {
		
		var p7 = parseInt(document.getElementById("money7").innerHTML);
		document.getElementById("money7").innerHTML = shopNumberFormat(String(p7)) + " 원";
	}
	if(document.getElementById("money8").innerHTML != null) {
		
		var p8 = parseInt(document.getElementById("money8").innerHTML);
		document.getElementById("money8").innerHTML = shopNumberFormat(String(p8)) + " 원";
	}
	if(document.getElementById("money9").innerHTML != null) {
		
		var p9 = parseInt(document.getElementById("money9").innerHTML);
		document.getElementById("money9").innerHTML = shopNumberFormat(String(p9)) + " 원";
	}
	if(document.getElementById("money10").innerHTML != null) {
		
		var p10 = parseInt(document.getElementById("money10").innerHTML);
		document.getElementById("money10").innerHTML = shopNumberFormat(String(p10)) + " 원";
	}
	
	
	function shopNumberFormat(data) {

		var tmp = '';
		var number = '';
		var cutlen = 3;
		var comma = ',';
		var i;

		len = data.length;
		mod = (len % cutlen);
		k = cutlen - mod;

		for (i = 0; i < data.length; i++) {

			number = number + data.charAt(i);

			if (i < data.length - 1) {

				k++;

				if ((k % cutlen) == 0) {

					number = number + comma;
					k = 0;

				}

			}

		}

		return number;

	}
});
</script>

<div id="overlay"></div><div id="message_box"></div><div class="layout_top_bg" style="height: 0px;"></div>
<style type="text/css">
body {background-color:#ffffff;}
.layout_top {width:1000px; margin:0 auto;}
.layout_left {float:left; width:200px;}
.layout_contents {width:1000px; margin:0 auto;}
.layout_contents:after {display:block; clear:both; content:'';}
.layout_main {float:left; width:790px; margin-left:10px;}
.layout_bottom {position:relative; width:1000px; margin:0 auto;}
</style>
<div class="layout_top">
<style type="text/css">
.layout_top {margin-bottom:10px;}
.layout_top_bg {background:url('/moyeo/resources/resource/img/shop/1935647224_0cdf6ff6_main_bg.gif') repeat;}
.layout_top .service_menu .line {padding:0 5px; line-height:14px; font-size:12px; color:#eeeeee; font-family:gulim,굴림;}
.layout_top .service_menu a {font-family:gulim;font-size:12px;color:#717171;font-weight:normal;}
.layout_top .service_menu a:hover {font-family:gulim;font-size:12px;color:#000000;font-weight:normal;}
.layout_top .layer0 {position:relative; left:0; top:0px; width:100%; text-align:center;}
.layout_top .layer0 .layer1 {margin:0 auto;}
.layout_top .layer0 .layer2 {position:absolute; right:0px; bottom:10px;}
</style>
<style type="text/css">
.dmshop_wmlist a.text {

font-family:gulim;
font-size:13px;
color:#3e424e;
font-weight:bold;
font-style:normal;
text-decoration:none;
}
.dmshop_wmlist a.text:hover, .dmshop_wmlist a.hover {

font-family:gulim;
font-size:13px;
color:#018498;
font-weight:bold;
font-style:normal;
text-decoration:none;
}
</style>

<div class="layout_contents">
	<div class="layout_left"><!--[if IE 6]>
	<script type="text/javascript">
	/* IE6 PNG 배경투명 */
	DD_belatedPNG.fix('.png');
	</script>
	<![endif]-->
	
	<style type="text/css">
	.layout_contents {background:url('/moyeo/resources/resource/img/shop/left_menu_bg.gif') repeat-y;}
	
	 /* 레이아웃사이즈를 조정한다 */
	.layout_left {width:150px;}
	.layout_main {width:840px;}
	
	.skin_mypage_menu {width:150px;}
	.skin_mypage_menu .menu_list {width:142px;}
	.skin_mypage_menu .off a {line-height:14px; font-size:12px; color:#9e9e9e; font-family:gulim,굴림;}
	.skin_mypage_menu .on {background-color:#f2f2f2;}
	.skin_mypage_menu .on a {font-weight:bold; line-height:14px; font-size:12px; color:#000000; font-family:gulim,굴림;}
	</style>

	
	<div class="skin_mypage_menu">
	
	
	<table width="20%" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr>
	    <td valign="top">
	<!-- 주문 start //-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr height="20"><td></td></tr>
	</tbody></table>
	
	<table border="0" cellspacing="0" cellpadding="0">
	<tbody><tr>
	    <td width="10"></td>
	    <td><img src="/moyeo/resources/resource/img/shop/lt1.gif"></td>
	</tr>
	</tbody></table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr height="10"><td></td></tr>
	</tbody></table>
	
	<table border="0" cellspacing="0" cellpadding="0" class="menu_list">
	<tbody><tr height="21" class="off">
	    <td width="10"></td>
	    <td><a href="#">- 주문 내역</a></td>
	</tr>
	</tbody></table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr height="15"><td></td></tr>
	</tbody></table>
	
<div style="height:1px; background:#efefef;" class="none">&nbsp;</div>
	<!-- 주문 end //-->
	
	<!-- 취소 start //-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr height="20"><td></td></tr>
	</tbody></table>
	
	<table border="0" cellspacing="0" cellpadding="0">
	<tbody><tr>
	    <td width="10"></td>
	    <td><img src="/moyeo/resources/resource/img/shop/lt2.gif"></td>
	</tr>
	</tbody></table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr height="10"><td></td></tr>
	</tbody></table>
	
	<table border="0" cellspacing="0" cellpadding="0" class="menu_list">
	<tbody><tr height="21" class="off">
	    <td width="10"></td>
	    <td><a href="#">- 취소 내역</a></td>
	</tr>
	<tr height="21" class="off">
	    <td width="10"></td>
	    <td><a href="#">- 교환 내역</a></td>
	</tr>
	<tr height="21" class="off">
	    <td width="10"></td>
	    <td><a href="#">- 환불 내역</a></td>
	</tr>
	</tbody></table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr height="15"><td></td></tr>
	</tbody></table>
	
<div style="height:1px; background:#efefef;" class="none">&nbsp;</div>
	</tbody></table>
	<!-- 취소 end //-->
	
	<!-- 혜택 start //-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr height="20"><td></td></tr>
	</tbody></table>
	
	<table border="0" cellspacing="0" cellpadding="0">
	<tbody><tr>
	    <td width="10"></td>
	    <td><img src="/moyeo/resources/resource/img/shop/lt3.gif"></td>
	</tr>
	</tbody></table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr height="10"><td></td></tr>
	</tbody></table>
	
	<table border="0" cellspacing="0" cellpadding="0" class="menu_list">
	<tbody><tr height="21" class="off">
	    <td width="10"></td>
	    <td><a href="#">- 적립금</a></td>
	</tr>
	<tr height="21" class="off">
	    <td width="10"></td>
	    <td><a href="#">- 쿠폰 보관함</a></td>
	</tr>
	<tr height="21" class="off">
	    <td width="10"></td>
	    <td><a href="#">- 쿠폰 사용내역</a></td>
	</tr>
	<tr height="21" class="off">
	    <td width="10"></td>
	    <td><a href="#" class="off">- 쿠폰 등록</a></td>
	</tr>
	</tbody></table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tbody><tr height="15"><td></td></tr>
	</tbody></table>
	<!-- 혜택 end //-->
	

	

	

	   
	    <td width="1"></td>
	</tr>
	</tbody></table>
	</div>
	</div>
<div class="layout_main">

<style type="text/css">
.order_list_position .home {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}
.order_list_position .off {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}

.order_list_title .b1 {margin-top:6px;}
.order_list_title .b2 {margin-top:7px;}
.order_list_title .t1 {font-weight:bold; line-height:15px; font-size:13px; color:#777777; font-family:gulim,굴림;}
.order_list_title .t2 {line-height:15px; font-size:11px; color:#acacac; font-family:dotum,돋움;}
.order_list_title .t3 {text-decoration:underline; line-height:15px; font-size:11px; color:#000000; font-family:dotum,돋움;}

.order_list_all .bg {height:44px; background:url('/moyeo/resources/resource/img/shop/title_bg.gif') repeat-x;}
.order_list_all .t1 {line-height:14px; font-size:11px; color:#717171; font-family:dotum,돋움;}
.order_list_all .date {line-height:14px; font-size:12px; color:#717171; font-family:gulim,굴림;}
.order_list_all .view {text-decoration:underline; line-height:14px; font-size:11px; color:#7da7d9; font-family:dotum,돋움;}
.order_list_all .thumb {border:2px solid #e4e4e4;}
.order_list_all .item_name {line-height:14px; font-size:12px; color:#717171; font-family:gulim,굴림;}
.order_list_all .option {line-height:15px; font-size:12px; color:#0459c1; font-family:gulim,굴림;}
.order_list_all .money {line-height:15px; font-size:12px; color:#333333; font-family:gulim,굴림;}
.order_list_all .order_type {line-height:15px; font-size:13px; color:#717171; font-family:gulim,굴림;}
.order_list_all .payment {line-height:15px; font-size:12px; color:#959595; font-family:dotum,돋움;}
.order_list_all .msg {text-align:center; line-height:16px; font-size:12px; color:#959595; font-family:dotum,돋움;}
.order_list_all .dot {height:1px; background:url('/moyeo/resources/resource/img/shop/dot.gif') repeat-x;}

.order_list_msg .t1 {line-height:18px; font-size:11px; color:#959595; font-family:dotum,돋움;}
</style>

<script type="text/javascript">
// 상품수령
function orderReceive(order_code)
{

    var f = document.formOrder;

    f.order_code.value = order_code;

    if (confirm("상품수령을 하시겠습니까?")) {

        f.action = "./order_receive_update.php";
        f.submit();

    } else {

        return false;

    }

}

// 구매확정
function orderOk(order_code)
{

    var f = document.formOrder;

    f.order_code.value = order_code;

    if (confirm("구매확정 하시겠습니까?")) {

        f.action = "./order_ok_update.php";
        f.submit();

    } else {

        return false;

    }

}
</script>

<form method="post" name="formOrder">
<input type="hidden" name="url" value="http%3A%2F%2Fdmshop.kr%2Forder_list.php">
<input type="hidden" name="order_code" value="">
</form>

<div style="height:2px; background:#efefef;" class="none">&nbsp;</div>
<div style="height:1px; background:#cccccc;" class="none">&nbsp;</div>
<div style="height:1px; background:#ffffff;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_list_position">
<tbody><tr height="34" bgcolor="#f8f8f8">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
<td width="10"></td><td><a class="home">홈</a></td><td width="20" align="center"><img src="/moyeo/resources/resource/img/shop/arrow.gif" class="up1"></td><td><a class="off">마이페이지</a></td><td width="20" align="center"><img src="/moyeo/resources/resource/img/shop/arrow.gif" class="up1"></td><td><a class="off">주문 내역</a></td></tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<style type="text/css">
.mypage_infor .infor_bg {height:100px; background:url('/moyeo/resources/resource/img/shop/infor_bg.gif') repeat-x;}
.mypage_infor .level {margin-top:2px; line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}
.mypage_infor .t1 {font-weight:bold; line-height:16px; font-size:14px; color:#000000; font-family:gulim,굴림;}
.mypage_infor .t2 {font-weight:bold; line-height:16px; font-size:14px; color:#3198f0; font-family:gulim,굴림;}
.mypage_infor .t3 {font-weight:bold; line-height:16px; font-size:14px; color:#ff3c00; font-family:gulim,굴림;}

.mypage_title p {line-height:14px; font-size:12px; color:#717171; font-family:gulim,굴림;}
.mypage_title p .t1 {font-weight:bold; line-height:14px; font-size:12px; color:#3198f0; font-family:gulim,굴림;}
.mypage_title p .t2 {font-weight:bold; line-height:14px; font-size:12px; color:#ff3c00; font-family:gulim,굴림;}
</style>

<div style="height:2px; background:#777777;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mypage_infor">
<tbody><tr height="100">
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;">
<tbody><tr>
    <td width="90" align="center" valign="top"><img src="/moyeo/resources/resource/img/shop/1935647224_968fdff8_2.gif"></td>
    <td valign="top"><div><img src="/moyeo/resources/resource/img/shop/title_level.gif"></div><div class="level">${mem_id}님의 회원등급은<br>일반회원 입니다.</div></td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#d5d5d5"></td>
    <td width="554" class="infor_bg">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="60">
    <td width="110" valign="top" class="pointer" onclick="shopMove('./order_list.php');">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/title_t1.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><span class="t1">${orderCnt}</span></td>
    <td width="4"></td>
    <td><img src="/moyeo/resources/resource/img/shop/limit.gif"></td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#d5d5d5"></td>
    <td width="110" valign="top" class="pointer" onclick="shopMove('./cancel.php');">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/title_t2.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><span class="t1">${cancelCnt}</span></td>
    <td width="4"></td>
    <td><img src="/moyeo/resources/resource/img/shop/limit.gif"></td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#d5d5d5"></td>
    <td width="110" valign="top" class="pointer" onclick="shopMove('./exchange.php');">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/title_t3.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><span class="t1">${changeCnt}</span></td>
    <td width="4"></td>
    <td><img src="/moyeo/resources/resource/img/shop/limit.gif"></td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#d5d5d5"></td>
    <td width="110" valign="top" class="pointer" onclick="shopMove('./refund.php');">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/title_t4.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><span class="t1">${refundCnt}</span></td>
    <td width="4"></td>
    <td><img src="/moyeo/resources/resource/img/shop/limit.gif"></td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#d5d5d5"></td>
    <td width="110" valign="top" class="pointer" onclick="shopMove('./help_list.php');">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/title_t5.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><span class="t1">${queCnt}</span></td>
    <td width="4"></td>
    <td><img src="/moyeo/resources/resource/img/shop/limit.gif"></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<div style="height:1px; background:#cccccc;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mypage_title">
<tbody><tr height="30">
    <td align="right"><p>${mem_id}님의 사용가능하신 <a href="#"><span class="t1">적립금은 <span id=mileage>${mileage}</span></span></a>이며, 사용 가능하신 <a href="#"><span class="t2">쿠폰은 0장</span></a>이 있습니다.</p></td>
</tr>
</tbody></table>

<div style="height:1px; background:#cccccc;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="40"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_list_title">
<tbody><tr>
    <td width="9"></td>
    <td width="82" valign="top"><img src="/moyeo/resources/resource/img/shop/t1.gif"></td>
    <td width="10"></td>
    <td width="100"><p class="b1 t2"><span class="t1">${orderCnt}</span> 건</p></td>
    <td align="right"><p class="b2 t2">주문중이거나 구매완료된 상품 목록 입니다. (취소/교환/환불 내역은 해당메뉴에서 확인)</p></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_list_all">
<colgroup>
    <col width="139">
    <col width="2">
    <col width="">
    <col width="2">
    <col width="118">
    <col width="2">
    <col width="190">
</colgroup>
<tbody><tr class="bg">
    <td align="center" class="t1"><b>주문일</b></td>
    <td><img src="/moyeo/resources/resource/img/shop/line.gif"></td>
    <td align="center" class="t1"><b>상품명/주문옵션</b></td>
    <td><img src="/moyeo/resources/resource/img/shop/line.gif"></td>
    <td align="center" class="t1"><b>주문상태</b></td>
    <td><img src="/moyeo/resources/resource/img/shop/line.gif"></td>
    <td align="center" class="t1"><b>옵션</b></td>
</tr>










<!-- 주문목록시작 -->
<c:forEach var="dto" items="${order_dtos}" varStatus="status">
<tr height="74">
    <td>
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td class="date">${fn:substring(dto.order_date, 0, 10)}</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><a href="#" onclick="orderPopupView('BW1702179574'); return false;" class="view">상세주문내역</a></td>
</tr>
</tbody></table>
    </td>
    <td></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="9"></td>
    <td width="50" align="center"><div class="thumb"><a href="/moyeo/six/shop/productDetail?product_num=${dto.product_num}" target="_blank"><img src="${dto.pic_path}/${dto.pic_name}" width="50" height="50" border="0"></a></div></td>
    <td width="20"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><a href="/moyeo/six/shop/productDetail?product_num=${dto.product_num}" target="_blank" class="item_name">${dto.product_name}</a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="2"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><b class="money" id="money${status.count}">${dto.payment_amount}</b></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>
    </td>
    <td></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td class="order_type">${dto.order_status}</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td class="payment">${dto.payment_means}</td>
</tr>
</tbody></table>
    </td>
    <td></td>
    <td>
<!-- btn start //-->
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><a href="#" onclick="orderPopupAddress('BW1702179574'); return false;"><img src="/moyeo/resources/resource/img/shop/btn1.gif" border="0"></a></td>
    <td width="2"></td>
    <td><a href="#" onclick="orderPopupOption('BW1702179574'); return false;"><img src="/moyeo/resources/resource/img/shop/btn2.gif" border="0"></a></td>
    <td width="2"></td>
    <td><a href="#" onclick="orderPopupCancel('BW1702179574'); return false;"><img src="/moyeo/resources/resource/img/shop/btn3.gif" border="0"></a></td>
</tr>
</tbody></table>
<!-- btn end //-->
    </td>
</tr>
<tr><td colspan="7" class="dot"></td></tr>
</c:forEach>
<!-- 주문목록 끝 -->


<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="50"></td></tr> 
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr><td><img src="/moyeo/resources/resource/img/shop/step.gif"></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="order_list_msg">
<tbody><tr>
    <td width="50"></td>
    <td class="t1">
- 결제전, 결제완료 단계에서는 고객님의 임의로 상품의 배송지 변경, 주문옵션 변경, 주문취소가 가능 합니다.<br>
- 배송준비중 단계 부터는, 배송지 변경, 주문옵션 변경, 주문취소가 불가 합니다. (상품수령 후, 교환/환불 신청 가능)<br>
* 결제전 단계에서 <b>무통장입금 5일, 가상계좌입금 5일</b> 경과시, <b>주문내역은 자동 삭제</b> 됩니다.<br>
* 상품수령 버튼을 클릭하지 않을 경우, <b>배송일로 부터 7일 경과 후 자동으로 상품수령</b>이 됩니다.<br>
* 구매확정 버튼을 클릭하지 않을 경우, <b>상품수령일로 부터 7일 경과 후 자동으로 구매완료</b>가 됩니다.<br>
    </td>
</tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="50"></td></tr> 
</tbody></table>


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

</div>




