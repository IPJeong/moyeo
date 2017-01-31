<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<html>
<body>
	<c:if test="${cnt == -1}">
		<script type="text/javascript">
			alert("패스워드가 일치하지 않습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("아이디가 일치하지 않습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			alert("로그인 되었습니다.");
			window.location='/moyeo/main/home';
		</script>
	</c:if>
</body>
</html>