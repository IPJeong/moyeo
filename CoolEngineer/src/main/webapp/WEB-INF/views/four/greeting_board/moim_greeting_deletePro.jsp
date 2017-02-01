<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
			<c:if test="${deleteCnt == 1 }">
				<script type="text/javascript">
					alert("게시글이 삭제되었습니다.");
					window.location='moim_greeting_board?pageNUm=${pageNum}';
				</script>
			</c:if>
			
			<c:if test="${deleteCnt != 1}">
				<script type="text/javascript">
					alert("삭제 오류 입니다.");
					window.location='moim_greeting_board?pageNUm=${pageNum}';
				</script>
			</c:if>
</body>
</html>