<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="icon" href="/moyeo/resources/resource/favicon.ico" type="image/x-icon" />
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,IE=9,chrome=1">
<title>모여샵 - ${dto.product_name}</title>
<meta name="twitter:card" content="summary_large_image">
<meta property="fb:app_id" content="882367985223438">
<meta property="og:url" content="http://dmshop.kr/qna_write.php?page_id=item&amp;m=&amp;item_id=8&amp;qna_id=&amp;page=1">
<meta property="og:type" content="website">
<meta property="og:title" content="모여샵 - ${dto.product_name}">
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
<script type="text/javascript">var shop_charset = 'utf-8';var shop_path = '.';var shop_user_login = '1';var shop_domain = 'dmshop.kr';var shop_url = 'http://dmshop.kr';var shop_user_admin = '';var shop_kakaomsg = ' http://dmshop.kr';var shop_return_url = 'http%3A%2F%2Fdmshop.kr%2Fqna_write.php%3Fpage_id%3Ditem%26m%3D%26item_id%3D8%26qna_id%3D%26page%3D1';var check_touch= '';</script>
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
</head>
<body>
<div id="overlay"></div><div id="message_box"></div><div class="layout_top_bg"></div><style type="text/css">
body {background-color:#f4f4f4;}

.title {font-weight:bold; line-height:15px; font-size:13px; color:#ffffff; font-family:gulim,굴림;}
.title2 {font-weight:bold; line-height:15px; font-size:13px; color:#027d94; font-family:gulim,굴림;}
.step_title {font-weight:bold; line-height:14px; font-size:11px; color:#9e9e9e; font-family:dotum,돋움;}
.item_title {font-weight:bold; line-height:14px; font-size:12px; color:#414141; font-family:dotum,돋움;}
.name {line-height:14px; font-size:12px; color:#414141; font-family:dotum,돋움;}
.date {line-height:14px; font-size:12px; color:#414141; font-family:dotum,돋움;}
.help {line-height:14px; font-size:11px; color:#b7b7b7; font-family:dotum,돋움;}
.message {line-height:14px; font-size:11px; color:#414141; font-family:dotum,돋움;}
.write_title {font-weight:bold; line-height:14px; font-size:11px; color:#9e9e9e; font-family:dotum,돋움;}
.secret {line-height:14px; font-size:12px; color:#414141; font-family:dotum,돋움;}
.source {font-size:12px; color:#2800bb; font-family:gulim,굴림;}
.filesize {font-size:12px; color:#9274ff; font-family:gulim,굴림;}
.filedel {font-size:12px; color:#9e0000; font-family:gulim,굴림;}

.input {width:112px; height:17px; border:1px solid #cccccc; padding:1px 3px 0px 3px;}
.input {line-height:17px; font-size:12px; color:#363636; font-family:gulim,굴림;}

.file {height:18px;}

.textarea {padding:5px; width:440px; height:170px; border:1px solid #c2c2c2;}
.textarea {line-height:15px; font-size:12px; color:#333333; font-family:dotum,돋움;}

.select {min-width:120px; height:18px; border:1px solid #c1c1c1;}
.select {line-height:14px; font-size:12px; color:#333333; font-family:dotum,돋움;}
.select option {padding:0px 3px 0px 3px; line-height:20px; font-size:12px; color:#333333; font-family:dotum,돋움;}
</style>

<script type="text/javascript">
function qnaSave()
{

    var f = document.formQna;


    if (f.qna_category.value == '') {

        alert('문의유형을 선택하십시오.');
        f.qna_category.focus();
        return false;

    }

    if (f.qna_title.value == '') {

        alert('제목을 입력하십시오.');
        f.qna_title.focus();
        return false;

    }

    if (f.qna_content.value == '') {

        alert('내용을 입력하십시오.');
        f.qna_content.focus();
        return false;

    }

    if (!confirm("등록하시겠습니까?")) {

        return false;

    }

    f.action = "inquireModifyPro?que_num=${dto.que_num}";
    f.submit();

}

</script>

<form method="post" name="formQna" enctype="multipart/form-data">
<input type="hidden" name="url" value="http%3A%2F%2Fdmshop.kr%2Fqna_write.php%3Fpage_id%3Ditem%26m%3D%26item_id%3D8%26qna_id%3D%26page%3D1">
<input type="hidden" name="m" value="">
<input type="hidden" name="item_id" value="8">
<input type="hidden" name="qna_id" value="">
<input type="hidden" name="page_id" value="item">
<input type="hidden" name="page" value="1">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="40" bgcolor="#000000">
    <td align="center" class="title">:: 상품문의 작성 ::</td>
</tr>
</tbody></table>
<input type="hidden" name="product_num" value="${product_num}">
<div style="height:2; background:#393939;" class="none"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<div style="padding:10px 10px 10px 10px; background-color:#ffffff;">
<div style="border:1px solid #e0e0e0;">
<div style="padding:15px 17px 15px 17px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td width="84" valign="top"><div style="text-align:center; background-color:#fafafa; border:1px solid #e0e0e0;"><a href="/moyeo/six/shop/productDetail?product_num=${product_num}" target="_blank"><img src="${pic_path}/${pic_name}" border="0" width="82" height="82"></a></div></td>
    <td width="28"></td>
    <td valign="top">
<div style="height:1; background:#e0e0e0;" class="none"></div>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30">
    <td width="120" bgcolor="#f5f5f5" align="center"><span class="step_title">상품명</span></td>
    <td width="20"></td>
    <td><a href="/moyeo/six/shop/productDetail?product_num=${product_num}" target="_blank" class="item_title">${dto.product_name}</a></td>
</tr>
</tbody></table>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30">
    <td width="120" bgcolor="#f5f5f5" align="center"><span class="step_title">작성일</span></td>
    <td width="20"></td>
    <td><span class="date"> ${fn:substring(dto.que_date, 0, 10)}</span></td>
</tr>
</tbody></table>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30">
    <td width="120" bgcolor="#f5f5f5" align="center"><span class="step_title">작성자</span></td>
    <td width="20"></td>
    <td><span class="name">${mem_id}</span></td>
</tr>
</tbody></table>


<div style="height:1; background:#e0e0e0;" class="none"></div>
    </td>
</tr>
</tbody></table>
</div>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30">
    <td width="120" bgcolor="#f5f5f5" align="center"><span class="write_title">문의유형</span></td>
    <td width="10"></td>
    <td>
<select id="qna_category" name="qna_category" class="select">
    <option value="">문의유형 선택</option>
    <option value="가격">가격</option>
    <option value="배송">배송</option>
    <option value="사이즈">사이즈</option>
    <option value="색상">색상</option>
    <option value="성능/기능">성능/기능</option>
    <option value="요구사항변경">요구사항변경</option>
    <option value="기타">기타</option>
</select>

<script type="text/javascript">
document.getElementById("qna_category").value = "";
</script>
    </td>
</tr>
</tbody></table>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30">
    <td width="120" bgcolor="#f5f5f5" align="center"><span class="write_title">제&nbsp;&nbsp;&nbsp;&nbsp;목</span></td>
    <td width="10"></td>
    <td><input type="text" name="qna_title" class="input" value="${dto.que_title}" style="width:360px;"></td>
    <td width="80" align="right">
<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr>
    <td><input type="checkbox" name="qna_secret" value="no" class=""></td>
    <td width="5"></td>
    <td><span class="secret">비밀글</span></td>
</tr>
</tbody></table>
    </td>
</tr>
</tbody></table>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<table border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="30">
    <td width="120" bgcolor="#f5f5f5" align="center"><span class="write_title">내&nbsp;&nbsp;&nbsp;&nbsp;용</span></td>
    <td width="10"></td>
    <td><div style="padding:10px 0 10px 0;"><textarea name="qna_content" class="textarea">${dto.que_content}</textarea></div></td>
</tr>
</tbody></table>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="5"><td></td></tr>
</tbody></table>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<div style="height:1; background:#e0e0e0;" class="none"></div>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
<tbody><tr height="15"><td></td></tr>
</tbody></table>

<div style="height:1; background:#efefef;" class="none"></div>

<div style="height:1; background:#e0e0e0;" class="none"></div>

<div style="height:1; background:#ffffff;" class="none"></div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tbody><tr height="20"><td></td></tr>
</tbody></table>

<table border="0" cellspacing="0" cellpadding="0" class="auto" align="center">
<tbody><tr>
    <td><a href="#" onclick="qnaSave(); return false;"><img src="/moyeo/resources/resource/img/shop/qna_ok.gif" border="0"></a></td>
    <td width="5"></td>
    <td><a href="#" onclick="window.close(); return false;"><img src="/moyeo/resources/resource/img/shop/qna_close.gif" border="0"></a></td>
</tr>
</tbody></table>
</form><script type="text/javascript">$(document).ready(function() { var version = $.browser.version; var resolution = screen.width+"x"+screen.height; $.post("./visit_update.php", {"visit_id" : "51", "version" : version, "resolution" : resolution}); });</script>

</body></html>