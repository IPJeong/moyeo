<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<html>
<body>
	<c:if test="${mem_id == 'admin'}">
		<script type="text/javascript">
			alert("관리자로 로그인 되었습니다.")
			window.location="/moyeo/one/managerMain";
		</script>
	</c:if>

	<c:if test="${cnt == -1}">
		<script type="text/javascript">
			alert("패스워드가 일치하지 않습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert("아이디가 일치하지 않습니다.");
			history.back();
		</script>
	</c:if>
	
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			alert("로그인 되었습니다.");
<%-- 			window.location='<%=request.getParameter("beforeurl")%>'; --%>
			window.location='/moyeo/main/home';
		</script>
	</c:if>
	
	<c:if test="${cnt == 2}">
		<script type="text/javascript">
			alert("임시비밀번호를 변경 하십시오.");
<%-- 			window.location='<%=request.getParameter("beforeurl")%>'; --%>
			window.location='/moyeo/three/tempPw';
		</script>
	</c:if>
</body>
</html>