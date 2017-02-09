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
                    <li class="active">비밀번호 찾기</li>
                </ul>
               <!-- END BREADCRUMB -->            
               
        <div class="registration-container">            
            <div class="registration-box animated fadeInDown">
                <div class="registration-logo"></div>
                <div class="registration-body">
                    <div class="registration-title"><strong>비밀번호</strong> 잊으셨나요?</div>
                    <div class="registration-subtitle">아이디를 입력 후 '찾기' 버튼을 누르면 가입시 입력한 이메일로 임시번호가 보내집니다.</div>
                    <form action="findPw" class="form-horizontal" method="post">                        
	                    <h4>아이디를 입력하세요</h4>
	                    <div class="form-group">
	                        <div class="col-md-12">
	                            <input type="text" name="mem_id" class="form-control" style="color:#212121;" placeholder="ID" required/>
	                        </div>
	                    </div>                                                            
	                    <div class="form-group push-up-20">
	                        <div class="col-md-6">
	                            <a href="/moyeo/three/registration" class="btn btn-link btn-block">회원가입</a>
	                        </div>
	                        <div class="col-md-6">
	                            <button type="submit" class="btn btn-danger btn-block">찾기</button>
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
