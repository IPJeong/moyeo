<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>모여샵 - 상세주문내역</title>
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

<script type="text/javascript">
	window.onload = function() {
		var p1 = parseInt(document.getElementById("money").innerHTML);
		var p2 = parseInt(document.getElementById("money1").innerHTML);
		var p3 = parseInt(document.getElementById("money2").innerHTML);	
		var p4 = parseInt(document.getElementById("money3").innerHTML);	
		
		
		document.getElementById("money").innerHTML = shopNumberFormat(String(p1)) + " 원";
		document.getElementById("money1").innerHTML = shopNumberFormat(String(p2)) + " 원";
		document.getElementById("money2").innerHTML = shopNumberFormat(String(p3)) + " 원";
		document.getElementById("money3").innerHTML = shopNumberFormat(String(p4)) + " 원";
			
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
</script>	

</head>
<body>
<div id="overlay"></div><div id="message_box"></div><div class="layout_top_bg"></div><!--[if IE 6]>
<script type="text/javascript">
/* IE6 PNG 배경투명 */
DD_belatedPNG.fix('.png');
</script>
<![endif]-->

<style type="text/css">
.top_bg {height:45px; background:url('/moyeo/resources/resource/img/shop/top_bg.gif') repeat-x;}

.order_infor .title {font-weight:bold; line-height:14px; font-size:11px; color:#717171; font-family:dotum,돋움;}
.order_infor .date {line-height:16px; font-size:12px; color:#717171; font-family:gulim,굴림;}
.order_infor .time {line-height:16px; font-size:11px; color:#adadad; font-family:dotum,돋움;}
.order_infor .code {line-height:16px; font-size:12px; color:#7da7d9; font-family:gulim,굴림;}
.order_infor .money {line-height:16px; font-size:12px; color:#717171; font-family:gulim,굴림;}
.order_infor .mode {line-height:16px; font-size:12px; color:#000000; font-family:gulim,굴림;}

.order_list .thumb {border:2px solid #e4e4e4;}

.order_list .title {font-weight:bold; line-height:14px; font-size:11px; color:#717171; font-family:dotum,돋움;}
.order_list .subject {line-height:16px; font-size:12px; color:#000000; font-family:dotum,돋움;}
.order_list .option {line-height:16px; font-size:11px; color:#8b49c7; font-family:dotum,돋움;}
.order_list .limit {line-height:16px; font-size:12px; color:#000000; font-family:dotum,돋움;}
.order_list .money {line-height:16px; font-size:12px; color:#ff3c00; font-family:dotum,돋움;}
.order_list .dot {height:1px; background:url('./skin/order_view/default/img/dot.gif') repeat-x;}

.order_addr .title {font-weight:bold; line-height:14px; font-size:11px; color:#717171; font-family:dotum,돋움;}
.order_addr .list {line-height:16px; font-size:12px; color:#717171; font-family:gulim,굴림;}
.order_addr .zip {line-height:16px; font-size:11px; color:#8b8d8e; font-family:dotum,돋움;}

.order_pay .title {font-weight:bold; line-height:14px; font-size:11px; color:#717171; font-family:dotum,돋움;}
.order_pay .t1 {line-height:16px; font-size:12px; color:#ff3c00; font-family:gulim,굴림;}
.order_pay .t2 {line-height:16px; font-size:12px; color:#717171; font-family:gulim,굴림;}
.order_pay .t3 {font-weight:bold; line-height:16px; font-size:13px; color:#010101; font-family:gulim,굴림;}
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr class="top_bg">
    <td width="15"></td>
    <td><img src="/moyeo/resources/resource/img/shop/title.png" class="png"></td>
    <td width="200" align="right" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td valign="top"><a href="#" onclick="dataPrint(); return false;"><img src="/moyeo/resources/resource/img/shop/print.png" class="png" border="0"></a></td>
    <td width="2"></td>
    <td valign="top"><a href="#" onclick="window.close(); return false;"><img src="/moyeo/resources/resource/img/shop/close.png" class="png" border="0"></a></td>
</tr>
</tbody></table>
    </td>
    <td width="10"></td>
</tr>
</tbody></table>

<div style="height:2px; background:#bbbbbb;" class="none">&nbsp;</div>


<div id="print_data">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="15"></td>
    <td>
<!-- 주문정보 start //-->
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/arrow1.gif"></td>
    <td width="5"></td>
    <td><img src="/moyeo/resources/resource/img/shop/t11.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="height:2px; background:#bbbbbb;" class="none">&nbsp;</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_infor">
<tbody><tr>
    <td width="149" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30" bgcolor="#f7f7f7">
    <td align="center" class="title">주문일시</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="47">
    <td align="center" class="date">${fn:substring(dto.order_date, 0, 10)}<br><span class="time">${fn:substring(dto.order_date, 11, 19)}</span></td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#e4e4e4"></td>
    <td width="1"></td>
    <td width="148" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30" bgcolor="#f7f7f7">
    <td align="center" class="title">주문번호</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="47">
    <td align="center" class="code">${dto.payment_num}</td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#e4e4e4"></td>
    <td width="1"></td>
    <td width="148" valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30" bgcolor="#f7f7f7">
    <td align="center" class="title">결제금액</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="47">
    <td align="center" class="money" id="money3">${dto.payment_amount}</td>
</tr>
</tbody></table>
    </td>
    <td width="1" bgcolor="#e4e4e4"></td>
    <td width="1"></td>
    <td valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30" bgcolor="#f7f7f7">
    <td align="center" class="title">주문상태</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="47">
    <td align="center" class="mode">${dto.order_status}</td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<div style="height:2px; background:#777777;" class="none">&nbsp;</div>

<!-- 주문정보 end //-->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<!-- 주문상품목록 start //-->
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/arrow1.gif"></td>
    <td width="5"></td>
    <td><img src="/moyeo/resources/resource/img/shop/t21.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="height:2px; background:#bbbbbb;" class="none">&nbsp;</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_list">
<colgroup>
    <col width="">
    <col width="1">
    <col width="90">
    <col width="1">
    <col width="90">
</colgroup>
<tbody><tr height="30" bgcolor="#f7f7f7">
    <td align="center" class="title">상품명</td>
    <td></td>
    <td align="center" class="title">주문수량</td>
    <td></td>
    <td align="center" class="title">판매가격</td>
</tr>
<tr><td colspan="5" height="2" bgcolor="#777777"></td></tr>
<tr height="73">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="9"></td>
    <td width="50" align="center"><div class="thumb"><a href="/moyeo/six/shop/productDetail?product_num=${dto.product_num}" target="_blank"><img src="${dto.pic_path}/${dto.pic_name}" width="50" height="50" border="0"></a></div></td>
    <td width="10"></td>
    <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><a href="/moyeo/six/shop/productDetail?product_num=${dto.product_num}" target="_blank" class="subject">${dto.product_name}</a></td>
</tr>
</tbody></table>

    </td>
</tr>
</tbody></table>
    </td>
    <td bgcolor="#efefef"></td>
    <td align="center" class="limit">${dto.order_qty} 개</td>
    <td bgcolor="#efefef"></td>
    <td align="center" class="money" id="money">${dto.payment_amount} 원</td>
</tr>
</tbody></table>

<div style="height:2px; background:#efefef;" class="none">&nbsp;</div>

<!-- 주문상품목록 end //-->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<!-- 배송지정보 start //-->
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/arrow1.gif"></td>
    <td width="5"></td>
    <td><img src="/moyeo/resources/resource/img/shop/t31.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="height:2px; background:#bbbbbb;" class="none">&nbsp;</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_addr">
<colgroup>
    <col width="149">
    <col width="1">
    <col width="15">
    <col width="">
</colgroup>
<tbody><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">수령자 성명</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="list">${dto.receiver_name}</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">휴대폰 / 전화</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="list">${dto.tel1} / ${dto.tel2}</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">배송지 주소</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="list">${dto.address}</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td></tr>
<tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">배송 요구사항</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="list">${dto.delivery_request}</td>
</tr>
</tbody></table>

<div style="height:2px; background:#777777;" class="none">&nbsp;</div>

<!-- 배송지정보 end //-->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<!-- 결제정보 start //-->
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/arrow1.gif"></td>
    <td width="5"></td>
    <td><img src="/moyeo/resources/resource/img/shop/t41.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="height:2px; background:#bbbbbb;" class="none">&nbsp;</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_pay">
<colgroup>
    <col width="149">
    <col width="1">
    <col width="15">
    <col width="">
</colgroup>
<tbody><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">총 주문금액</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="t1" id="money1">${dto.payment_amount-2500} 원</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">쿠폰 할인</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="t2">0 원</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">적립금 할인</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="t2">0 원</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">배송비</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="t2">2,500 원</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">실 결제금액</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="t3" id="money2">${dto.payment_amount} 원</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">결제수단</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="t2">무통장 입금</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">입금은행</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="t2"> 신한은행 752-436-739113 (예금주 : 양우진)</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">입금자명</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="t2">${dto.receiver_name}</td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">영수증</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="t2">
    </td>
</tr>
</tbody></table>

<div style="height:2px; background:#777777;" class="none">&nbsp;</div>

<!-- 결제정보 end //-->
    </td>
    <td width="15"></td>
</tr>
</tbody></table>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="50"><td></td></tr>
</tbody></table>

<script type="text/javascript">
var tmp;

function dataPrint()
{

    beforePrint();

    window.print();

    setTimeout("afterPrint();", 1000);

}

function beforePrint()
{

    tmp = document.body.innerHTML;

    document.body.innerHTML = document.getElementById("print_data").innerHTML;

}

function afterPrint()
{

    document.body.innerHTML = tmp;

}
</script>
</body></html>