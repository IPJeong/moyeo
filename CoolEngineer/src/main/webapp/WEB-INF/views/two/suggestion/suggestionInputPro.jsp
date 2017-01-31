<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<html>
<body>
	<h2><center>건의사항 전송 완료</center></h2>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("건의사항을 전송하지 못 했습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("건의사항이 전송되었습니다.");
			window.location='/moyeo/six/cusSupMain';
		</script>
	</c:if>
</body>
</html>