<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<html>
<body>
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("건의사항을 확인 처리하지 못 했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("건의사항을 확인 처리했습니다.!");
			window.location='suggestionList?pageNum=' + ${pageNum};
		</script>
	</c:if>
</body>
</html>