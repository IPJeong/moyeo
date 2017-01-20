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
                    <li class="active">회원가입</li>
                </ul>
               <!-- END BREADCRUMB -->         

         <div class="registration-container">            
            <div class="registration-box animated fadeInDown">
                <div class="registration-logo"></div>
                <div class="registration-body">
                    <div class="registration-title"><strong>Registration</strong>, use form below</div>
                    <div class="registration-subtitle">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In odio mauris, maximus ac sapien sit amet. </div>
                    <form action="index.html" class="form-horizontal" method="post">
                        
                    <h4>Personal info</h4>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="First Name"/>
                        </div>
                    </div>
                        <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="Secondname"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="E-mail"/>
                        </div>
                    </div>
                    
                    <h4>Authentication</h4>                    
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="text" class="form-control" placeholder="Id"/>
                        </div>
                    </div>                        
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="password" class="form-control" placeholder="Password"/>
                        </div>
                    </div>                    
                    <div class="form-group">
                        <div class="col-md-12">
                            <input type="password" class="form-control" placeholder="Re-Password"/>
                        </div>
                    </div>             
                    
                    <div class="form-group push-up-30">
                        <div class="col-md-6">
                            <a href="../member/login.jsp" class="btn btn-link btn-block">Already have account?</a>
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
       