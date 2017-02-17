<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../etc/header2.jsp"%>
<head>        
        <!-- META SECTION -->
        <title>Atlant - Responsive Bootstrap Admin Template</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
             
    </head>
<style>
	.x-dashboard .page-container .page-content {
	    margin-left: 0px;
	    background: linear-gradient( to top, #fbfeff, #E1F5FE ,#B3E5FC, #81D4FA);
	
</style>
<div class="col-md-9" style="position: absolute;left:25%;top:25%;width:50%;margin:auto;">
	<div class="panel panel-default" >
	    <div class="panel-body">	        
	        <form action="memInterestModifyPro2" role="form" class="form-horizontal" name="memInterest">
	        	<input type="hidden" value="${mem_id}" name="mem_id">	       		 
	          	<h3>관심사</h3>
	          	<div class="form-group">
	                <label class="col-md-3 control-label">관심사</label>
	                <div class="col-md-9">                                                                                
	                    <select name="recpla_category1"  class="form-control select" data-live-search="true" onchange="select_recpla_category()" required>
	                        <option value="">선택하세요</option>
			                <option value="아웃도어_여행">아웃도어/여행</option>
			                <option value="운동_스포츠">운동/스포츠</option>
			                <option value="인문학_책_글">인문학/책/글</option>
			                <option value="외국_언어">외국/언어</option>
			                <option value="문화_공연">문화/공연</option>
			                <option value="음악_악기">음악/악기</option>
			                <option value="공예_만들기">공예/만들기</option>
			                <option value="댄스_무용">댄스/무용</option>
			                <option value="봉사활동">봉사활동</option>
			                <option value="사교_인맥">사교/인맥</option>
			                <option value="차_오토바이">차/오토바이</option>
			                <option value="사진">사진</option>
			                <option value="야구관람">야구관람</option>
			                <option value="게임_오락">게임/오락</option>
			                <option value="요리_제조">요리/제조</option>
			                <option value="반려동물">반려동물</option>
			                <option value="가족_결혼">가족/결혼</option>
			                <option value="자유주제">자유주제</option>
	                    </select>
	                </div>
	            </div>
	            <div class="form-group">
	            	<label class="col-md-3 control-label"></label>
	                <div class="col-md-9"> 
	                     <select name="recpla_category2" class="col-md-12 selectC" required>
	                     		<option value="">선택하세요</option>
	                     </select>
	                </div>
	            </div>
	            <div class="form-group" style="float:right">	            	
	            	<div class="col-md-9" style="width:85px;">
	            		<button type="submit" class="btn btn-info">수정</button>
	            	</div>
	            </div>
	        </form>         
	    </div>
	</div>
</div>
<script src="/moyeo/resources/customScript/three.js" type="text/javascript"></script>
<!-- START PLUGINS -->
<!-- <script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script> -->
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<!-- <script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/highlight/jquery.highlight-4.js"></script> -->
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>

<script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-file-input.js"></script>-->
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-select.js"></script>
<!--
<script type="text/javascript" src="/moyeo/resources/resource/js/faq.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/jquery-1.12.4.js"></script> -->
<!-- END TEMPLATE -->

<%@ include file="../../etc/footer2.jsp"%>