<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<body>
	<c:if test="${cnt > 0}">
		<script type="text/javascript">
			alert("책이 등록되었습니다.");
		</script>
		<c:redirect url="/four/shop/moyeoShop" />
	</c:if>
	<c:if test="${cnt <= 0}">
		<!-- 작성 실패  -->
		<script type="text/javascript">
			alert("등록 오류입니다.");
			history.back();
		</script>
	</c:if>
	
</body>