<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/header2.jsp"%>

<style>
td.none {
	height:1px;
}
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


body {background-color:#ffffff;}
.layout_top {width:1000px; margin:0 auto;}
.layout_contents {width:1000px; margin:0 auto;}
.layout_contents:after {display:block; clear:both; content:'';}
.layout_main {width:1000px;}
.layout_bottom {position:relative; width:1000px; margin:0 auto;}

.order_position .home {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}
.order_position .off {line-height:14px; font-size:11px; color:#9e9e9e; font-family:gulim,굴림;}

.order_top .bg {height:79px; background:url('/moyeo/resources/resource/img/shop/top_bg.gif') repeat-x;}

.order_message .title {line-height:14px; font-size:11px; color:#787878; font-family:dotum,돋움;}

.order_title .bg1 {width:2px; height:30px; background:url('/moyeo/resources/resource/img/shop/title_bg1.gif') no-repeat;}
.order_title .bg2 {height:30px; background:url('/moyeo/resources/resource/img/shop/title_bg2.gif') repeat-x;}
.order_title .bg3 {width:2px; background:url('/moyeo/resources/resource/img/shop/title_bg3.gif') no-repeat;}

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

.order_sum.bg {height:88px; background:url('/moyeo/resources/resource/img/shop/bg.gif') no-repeat;}
.order_sum .money1 {font-weight:bold; line-height:28px; font-size:26px; color:#626262; font-family:Tahoma,dotum,gulim;}
.order_sum .money2 {font-weight:bold; line-height:28px; font-size:26px; color:#cc1414; font-family:Tahoma,dotum,gulim;}
.order_sum .won1 {font-weight:bold; line-height:15px; font-size:13px; color:#787878; font-family:gulim,굴림;}
.order_sum .won2 {font-weight:bold; line-height:15px; font-size:13px; color:#cc1414; font-family:gulim,굴림;}
.order_sum .sign {margin-top:18px;}

.order_buy_title .bg {height:35px; background:url('/moyeo/resources/resource/img/shop/title_bg.gif') repeat-x;}
.order_buy .input {width:94px; height:17px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_buy .input {line-height:17px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_buy .input2 {width:342px; height:19px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_buy .input2 {line-height:19px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_buy .hyphen {line-height:14px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_buy .title {line-height:14px; font-size:11px; color:#787878; font-family:dotum,돋움;}
.order_buy .help {line-height:14px; font-size:11px; color:#787878; font-family:dotum,돋움;}

.order_addr_title .bg {height:35px; background:url('/moyeo/resources/resource/img/shop/title_bg.gif') repeat-x;}
.order_addr .input {width:94px; height:17px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_addr .input {line-height:17px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_addr .input2 {width:342px; height:19px; border:1px solid #c9c9c9; padding:1px 3px 0px 3px;}
.order_addr .input2 {line-height:19px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_addr .hyphen {line-height:14px; font-size:12px; color:#414141; font-family:gulim,굴림;}
.order_addr .textarea  {padding:3px; width:342px; height:40px; border:1px solid #c9c9c9;}
.order_addr .textarea  {line-height:15px; font-size:12px; color:#333333; font-family:dotum,돋움;}
.order_addr .title {line-height:14px; font-size:11px; color:#787878; font-family:dotum,돋움;}
.order_addr .user {line-height:17px; font-size:12px; color:#787878; font-family:dotum,돋움;}

.order_pay_title {height:35px; background:url('/moyeo/resources/resource/img/shop/title_bg.gif') repeat-x;}

.order_pay .pay_bg {width:250px; height:50px; background:url('/moyeo/resources/resource/img/shop/pay_bg.gif') no-repeat;}
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
<script>
function shopNumberFormat(data) 
{

    var tmp = '';
    var number = '';
    var cutlen = 3;
    var comma = ',';
    var i;

    len = data.length;
    mod = (len % cutlen);
    k = cutlen - mod;

    for (i=0; i<data.length; i++) {

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





//결제수단별 메세지
var order_pay_msg1 = "<font color='#6d71d0'>[신용카드]</font> 온라인상에서 소유하신 신용카드를 통해, 전자결제를 진행 합니다.";
var order_pay_msg2 = "<font color='#6d71d0'>[실시간 계좌이체]</font> 주민번호, 계좌정보, 공인인증서를 통해 실시간 계좌이체를 진행 합니다.";
var order_pay_msg3 = "<font color='#6d71d0'>[휴대폰 결제]</font> 휴대폰 번호와 주민번호를 이용하여, SMS 인증을 통한 결제가 진행 됩니다.";
var order_pay_msg4 = "<font color='#6d71d0'>[가상계좌]</font> 원하시는 은행으로 가상계좌를 발급해 드리며, 발급된 계좌로 구매대금을 직접 송금 합니다.";
var order_pay_msg5 = "<font color='#6d71d0'>[무통장 입금]</font> 쇼핑몰의 대표 계좌로 구매대금을 직접 송금 합니다.";

function shopNumeric(input)
{

    var chars = "0123456789";

    return shopContainsCharsOnly(input,chars);

}

function shopContainsCharsOnly(input, chars)
{

    for (var i=0; i< input.length; i++) {

        if (chars.indexOf(input.charAt(i)) == -1) {

            return false;

        }

  }

  return  true;

}

// 주문체크
function orderCheck()
{

    var f = document.formOrder;

    // 적립금 사용
    if (user_cash_use) {

        var order_cash = parseInt(document.getElementById("order_cash").value);
    
        // 공백
        if (document.getElementById("order_cash").value == '') {
    
            // 0원으로 설정
            var order_cash = parseInt(0);
    
        }
    
        if (!shopNumeric(document.getElementById("order_cash").value)) {
    
            alert("숫자만 입력하여 주세요.");
            document.getElementById("order_cash").value = "0";
            orderCheck();
            return false;
    
        }

        if (document.getElementById("order_cash").value.charAt(0) == '0' && document.getElementById("order_cash").value.length > 1) {
    
            alert("적립금의 첫문자는 '0'로 시작할 수 없습니다.");
            document.getElementById("order_cash").value = "0";
            orderCheck();
            return false;
    
        }

        if (user_cash < order_cash_min && order_cash) {

            alert("보유하신 적립금이 "+order_cash_min+"원 이상일 때만 사용이 가능합니다.");
            document.getElementById("order_cash").value = "0";
            orderCheck();
            return false;

        }

        // 보유적립금 초과
        if (user_cash >= 0 && user_cash < order_cash) {
    
            alert("보유한 적립금이 부족합니다.");
            document.getElementById("order_cash").value = "0";
            orderCheck();
            return false;
    
        }

    } else {
    // 미사용

        var order_cash = parseInt(0);

    }

    // 결제수단
    var pay_type = "";
    for (var i=0; i<f.order_pay_type.length; i++) {

        if (f.order_pay_type[i].checked == true) {

            pay_type = f.order_pay_type[i].value;
            break;

        }

    }

    // 기본 결제금액
    var order_money = order_total_money - order_cash;

    // 카드결제
    if (pay_type == '1' && order_money) {

        // 총 결제금액 증가
        var order_pay_money = (order_money + (order_money * order_card_percent)).toFixed(0);

    }

    // 휴대폰결제
    else if (pay_type == '3' && order_money) {

        // 총 결제금액 증가
        var order_pay_money = (order_money + (order_money * order_mobile_percent)).toFixed(0);

    } else {
    // 일반수단

        // 기본 결제금액
        var order_pay_money = order_money;

    }

    // 마이너스이면
    if (order_pay_money < 0) {

        alert("결제금액이 마이너스 입니다.\n\n주문을 다시 확인하시기 바랍니다.");

        if (user_cash_use) {

            document.getElementById("order_cash").value = "0";

        }

        orderCheck();
        return false;

    }

    document.getElementById("order_pay_money").value = order_pay_money;
    document.getElementById("order_total_money_view").innerHTML = shopNumberFormat(String(order_pay_money));
    document.getElementById("order_pay_money_view").innerHTML = shopNumberFormat(String(order_pay_money))+" 원";

    if (user_cash_use) {

        document.getElementById("order_cash_view").innerHTML = shopNumberFormat(String(order_cash));

    }

}

// 적립금
function orderCash()
{

    // 적립금이 많다
    if (user_cash > order_total_money) {

        document.getElementById("order_cash").value = order_total_money;

    } else {
    // 부족하다

        document.getElementById("order_cash").value = user_cash;

    }

    orderCheck();

}

// 플러그인 체크
function orderPluginCheck()
{

    if (navigator.userAgent.indexOf('MSIE') > 0 || navigator.userAgent.indexOf('Trident/7.0') > 0) {

        if (document.Payplus.object != null) {

            return true;

        }

    } else {

        var inst = 0;
        for (var i = 0; i < navigator.plugins.length; i++) {

            if (navigator.plugins[i].name == "KCP") {

                inst = 1;

            }

        }

        if (inst == 1) {

            return true;

        } else {

            document.location.href = GetInstallFile();

        }

    }

    alert("플러그인을 설치하여주시기 바랍니다.\n이미 설치되어있는 경우에는 도구 -> 호환성 보기 설정 -> ‘이 웹 사이트 추가’를 해주시기 바랍니다.");
    return false;

}

// 결제
function orderSave()
{

    orderCheck();

/*
    // 플러그인 검증
    var plugin = orderPluginCheck();
    if (!plugin) {
        return false;
    }
*/

    var f = document.formOrder;

    // 적립금 사용
    if (user_cash_use) {

        // 공백
        if (document.getElementById("order_cash").value == '' || !document.getElementById("order_cash").value) {
    
            // 0원으로 설정
            var order_cash = parseInt(0);
    
        } else {

            var order_cash = parseInt(document.getElementById("order_cash").value);

        }

    } else {

        var order_cash = parseInt(0);

    }

    // 결제수단
    var pay_type = "";
    for (var i=0; i<f.order_pay_type.length; i++) {

        if (f.order_pay_type[i].checked == true) {

            pay_type = f.order_pay_type[i].value;

            break;

        }

    }

    // 무통장 결제만 가능한 쿠폰
    if (order_coupon_bank && pay_type != '5') {

        alert("무통장 결제만 가능한 쿠폰이 적용되었습니다.");
        return false;

    }

    // 적립금 사용불가 쿠폰
    if (order_coupon_cash && order_cash > 0) {

        alert("적립금을 사용할 수 없는 쿠폰이 적용되었습니다.");
        return false;

    }


    if (f.order_rec_name.value == '') {

        alert("수령자명을 입력하세요.");
        f.order_rec_name.focus();
        return false;

    }

    if (f.order_rec_addr1.value == '') {

        alert("주소를 입력하세요.");
        f.order_rec_addr1.focus();
        return false;

    }

    if (f.order_rec_addr2.value == '') {

        alert("상세주소를 입력하세요.");
        f.order_rec_addr2.focus();
        return false;

    }

    if (f.order_rec_hp1.value == '') {

        alert("휴대폰번호를 입력하세요.");
        f.order_rec_hp1.focus();
        return false;

    }

    if (f.order_rec_hp2.value == '') {

        alert("휴대폰번호를 입력하세요.");
        f.order_rec_hp2.focus();
        return false;

    }

    if (f.order_rec_hp3.value == '') {

        alert("휴대폰번호를 입력하세요.");
        f.order_rec_hp3.focus();
        return false;

    }

    if (f.order_rec_tel1.value == '') {

        alert("집전화를 입력하세요.");
        f.order_rec_tel1.focus();
        return false;

    }

    if (f.order_rec_tel2.value == '') {

        alert("집전화를 입력하세요.");
        f.order_rec_tel2.focus();
        return false;

    }

    if (f.order_rec_tel3.value == '') {

        alert("집전화를 입력하세요.");
        f.order_rec_tel3.focus();
        return false;

    }

    if (f.order_receipt.value == '1' || f.order_receipt.value == '2') {

        var receipt_type = $("input[name='order_receipt_type']:checked").val();
        var receipt_name = $('#tmp'+receipt_type+'_order_receipt_name');
        var receipt_number = $('#tmp'+receipt_type+'_order_receipt_number');

        if (receipt_name.val() == '') {

            alert("항목을 입력하세요.");
            receipt_name.focus();
            return false;

        }

        if (receipt_number.val() == '') {

            alert("항목을 입력하세요.");
            receipt_number.focus();
            return false;

        }

        f.order_receipt_name.value = receipt_name.val();
        f.order_receipt_number.value = receipt_number.val();

    } else {

        f.order_receipt_name.value = "";
        f.order_receipt_number.value = "";

    }

    if (confirm("결제 하시겠습니까?")) {

        f.action = order_pay_url;
        //f.target = "order_update";
        f.submit();

    } else {

        return false;

    }

}

// 결제수단
function orderPayType(id)
{

    orderCheck();

    document.getElementById("order_pay_message").innerHTML = eval("order_pay_msg"+id);

    if (id == '5') {

        document.getElementById("order_pay_bank").style.display = "inline";

    } else {

        document.getElementById("order_pay_bank").style.display = "none";

    }

}

// 결제수단 로드
function orderPayTypeLoad()
{

    var f = document.formOrder;

    if (f.order_pay_type[0]) {

        f.order_pay_type[0].checked = true;
        orderPayType(f.order_pay_type[0].value);

    } else {

        f.order_pay_type.checked = true;
        orderPayType(f.order_pay_type.value);

    }

}

// 영수증 선택
function orderReceipt(receipt)
{

    $('#order_receipt_layer1').hide();
    $('#order_receipt_layer2').hide();
    $('#order_receipt_layer'+receipt).show();

    if (receipt == '1') {

        shopElementFocus('formOrder', 'order_receipt_type', '0');
        orderReceiptType('0');

    }

    if (receipt == '2') {

        shopElementFocus('formOrder', 'order_receipt_type', '3');
        orderReceiptType('3');

    }

}

// 영수증 발급방식
function orderReceiptType(receipt_type)
{

    $('#order_receipt_type_layer0').hide();
    $('#order_receipt_type_layer1').hide();
    $('#order_receipt_type_layer2').hide();
    $('#order_receipt_type_layer3').hide();
    $('#order_receipt_type_layer4').hide();
    $('#order_receipt_type_layer'+receipt_type).show();

}

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

// 주소자동입력 (회원)
function orderAddr(mode)
{

    var f = document.formOrder;

    if (mode == 'insert') {

        f.order_rec_name.value = order_rec_name;
        f.order_rec_zip1.value = order_rec_zip1;
        f.order_rec_zip2.value = order_rec_zip2;
        f.order_rec_addr1.value = order_rec_addr1;
        f.order_rec_addr2.value = order_rec_addr2;
        f.order_rec_hp1.value = order_rec_hp1;
        f.order_rec_hp2.value = order_rec_hp2;
        f.order_rec_hp3.value = order_rec_hp3;
        f.order_rec_tel1.value = order_rec_tel1;
        f.order_rec_tel2.value = order_rec_tel2;
        f.order_rec_tel3.value = order_rec_tel3;

    } else {

        f.order_rec_name.value = "";
        f.order_rec_zip1.value = "";
        f.order_rec_zip2.value = "";
        f.order_rec_addr1.value = "";
        f.order_rec_addr2.value = "";
        f.order_rec_hp1.value = "";
        f.order_rec_hp2.value = "";
        f.order_rec_hp3.value = "";
        f.order_rec_tel1.value = "";
        f.order_rec_tel2.value = "";
        f.order_rec_tel3.value = "";

    }

}

// 주소자동입력 (비회원)
function orderAddr2()
{

    var f = document.formOrder;

    if (f.addr_type.checked == true) {

        f.order_rec_name.value = f.order_name.value;
        f.order_rec_zip1.value = f.order_zip1.value;
        f.order_rec_zip2.value = f.order_zip2.value;
        f.order_rec_addr1.value = f.order_addr1.value;
        f.order_rec_addr2.value = f.order_addr2.value;
        f.order_rec_hp1.value = f.order_hp1.value;
        f.order_rec_hp2.value = f.order_hp2.value;
        f.order_rec_hp3.value = f.order_hp3.value;
        f.order_rec_tel1.value = f.order_tel1.value;
        f.order_rec_tel2.value = f.order_tel2.value;
        f.order_rec_tel3.value = f.order_tel3.value;

    } else {

        f.order_rec_name.value = "";
        f.order_rec_zip1.value = "";
        f.order_rec_zip2.value = "";
        f.order_rec_addr1.value = "";
        f.order_rec_addr2.value = "";
        f.order_rec_hp1.value = "";
        f.order_rec_hp2.value = "";
        f.order_rec_hp3.value = "";
        f.order_rec_tel1.value = "";
        f.order_rec_tel2.value = "";
        f.order_rec_tel3.value = "";

    }

}

// 쿠폰
function cartCoupon(cart_id)
{

    shopOpen(shop_path+"/coupon_apply.php?coupon_page=order&cart_id="+cart_id, "couponApply", "width=650, height=700, scrollbars=yes");

}

// sms 발송
function smsSelfSend(order_code)
{

    var sms_message = $("#sms_message").val();
    var sms_hp1 = $("#sms_hp1").val();
    var sms_hp2 = $("#sms_hp2").val();

    if (sms_message == '') {

        alert("메세지 내용을 입력하세요.");
        return false;

    }

    if (sms_hp1 == '') {

        alert("수신번호를 입력하세요.");
        return false;

    }

    if (sms_hp2 == '') {

        alert("발신번호를 입력하세요.");
        return false;

    }

    $.post(shop_path+"/order_ok_sms.php", {"order_code" : order_code, "sms_message" : sms_message, "sms_hp1" : sms_hp1, "sms_hp2" : sms_hp2}, function(data) {

        $("#order_ok_update").html(data);

    });

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
					<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;">
<!-- 본문시작 -->
	<div style="border:1px solid #efefef; background-color:#f7f7f7;">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_position">
<tbody><tr height="30">
    <td width="10"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
<td><a href="http://dmshop.kr/" class="home">홈</a></td><td width="20" align="center"><img src="/moyeo/resources/resource/img/shop/arrow.gif" class="up1"></td><td><span class="off">주문/결제</span></td></tr>
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
    <td width="4"><img src="/moyeo/resources/resource/img/shop/top_bg_side1.gif"></td>
    <td width="610"><img src="/moyeo/resources/resource/img/shop/top_bg_title.gif"></td>
    <td class="bg none">&nbsp;</td>
    <td width="4"><img src="/moyeo/resources/resource/img/shop/top_bg_side2.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_message">
<tbody><tr height="40">
    <td class="title">주문상품 목록을 확인 &gt; 적립금 적용 &gt; 배송정보 입력 &gt; 결제수단 선택 순으로 진행 합니다.</td>
</tr>
</tbody></table>

<div style="height:1px; background:#efefef;" class="none">&nbsp;</div>

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
    <td align="center"><img src="/moyeo/resources/resource/img/shop/title_item.gif"></td>
    <td width="1"></td>
    <td width="60" align="center"><img src="/moyeo/resources/resource/img/shop/title_limit.gif"></td>
    <td width="1"></td>
    <td width="90" align="center"><img src="/moyeo/resources/resource/img/shop/title_money.gif"></td>
    <td width="1"></td>
    <td width="90" align="center"><img src="/moyeo/resources/resource/img/shop/title_coupon.gif"></td>
    <td width="1"></td>
    <td width="90" align="center"><img src="/moyeo/resources/resource/img/shop/title_total.gif"></td>
    <td width="1"></td>
    <td width="90" align="center"><img src="/moyeo/resources/resource/img/shop/title_delivery.gif"></td>
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
<input type="hidden" id="order_total_money" name="order_total_money" value="${product_price * order_limit + 2500}">
<input type="hidden" id="order_total_item_money" name="order_total_item_money" value="1000">
<input type="hidden" id="order_total_coupon" name="order_total_coupon" value="0">
<input type="hidden" id="order_pay_money" name="order_pay_money" value="${product_price * order_limit + 2500}">
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
    <td width="84" valign="top"><div style="border:1px solid #e0e0e0;"><a href="productDetail?product_num=${product_num}"><img src="${pic_path}/${pic_name}" width="82" height="82" border="0"></a></div></td>
    <td width="15"></td>
    <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><a href="productDetail?product_num=${product_num}" class="title">${product_name}</a></td>
</tr>
</tbody></table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="8"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><a href="productDetail?product_num=${product_num}" target="_blank"><img src="/moyeo/resources/resource/img/shop/blank.gif" border="0"></a></td>
</tr>
</tbody></table>
    </td>
    <td width="20"></td>
</tr>
</tbody></table>
    </td>
    <td class="line_h"></td>
    <td class="limit" align="center">${order_limit}</td>
    <td class="line_h"></td>
    <td class="money" align="center">${product_price * order_limit} 원</td>
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
    <td><a href="#" onclick="cartCoupon('3'); return false;"><img src="/moyeo/resources/resource/img/shop/coupon.gif" border="0"></a></td>
</tr>
</tbody></table>
    </td>
    <td class="line_h"></td>
    <td class="total" align="center">${product_price * order_limit} 원</td>
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
    <td><a href="http://dmshop.kr/cart.php"><img src="/moyeo/resources/resource/img/shop/cart.gif" border="0"></a></td>
    <td width="10"></td>
    <td class="title">주문상품의 변경과 쿠폰을 적용하고자 하신다면 장바구니로 돌아가 다시 진행하시기 바랍니다.</td>
</tr>
</tbody></table>

<!-- 적립금사용 start //-->
<!-- 적립금사용 end //-->

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

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
    <td><img src="/moyeo/resources/resource/img/shop/sum_money.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="4"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><span class="money1">${product_price * order_limit}</span></td>
    <td width="5"></td>
    <td><span class="won1">원</span></td>
</tr>
</tbody></table>
    </td>
    <td width="50" align="center"><img src="/moyeo/resources/resource/img/shop/sign1.gif" class="sign"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="14">
    <td><img src="/moyeo/resources/resource/img/shop/sum_delivery.gif"></td>
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
    <td width="50" align="center"><img src="/moyeo/resources/resource/img/shop/sign2.gif" class="sign"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="14">
    <td><img src="/moyeo/resources/resource/img/shop/sum_coupon.gif"></td>
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
    <td width="50" align="center"><img src="/moyeo/resources/resource/img/shop/sign3.gif" class="sign"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="14">
    <td><img src="/moyeo/resources/resource/img/shop/sum_total.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="4"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><span id="order_total_money_view" class="money2">${product_price * order_limit + 2500}</span></td>
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

<div style="height:1px; background:#6d6d6d;" class="none">&nbsp;</div>
<!-- 결제금액합산 end //-->

<table align="center" border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr height="60">
    <td><img src="/moyeo/resources/resource/img/shop/arrow2.gif"></td>
</tr>
</tbody></table>

<!-- 배송정보입력 start //-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_addr_title">
<tbody><tr>
    <td width="5"><img src="/moyeo/resources/resource/img/shop/title_side1.gif"></td>
    <td class="bg" align="center"><img src="/moyeo/resources/resource/img/shop/title_addr.gif"></td>
    <td width="5"><img src="/moyeo/resources/resource/img/shop/title_side2.gif"></td>
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
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10"><img src="/moyeo/resources/resource/img/shop/arrow3.gif"></td>
    <td width="100"><img src="/moyeo/resources/resource/img/shop/order_rec_name.gif"></td>
    <td><input type="text" name="order_rec_name" value="" class="input" style="float:left"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="10" valign="top" style="padding-top:8px;"><img src="/moyeo/resources/resource/img/shop/arrow3.gif"></td>
    <td width="100" valign="top" style="padding-top:6px;"><img src="/moyeo/resources/resource/img/shop/order_addr.gif"></td>
    <td valign="top">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" style="width:90px; margin-right:5px;"name="order_rec_zip1" id="zipNo" value="" readonly="" class="input" style="width:40px;"></td>
    <td><a href="#" onclick="goPopup();"><img src="/moyeo/resources/resource/img/shop/find_addr.gif" border="0"></a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_rec_addr1" id="roadAddrPart1" value="" readonly="" class="input2"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="text" name="order_rec_addr2" id="addrDetail" value="" class="input2"></td>
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
    <td width="10"><img src="/moyeo/resources/resource/img/shop/arrow3.gif"></td>
    <td width="100"><img src="/moyeo/resources/resource/img/shop/order_hp.gif"></td>
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
    <td width="10"><img src="/moyeo/resources/resource/img/shop/arrow3.gif"></td>
    <td width="100"><img src="/moyeo/resources/resource/img/shop/order_tel.gif"></td>
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
    <td width="10" valign="top" style="padding-top:6px;"><img src="/moyeo/resources/resource/img/shop/arrow3.gif"></td>
    <td width="100" valign="top" style="padding-top:4px;"><img src="/moyeo/resources/resource/img/shop/order_memo.gif"></td>
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

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>
<!-- 배송정보입력 end //-->

<table align="center" border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr height="60">
    <td><img src="/moyeo/resources/resource/img/shop/arrow2.gif"></td>
</tr>
</tbody></table>

<!-- 결제수단선택 start //-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_pay_title">
<tbody><tr>
    <td width="5"><img src="/moyeo/resources/resource/img/shop/title_side1.gif"></td>
    <td class="bg" align="center"><img src="/moyeo/resources/resource/img/shop/title_pay.gif"></td>
    <td width="5"><img src="/moyeo/resources/resource/img/shop/title_side2.gif"></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="order_pay">
<tbody><tr>
    <td width="1" bgcolor="#d6d6d6"></td>
    <td>
<div style="height:1px; background:#ffffff;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="80" bgcolor="#f5f5f5">
    <td width="144" align="center"><img src="/moyeo/resources/resource/img/shop/title_pay_money.gif"></td>
    <td>
<table width="250" border="0" cellspacing="0" cellpadding="0" class="pay_bg">
<tbody><tr>
    <td align="center"><span id="order_pay_money_view" class="money">${product_price * order_limit + 2500} 원</span></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="144" align="center"><img src="/moyeo/resources/resource/img/shop/title_pay_type.gif"></td>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="radio" style="width:13px;" name="order_pay_type" value="1" class="radio" checked="" onclick="orderPayType(this.value);"></td>
    <td width="5"></td>
    <td class="title">신용카드</td>
    <td width="15"></td>
    <td><input type="radio" style="width:13px;" name="order_pay_type" value="2" class="radio" onclick="orderPayType(this.value);"></td>
    <td width="5"></td>
    <td class="title">실시간 계좌이체</td>
    <td width="15"></td>
    <td><input type="radio" style="width:13px;" name="order_pay_type" value="3" class="radio" onclick="orderPayType(this.value);"></td>
    <td width="5"></td>
    <td class="title">휴대폰 결제</td>
    <td width="15"></td>
    <td><input type="radio" style="width:13px;" name="order_pay_type" value="5" class="radio" onclick="orderPayType(this.value);"></td>
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
    <td><img src="/moyeo/resources/resource/img/shop/order_dep_name.gif"></td>
    <td width="20"></td>
    <td><input type="text" name="order_dep_name" value="" class="input" style="width:92px;"></td>
    <td width="50"></td>
    <td><img src="/moyeo/resources/resource/img/shop/order_receipt.gif"></td>
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

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="35" bgcolor="#fbfbfb">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="28"></td>
    <td><img src="/moyeo/resources/resource/img/shop/order_receipt_type.gif"></td>
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

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

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

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>
</div>

<div id="order_receipt_layer2" style="display:none;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="35" bgcolor="#fbfbfb">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="28"></td>
    <td><img src="/moyeo/resources/resource/img/shop/order_receipt_type.gif"></td>
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

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

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

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>

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

<div style="height:1px; background:#d6d6d6;" class="none">&nbsp;</div>
<!-- 결제수단선택 end //-->

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="10"><td></td></tr>
</tbody></table>

<div style="height:2px; background:#d6d6d6;" class="none">&nbsp;</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30"><td></td></tr>
</tbody></table>

<table align="center" border="0" cellspacing="0" cellpadding="0" class="auto">
<tbody><tr>
    <td><a href="#"><img src="/moyeo/resources/resource/img/shop/cart_go.gif" border="0"></a></td>
    <td width="5"></td>
    <td><a href="#" onclick="orderSave(); return false;"><img src="/moyeo/resources/resource/img/shop/order_pay.gif" border="0"></a></td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="50"><td></td></tr>
</tbody></table>

<table align="center" border="0" cellspacing="0" cellpadding="0" class="auto order_help">
<tbody><tr>
    <td>
<div style="padding:20px 68px; border:1px solid #d6d6d6;">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/dot.gif" class="up1"></td>
    <td width="5"></td>
    <td class="title">결제하기 버튼을 클릭하여, 선택하신 결제수단으로 결제를 진행해 주시기 바랍니다.</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="6"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/dot.gif" class="up1"></td>
    <td width="5"></td>
    <td class="title">처음 구매시, 결제를 위해 회원님의 PC에 전자결제 모듈이 설치를 진행해 주세요.</td>
</tr>
</tbody></table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="6"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><img src="/moyeo/resources/resource/img/shop/dot.gif" class="up1"></td>
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
var order_total_money = parseInt(document.getElementById("order_total_money").value);
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

<script type="text/javascript">
var order_pay_url = "order";
</script>

<script type="text/javascript" src="/moyeo/resources/customScript/six/order.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    orderByte('order_memo', 'order_memo_byte');
    orderCheck();
    orderPayTypeLoad();
});
</script>

<script type="text/javascript" src="https://pay.kcp.co.kr/plugin/payplus_un.js"></script> 
<script type="text/javascript">
kcpTx_install();
</script>


<script type="text/javascript" src="/moyeo/resources/customScript/six/scrollbox.js"></script></div>
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
</div>

<%@ include file="../../etc/footer2.jsp"%>