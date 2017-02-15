<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<title>kcp</title>
<script type="text/javascript">
function jsf__pay()
{

    var frm = document.order_info;

    KCP_Pay_Execute(frm);

}

function m_Completepayment( FormOrJson, closeEvent )
{

    var frm = document.order_info;

    GetField(frm, FormOrJson);

    if (frm.res_cd.value == '0000') {

        frm.submit();

    } else {

        if (document.getElementById("shop_cancel").value == 'cart') {

            location.href = "../../cart.php";

        }

    }

}
</script>
<script type="text/javascript" src="https://pay.kcp.co.kr/plugin/payplus_un.js"></script><style type="text/css">                                                                                       .kcpTransDiv{                                                                                                 filter:alpha(opacity=10); -khtml-opacity: 0.1; -moz-opacity: 0.1; opacity: 0.1; top:0px; left:0;          background-color:#000000; width:100%; height:100%; position:absolute; z-index:10000;                  }                                                                                                     </style>                                                                                                  <style type="text/css"></style></head><body><div id="kcp_content" style="background-color: white;"></div><div id="kcp_mask" class="kcpTransDiv" style="height: 920px; display: none;"></div><div id="kcp_progress" class="spin_container"></div><script type="text/javascript" src="https://pay.kcp.co.kr/plugin/js/ajax.js?U6UDWPUQ43N6Z6FX1023MCRP7WJXRGZ7" charset="EUC-KR"></script><script type="text/javascript" src="https://pay.kcp.co.kr/plugin/cross_service/extends/util.js?U6UDWPUQ43N6Z6FX1023MCRP7WJXRGZ7" charset="EUC-KR"></script><script type="text/javascript" src="https://pay.kcp.co.kr/plugin/cross_service/extends/spin.min.js?U6UDWPUQ43N6Z6FX1023MCRP7WJXRGZ7" charset="EUC-KR"></script><script type="text/javascript" src="https://pay.kcp.co.kr/plugin/js/payplus_exe.js?U6UDWPUQ43N6Z6FX1023MCRP7WJXRGZ7" charset="EUC-KR"></script>
<script type="text/javascript">
kcpTx_install();
</script>
<script type="text/javascript">
setTimeout("jsf__pay();", 1000);
</script>


<form name="order_info" method="post" action="./pp_ax_hub.php">
<!-- 기본정보 //-->
<input type="hidden" name="order_code" value="ZJ1702162780">
<input type="hidden" name="pay_code" value="">

<!-- 기본 주문 정보 //-->
<input type="hidden" name="pay_method" value="000010000000">
<input type="hidden" name="ordr_idxx" value="ZJ1702162780">
<input type="hidden" name="good_name" value="소품 (갤러리 학습)">
<input type="hidden" name="good_mny" value="3640">
<input type="hidden" name="buyr_name" value="하대성">
<input type="hidden" name="buyr_mail" value="111@naver.com">
<input type="hidden" name="buyr_tel1" value="010-1111-1111">
<input type="hidden" name="buyr_tel2" value="010-1111-1111">

<!-- 에스크로 수취인 정보 //-->
<input type="hidden" name="rcvr_name" value="하대성">
<input type="hidden" name="rcvr_tel1" value="010-1111-1111">
<input type="hidden" name="rcvr_tel2" value="010-1111-1111">
<input type="hidden" name="rcvr_mail" value="111@naver.com">
<input type="hidden" name="rcvr_zipx" value="07607">
<input type="hidden" name="rcvr_add1" value="서울특별시 강서구 금낭화로 36-10 (경신다세대)">
<input type="hidden" name="rcvr_add2" value="102호">


<!-- 에스크로 사용 여부 : 반드시 Y 로 설정 //-->
<input type="hidden" name="escw_used" value="Y">

<!-- 에스크로 결제처리 모드 : 에스크로: Y, 일반: N, KCP 설정 조건: O //-->
<input type="hidden" name="pay_mod" value="N">


<!-- 장바구니 상품 개수 : 장바구니에 담겨있는 상품의 개수를 입력(good_info의 seq값 참조) //-->
<input type="hidden" name="bask_cntx" value="1">

<!-- 장바구니 상품 상세 정보 (자바 스크립트 샘플 create_goodInfo()가 온로드 이벤트시 설정되는 부분입니다.) -->
<input type="hidden" name="good_info" value="seq=1ordr_numb=ZJ1702162780_0001good_name=소품 (갤러리 학습)good_cntx=1good_amtx=3640">

<input type="hidden" name="req_tx" value="pay">
<input type="hidden" name="site_cd" value="DM001">
<input type="hidden" name="site_name" value="Moyeo샵">
<input type="hidden" name="shop_name" value="Moyeo샵">

<input type="hidden" name="currency" value="WON">

<input type="hidden" name="module_type" value="01">
<input type="hidden" name="epnt_issu" value="">

<input type="hidden" name="res_cd" value="3001">
<input type="hidden" name="res_msg" value="사용자 취소">
<input type="hidden" name="tno" value="">
<input type="hidden" name="trace_no" value="">
<input type="hidden" name="enc_info" value="">
<input type="hidden" name="enc_data" value="">
<input type="hidden" name="ret_pay_method" value="">
<input type="hidden" name="tran_cd" value="">
<input type="hidden" name="bank_name" value="">
<input type="hidden" name="bank_issu" value="">
<input type="hidden" name="use_pay_method" value="">

<!--  현금영수증 관련 정보 : Payplus Plugin 에서 설정하는 정보입니다 //-->
<input type="hidden" name="cash_tsdtime" value="">
<input type="hidden" name="cash_yn" value="">
<input type="hidden" name="cash_authno" value="">
<input type="hidden" name="cash_tr_code" value="">
<input type="hidden" name="cash_id_info" value="">

<input type="hidden" name="vcnt_expire_term" value="5"><!-- 가상계좌 입금기한 1일 //-->
<input type="hidden" name="site_logo" value="">

<!-- 삭제불가 //-->
<input type="hidden" id="shop_cancel" value="cart">

<input type="hidden" name="quotaopt" value="12">
<input type="hidden" name="deli_term" value="03">
<input type="hidden" name="wish_vbank_list" value="05:03:04:07:11:23:26:32:34:81:71">
<input type="hidden" name="disp_tax_yn" value="Y">
<input type="hidden" name="skin_indx" value="1">
<input type="hidden" name="good_expr" value="0">
<input type="hidden" name="shop_user_id" value="">
<input type="hidden" name="pt_memcorp_cd" value="">
<!-- 삭제불가 //-->

<h1>결제가 진행중입니다.</h1>
<h5>결제창이 뜬 이후에 새로고침을 절대 누르지 마세요.</h5>
</form>





</body>
</html>