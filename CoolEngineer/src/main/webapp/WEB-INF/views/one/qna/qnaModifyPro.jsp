<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("수정오류");
			window.location='/moyeo/one/qna';
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("글이 수정되었습니다.");
			window.location="/moyeo/one/qnaContentForm?qboard_num="+${qboard_num}+"&pageNum="+${pageNum}+"&number="+${number};
		</script>
	</c:if>
	
	
</body>
</html>