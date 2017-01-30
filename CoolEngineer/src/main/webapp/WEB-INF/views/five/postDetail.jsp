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
<link rel="stylesheet" type="text/css" id="theme"
	href="/moyeo/resources/resource/css/theme-default.css" />
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
<body onload="img()">
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
						<div style="float: left; width: 55%; height:100%;">
							<div style="margin: 50px auto; height:40%;">
								<img style="margin:30px auto; width:300px; height:300px;" id="mainImg" src="${picDtos.get(0).pic_path}/${picDtos.get(0).pic_name}">
							</div>
							<div>
								<section class="regular slider">
									<c:forEach var="picDto" items="${picDtos}">
									<div>
										<img src="${picDto.pic_path}/${picDto.pic_name}">
									</div>
									</c:forEach>
								</section>
								
							<section class="regular slider">
							    <div>
							      <img src="http://placehold.it/350x300?text=1">
							    </div>
							    <div>
							      <img src="http://placehold.it/350x300?text=2">
							    </div>
							  </section>
							</div>
						</div>	
						<div id="post_content" style="float: left; width: 30%; height:100%;">
							<div style="margin-top:10%; height:40%;">
								<h2>후기내용</h2>
								<p>${dto.post_content}</p>
							</div>
							<div style="margin-top:10%; height:40%">
								여기는 댓글을 위한 공간 입니다.
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
<script type="text/javascript">
 $(document).on('ready', function() {
   $(".regular").slick({
     dots: true,
     infinite: true,
     slidesToShow: 3,
     slidesToScroll: 3
   });
   $(".center").slick({
     dots: true,
     infinite: true,
     centerMode: true,
     slidesToShow: 3,
     slidesToScroll: 3
   });
   $(".variable").slick({
     dots: true,
     infinite: true,
     variableWidth: true
   });
 });
</script>
</body>
</html>
