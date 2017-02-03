<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${cnt==0}">
		<!-- 작성 실패  -->
		<script type="text/javascript">
			alert("글 작성 오류입니다.");
		</script>
	</c:if>
	
	<c:if test="${cnt !=0}">
		<c:redirect url="moim_notice_board" />
	</c:if>
</body>
</html>