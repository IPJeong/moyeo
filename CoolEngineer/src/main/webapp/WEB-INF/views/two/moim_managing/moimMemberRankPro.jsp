<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<body>
	<c:if test="${cnt == -1}">
		<script type="text/javascript">
			alert("모임장의 등급을 변경할 수 없습니다.");
			opener.location.reload();//새로고침
			window.close();
		</script>
	</c:if>

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("모임원 등급 변경을 실패했습니다.");
			opener.location.reload();//새로고침
			window.close();
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("모임원 등급 변경을 변경했습니다.");
			opener.location.reload();//새로고침
			window.close();
		</script>
	</c:if>
	
</body>
</html>