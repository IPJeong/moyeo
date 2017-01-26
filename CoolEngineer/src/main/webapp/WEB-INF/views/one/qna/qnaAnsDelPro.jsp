<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
	<c:if test="${deleteCnt == 1}">
		<script>
			alert("정상적으로 삭제되었습니다.");
			window.location="/moyeo/one/qnaContentForm?qboard_num="+${qboard_num}+"&number="+${number}+"&pageNum="+${pageNum};
		</script>
	</c:if>
	
	<c:if test="${deleteCnt != 1}">
		<script>
			alert("삭제실패");
			history.back();
		</script>
	</c:if>
</body>
</html>