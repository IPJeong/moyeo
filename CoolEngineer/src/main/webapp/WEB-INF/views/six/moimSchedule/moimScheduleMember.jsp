<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" id="theme" href="/moyeo/resources/resource/css/theme-default.css" />

<title>Insert title here</title>
</head>
<body>
<table class="table table-striped table-hover" style="width:200px;">
	<c:if test="${dtos == null}">
		아직 참석 멤버가 없습니다. 모임에 참석해보세요!
	</c:if>
	<c:forEach var="dto" items="${dtos}">
			<tr class="info">
				<td style="border:1px solid black; size:14; margin:20px;">
				${dto.mem_id}
				</td>
			</tr>
	</c:forEach>
</table>
</body>
</html>