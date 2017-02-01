<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("답변실패");
			window.location='/moyeo/one/moimReportHandleMain';
		</script>
	</c:if>
	
	<c:if test="${cnt != 0}">
		<script type="text/javascript">
			alert("답변이 등록되었습니다");
			window.location="/moyeo/one/reportContentForm?report_num="+${report_num}+"&pageNum="+${pageNum}+"&number="+${number};
		</script>
	</c:if>
	
	
</body>
</html>