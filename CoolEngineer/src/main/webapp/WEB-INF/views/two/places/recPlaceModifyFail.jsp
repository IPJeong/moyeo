<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<html>
<body>
<script type="text/javascript">
	alert("다른 사람이 작성한 글입니다.");
	window.location='recPlaceContentForm?recpla_num=${recpla_num}';
</script>
</body>
</html>