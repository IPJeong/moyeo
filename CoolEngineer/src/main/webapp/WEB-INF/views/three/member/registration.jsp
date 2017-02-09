<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 

<%@ include file="../../etc/header2.jsp"%>

<style>
.registration-container {
	background: url(/moyeo/resources/resource/img/bg.png) left top repeat #efeeee;
	height:100%;
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
                    <li class="active">회원가입</li>
                </ul>
               <!-- END BREADCRUMB -->       
        
         <div class="registration-container ">            
            <div class="registration-box animated fadeInDown" >
                <div class="registration-logo"></div>
                <div class="registration-body">
	                <form:form class="form-horizontal" action="registMember" method="post" name="registMember" modelAttribute="uploadForm" enctype="multipart/form-data">
		                
		                    <div class="registration-title"><strong>Registration</strong>, MoYeo</div>
		                    <div class="registration-subtitle">Best Meetings, Social Sites </div>
		                    <h4><span class="fa fa-asterisk" style="color:#F44336;font-size:3pt;"></span> 간단 정보</h4>
		                    <div class="form-group">
		                        <div class="col-md-12">
		                            <input type="text" class="form-control" name="name" placeholder="Name" style="color:#212121;" required/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <div class="col-md-12">
		                            <input type="email" class="form-control" name="email" style="color:#212121;" placeholder="E-mail" required/>
		                        </div>
		                    </div>       
		                
		                    <h4><span class="fa fa-asterisk" style="color:#F44336;font-size:3pt;"></span> 상세 정보</h4>                    
		                    <div class="form-group" style="max-height:40px;">
		                        <div class="col-md-12" style="max-height:40px;">
		                        	<table style="border:0px;width:100%;">
			                        	<tr>
				                        	<td style="width:80%;padding:0px;">
					                        	<div class="input-group col-md-12" >
					                            	<input type="text" class="form-control" name="memid" id="memid" placeholder="Id" style="color:#212121;" onkeyup="duplication()" required/>                            	                           
					                            </div>
					                        </td>
					                        <td style="width:20%;padding:0px;">                            
					                            <div class="col-md-12" id="duplication" style="padding:0px;text-size:14px;">
					                            			                           		
					                           	</div>
				                           	</td>
			                           	</tr> 
		                            </table>
		                        </div>
		                    </div>                        
		                    <div class="form-group">
		                        <div class="col-md-12">
		                            <input type="password" class="form-control" name="password" placeholder="Password" style="color:#212121;" required/>
		                        </div>
		                    </div>                    
		                    <div class="form-group">
		                        <div class="col-md-12">
		                            <input type="password" class="form-control" name="re_password" placeholder="Re-Password" onkeyup="passChk()" style="color:#212121;" required/>
		                        </div>
		                        <div class="col-md-12 line-height-15" id="passChk" style="padding-top:5px;">
					                            			                           		
					            </div>
		                    </div>
		                    <h4><span class="fa fa-asterisk" style="color:#F44336;font-size:3pt;"></span> 주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</h4> 
	                    	<div class="form-group">                                            
                                 <div class="col-md-12">                                                                                
                                     <select name="loc_category1" class="form-control select" style="color:#212121;" onchange="select_loc_category()" required>
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
                                 <div class="col-md-12"> 
                                      <select name="loc_category2" style="color:#212121;" class="form-control select" required>
                                      		<option value="">선택하세요</option>
                                      </select>
                                 </div>
                             </div>
                             
                             <h4><span class="fa fa-asterisk" style="color:#F44336;font-size:3pt;"></span> 휴대폰 번호</h4> 
                             <div class="form-group">
		                        <div class="col-md-12" style="width:80%; float:left">
		                            <input type="text" class="form-control" name="tel" placeholder="tel" id="tell"
		                            onkeyup="phoneChk()"		                             
		                            style="color:#212121;" required/>		                            
		                        </div>
		                        <div style="width:20%; float:left">
		                        	<div id="telMsg"></div>
		                        </div>
		                    </div>
		                    <h4><span class="fa fa-asterisk" style="color:#F44336;font-size:3pt;"></span> 생&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일</h4> 
		                    <div class="form-group">                                
                                <div class="col-md-12">
                                    <div class="input-group date">
                                    	<label class="col-md-3 control-label"></label>
                                        <input type="text" id="dp-3" name="birth" class="form-control datepicker" placeholder="birthday" required/>
                                    </div>
                                </div>
                            </div>
                            <h4>프로필 사진</h4>
                            <div class="form-group">
                            	<label class="col-md-2 control-label"></label>                           	                                
                                <div class="col-md-12">                               	                            	
                                    <input type="file" class="fileinput btn-info" name="files[0]" id="filename2" onchange="chkType('files[0]')" style="" title="프로필 사진"/>
                                </div>
                            </div>
                            <h4><span class="fa fa-asterisk" style="color:#F44336;font-size:3pt;"></span> 성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</h4>
                            <div class="form-group">
	                            <div class="col-md-12">
	                                <label class="radio-material">
	                                    <input id="radio1" type="radio" name="gender" value="man" required>
	                                    <span class="outer"><span class="inner"></span></span> 남
	                                </label>
	                                &nbsp;&nbsp;                                            
	                                <label class="radio-material">
	                                    <input id="radio2" type="radio" name="gender" value="woman" required>
	                                    <span class="outer"><span class="inner"></span></span> 여
	                                </label>
	                            </div>
                            </div>
		                    <div class="form-group push-up-20">
		                        <div class="col-md-6">
		                            <a href="/moyeo/main/memberLoginForm" class="btn btn-link btn-block">이미 회원이신가요?</a>
		                        </div>
		                        <div class="col-md-6">
		                            <button type="submit" id="regiMember" class="btn btn-danger btn-block">회원가입</button>
		                        </div>
		                    </div>
	                    
	                    </form:form>
                </div>
                <div class="registration-footer">
                    <div class="pull-left">
                        &copy; 2017 MoYeo
                    </div>
                </div>
            </div>
            
        </div>
        
        
                
    </body>
</html>

<script src="/moyeo/resources/customScript/three.js" type="text/javascript"></script>

<script type="text/javascript" src="/moyeo/resources/customScript/five.js"></script> 
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-file-input.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>

<script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>        
<script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script> 