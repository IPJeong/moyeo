<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- META SECTION -->
<title>모임후기 조회</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/moyeo/resources/resource/js/plugins/slick/slick.css">
<link rel="stylesheet" type="text/css" href="/moyeo/resources/resource/js/plugins/slick/slick-theme.css">
<!-- END META SECTION -->

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme" href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->
<style>
@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features {
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

@media ( min-width : 1100px) {
	.col-md-56 {
		width: 60%;
		height: 870px;
	}
}

.chart-holder {
	height: 100%;
}

.main {
	height: 100%;
}

.panel .panel-body {
	height: 100%;
	overflow: scroll;
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

@media ( min-width : 992px) {
	.col-lg-2 {
		width: auto;
	}
}

#writeBtn {
	margin-top: 30px;
	margin-right: 30px;
	float: right;
}

#dataTable {
	margin-top: 30px;
}

/* slider css */
html, body {
  margin: 0;
  padding: 0;
}

* {
  box-sizing: border-box;
}

.slider {
    width: 50%;
    margin: 100px auto;
}

.slick-slide {
  margin: 0px 20px;
}

.slick-slide img {
  width: 100%;
}

.slick-prev:before,
.slick-next:before {
    color: black;
}
/* slider css */
</style>
</head>
<body onload="imgSlide()">
	<%@include file="../etc/moim_header.jsp"%>

	<!-- START ROW -->
	<div class="row">
		<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
			<%@include file="../etc/moim_side.jsp"%>
			<!-- START PHOTO BLOCK -->
			<div class="col-md-56" style="margin-top: 10px;">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<strong>후기제목 : ${dto.post_title}</strong>
						</h3>
					</div>
					<div class="panel-body">
						<div style="float: left; width: 50%; height: 100%;">
							<div style="margin: 10px auto; height: 50%;" id="mainImg">
								<!-- 사진&동영상 데이터 입력창 -->
								<c:if test="${picDtos != null}">
									<img style="margin-left: 50px; margin-top:50px; width: 400px; height: 400px;" src="${picDtos.get(0).pic_path }/${picDtos.get(0).pic_name}">
								</c:if>
								<c:if test="${picDtos == null && videoDtos == null}">
									<img style="margin-left: 50px auto; width: 400px; height: 400px;" src="/moyeo/resources/resource/img/common/noimage.jpg">
								</c:if>
							</div>
							<div style="margin: 10px auto; height: 50%;" id="sliderDiv">
								<!-- 슬라이드 이미지가 삽입되는 부분 -->
								<section class="regular slider">
									<c:forEach var="picDto" items="${picDtos}">
										<div>
							     	    	<img style="width:120px; height:120px;" src="${picDto.pic_path}/${picDto.pic_name}" onclick="changeMainImg('${picDto.pic_path}/${picDto.pic_name}')">
							            </div>
									</c:forEach>
									<c:forEach var="videoDto" items="${videoDtos}">
										<div>
							     	    	<video style="width:120px; height:120px;" src="${videoDto.video_path}/${videoDto.video_name}" onclick="changeMainVideo('${videoDto.video_path}/${videoDto.video_name}')" />
							            </div>
									</c:forEach>
								</section>
							</div>
						</div>
						<div style="float: left; width: 50%; height: 100%;">
							<div style="margin-top: 10%; height: 250px;" >
								<div id="post_content" style="width:100px; height:90%;">
									<!-- 후기내용이 삽입되는 부분 -->
									<h3>후기내용</h3> 
									<div style="border: 1px solid black; width:500px; height:170px;">
										<p>${dto.post_content}</p>
									</div>
						   								
								</div>
								<div  style="width:100px; height:10%; ">
									<div style="float:left; width:150px; margin-bottom: 20px;">
										<i class="fa fa-heart" id="likeNum">&nbsp;${dto.like_num}명이 좋아합니다.</i>
									</div>
									
									<div style="float:left; width:150px;" id="divLikeBtn">
										<button class="btn btn-danger" id="listBtn" type="button" onclick="likePost('${dto.post_num}', '1')">
											좋아요
										</button>
									</div>
									
								</div>						
							</div>
							<!-- 댓글이 삽입되는 부분 -->
							<div style="margin-top: 10%; height: 250px;">
							
								<!-- 메시지박스 시작 -->
										                        
		                        <div class="panel panel-default push-up-10">
		                            <div class="panel-body panel-body-search">
		                            <div class="messages messages-img">
		                            <div class="item in">
		                                <div class="image">
		                                    <img src="assets/images/users/user2.jpg" alt="John Doe">
		                                </div>
		                                <div class="text">
		                                    <div class="heading">
		                                        <a href="#">John Doe</a>
		                                        <span class="date">08:33</span>
		                                    </div>
		                                    Lorem ipsum dolor sit amet, consectetur 
		                                </div>
		                            </div>
		                            <div class="item">
		                                <div class="image">
		                                    <img src="assets/images/users/user.jpg" alt="Dmitry Ivaniuk">
		                                </div>                                
		                                <div class="text">
		                                    <div class="heading">
		                                        <a href="#">Dmitry Ivaniuk</a>
		                                        <span class="date">08:39</span>
		                                    </div>                                    
		                                    Integer et ipsum vitae urna mattis dictum. 
		                                </div>
		                            </div>
		                            <div class="item">
		                                <div class="image">
		                                    <img src="assets/images/users/user.jpg" alt="Dmitry Ivaniuk">
		                                </div>                                
		                                <div class="text">
		                                    <div class="heading">
		                                        <a href="#">Dmitry Ivaniuk</a>
		                                        <span class="date">08:42</span>
		                                    </div>                                    
		                                    In dapibus ex ut nisl laoreet aliquam. Donec 
		                                </div>
		                            </div>
		                            <div class="item in">
		                                <div class="image">
		                                    <img src="assets/images/users/user2.jpg" alt="John Doe">
		                                </div>
		                                <div class="text">
		                                    <div class="heading">
		                                        <a href="#">John Doe</a>
		                                        <span class="date">08:58</span>
		                                    </div>
		                                    Curabitur et euismod urna?
		                                </div>
		                            </div>
		                            <div class="item">
		                                <div class="image">
		                                    <img src="assets/images/users/user.jpg" alt="Dmitry Ivaniuk">
		                                </div>                                
		                                <div class="text">
		                                    <div class="heading">
		                                        <a href="#">Dmitry Ivaniuk</a>
		                                        <span class="date">09:11</span>
		                                    </div>                                    
		                                    Fusce ultricies erat quis massa interdum, 
		                                </div>
		                            </div>
		                            <div class="item in">
		                                <div class="image">
		                                    <img src="assets/images/users/user2.jpg" alt="John Doe">
		                                </div>
		                                <div class="text">
		                                    <div class="heading">
		                                        <a href="#">John Doe</a>
		                                        <span class="date">09:22</span>
		                                    </div>
		                                    Vestibulum cursus ipsum ut dolor vulputate dapibus. 
		                                </div>
		                            </div>
		                        </div>                        
		                            
		                            
		                            
		                            </div>
		                              <div class="input-group">
		                                    <div class="input-group-btn">
		                                        <button class="btn btn-default"><span class="fa fa-camera"></span></button>
		                                        <button class="btn btn-default"><span class="fa fa-chain"></span></button>
		                                    </div>
		                                    <input type="text" class="form-control" placeholder="Your message..."/>
		                                    <div class="input-group-btn">
		                                        <button class="btn btn-default">Send</button>
		                                    </div>
		                                </div>
		                        </div>
                        	    <!-- 메시지박스 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script src="http://code.jquery.com/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	<script src="/moyeo/resources/resource/js/plugins/slick/slick.js" type="text/javascript" charset="utf-8"></script>
	<script src="/moyeo/resources/customScript/five.js" type="text/javascript"></script>

 <!-- START PLUGINS -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- THIS PAGE PLUGINS -->
        <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
		<!-- END PAGE PLUGINS -->     

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>        
        <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>        
</body>
</html>
