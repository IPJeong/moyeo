<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	
	<c:if test="${cnt == 0}">
	<!-- 작성 실패 -->
	<script type="text/javascript">
		alert("등록 실패");
		window.location='../one/qna';
	</script>
	</c:if>

	<c:if test="${cnt != 0}">
	<script type="text/javascript">
		alert("등록 성공");
		window.location='../one/qna';
	</script>
	</c:if>
