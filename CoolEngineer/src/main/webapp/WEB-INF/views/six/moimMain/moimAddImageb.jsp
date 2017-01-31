<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>등록할 사진을 선택해주세요</h3><br>
 <form:form class="form-horizontal" action="moimAddImageProb" method="post" modelAttribute="uploadForm" enctype="multipart/form-data">
		<input type="file" class="form-control" style="margin-left:30px; border:1px #bbb6f6 solid" id="file0" name="files[0]" required><br><br>
		<center><input type="submit" value="등록">
		<input type="button" value="닫기" onclick="window.close();"></center>
</form:form>
</body>
</html>