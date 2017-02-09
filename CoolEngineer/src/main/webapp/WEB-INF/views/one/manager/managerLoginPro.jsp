<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<html>
<body>
	<c:if test="${authority == '02'}">
		<script type="text/javascript">
			alert("최고관리자로 로그인 되었습니다.");
			window.location="/moyeo/one/managerMain?authority=${authority}";
		</script>
	</c:if>
	
	<c:if test="${authority == '08'}">
		<script type="text/javascript">
			alert("하위관리자로 로그인 되었습니다.");
			window.location="/moyeo/one/managerMain?authority=${authority}";
		</script>
	</c:if>

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
</body>
</html>