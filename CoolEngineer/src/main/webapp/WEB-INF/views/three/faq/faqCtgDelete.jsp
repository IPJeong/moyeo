<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="/moyeo/resources/customScript/three.js"></script>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert(deleteError);
	</script>
</c:if>

<c:if test="${cnt != 0}">
	<script type="text/javascript">
		alert("카테고리가 삭제되었습니다.");
		window.location='faq';
	</script>
</c:if>