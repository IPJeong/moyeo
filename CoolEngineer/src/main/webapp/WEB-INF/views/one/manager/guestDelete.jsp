<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<body>
	<c:if test="${deleteCnt == 1}">
		<c:if test="${openType == 'info'}">
			<script>
				alert("정상적으로 삭제되었습니다.");
				
				opener.document.location.href="/moyeo/one/guestList?pageNum="+${pageNum};
				
				self.close();
			</script>
		</c:if>
		<c:if test="${openType == 'ginfo'}">
			<script>
				alert("정상적으로 삭제되었습니다.");
				
				self.close();
				opener.close();
				opener.opener.location.reload(true);
			</script>
		</c:if>
	</c:if>

	<c:if test="${deleteCnt != 1}">
		<script>
			alert("삭제실패");
			history.back();
		</script>
	</c:if>
</body>
</html>