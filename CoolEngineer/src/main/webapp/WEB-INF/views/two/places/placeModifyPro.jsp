<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<html>
<body>
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("장소 정보를 수정하지 못 했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("장소 정보가 수정되었습니다.");
			window.location='placeContentForm?place_num=' + ${place_num};
		</script>
	</c:if>
</body>
</html>