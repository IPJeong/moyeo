<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="/moyeo/resources/customScript/three.js"></script>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert(meminputError);
	</script>
</c:if>

<c:if test="${cnt != 0}">
	<form action="memInterest" name="form" method="post">
		<input type="hidden" name="memid" value="${memid}">	
	</form>
	<script type="text/javascript">
		alert("회원가입 되었습니다.\n관심사를 입력 하십시오.");
		document.form.submit();
	</script>
</c:if>