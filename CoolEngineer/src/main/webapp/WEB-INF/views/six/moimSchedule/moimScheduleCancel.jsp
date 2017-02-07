<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${cnt2 == 1}">
		<script type="text/javascript">
			alert("참석취소가 완료되었습니다");
			window.location = 'moimSchedule?group_num=${group_num}';
		</script>
	</c:if>
	<c:if test="${cnt2 != 1}">
		<script type="text/javascript">
			alert("참석취소에 실패했습니다.\n 잠시후 다시 시도하세요.");
			window.location = 'moimSchedule?group_num=${group_num}';
			</script>
	</c:if>
	
	
</body>
</html>