<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../etc/header.jsp"%>

<style>
.registration-container {
	background: url(../img/bg.png) left top repeat #efeeee;
	height:900px;
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
                    <div class="registration-title"><strong>Forgot</strong> Password?</div>
                    <div class="registration-subtitle">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In odio mauris, maximus ac sapien sit amet. </div>
                    <form action="index.html" class="form-horizontal" method="post">                        
                    <h4>Your E-mail</h4>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="email@domain.com"/>
                        </div>
                    </div>                                                            
                    <div class="form-group push-up-20">
                        <div class="col-md-6">
                            <a href="../member/registration.jsp" class="btn btn-link btn-block">Registration</a>
                        </div>
                        <div class="col-md-6">
                            <button class="btn btn-danger btn-block">Sign Up</button>
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
