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
	        <h3>관심지역</h3>
	        <form action="memInterestModifyPro" role="form" class="form-horizontal" name="memInterest">
	        	<input type="hidden" value="${mem_id}" name="mem_id">
	       		 <div class="form-group">
	                <label class="col-md-3 control-label">관심지역</label>
	                <div class="col-md-9">                                                                                
	                    <select name="loc_category1"  class="form-control select" data-live-search="true" onchange="select_loc_category2()" required>
	                        <option value="">선택하세요</option>
		                    <option value="서울특별시">서울특별시</option>
			                <option value="부산광역시">부산광역시</option>
			                <option value="인천광역시">인천광역시</option>
			                <option value="대구광역시">대구광역시</option>
			                <option value="대전광역시">대전광역시</option>
			                <option value="광주광역시">광주광역시</option>
			                <option value="울산광역시">울산광역시</option>
			                <option value="세종특별자치시">세종특별자치시</option>
			                <option value="경기도">경기도</option>
			                <option value="강원도">강원도</option>
			                <option value="충청북도">충청북도</option>
			                <option value="충청남도">충청남도</option>
			                <option value="경상북도">경상북도</option>
			                <option value="경상남도">경상남도</option>
			                <option value="전라북도">전라북도</option>
			                <option value="전라남도">전라남도</option>
			                <option value="제주특별자치도">제주특별자치도</option>
	                    </select>
	                </div>
	            </div>
	            <div class="form-group">
	            	<label class="col-md-3 control-label"></label>
	                <div class="col-md-9"> 
	                     <select name="loc_category2" class="col-md-12 selectC" required>
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