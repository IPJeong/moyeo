<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<html>
<body>
	<c:if test="${cnt == -3}">
		<script type="text/javascript">
			alert("모임 정원이 다 찼습니다. 더 이상 가입신청할 수 없습니다.");
			history.back();	
		</script>
	</c:if>

	<c:if test="${cnt == -2}">
		<script type="text/javascript">
			alert("강제탈퇴되어 다시 가입할 수 없습니다.");
			history.back();	
		</script>
	</c:if>

	<c:if test="${cnt == -1}">
		<script type="text/javascript">
			alert("이미 가입신청했습니다.");
			history.back();	
		</script>
	</c:if>

	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("가입 신청하지 못 했습니다.");
			history.back();	
		</script>
	</c:if>
	
	<c:if test="${cnt > 0}">
		<script type="text/javascript">
			alert("가입신청했습니다.");
			window.location = '../six/moimMain/moimMain?group_num=${group_num}';
		</script>
	</c:if>

</body>
</html>