<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../../etc/header2.jsp"%>

<style>
.registration-container {
	background: url(../img/bg.png) left top repeat #efeeee;
	height:900px;
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
                    <li class="active">비밀번호 바꾸기</li>
                </ul>
               <!-- END BREADCRUMB -->            
               
        <div class="registration-container">            
            <div class="registration-box animated fadeInDown">
                <div class="registration-logo"></div>
                <div class="registration-body">
                    <div class="registration-title"><strong>임시비밀번호,</strong> 변경하세요</div>
                    <div class="registration-subtitle">새로 변경할 비밀번호를 입력하세요!</div>
                    <form action="chgPw" name="chgPw" class="form-horizontal" method="post">                        
	                    <h4>비밀번호를 입력하세요</h4>
	                    <div class="form-group">
	                        <div class="col-md-12">
	                            <input type="password" name="password" class="form-control" onkeyup="passChk3()" style="color:#212121;" placeholder="PASSWORD" required/>
	                        </div>
	                    </div>
	                    <div class="form-group">
	                        <div class="col-md-12">
	                            <input type="password" class="form-control" name="re_password" placeholder="RE-PASSWORD" onkeyup="passChk3()" style="color:#212121;" required/>
	                        </div>
	                        <div class="col-md-12 line-height-15" id="passChk3" style="padding-top:5px;">
				                            			                           		
				            </div>
	                    </div>                                                            
	                    <div class="form-group push-up-20">
	                        <div class="col-md-6">
	                            
	                        </div>
	                        <div class="col-md-6">
	                            <button type="submit" id="proPwSub" class="btn btn-danger btn-block">변경</button>
	                        </div>
	                    </div>
                    </form>
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