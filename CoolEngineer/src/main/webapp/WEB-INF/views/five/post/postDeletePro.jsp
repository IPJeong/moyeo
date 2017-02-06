<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<c:if test="${cnt == 1}">
		<script type="text/javascript">
			alert('모임후기가 정상적으로 삭제 되었습니다.');
			window.location='postList?pageNum='+${pageNum};
		</script>
	</c:if>
	<c:if test="${cnt == 0}">
		<script type="text/javascript">
			alert('모임후기 삭제에 실패하였습니다. \n 잠시후 다시 시도해주세요.');
			history.back();
		</script>	
	</c:if>
</body>
</html>