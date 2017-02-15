<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,IE=9,chrome=1">
<title>모여샵 - 주문/결제</title>
<meta name="twitter:card" content="summary_large_image">
<meta property="fb:app_id" content="882367985223438">
<meta property="og:url" content="http://dmshop.kr/order.php">
<meta property="og:type" content="website">
<meta property="og:title" content="모여샵 - 주문/결제">
<meta property="og:subject" content="">
<meta property="og:description" content="">
<meta property="og:image" content="">
<meta property="og:image:width" content="">
<meta property="og:image:height" content="">
<meta property="og:locale" content="ko_KR">
<meta property="og:site_name" content="모여샵">
<link rel="stylesheet" href="./css/default.css" type="text/css">
<link rel="stylesheet" href="./css/jquery.selectBox.css" type="text/css">
<link rel="stylesheet" href="./css/jquery.jscrollpane.css" type="text/css">
<script type="text/javascript">var shop_charset = 'utf-8';var shop_path = '.';var shop_user_login = '';var shop_domain = 'dmshop.kr';var shop_url = 'http://dmshop.kr';var shop_user_admin = '';var shop_kakaomsg = ' http://dmshop.kr';var shop_return_url = 'http%253A%252F%252Fdmshop.kr%252Fitem.php%253Fid%253DY848100408';var check_touch= '';</script>
<script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="./js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="./js/jquery.simpletip-1.3.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.selectBox.min.js"></script>
<script type="text/javascript" src="./js/jcarousellite_1.0.1.min.js"></script>
<script type="text/javascript" src="./js/jquery.banner.js"></script>
<script type="text/javascript" src="./js/shop.js"></script>
<script type="text/javascript" src="./js/showwindow.js"></script>
<script type="text/javascript" src="./js/showwindow2.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="./js/DD_belatedPNG_0.0.8a-min.js"></script>
<![endif]-->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
Kakao.init('29856bc78cbfb5ed4f80bc189cb01054');
function kakaoLink()
{

    var label = "";
    var label_subject = $('meta[property="og:subject"]').attr('content');
    var label_url = $('meta[property="og:url"]').attr('content');

    if (label_subject) { label += label_subject; }
    if (label_url) { label += "\n"+label_url; }

    Kakao.Link.sendTalkLink({
    label: label,
    });

}
</script>
<style type="text/css"></style></head>
<body>
<div id="overlay"></div><div id="message_box"></div><div class="layout_top_bg" style="height: 160px;"></div>
<style type="text/css">
body {background-color:#ffffff;}
.layout_top {width:1000px; margin:0 auto;}
.layout_contents {width:1000px; margin:0 auto;}
.layout_contents:after {display:block; clear:both; content:'';}
.layout_main {width:1000px;}
.layout_bottom {position:relative; width:1000px; margin:0 auto;}
</style>

<div class="layout_contents">
<div class="layout_main">

<script type="text/javascript">
$('.layout_top_bg').css( { 'height': $('.layout_top').height()+'px' } );
</script><style type="text/css">
.order_position .home {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}
.order_position .off {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}

.order_top .bg {height:79px; background:url('./skin/order/default/img/top_bg.gif') repeat-x;}

.order_message .title {line-height:14px; font-size:11px; color:#787878; font-family:dotum,돋움;}

.order_title .bg1 {width:2px; height:30px; background:url('./skin/order/default/img/title_bg1.gif') no-repeat;}
.order_title .bg2 {height:30px; background:url('./skin/order/default/img/title_bg2.gif') repeat-x;}
.order_title .bg3 {width:2px; background:url('./skin/order/default/img/title_bg3.gif') no-repeat;}

.order_list .title {line-height:16px; font-size:12px; color:#000000; font-family:dotum,돋움;}
.order_list .option {line-height:16px; font-size:11px; color:#8b49c7; font-family:dotum,돋움;}
.order_list .money {line-height:18px; font-size:12px; color:#000000; font-family:dotum,돋움;}
.order_list .delivery1 {line-height:18px; font-size:11px; color:#959595; font-family:dotum,돋움;}
.order_list .delivery2 {line-height:18px; font-size:12px; color:#000000; font-family:dotum,돋움;}
.order_list .limit {line-height:16px; font-size:12px; color:#555555; font-family:dotum,돋움;}
.order_list .coupon {line-height:16px; font-size:12px; color:#000000; font-family:dotum,돋움;}
.order_list .coupon_msg {line-height:16px; font-size:12px; color:#fe6e1a; font-family:dotum,돋움;}
.order_list .total {font-weight:bold; line-height:16px; font-size:12px; color:#000000; font-family:dotum,돋움;}

.order_list .line_w {height:1px; background-color:#d6d6d6;}
.order_list .line_h {width:1px; background-color:#efefef;}

.order_cart .title {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}

.order_cash .cash {font-weight:bold; line-height:17px; font-size:12px; color:#3197f0; font-family:dotum,돋움;}
.order_cash .input {width:52px; height:17px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_cash .input {font-weight:bold; line-height:17px; font-size:12px; color:#3197f0; font-family:dotum,돋움;}

.order_sum.bg {height:88px; background:url('./skin/order/default/img/bg.gif') no-repeat;}
.order_sum .money1 {font-weight:bold; line-height:28px; font-size:26px; color:#626262; font-family:Tahoma,dotum,gulim;}
.order_sum .money2 {font-weight:bold; line-height:28px; font-size:26px; color:#cc1414; font-family:Tahoma,dotum,gulim;}
.order_sum .won1 {font-weight:bold; line-height:15px; font-size:13px; color:#787878; font-family:gulim,굴림;}
.order_sum .won2 {font-weight:bold; line-height:15px; font-size:13px; color:#cc1414; font-family:gulim,굴림;}
.order_sum .sign {margin-top:18px;}

.order_buy_title .bg {height:35px; background:url('./skin/order/default/img/title_bg.gif') repeat-x;}
.order_buy .input {width:94px; height:17px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_buy .input {line-height:17px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_buy .input2 {width:342px; height:19px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_buy .input2 {line-height:19px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_buy .hyphen {line-height:14px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_buy .title {line-height:14px; font-size:11px; color:#787878; font-family:dotum,돋움;}
.order_buy .help {line-height:14px; font-size:11px; color:#787878; font-family:dotum,돋움;}

.order_addr_title .bg {height:35px; background:url('./skin/order/default/img/title_bg.gif') repeat-x;}
.order_addr .input {width:94px; height:17px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_addr .input {line-height:17px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_addr .input2 {width:342px; height:19px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_addr .input2 {line-height:19px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_addr .hyphen {line-height:14px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_addr .textarea  {padding:3px; width:342px; height:40px; border:1px solid #c9c9c9;}
.order_addr .textarea  {line-height:15px; font-size:12px; color:#333333; font-family:dotum,돋움;}
.order_addr .title {line-height:14px; font-size:11px; color:#787878; font-family:dotum,돋움;}
.order_addr .user {line-height:17px; font-size:12px; color:#787878; font-family:dotum,돋움;}

.order_pay_title {height:35px; background:url('./skin/order/default/img/title_bg.gif') repeat-x;}

.order_pay .pay_bg {width:250px; height:50px; background:url('./skin/order/default/img/pay_bg.gif') no-repeat;}
.order_pay .money {font-weight:bold; line-height:28px; font-size:26px; color:#ffffff; font-family:Tahoma,dotum,gulim;}
.order_pay .title {line-height:14px; font-size:12px; color:#000000; font-family:dotum,돋움;}
.order_pay .message {line-height:14px; font-size:11px; color:#9e9e9e; font-family:dotum,돋움;}

.order_pay .input {width:94px; height:17px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_pay .input {line-height:17px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_pay .input2 {background-color:#f0f3fa; width:110px; height:17px; border:1px solid #bdc1cb; padding:1px 3px 0px 3px;}
.order_pay .input2 {line-height:17px; font-size:12px; color:#000000; font-family:gulim,굴림;}

.order_pay .select {line-height: 1.5; font-size:12px; color:#000000; font-family:"돋움",Dotum,Helvetica,AppleGothic,Sans-serif;}
.order_pay .selectBox-dropdown {width:120px; height:19px;}
.order_pay .selectBox-dropdown .selectBox-label {padding:1px 5px 1px 5px;}

.order_help .title {line-height:14px; font-size:11px; color:#9e9e9e; font-family:dotum,돋움;}
</style>

<script type="text/javascript">
$(document).ready( function() {
    $(".order_pay select").selectBox();
});
</script>

<div style="border:1px solid #efefef; background-color:#f7f7f7;">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_position">
<tbody><tr height="30">
    <td width="10"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
<td><a href="http://dmshop.kr/" class="home">홈</a></td><td width="20" align="center"><img src="./skin/order/default/img/arrow.gif" class="up1"></td><td><span class="off">주문/결제</span></td></tr>
</tbody></table>
    </td>
    <td width="10"></td>
</tr>
</tbody></table>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_top">
<tbody><tr>
    <td width="4"><img src="./skin/order/default/img/top_bg_side1.gif"></td>
    <td width="610"><img src="./skin/order/default/img/top_bg_title.gif"></td>
    <td class="bg none">&nbsp;</td>
    <td width="4"><img src="./skin/order/default/img/top_bg_side2.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_message">
<tbody><tr height="40">
    <td class="title">주문상품 목록을 확인 &gt; 적립금 적용 &gt; 배송정보 입력 &gt; 결제수단 선택 순으로 진행 합니다.</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#efefef" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<!-- 타이틀 start //-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_title">
<tbody><tr>
    <td class="bg1"></td>
    <td class="bg2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30">
    <td width="6"></td>
    <td align="center"><img src="./skin/order/default/img/title_item.gif"></td>
    <td width="1"></td>
    <td width="60" align="center"><img src="./skin/order/default/img/title_limit.gif"></td>
    <td width="1"></td>
    <td width="90" align="center"><img src="./skin/order/default/img/title_money.gif"></td>
    <td width="1"></td>
    <td width="90" align="center"><img src="./skin/order/default/img/title_coupon.gif"></td>
    <td width="1"></td>
    <td width="90" align="center"><img src="./skin/order/default/img/title_total.gif"></td>
    <td width="1"></td>
    <td width="90" align="center"><img src="./skin/order/default/img/title_delivery.gif"></td>
</tr>
</tbody></table>
    </td>
    <td class="bg3"></td>
</tr>
</tbody></table>
<!-- 타이틀 end //-->

<!-- 리스트 start //-->
<script type="text/javascript">
// 쿠폰 업데이트 (주문 테이블로 재전송)
function cartCouponUpdate()
{

    var f = document.formCoupon;

    f.action = "./order.php";
    f.submit();

}
</script>

<form method="post" name="formCoupon">
<input type="hidden" name="m" value="all">
<input type="hidden" name="chk_id[]" value="0">
<input type="hidden" name="cart_id[0]" value="3">
</form>

<form method="post" name="formOrder" autocomplete="off">
<input type="hidden" name="ss_name" value="order_424212">
<input type="hidden" name="robot_mkey1" value="2017-02-15 22:26:04">
<input type="hidden" name="robot_mkey2" value="49">
<input type="hidden" name="robot_mkey3" value="218.38.255.69">
<input type="hidden" name="robot_mkey" value="7ea82f1c82">
<input type="hidden" name="url" value="http%253A%252F%252Fdmshop.kr%252Fitem.php%253Fid%253DY848100408">
<input type="hidden" name="m" value="">
<input type="hidden" name="order_receipt_name" value="">
<input type="hidden" name="order_receipt_number" value="">
<input type="hidden" id="order_delivery_money" name="order_delivery_money" value="2500">
<input type="hidden" id="order_total_money" name="order_total_money" value="3500">
<input type="hidden" id="order_total_item_money" name="order_total_item_money" value="1000">
<input type="hidden" id="order_total_coupon" name="order_total_coupon" value="0">
<input type="hidden" id="order_pay_money" name="order_pay_money" value="3500">
<input type="submit" value="ok" disabled="" style="display:none;">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_list">
<colgroup>
    <col width="6">
    <col width="">
    <col width="1">
    <col width="60">
    <col width="1">
    <col width="110">
    <col width="1">
    <col width="90">
    <col width="1">
    <col width="90">
    <col width="1">
    <col width="90">
</colgroup>
<input type="hidden" name="chk_id[]" value="0">
<input type="hidden" name="cart_id[0]" value="3">
<tbody><tr>
    <td></td>
    <td valign="top" style="padding:15px 0 15px 0;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="84" valign="top"><div style="border:1px solid #e0e0e0;"><a href="http://dmshop.kr/item.php?id=Y848100408"><img src="./data/thumb/item/82x82/1935647224_bcb14092_IMG_1674.jpg" width="82" height="82" border="0"></a></div></td>
    <td width="15"></td>
    <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><a href="http://dmshop.kr/item.php?id=Y848100408" class="title">소품 (갤러리 학습)</a></td>
</tr>
</tbody></table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="8"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><a href="http://dmshop.kr/item.php?id=Y848100408" target="_blank"><img src="./skin/order/default/img/blank.gif" border="0"></a></td>
</tr>
</tbody></table>
    </td>
    <td width="20"></td>
</tr>
</tbody></table>
    </td>
    <td class="line_h"></td>
    <td class="limit" align="center">1</td>
    <td class="line_h"></td>
    <td class="money" align="center">1,000 원</td>
    <td class="line_h"></td>
    <td align="center">
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td class="coupon">없음</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><a href="#" onclick="cartCoupon('3'); return false;"><img src="./skin/order/default/img/coupon.gif" border="0"></a></td>
</tr>
</tbody></table>
    </td>
    <td class="line_h"></td>
    <td class="total" align="center">3,500 원</td>
    <td class="line_h"></td>
    <td class="money" align="center">
<span class="delivery2">2,500 원<br>묶음배송불가</span>    </td>
</tr>
<tr><td colspan="12" class="line_w"></td></tr>
</tbody></table>
<!-- 리스트 end //-->

<table border="0" cellspacing="0" cellpadding="0" class="order_cart">
<tbody><tr height="34">
    <td width="10"></td>
    <td><a href="http://dmshop.kr/cart.php"><img src="./skin/order/default/img/cart.gif" border="0"></a></td>
    <td width="10"></td>
    <td class="title">주문상품의 변경과 쿠폰을 적용하고자 하신다면 장바구니로 돌아가 다시 진행하시기 바랍니다.</td>
</tr>
</tbody></table>

<!-- 적립금사용 start //-->
<!-- 적립금사용 end //-->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<!-- 결제금액합산 start //-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_sum bg">
<tbody><tr>
    <td align="right" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="25"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="14">
    <td><img src="./skin/order/default/img/sum_money.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="4"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><span class="money1">1,000</span></td>
    <td width="5"></td>
    <td><span class="won1">원</span></td>
</tr>
</tbody></table>
    </td>
    <td width="50" align="center"><img src="./skin/order/default/img/sign1.gif" class="sign"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="14">
    <td><img src="./skin/order/default/img/sum_delivery.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="4"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><span class="money1">2,500</span></td>
    <td width="5"></td>
    <td><span class="won1">원</span></td>
</tr>
</tbody></table>
    </td>
    <td width="50" align="center"><img src="./skin/order/default/img/sign2.gif" class="sign"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="14">
    <td><img src="./skin/order/default/img/sum_coupon.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="4"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><span class="money1">0</span></td>
    <td width="5"></td>
    <td><span class="won1">원</span></td>
</tr>
</tbody></table>
    </td>
    <td width="50" align="center"><img src="./skin/order/default/img/sign3.gif" class="sign"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="14">
    <td><img src="./skin/order/default/img/sum_total.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="4"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><span id="order_total_money_view" class="money2">3,500</span></td>
    <td width="5"></td>
    <td><span class="won2">원</span></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>
    </td>
    <td width="10"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="2" bgcolor="#6b6b6b" class="none">&nbsp;</td></tr>
</tbody></table>
<!-- 결제금액합산 end //-->

<!-- 주문자정보 start //-->

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr height="60">
    <td><img src="./skin/order/default/img/arrow2.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_buy_title">
<tbody><tr>
    <td width="5"><img src="./skin/order/default/img/title_side1.gif"></td>
    <td class="bg" align="center"><img src="./skin/order/default/img/title_buy.gif"></td>
    <td width="5"><img src="./skin/order/default/img/title_side2.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_buy">
<tbody><tr>
    <td width="1" bgcolor="#d6d6d6"></td>
    <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="30"></td>
    <td width="460" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100"><img src="./skin/order/default/img/order_buy_name.gif"></td>
    <td><input type="text" name="order_name" value="" class="input"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10" valign="top" style="padding-top:8px;"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100" valign="top" style="padding-top:6px;"><img src="./skin/order/default/img/order_addr.gif"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_zip1" value="" readonly="" class="input" style="width:40px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_zip2" value="" readonly="" class="input" style="width:40px;"></td>
    <td width="10"></td>
    <td><a href="#" onclick="shopZip('formOrder', 'order_zip1', 'order_zip2', 'order_addr1', 'order_addr2'); return false;"><img src="./skin/order/default/img/find_addr.gif" border="0"></a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_addr1" value="" readonly="" class="input2"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_addr2" value="" class="input2"></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100"><img src="./skin/order/default/img/order_hp.gif"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_hp1" value="" maxlength="4" class="input" style="width:27px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_hp2" value="" maxlength="4" class="input" style="width:27px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_hp3" value="" maxlength="4" class="input" style="width:27px;"></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100"><img src="./skin/order/default/img/order_tel.gif"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_tel1" value="" maxlength="4" class="input" style="width:27px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_tel2" value="" maxlength="4" class="input" style="width:27px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_tel3" value="" maxlength="4" class="input" style="width:27px;"></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100"><img src="./skin/order/default/img/order_email.gif"></td>
    <td><input type="text" name="order_email" value="" class="input" style="width:137px;"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100"><img src="./skin/order/default/img/order_password.gif"></td>
    <td><input type="password" name="order_password" value="" class="input"></td>
    <td width="10"></td>
    <td class="help">상품주문내역 / 배송 조회시 사용하실 비밀번호 입력</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>
    </td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#d6d6d6"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>
<!-- 주문자정보 end //-->

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr height="60">
    <td><img src="./skin/order/default/img/arrow2.gif"></td>
</tr>
</tbody></table>

<!-- 배송정보입력 start //-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_addr_title">
<tbody><tr>
    <td width="5"><img src="./skin/order/default/img/title_side1.gif"></td>
    <td class="bg" align="center"><img src="./skin/order/default/img/title_addr.gif"></td>
    <td width="5"><img src="./skin/order/default/img/title_side2.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_addr">
<tbody><tr>
    <td width="1" bgcolor="#d6d6d6"></td>
    <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="30"></td>
    <td width="460" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100"><img src="./skin/order/default/img/order_addr_type.gif"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="checkbox" name="addr_type" value="1" onclick="orderAddr2();"></td>
    <td width="5"></td>
    <td class="title">주문자 정보와 동일 (자동입력)</td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100"><img src="./skin/order/default/img/order_rec_name.gif"></td>
    <td><input type="text" name="order_rec_name" value="" class="input"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10" valign="top" style="padding-top:8px;"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100" valign="top" style="padding-top:6px;"><img src="./skin/order/default/img/order_addr.gif"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_rec_zip1" value="" readonly="" class="input" style="width:40px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_rec_zip2" value="" readonly="" class="input" style="width:40px;"></td>
    <td width="10"></td>
    <td><a href="#" onclick="shopZip('formOrder', 'order_rec_zip1', 'order_rec_zip2', 'order_rec_addr1', 'order_rec_addr2'); return false;"><img src="./skin/order/default/img/find_addr.gif" border="0"></a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_rec_addr1" value="" readonly="" class="input2"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_rec_addr2" value="" class="input2"></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100"><img src="./skin/order/default/img/order_hp.gif"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_rec_hp1" value="" maxlength="4" class="input" style="width:27px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_rec_hp2" value="" maxlength="4" class="input" style="width:27px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_rec_hp3" value="" maxlength="4" class="input" style="width:27px;"></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100"><img src="./skin/order/default/img/order_tel.gif"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_rec_tel1" value="" maxlength="4" class="input" style="width:27px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_rec_tel2" value="" maxlength="4" class="input" style="width:27px;"></td>
    <td width="20" align="center" class="hyphen">-</td>
    <td><input type="text" name="order_rec_tel3" value="" maxlength="4" class="input" style="width:27px;"></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10" valign="top" style="padding-top:6px;"><img src="./skin/order/default/img/arrow3.gif"></td>
    <td width="100" valign="top" style="padding-top:4px;"><img src="./skin/order/default/img/order_memo.gif"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><textarea id="order_memo" name="order_memo" class="textarea" onkeyup="orderByte('order_memo', 'order_memo_byte');"></textarea></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td class="title">( <span id="order_memo_byte">0</span> / 120byte)</td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>
    </td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#d6d6d6"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>
<!-- 배송정보입력 end //-->

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr height="60">
    <td><img src="./skin/order/default/img/arrow2.gif"></td>
</tr>
</tbody></table>

<!-- 결제수단선택 start //-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_pay_title">
<tbody><tr>
    <td width="5"><img src="./skin/order/default/img/title_side1.gif"></td>
    <td class="bg" align="center"><img src="./skin/order/default/img/title_pay.gif"></td>
    <td width="5"><img src="./skin/order/default/img/title_side2.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_pay">
<tbody><tr>
    <td width="1" bgcolor="#d6d6d6"></td>
    <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#ffffff" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="80" bgcolor="#f5f5f5">
    <td width="144" align="center"><img src="./skin/order/default/img/title_pay_money.gif"></td>
    <td>
<table width="250" border="0" cellspacing="0" cellpadding="0" class="pay_bg">
<tbody><tr>
    <td align="center"><span id="order_pay_money_view" class="money">3,500 원</span></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="144" align="center"><img src="./skin/order/default/img/title_pay_type.gif"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="radio" name="order_pay_type" value="1" class="radio" checked="" onclick="orderPayType(this.value);"></td>
    <td width="5"></td>
    <td class="title">신용카드</td>
    <td width="15"></td>
    <td><input type="radio" name="order_pay_type" value="2" class="radio" onclick="orderPayType(this.value);"></td>
    <td width="5"></td>
    <td class="title">실시간 계좌이체</td>
    <td width="15"></td>
    <td><input type="radio" name="order_pay_type" value="3" class="radio" onclick="orderPayType(this.value);"></td>
    <td width="5"></td>
    <td class="title">휴대폰 결제</td>
    <td width="15"></td>
    <td><input type="radio" name="order_pay_type" value="5" class="radio" onclick="orderPayType(this.value);"></td>
    <td width="5"></td>
    <td class="title">무통장 입금</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><span id="order_pay_message" class="message"><font color="#6d71d0">[신용카드]</font> 온라인상에서 소유하신 신용카드를 통해, 전자결제를 진행 합니다.</span></td>
</tr>
</tbody></table>

<div id="order_pay_bank" style="display:none;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table width="500" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td>
<div style="border:1px solid #d6d6d6;">
<div style="border:1px solid #ffffff; background-color:#fbfbfb;">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="40">
    <td width="25"></td>
    <td><img src="./skin/order/default/img/order_dep_name.gif"></td>
    <td width="20"></td>
    <td><input type="text" name="order_dep_name" value="" class="input" style="width:92px;"></td>
    <td width="50"></td>
    <td><img src="./skin/order/default/img/order_receipt.gif"></td>
    <td width="20"></td>
    <td>
<select id="order_receipt" name="order_receipt" onchange="orderReceipt(this.value);" class="select selectBox" style="display: none;">
    <option value="0">신청안함</option>
    <option value="1">개인소득공제</option>
    <option value="2">사업자지출증빙</option>
</select><a class="selectBox select selectBox-dropdown" style="display: inline-block;" title="" tabindex="0"><span class="selectBox-label">신청안함</span><span class="selectBox-arrow"></span></a>
    </td>
</tr>
</tbody></table>
</div>
</div>

<div id="order_receipt_layer1" style="display:none;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="35" bgcolor="#fbfbfb">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="28"></td>
    <td><img src="./skin/order/default/img/order_receipt_type.gif"></td>
    <td width="20"></td>
    <td><input type="radio" name="order_receipt_type" value="0" onclick="orderReceiptType(this.value);" class="radio"></td>
    <td width="5"></td>
    <td class="title">휴대폰</td>
    <td width="20"></td>
    <td><input type="radio" name="order_receipt_type" value="1" onclick="orderReceiptType(this.value);" class="radio"></td>
    <td width="5"></td>
    <td class="title">주민등록번호</td>
    <td width="20"></td>
    <td><input type="radio" name="order_receipt_type" value="2" onclick="orderReceiptType(this.value);" class="radio"></td>
    <td width="5"></td>
    <td class="title">현금영수증카드</td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<div id="order_receipt_type_layer0" style="display:none;">
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td class="title">이름</td>
    <td width="15"></td>
    <td><input type="text" id="tmp0_order_receipt_name" value="" class="input2" style="width:110px;"></td>
    <td width="30"></td>
    <td class="title">휴대폰</td>
    <td width="15"></td>
    <td><input type="text" id="tmp0_order_receipt_number" value="" class="input2" style="width:110px;"></td>
</tr>
</tbody></table>
</div>

<div id="order_receipt_type_layer1" style="display:none;">
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td class="title">이름</td>
    <td width="15"></td>
    <td><input type="text" id="tmp1_order_receipt_name" value="" class="input2" style="width:110px;"></td>
    <td width="30"></td>
    <td class="title">주민등록번호</td>
    <td width="15"></td>
    <td><input type="text" id="tmp1_order_receipt_number" value="" class="input2" style="width:110px;"></td>
</tr>
</tbody></table>
</div>

<div id="order_receipt_type_layer2" style="display:none;">
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td class="title">이름</td>
    <td width="15"></td>
    <td><input type="text" id="tmp2_order_receipt_name" value="" class="input2" style="width:110px;"></td>
    <td width="30"></td>
    <td class="title">현금영수증카드 번호</td>
    <td width="15"></td>
    <td><input type="text" id="tmp2_order_receipt_number" value="" class="input2" style="width:110px;"></td>
</tr>
</tbody></table>
</div>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr height="40">
    <td class="message">번호 입력시 하이픈 (-)을 제외한 숫자만 입력하세요.</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>
</div>

<div id="order_receipt_layer2" style="display:none;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="35" bgcolor="#fbfbfb">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="28"></td>
    <td><img src="./skin/order/default/img/order_receipt_type.gif"></td>
    <td width="20"></td>
    <td><input type="radio" name="order_receipt_type" value="3" onclick="orderReceiptType(this.value);" class="radio"></td>
    <td width="5"></td>
    <td class="title">사업자번호</td>
    <td width="20"></td>
    <td><input type="radio" name="order_receipt_type" value="4" onclick="orderReceiptType(this.value);" class="radio"></td>
    <td width="5"></td>
    <td class="title">현금영수증카드</td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<div id="order_receipt_type_layer3" style="display:none;">
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td class="title">이름</td>
    <td width="15"></td>
    <td><input type="text" id="tmp3_order_receipt_name" value="" class="input2" style="width:110px;"></td>
    <td width="30"></td>
    <td class="title">사업자등록 번호</td>
    <td width="15"></td>
    <td><input type="text" id="tmp3_order_receipt_number" value="" class="input2" style="width:110px;"></td>
</tr>
</tbody></table>
</div>

<div id="order_receipt_type_layer4" style="display:none;">
<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td class="title">이름</td>
    <td width="15"></td>
    <td><input type="text" id="tmp4_order_receipt_name" value="" class="input2" style="width:110px;"></td>
    <td width="30"></td>
    <td class="title">현금영수증카드 번호</td>
    <td width="15"></td>
    <td><input type="text" id="tmp4_order_receipt_number" value="" class="input2" style="width:110px;"></td>
</tr>
</tbody></table>
</div>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr height="40">
    <td class="message">번호 입력시 하이픈 (-)을 제외한 숫자만 입력하세요.</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>
</div>
    </td>
</tr>
</tbody></table>
</div>
    </td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#d6d6d6"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="1" bgcolor="#d6d6d6" class="none">&nbsp;</td></tr>
</tbody></table>
<!-- 결제수단선택 end //-->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="2" bgcolor="#6b6b6b" class="none">&nbsp;</td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><a href="http://dmshop.kr/cart.php"><img src="./skin/order/default/img/cart_go.gif" border="0"></a></td>
    <td width="5"></td>
    <td><a href="#" onclick="orderSave(); return false;"><img src="./skin/order/default/img/order_pay.gif" border="0"></a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="50"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto order_help">
<tbody><tr>
    <td>
<div style="padding:20px 68px; border:1px solid #d6d6d6;">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="./skin/order/default/img/dot.gif" class="up1"></td>
    <td width="5"></td>
    <td class="title">결제하기 버튼을 클릭하여, 선택하신 결제수단으로 결제를 진행해 주시기 바랍니다.</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="6"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="./skin/order/default/img/dot.gif" class="up1"></td>
    <td width="5"></td>
    <td class="title">처음 구매시, 결제를 위해 회원님의 PC에 전자결제 모듈이 설치를 진행해 주세요.</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="6"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="./skin/order/default/img/dot.gif" class="up1"></td>
    <td width="5"></td>
    <td class="title">결제결과는 이 후, 주문완료 페이지에서 확인 가능 합니다.</td>
</tr>
</tbody></table>
</div>
    </td>
</tr>
</tbody></table>
</form>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr><td height="50"></td></tr> 
</tbody></table>

<!--결제처리 위한 iframe start //-->
<iframe id="order_update" name="order_update" width="0" height="0" style="display:none;"></iframe>
<!--결제처리 위한 iframe end //-->

<script type="text/javascript">
var user_cash_use = "";
var user_cash = parseInt("0");
var order_cash_min = parseInt("50000");
var order_total_money = parseInt("3500");
var order_card_percent = parseFloat("0");
var order_mobile_percent = parseFloat("0.04");
</script>

<script type="text/javascript">
var order_rec_name = "";
var order_rec_zip1 = "";
var order_rec_zip2 = "";
var order_rec_addr1 = "";
var order_rec_addr2 = "";
var order_rec_hp1 = "";
var order_rec_hp2 = "";
var order_rec_hp3 = "";
var order_rec_tel1 = "";
var order_rec_tel2 = "";
var order_rec_tel3 = "";
</script>

<script type="text/javascript">
var order_coupon_bank = "";
var order_coupon_cash = "";
</script>

<!-- <script type="text/javascript">
var order_pay_url = "./pay/kcp/pay.php";
</script> -->

<script type="text/javascript" src="./skin/order/default/order.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    orderByte('order_memo', 'order_memo_byte');
    orderCheck();
    orderPayTypeLoad();
});
</script>

<!-- <script type="text/javascript" src="https://pay.kcp.co.kr/plugin/payplus_un.js"></script> 
<script type="text/javascript">
kcpTx_install();
</script> -->


<script type="text/javascript" src="./skin/scrollbox/default/scrollbox.js"></script></div>
</div>
<div class="layout_bottom"><div class="layout_bottom_bg" style="left: -80.5px; width: 1161px; height: 208px;"></div>
<style type="text/css">
.layout_bottom .service_menu .line {padding:0 5px; line-height:14px; font-size:12px; color:#eeeeee; font-family:gulim,굴림;}
.layout_bottom .service_menu a {
font-family:gulim;
font-size:12px;
line-height:30px;
color:#787878;
font-weight:bold;
}
.layout_bottom .service_menu a:hover {
font-family:gulim;
font-size:12px;
line-height:30px;
color:#787878;
font-weight:bold;
}
</style>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><br>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody><tr>
<td bgcolor="#dbdbdb" height="1"></td>
</tr>
<tr>
<td align="center" height="50"><table border="0" cellpadding="0" cellspacing="0">
<tbody><tr>
<td><a href="http://www.dmshopkorea.com/" target="_blank"><img src="/image/shop/public/bottorm_a01.gif" border="0"></a></td>
<td><img src="/image/shop/public/bottorm_bg.gif" height="50" width="1"></td>
<td><a href="http://www.koreacb.com/" target="_blank"><img src="/image/shop/public/bottorm_b01.gif" border="0"></a></td>
<td><img src="/image/shop/public/bottorm_bg.gif" height="50" width="1"></td>
<td><a href="http://www.kcp.co.kr/alpa.escrow.info.do" target="_blank"><img src="/image/shop/public/bottorm_c01.gif" border="0"></a></td>
<td><img src="/image/shop/public/bottorm_bg.gif" height="50" width="1"></td>
<td><a href="http://www.kcp.co.kr/payment.service.info.do" target="_blank"><img src="/image/shop/public/bottorm_d01.gif" border="0"></a></td>
<td><img src="/image/shop/public/bottorm_bg.gif" height="50" width="1"></td>
<td><a href="http://www.taxsave.go.kr/" target="_blank"><img src="/image/shop/public/bottorm_e01.gif" border="0"></a></td>
<td><img src="/image/shop/public/bottorm_bg.gif" height="50" width="1"></td>
<td><a href="http://www.ftc.go.kr/" target="_blank"><img src="/image/shop/public/bottorm_f01.gif" border="0"></a></td>
</tr>
</tbody></table></td>
</tr>
<tr>
<td bgcolor="#dbdbdb" height="1"></td>
</tr>
<tr>
<td bgcolor="#f1f1f1" height="1"></td>
</tr>
</tbody></table>
</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td align="center"><table border="0" cellspacing="0" cellpadding="0" class="service_menu">
<tbody><tr>
<td><a href="http://dmshop.kr/board.php?bbs_id=notice">공지사항</a></td><td><span class="line">|</span></td><td><a href="http://dmshop.kr/board.php?bbs_id=faq">자주묻는 질문</a></td><td><span class="line">|</span></td><td><a href="http://dmshop.kr/page.php?page_id=about">회사소개</a></td><td><span class="line">|</span></td><td><a href="http://dmshop.kr/page.php?page_id=nospam">이메일무단수집거부</a></td><td><span class="line">|</span></td><td><a href="http://dmshop.kr/page.php?page_id=privacy">개인정보취급방침</a></td><td><span class="line">|</span></td><td><a href="http://dmshop.kr/page.php?page_id=service">서비스이용약관</a></td></tr>
</tbody></table></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="215" valign="top"><a href="http://dmshop.kr" onfocus="this.blur();"><img src="./data/design/2012-07-09/2077629024_872f1bb5_logo_noimg.png" width="215" height="70" border="0"></a></td>
    <td valign="bottom">

<style type="text/css">
.bottom_information .text {
font-family:dotum;
font-size:11px;
line-height:16px;
color:#9e9e9e;
font-weight:normal;
}
.bottom_information .bline {margin:0 5px; font-size:11px; color:#cccccc; font-family:dotum,돋움;}
.bottom_information td {text-align:left;}
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bottom_information">
<tbody><tr>
    <td>
<p><span class="text">회사명 : Moyeo</span><span class="bline">|</span><span class="text">사업자 등록번호 : 105-16-21510</span><span class="bline">|</span><span class="text">통신판매업 신고번호 : 시군구-0000호</span></p>
<p><span class="text">대표 : 홍길동</span> <a href="mailto:info@domain.com"><img src="./layout/default/img/email.gif" border="0" class="down1"></a><span class="bline">|</span><span class="text">개인정보관리 책임자 : 황비홍</span> <a href="mailto:privacy@domain.com"><img src="./layout/default/img/email.gif" border="0" class="down1"></a><span class="bline">|</span><span class="text">주소 : 서울 마포구 성산동 000-00 000호</span></p>
<p><span class="text">대표전화 : 02-0000-0000</span><span class="bline">|</span><span class="text">팩스 : 02-0000-0000</span></p>
    </td>
</tr>
</tbody></table>
<style type="text/css">
.bottom_copyright .text {
font-family:dotum;
font-size:11px;
line-height:11px;
color:#787878;
font-weight:normal;
}
.bottom_copyright td {text-align:right;}
</style>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="bottom_copyright">
<tbody><tr>
    <td><p><span class="text">Copyright © <b>Moyeo</b> Corp. All Rights Reserved.</span></p></td>
</tr>
</tbody></table>    </td>
</tr>
</tbody></table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table></div>

<script type="text/javascript">
$(document).ready( function() {

    $(window).resize(function() {

        $('.layout_bottom_bg').css( { 'left': -($('.layout_bottom').offset().left)+'px', 'width': $(window).width()+'px' } );

    });

    $('.layout_bottom_bg').css( { 'left': -($('.layout_bottom').offset().left)+'px', 'width': $(window).width()+'px', 'height': $('.layout_bottom').height()+'px' } );

});
</script><script type="text/javascript">$(document).ready(function() { var version = $.browser.version; var resolution = screen.width+"x"+screen.height; $.post("./visit_update.php", {"visit_id" : "313", "version" : version, "resolution" : resolution}); });</script>

<ul class="selectBox-dropdown-menu selectBox-options select-selectBox-dropdown-menu" style="display: none;"><li class="selectBox-selected"><a rel="0">신청안함</a></li><li><a rel="1">개인소득공제</a></li><li><a rel="2">사업자지출증빙</a></li></ul></body></html>