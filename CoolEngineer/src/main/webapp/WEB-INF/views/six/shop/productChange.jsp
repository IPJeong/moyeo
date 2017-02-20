<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>모여샵 - 교환신청</title>
<!--[if IE 6]>
<script type="text/javascript" src="./js/DD_belatedPNG_0.0.8a-min.js"></script>
<![endif]-->


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
.top_bg {height:45px; background:url('/moyeo/resources/resource/img/shop/top_bg.gif') repeat-x;}

.help_box .title {font-weight:bold; line-height:14px; font-size:11px; color:#717171; font-family:dotum,돋움;}
.help_box .list {line-height:16px; font-size:12px; color:#717171; font-family:gulim,굴림;}
.help_box .msg {line-height:16px; font-size:11px; color:#717171; font-family:gulim,굴림;}
.help_box .msg2 {line-height:16px; font-size:11px; color:#f26c4f; font-family:gulim,굴림;}
#code_msg {line-height:16px; font-size:12px; color:#717171; font-family:gulim,굴림;}

.help_box .category .select {line-height: 1.5; font-size:12px; color:#000000; font-family:"돋움",Dotum,Helvetica,AppleGothic,Sans-serif;}
.help_box .category .selectBox-dropdown {width:150px; height:19px;}
.help_box .category .selectBox-dropdown .selectBox-label {padding:1px 5px 1px 5px;}

/* 영역을 이탈하니 기본 셀렉트로만 해주자.
.help_box .email .select {line-height: 1.5; font-size:12px; color:#000000; font-family:"돋움",Dotum,Helvetica,AppleGothic,Sans-serif;}
.help_box .email .selectBox-dropdown {width:100px; height:19px;}
.help_box .email .selectBox-dropdown .selectBox-label {padding:1px 5px 1px 5px;}
*/

.help_box .input {width:94px; height:17px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.help_box .input {line-height:17px; font-size:12px; color:#414141; font-family:gulim,굴림;}

.help_box .file {width:300px; height:17px; border:1px solid #c9c9c9; padding:0px 3px 0px 3px;}
.help_box .file {line-height:17px; font-size:12px; color:#414141; font-family:gulim,굴림;}

.help_box .radio {width:13px; height:13px; position:relative; overflow:hidden; left:0; top:-1px;}

.help_box .textarea {padding:3px; width:425px; height:180px; border:1px solid #c9c9c9;}
.help_box .textarea {line-height:15px; font-size:12px; color:#333333; font-family:dotum,돋움;}

.title p {margin-top:10px;}

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
.order_list .dot {height:1px; background:url('/moyeo/resources/resource/img/shop/dot.gif') repeat-x;}
</style>

<script type="text/javascript">
window.onload = function() {

	var p1 = parseInt(document.getElementById("money").innerHTML);
	var p2 = parseInt(document.getElementById("money1").innerHTML);
	var p3 = parseInt(document.getElementById("money2").innerHTML);	
	
	
	document.getElementById("money").innerHTML = shopNumberFormat(String(p1)) + " 원";
	document.getElementById("money1").innerHTML = shopNumberFormat(String(p2)) + " 원";
	document.getElementById("money2").innerHTML = shopNumberFormat(String(p3)) + " 개";

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
}	
</script>

<script type="text/javascript">
// 이메일 선택
function helpEmail()
{

    var f = document.formHelp;

    if (f.user_email_list.value != '' && f.user_email_list.value != 'self') {

        f.user_email2.value = f.user_email_list.value;
        f.user_email2.style.display = "none";

    }

    else if (f.user_email_list.value == 'self') {

        f.user_email2.value = "";
        f.user_email2.focus();
        f.user_email2.style.display = "";

    }

}

// 유형 선택
function helpCategory(id)
{

    var order_pay_type = document.getElementById("order_pay_type").value;

    document.getElementById("return_layer").style.display = "none";

    if (order_pay_type == '4' || order_pay_type == '5') {

        if (id == '300' || id == '500') {

            document.getElementById("return_layer").style.display = "inline";

        }

    }

}

// 문의대상
function helpType(id, mode)
{

    document.getElementById("help_check").value = "";

    if (mode == 'reset') {

        document.getElementById("help_code").value = "";

    }

    if (id == '1' || id == '2') {

        document.getElementById("code_layer").style.display = "inline";

    } else {

        document.getElementById("code_layer").style.display = "none";

    }

    if (id == '1') {

        document.getElementById("code_msg").innerHTML = "주문번호 입력";

    }

    if (id == '2') {

        document.getElementById("code_msg").innerHTML = "상품번호 입력";

    }

    document.getElementById("help_data").innerHTML = "";

}

// 확인
function helpOk()
{

    var f = document.formHelp;

    if (f.help_code.value == '') {

        if (f.help_type[0].checked == true) {

            alert("주문번호를 입력하세요.");
            f.help_code.focus();

        }

        if (f.help_type[1].checked == true) {

            alert("상품번호를 입력하세요.");
            f.help_code.focus();

        }

        return false;

    }

    if (f.help_type[0].checked == true) {

        var help_type = "1";

    }

    if (f.help_type[1].checked == true) {

        var help_type = "2";

    }

    if (f.help_type[2].checked == true) {

        var help_type = "3";

    }

    $.post("./help_update.php", {"m" : "", "help_type" : help_type, "help_code" : f.help_code.value}, function(data) {

        $("#help_data").html(data);

        if (help_type == '1') {

            helpCategory(f.help_category.value);

        }

    });

}

// 찾기
function helpSearch()
{

    var f = document.formHelp;

    if (f.help_type[0].checked == true) {

        var help_type = "1";

    }

    if (f.help_type[1].checked == true) {

        var help_type = "2";

    }

    shopOpen("./help_search.php?help_type="+help_type, "helpSearch", "width=650, height=720, scrollbars=yes");

}

// 저장
function submitHelp()
{

    var f = document.formHelp;

    if (f.help_category.value == '') {

        alert("문의유형을 선택하세요.");
        return false;

    }

    if (f.help_type[0].checked == true || f.help_type[1].checked == true) {

        // 확인되지 않았다
        if (f.help_check.value == '' || f.help_code.value == '' || f.help_check.value != f.help_code.value) {
    
            if (f.help_type[0].checked == true) {
    
                alert("주문번호를 입력하신 후 확인버튼을 눌러주세요.");
                f.help_code.focus();
    
            }
    
            if (f.help_type[1].checked == true) {
    
                alert("상품번호를 입력하신 후 확인버튼을 눌러주세요.");
                f.help_code.focus();
    
            }
    
            return false;
    
        }

    }

    if (f.subject.value == '') {

        alert("상담 제목을 입력하세요.");
        f.subject.focus();
        return false;

    }

    if (f.content.value == '') {

        alert("상담 내용을 입력하세요.");
        f.content.focus();
        return false;

    }

    if (document.getElementById("return_layer").style.display == 'inline') {

        if (f.order_refund_holder.value == '') {

            alert("예금주명을 입력하세요.");
            f.order_refund_holder.focus();
            return false;

        }

        if (f.order_refund_number.value == '') {

            alert("계좌번호을 입력하세요.");
            f.order_refund_number.focus();
            return false;

        }

        if (f.order_refund_code.value == '') {

            alert("은행을 선택하세요.");
            f.order_refund_code.focus();
            return false;

        }
/*
        if (f.order_refund_jumin.value == '') {

            alert("예금주 주민등록번호를 입력하세요.");
            f.order_refund_jumin.focus();
            return false;

        }
*/

    }

    f.user_email.value = f.user_email1.value+"@"+f.user_email2.value;
    f.user_hp.value = f.user_hp1.value+"-"+f.user_hp2.value+"-"+f.user_hp3.value;

    if (confirm("상담내용을 접수하시겠습니까?")) {

        return true;

    } else {

        return false;

    }

}
</script>


<form method="post" name="formHelp" action="./help_update.php" onsubmit="return submitHelp();" enctype="multipart/form-data" autocomplete="off">
<input type="hidden" id="order_pay_type" name="order_pay_type" value="5">
<input type="hidden" id="help_check" name="help_check" value="BP1702206518">
<input type="hidden" name="m" value="help">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr class="top_bg">
    <td width="15"></td>
    <td><img src="/moyeo/resources/resource/img/shop/5title.png" class="png"></td>
</tr>
</tbody></table>

<div style="height:2px; background:#bbbbbb;" class="none">&nbsp;</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr>
    <td width="15"></td>
    <td>
<!-- 문의유형 start //-->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/5help_arrow.gif"></td>
    <td width="5"></td>
    <td><img src="/moyeo/resources/resource/img/shop/5t1.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="height:2px; background:#bbbbbb;" class="none">&nbsp;</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="help_box">
<colgroup>
    <col width="149">
    <col width="1">
    <col width="15">
    <col width="">
</colgroup>
<tbody><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">문의 유형</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td class="category">
<select id="help_category" name="help_category" class="select selectBox" style="display: none;">
    <option value="">문의유형을 선택해 주세요.</option>
    <option value="200">상품배송</option>
    <option value="300">주문취소</option>
    <option value="400">교환신청</option>
    <option value="500">환불</option>
    <option value="1">A/S 관련</option>
    <option value="2">영수증/계산서</option>
    <option value="3">이벤트/행사</option>
    <option value="4">쇼핑몰 이용</option>
    <option value="0">기타</option>
</select><a class="selectBox select selectBox-dropdown" style="display: inline-block;" title="" tabindex="0"><span class="selectBox-label">교환신청</span><span class="selectBox-arrow"></span></a>

<script type="text/javascript">
document.getElementById('help_category').value = "300";
</script>
    </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#dddddd"></td>
</tr>
</tbody></table>

<div style="height:2px; background:#777777;" class="none">&nbsp;</div>

<!-- 문의유형 end //-->

<!-- 문의대상정보 start //--><table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<div id="help_data"><meta http-equiv="content-type" content="text/html; charset=utf-8"><table border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/5help_arrow.gif"></td>
    <td width="5"></td>
    <td><img src="/moyeo/resources/resource/img/shop/5t2.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="10">
    <td></td>
</tr>
</tbody></table>

<!-- 주문정보 start //-->
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
    <td align="center" class="money" id="money">${dto.payment_amount}</td>
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
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<!-- 주문상품목록 start //-->
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
    <td align="center" class="limit" id="money2">${dto.order_qty} 개</td>
    <td bgcolor="#efefef"></td>
    <td align="center" class="money" id="money1">${dto.payment_amount} 원</td>
</tr>
</tbody></table>

<div style="height:2px; background:#efefef;" class="none">&nbsp;</div>

<!-- 주문상품목록 end //-->

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="30"><td></td></tr>
</tbody></table>


</div>
<!-- 문의대상정보 end //-->

<!-- 내용작성 start //-->
<table border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/5help_arrow.gif"></td>
    <td width="5"></td>
    <td><img src="/moyeo/resources/resource/img/shop/5t3.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="height:1px; background:#bbbbbb;" class="none">&nbsp;</div>


<table width="100%" border="0" cellspacing="0" cellpadding="0" class="box_bg">
<tbody><tr height="1"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="help_box box_bg">
<colgroup>
    <col width="149">
    <col width="1">
    <col width="15">
    <col width="">
</colgroup>
<tbody><tr height="30">
    <td bgcolor="#f7f7f7" align="center" class="title">상담 제목</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td><input type="text" name="subject" class="input" style="width:425px;"></td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr><tr>
    <td bgcolor="#f7f7f7" align="center" class="title">상담 내용</td>
    <td bgcolor="#e4e4e4"></td>
    <td></td>
    <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<textarea name="content" class="textarea"></textarea>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>
    </td>
</tr>
<tr><td colspan="4" height="1" bgcolor="#bbbbbb"></td>
</tr>
</tbody></table>

<div style="height:2px; background:#777777;" class="none">&nbsp;</div>

<!-- 내용작성 end //-->

<!-- 환불정보 start //-->

<!-- 환불정보 end //-->


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

<center><table border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><input type="image" src="/moyeo/resources/resource/img/shop/5submit.gif" border="0"></td>
    <td width="5"></td>
    <td><a href="#" onclick="window.close(); return false;"><img src="/moyeo/resources/resource/img/shop/5cancel.gif" border="0"></a></td>
</tr>
</tbody></table>
</center>
</td>
</tr>
</tbody></table>
</form>
<ul class="selectBox-dropdown-menu selectBox-options select-selectBox-dropdown-menu" style="display: none;"><li><a rel="">문의유형을 선택해 주세요.</a></li><li><a rel="200">상품배송</a></li><li class="selectBox-selected"><a rel="300">주문취소</a></li><li><a rel="400">교환</a></li><li><a rel="500">환불</a></li><li><a rel="1">A/S 관련</a></li><li><a rel="2">영수증/계산서</a></li><li><a rel="3">이벤트/행사</a></li><li><a rel="4">쇼핑몰 이용</a></li><li><a rel="0">기타</a></li></ul></body></html>