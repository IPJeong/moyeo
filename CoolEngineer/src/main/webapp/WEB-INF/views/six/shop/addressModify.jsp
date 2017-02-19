<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>모여샵 - 배송지 변경</title>

</head>
<body>
<div id="overlay"></div><div id="message_box"></div><div class="layout_top_bg"></div><!--[if IE 6]>
<script type="text/javascript">
/* IE6 PNG 배경투명 */
DD_belatedPNG.fix('.png');
</script>
<![endif]-->

<style type="text/css">
body {background-color:#f4f4f4;}
.box_bg {background-color:#ffffff;}
.top_bg {height:45px; background:url('/moyeo/resources/resource/img/shop/top_bg2.gif') repeat-x;}

.order_addr .title {font-weight:bold; line-height:14px; font-size:11px; color:#717171; font-family:dotum,돋움;}
.order_addr .list {line-height:16px; font-size:12px; color:#717171; font-family:gulim,굴림;}
.order_addr .zip {line-height:16px; font-size:11px; color:#8b8d8e; font-family:dotum,돋움;}
.order_addr .hyphen {line-height:14px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_addr .byte {line-height:14px; font-size:11px; color:#787878; font-family:dotum,돋움;}

.order_addr .input {width:94px; height:17px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_addr .input {line-height:17px; font-size:12px; color:#414141; font-family:gulim,굴림;}

.order_addr .textarea  {padding:3px; width:340px; height:40px; border:1px solid #c9c9c9;}
.order_addr .textarea  {line-height:15px; font-size:12px; color:#333333; font-family:dotum,돋움;}
</style>

<script type="text/javascript">
// byte 체크
function orderByte(content, bytes)
{

    var conts = document.getElementById(content);
    var bytes = document.getElementById(bytes);

    var i = 0;
    var cnt = 0;
    var exceed = 0;
    var ch = '';

    for (i=0; i<conts.value.length; i++) {

        ch = conts.value.charAt(i);

        if (escape(ch).length > 4) {

            cnt += 2;

        } else {

            cnt += 1;

        }

    }

    bytes.innerHTML = cnt;

/*
    if (cnt > 80) {

        exceed = cnt - 80;
        alert('메시지 내용은 80바이트를 넘을수 없습니다.\n\n작성하신 메세지 내용은 '+ exceed +'byte가 초과되었습니다.\n\n초과된 부분은 자동으로 삭제됩니다.');
        var tcnt = 0;
        var xcnt = 0;
        var tmp = conts.value;
        for (i=0; i<tmp.length; i++) {

            ch = tmp.charAt(i);

            if (escape(ch).length > 4) {

                tcnt += 2;

            } else {

                tcnt += 1;

            }

            if (tcnt > 80) {

                tmp = tmp.substring(0,i);
                break;

            } else {

                xcnt = tcnt;

            }

        }

        conts.value = tmp;
        bytes.innerHTML = xcnt;

        return;

    }
*/

}

function submitOrder()
{

    var f = document.formOrder;

    if (!f.order_rec_name.value) {

        alert("수령자명을 입력하세요.");
        f.order_rec_name.focus();
        return false;

    }

    if (!f.order_rec_hp1.value) {

        alert("휴대폰번호를 입력하십시오.");
        f.order_rec_hp1.focus();
        return false;

    }

    if (!f.order_rec_tel1.value) {

        alert("일반전화를 입력하십시오.");
        f.order_rec_tel1.focus();
        return false;

    }

    if (!f.roadAddrPart1.value) {

        alert("주소를 입력하세요.");
        f.roadAddrPart1.focus();
        return false;

    }

    if (!f.addrDetail.value) {

        alert("상세주소를 입력하세요.");
        f.addrDetail.focus();
        return false;

    }

    if (confirm("배송지정보를 변경하시겠습니까?")) {

        return true;

    } else {

        return false;

    }

}

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
		, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno){
// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
document.getElementById('roadAddrPart1').value = roadAddrPart1;
document.getElementById('addrDetail').value = addrDetail;
document.getElementById('zipNo').value = zipNo;
}

</script>

<form name="formOrder" action="addressModifyPro" onsubmit="return submitOrder();">
<input type="hidden" name="order_code" value="QG1702199468">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr class="top_bg">
    <td width="15"></td>
    <td><img src="/moyeo/resources/resource/img/shop/title2.png" class="png"></td>
</tr>
</tbody></table>





<div style="height:2px; background:#bbbbbb;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr>
    <td width="15"></td>
    <td>
<!-- 배송지정보 start //-->
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/arrow1.gif"></td>
    <td width="5"></td>
    <td><img src="/moyeo/resources/resource/img/shop/t122.gif"></td>
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
    <td class="list">${dto.receiver_name }</td>
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

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<!-- 변경배송지정보 start //-->
<table border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/arrow1.gif"></td>
    <td width="5"></td>
    <td><img src="/moyeo/resources/resource/img/shop/t22.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="height:2px; background:#bbbbbb;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_addr box_bg">
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
    <td><input type="text" name="order_rec_name" value="${dto.receiver_name}" class="input"></td>
	<input type="hidden" name="payment_num" value="${dto.payment_num}">
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">휴대폰</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_rec_hp1" value="${dto.tel1}" class="input" style="width:100px;"></td>
 </tr>
</tbody></table>
    </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">일반전화</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_rec_tel1" value="${dto.tel2}" class="input" style="width:100px;"></td>
</tr>
</tbody></table>
    </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">배송지 주소</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" id="zipNo" name="zipNo" value="" class="input" style="width:45px;" readonly></td>
    <td><a href="#" onclick="goPopup();"><img src="/moyeo/resources/resource/img/shop/find_addr2.gif" border="0"></a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" id="roadAddrPart1" name="roadAddrPart1" value="" class="input" style="width:340px;" readonly></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" id="addrDetail" name="addrDetail" value="" class="input" style="width:340px;"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>
    </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td></tr>
<tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">배송 요구사항</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><textarea id="order_memo" name="order_memo" class="textarea" onkeyup="orderByte('order_memo', 'order_memo_byte');">${dto.delivery_request}</textarea></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td class="byte">( <span id="order_memo_byte">0</span> / 120byte)</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<div style="height:2px; background:#777777;" class="none">&nbsp;</div>
<!-- 변경배송지정보 end //-->
    </td>
    <td width="15"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<div style="height:1px; background:#efefef;" class="none">&nbsp;</div>

<div style="height:1px; background:#e0e0e0;" class="none">&nbsp;</div>

<div style="height:1px; background:#ffffff;" class="none">&nbsp;</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="90">
    <td valign="top">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<center><table border="0" cellspacing="0" cellpadding="0" class="auto" style="align:center;">
<tbody><tr style="align:center;">
    <td><input type="image" src="/moyeo/resources/resource/img/shop/ok2.gif" border="0"></td>
    <td width="5"></td>
    <td><a href="#" onclick="window.close(); return false;"><img src="/moyeo/resources/resource/img/shop/close2.gif" border="0"></a></td>
</tr>
</tbody></table></center>
    </td>
</tr>
</tbody></table>
</form>
</body></html>