<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<body>
	<c:if test="${chk_cnt == 0}">
		<script type="text/javascript">
			alert("판매자가 아닙니다");
			window.location='/moyeo/one/moyeoSeller';
		</script>
	</c:if>
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("판매자 정보 수정에 실패했습니다.");
			window.location='/moyeo/one/moyeoSeller';
		</script>
	</c:if>
	<c:if test="${cnt > 0}">
		<script type="text/javascript">
			alert("판매자 정보 수정을 성공했습니다.");
			window.location='/moyeo/one/moyeoSeller';
		</script>
	</c:if>	
</body>
</html>