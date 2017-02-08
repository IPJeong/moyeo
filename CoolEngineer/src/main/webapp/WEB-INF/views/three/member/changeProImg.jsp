<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="/moyeo/resources/customScript/three.js"></script>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert(insertError);
	</script>
</c:if>

<c:if test="${cnt == -1}">
	<script type="text/javascript">
		alert("프로필사진을 선택하세요");
		window.location='/moyeo/three/myPage';
	</script>
</c:if>

<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert("프로필사진을 초기화했습니다.");
		window.location='/moyeo/three/myPage';
	</script>
</c:if>

<c:if test="${cnt == 2}">
	<script type="text/javascript">
		alert("프로필사진을 변경하였습니다.");
		window.location='/moyeo/three/myPage';
	</script>
</c:if>