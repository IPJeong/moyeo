<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
function placeSearchCheck(){
	if(!document.placesearchform.search.value) {
		alert("검색창에 입력하지 않았습니다.");
		document.placesearchform.search.focus();
		return false;
	}
}	
</script>

<html>
<body>
	<form action="placeSearchList" name="placesearchform" class="navbar-form navbar-left" role="search" style="width:400px;" onsubmit="return placeSearchCheck()">
		<select class="form-control-1 select" name="category" style="height:35px">
			<option value="place_name">장소명</option>
			<option value="place_address">주소</option>
			<option value="place_link">링크</option>		
		</select>
		<input class="form-control" type="text" name="search" maxlength="30">
		<input type="submit" class="btn btn-default" value="입력">
	</form>
</body>
</html>