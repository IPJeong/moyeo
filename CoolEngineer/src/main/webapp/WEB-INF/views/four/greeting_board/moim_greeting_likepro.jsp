<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<body>
	<c:if test="${cnt < 0}">
		<script type="text/javascript">
			alert("이미 추천을 눌렀습니다.");
			history.back();
		</script>
	</c:if>
	<c:if test="${cnt==0}">
		<!-- 작성 실패  -->
		<script type="text/javascript">
			alert("추천 오류입니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
		<script type="text/javascript">
		alert("추천 되었습니다.");
		history.back();
		</script>
	</c:if>
</body>