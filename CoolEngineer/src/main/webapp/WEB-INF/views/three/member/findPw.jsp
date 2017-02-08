<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="/moyeo/resources/customScript/three.js"></script>
<c:if test="${cnt != 1 || cnt != -1}">
	<script type="text/javascript">
		errorAlert(insertError);
	</script>
</c:if>

<c:if test="${cnt == -1}">
	<script type="text/javascript">
		alert("아이디가 존재 하지 않습니다. \n다시 확인해주세요");
		window.location='/moyeo/three/forgetpassword';
	</script>
</c:if>

<c:if test="${cnt == 1}">
	<script type="text/javascript">
		alert("등록된 이메일로 임시번호가 전송되었습니다.. \n이메일 확인 후 임시번호로 로그인 해주세요");
		window.location='/moyeo/main/memberLoginForm';
	</script>
</c:if>