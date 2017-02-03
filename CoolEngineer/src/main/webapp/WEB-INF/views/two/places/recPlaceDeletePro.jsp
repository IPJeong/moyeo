<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<html>
<body>
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("다른 사람이 작성한 글입니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("추천장소 후기가 삭제되었습니다.");
			window.location='placeContentForm?place_num=${place_num}';
		</script>
	</c:if>
</body>
</html>