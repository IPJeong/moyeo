<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="/moyeo/resources/customScript/three.js"></script>
<c:if test="${cnt == 0}">
	<script type="text/javascript">
		errorAlert(insertError);
	</script>
</c:if>

<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert("이벤트를 마감하였습니다.");
		opener.parent.location.reload();
		window.close();
	</script>
</c:if>

<c:if test="${cnt == -1}">
	<script type="text/javascript">
		alert("당첨자를 선택하세요.");		
		window.history.back();			
	</script>
</c:if>