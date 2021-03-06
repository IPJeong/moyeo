<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    

<%@ include file="../../etc/header2.jsp"%>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
//모임후기 사진파일, 동영상 파일 등록시 파일타입 체크
function chkType(id) {

	var fileName = $("#"+id).val();
	var extension = fileName.slice(fileName.indexOf(".") + 1).toLowerCase();

	var isOk = false;
	isOk = imgChk(extension);

	if(!isOk){
		alert("이미지 파일 형식만 등록 가능합니다.");
		$("#"+id).val("");
	}
}

//사진파일 확장자
function imgChk(extension) {
	var imgs = ['jpg', 'png', 'gif', 'bmp', 'rel', 'psd', 'pdd', 'tif', 'pdf', 'raw', 'pct', 'pic'];
	for(var i=0; i<imgs.length; i++){
		if(imgs[i] == extension.toLowerCase()){
			return true;
		}
	}
	return false;
}

function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("/moyeo/six//shop/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
		, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno){
// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
document.getElementById('roadAddrPart1').value = roadAddrPart1;
document.getElementById('addrDetail').value = addrDetail;
document.getElementById('roadAddrPart2').value = roadAddrPart2;
document.getElementById('zipNo').value = zipNo;
}

</script>

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
    height: 900px;
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

.registration-container {
	background: url(/moyeo/resources/resource/img/bg.png) left top repeat white;

}

.registration-container .registration-box .registration-body .form-control:focus {
    background: #f8f9fa;
}
.registration-container .registration-box {  
    padding-top: 25px;
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
		<div class="col-md-56" style="margin-top: 10px; height:870px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>판매자 등록</h3>
					</div>
				</div>
				<div class="panel-body padding-0" style="text-align: center; font-size: 25px; height:830px;">
					
					<div class="registration-container" style="background: url("/moyeo/resources/resource/img/bg.png") left top repeat rgba(245, 247, 239, 0.91);">            
            			<div class="registration-box animated fadeInDown" >
				
					    	<div class="registration-body" style="margin-top:-50px; margin-bottom:20px;">
			                	<form:form class="form-horizontal" name="rdnAddr" action="sellerModifyPro" method="post" modelAttribute="uploadForm" enctype="multipart/form-data">
				                	<input type="hidden" name="seller_id" value="${dto.seller_id}">
				                    <div class="registration-title"><strong>판매자 정보 수정</strong>, MoYeo</div>
				                    <h4><span class="fa fa-asterisk" style="color:#F44336;font-size:3pt;"></span> 기본 정보</h4>
				                    <div class="form-group">
				                        <div class="col-md-12">
				                            <input type="text" class="form-control" placeholder="ID" name="seller_id"style="color:#212121;" value="${mem_id}" required readonly/>
				                        </div>
				                    </div>

				                     <input type="hidden" id="confmKey" name="confmKey" value="U01TX0FVVEgyMDE3MDIxNDE4MTY1ODE5MDEz"  >
   				                    <div class="form-group">
				                        <div class="col-md-12">
				                            <input type="text" class="form-control" name="zipNo" id="zipNo" name="zipNo" placeholder="우편번호" readonly style="color:#212121; width:100px; float:left;" placeholder="우편번호" maxlength="13" required/>
				                        	<input type="button" class="btn btn-danger btn-block" style="width:100px; float:left; margin-left:10px; height:40px;" value="주소검색" onclick="goPopup();">
				                        </div>
				                    </div> 
				                    
				                    <div class="form-group">
				                        <div class="col-md-12">
				                            <input type="text" class="form-control" name="roadAddrPart1" id="roadAddrPart1" placeholder="도로명주소 예)서울특별시 마포구 상암로 301" readonly style="color:#212121;" placeholder="우편번호" maxlength="13" required/>
				                        </div>
				                    </div> 
				                    
				                  	<div class="form-group">
				                        <div class="col-md-12">
				                            <input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소 예)105동 123호" style="color:#212121; width:48%; float:left;" placeholder="우편번호" maxlength="13" required/>
				                        	<input type="text" class="form-control" name="roadAddrPart2" id="roadAddrPart2" placeholder="참고항목 예)(상암동)" style="width:48%; margin-left:10px; float:left;" readonly>
				                        </div>
				                    </div> 
				                
				                    <div class="form-group">
				                        <div class="col-md-12">
				                            <input type="text" class="form-control" name="tel" style="color:#212121;" placeholder="연락처" maxlength="13" value="${dto.tel}" required/>
				                        </div>
				                    </div>  
				                      
									<h4><span class="fa fa-asterisk" style="color:#F44336;font-size:3pt;"></span> 판매자 정보</h4>                    
				                                       
				                    <div class="form-group">
				                        <div class="col-md-12">
				                            <input type="text" class="form-control" name="comp_name" placeholder="상호명" style="color:#212121;" maxlength="13" value="${dto.comp_name}" required/>
				                        </div>
				                    </div>                    
				                    
				                    <div class="form-group" style="width:110px; float:left;">
					                    <div class="col-md-12">
					                            <input type="text" class="form-control" placeholder="거래은행" style="color:#212121;" required readonly/>
					                    </div>
				                    </div>
				                    <div class="form-group" style="width:250px; float:left;">
				                    
				                        <div class="col-md-12" style="padding-left:0px;">
				                            <select name="bank" id="bank" class="form-control" style="color:#212121;" required>
						                        <option value="">선택하세요</option>
	                                         	<option value="농협">농협</option>
								                <option value="국민은행">국민은행</option>
								                <option value="우리">우리</option>
								                <option value="신한">신한</option>
								                <option value="기업">기업</option>
								                <option value="경남">경남</option>
								                <option value="광주">광주</option>
								                <option value="대구">대구</option>
								                <option value="부산">부산</option>
								                <option value="산업">산업</option>
								                <option value="새마을금고">새마을금고</option>
								                <option value="수협">수협</option>
								                <option value="신협">신협</option>
								                <option value="우체국">우체국</option>
								                <option value="전북">전북</option>
								                <option value="제주">제주</option>
								                <option value="KEB하나">KEB하나</option>
				                            	<option value="씨티">씨티</option>
				                            	<option value="SC은행">SC은행</option>
				                            </select>
				                            <script>document.getElementById("bank").value = '${dto.bank}'</script>
				                        </div>
				                    </div>
				                    <div class="form-group">
				                        <div class="col-md-12">
				                            <input type="text" class="form-control" name="account_number" placeholder="계좌번호" maxlength="20" style="color:#212121;" value="${dto.account_number}" required/>
				                        </div>
				                    </div>
				                    <div class="form-group">
				                        <div class="col-md-12">
				                            <input type="text" class="form-control" name="depositor" placeholder="예금주" maxlength="13" style="color:#212121;" value="${dto.depositor}" required/>
				                        </div>
				                    </div>
              
						            <div class="form-group push-up-20">
				                        <div class="col-md-6" style="width:400px;">
				                            <button type="submit" id="regiMember" class="btn btn-danger btn-block" style="float:left; width:150px;">정보 수정</button> &nbsp;&nbsp;&nbsp;
				                            <button type="reset" id="regiMember" class="btn btn-danger btn-block" style="float:left; width:150px; margin-top:0px; margin-left:30px;" onclick="history.back();">취소</button>
				                        </div>
				                    </div>
				    
			                    </form:form>
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