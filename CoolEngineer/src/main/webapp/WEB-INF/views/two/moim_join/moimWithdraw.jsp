<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<html>
<body>
	
	<c:if test="${cnt == -1}">
		<script type="text/javascript">
			alert("모임장은 탈퇴할 수 없습니다");
			history.back();	
		</script>
	</c:if>

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("모임 탈퇴하지 못 했습니다.");
			history.back();	
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
		<script type="text/javascript">
			alert("모임 탈퇴되었습니다.");
			window.location = '../six/moimMain/moimMain?group_num=${group_num}';
		</script>
	</c:if>

</body>
</html>