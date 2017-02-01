<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<html>
<body>
	<c:if test="${cnt == -1}">
		<script type="text/javascript">
			alert("이미 '좋아요'를 눌렀습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("로그인해주세요.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			alert("'좋아요'를 누르셨습니다.");
			window.location='recPlaceContentForm?recpla_num=${recpla_num}';
		</script>
	</c:if>
</body>
</html>