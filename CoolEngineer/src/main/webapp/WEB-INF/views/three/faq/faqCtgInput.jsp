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
			alert("카테고리가 입력되었습니다.");
			window.location='faq';
		</script>
	</c:if>
	<c:if test="${cnt == -1}">
		<script type="text/javascript">
			alert("입력하신 카테고리는 이미 존재 합니다.");
			window.location='faqCategory';			
		</script>
	</c:if>
	