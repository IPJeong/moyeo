<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="icon" href="/moyeo/resources/resource/favicon.ico" type="image/x-icon" />
<!-- END META SECTION -->

<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme" href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->
</head>

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<script type='text/javascript'
	src="/moyeo/resources/resource/js/plugins/icheck/icheck.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/scrolltotop/scrolltopcontrol.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/morris/raphael-min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/morris/morris.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/rickshaw/d3.v3.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/rickshaw/rickshaw.min.js"></script>
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
<script type='text/javascript'
	src='/moyeo/resources/resource/s/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/owl/owl.carousel.min.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/moment.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/daterangepicker/daterangepicker.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->

<script type="text/javascript">

function comma(x) {
	return  x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function chaMain() {
	
	$('#price').val($('#price').val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
		
}
</script>


<title>Insert title here</title>
</head>
<body onload=chaMain();>
	<div style="float:left;  overflow:scroll; width:100%;">
		<div style="margin: 10px; border-right:3px solid rgba(155, 143, 255, 0.74); width:51%; height:550px; float:left;">
			<div id="map" style="width: 100%; height: 60%;">
	
				<script
					src="//apis.daum.net/maps/maps3.js?apikey=14b379d0fba99fe89520cb90c8c7d849"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng${dto.meeting_loc}, // 지도의 중심좌표
				        level: 5, // 지도의 확대 레벨
				        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
				    }; 
	
					// 지도를 생성한다 
					var map = new daum.maps.Map(mapContainer, mapOption); 
			
					// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
					daum.maps.event.addListener(map, 'click', function (mouseEvent) {
						alert('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
					});
					
					// 지도 타입 변경 컨트롤을 생성한다
					var mapTypeControl = new daum.maps.MapTypeControl();
			
					// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
					map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
			
					// 지도에 확대 축소 컨트롤을 생성한다
					var zoomControl = new daum.maps.ZoomControl();
			
					// 지도의 우측에 확대 축소 컨트롤을 추가한다
					map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			
					// 지도에 마커를 생성하고 표시한다
					var marker = new daum.maps.Marker({
					    position: new daum.maps.LatLng${dto.meeting_loc}, // 마커의 좌표
					    map: map // 마커를 표시할 지도 객체
					});
					daum.maps.event.addListener(marker, 'click', function() {
					   
					});
			
				</script>
			</div>
			<div>
				<span class="fa fa-map-marker" style="margin:30px; font-size:40px">
					<font color="#1d1f21">${dto.loc_detail}</font>
				</span>
			</div>
		</div>
		<div style="height:400px; width:45%; float:right;">
			<form name="contents">
				<p style="margin:20px; font-size:30px;"><font color="#1d1f21">모임명 :</font> ${dto.meeting_title}</p>
				<p style="margin:20px; font-size:30px;"><font color="#1d1f21">시간 :</font> ${date}</p>
				<p style="margin:20px; font-size:30px;"><font color="#1d1f21">참가비 :</font> <input type="text" id="price" style="width:200px; border:0px; background:#eeeeed;"value="${dto.meeting_cost}"></p>
				<p style="margin:20px; font-size:30px;"><font color="#1d1f21">인원 :</font> ${dto.meeting_pernum} 명</p>
				<p style="margin:20px; font-size:30px;"><font color="#1d1f21">상세설명 :</font> ${dto.meeting_detail}</p>
			</form>
		</div>
	</div>
</body>
</html>