<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="map" style="width: 750px; height: 350px;">

		<script
			src="//apis.daum.net/maps/maps3.js?apikey=14b379d0fba99fe89520cb90c8c7d849"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(37.556444, 126.945201), // 지도의 중심좌표
				level : 5, // 지도의 확대 레벨
				mapTypeId : daum.maps.MapTypeId.ROADMAP
			// 지도종류
			};

			// 지도를 생성한다 
			var map = new daum.maps.Map(mapContainer, mapOption);

			// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
			daum.maps.event.addListener(map, 'rightclick', function(mouseEvent) {
				alert('지도에서 클릭한 위치의 좌표는 '
						+ mouseEvent.latLng.toString() + ' 입니다.');
				var point = mouseEvent.latLng.toString();
				opener.document.register.meeting_loc.value = point;
				opener.document.register.map.value = point;
				self.close();
			});

			// 지도 타입 변경 컨트롤을 생성한다
			var mapTypeControl = new daum.maps.MapTypeControl();

			// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

			// 지도에 확대 축소 컨트롤을 생성한다
			var zoomControl = new daum.maps.ZoomControl();

			// 지도의 우측에 확대 축소 컨트롤을 추가한다
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

			
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(); 

			// 키워드로 장소를 검색합니다
			ps.keywordSearch('이태원 맛집', placesSearchCB); 

			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (status, data, pagination) {
			    if (status === daum.maps.services.Status.OK) {

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new daum.maps.LatLngBounds();

			        for (var i=0; i<data.places.length; i++) {
			            displayMarker(data.places[i]);    
			            bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
			        }       

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}

			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new daum.maps.Marker({
			        map: map,
			        position: new daum.maps.LatLng(place.latitude, place.longitude) 
			    });

			    // 마커에 클릭이벤트를 등록합니다
			    daum.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
			        infowindow.open(map, marker);
			    });
			}
			
			// 지도에 마커를 생성하고 표시한다
		</script>
	</div><br>
	지도에서 마우스 오른쪽버튼을 클릭하면 모임장소가 자동으로 등록됩니다.
</body>
</html>