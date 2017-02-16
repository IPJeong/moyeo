<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
	<c:if test="${cnt == 1}">
		<script>
			alert("정상적으로 승인되었습니다.");
			opener.document.location.href="/moyeo/one/seller?pageNum="+${pageNum};
			self.close();
		</script>
	</c:if>
	
	<c:if test="${cnt != 1}">
		<script>
			alert("승인실패");
			history.back();
		</script>
	</c:if>
</body>
</html>