<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("수정오류");
			opener.document.location.href="/moyeo/one/productManage";
			self.close();
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("제품이 수정되었습니다.");
			opener.document.location.href="/moyeo/one/productManage";
			self.close();
		</script>
	</c:if>
	
	
</body>
</html>