<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<html>
<body>
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("모임원을 강제탈퇴시키지 못 했습니다..");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("모임원을 강제탈퇴시켰습니다.");
			window.location='moimMemberManaging?group_num='+${group_num};
		</script>
	</c:if>
</body>
</html>