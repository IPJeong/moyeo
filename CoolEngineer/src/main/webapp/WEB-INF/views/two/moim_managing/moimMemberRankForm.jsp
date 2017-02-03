<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">

function moimMemberRankSelectCheck() {
	var group_per = document.moimmemberrankform.group_per.value;
	
	if(group_per == 0) {
		alert("회원 등급을 선택해주세요.");
		return false;
	}
	
}


</script>

<style>
.btn {
  display: inline-block;
  margin-bottom: 0;
  font-weight: normal;
  text-align: center;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  background-image: none;
  border: 1px solid transparent;
  white-space: nowrap;
  padding: 8px 12px;
  font-size: 14px;
  line-height: 1.42857143;
  border-radius: 4px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.btn-primary {
  color: #ffffff;
  background-color: #2fa4e7;
  border-color: #2fa4e7;
}
</style>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모임원 등급 변경</title>
</head>
<body>
	<div>
		<form action="moimMemberRankPro" name="moimmemberrankform" onsubmit="return moimMemberRankSelectCheck()">
			<input type="hidden" name="group_num" value="${group_num}">
			<input type="hidden" name="my_group_num" value="${my_group_num}">
			<br>
			<div style="float:left; margin-left:90px;">
				<h3><span style="color:red;">${dto.mem_id}</span> 회원의 등급은 <span style="color:red;"><c:if test="${dto.group_per == 1}">모임장</c:if><c:if test="${dto.group_per == 2}">운영진</c:if><c:if test="${dto.group_per == 3}">모임원</c:if></span> 입니다.</h3>
			</div>
			<br>
			<div style="float:left; margin-left:80px; margin-top:-10px;">
				<h3><select class="form-control" name="group_per" style="height:30px;">
						<option value="0">등급선택</option>
						<option value="2">운영진</option>
						<option value="3">모임원</option>
					</select> 
				&nbsp;등급으로 변경하시겠습니까?</h3>
			</div>
			<br>
			<div style="float:left; margin-left:170px; margin-top:20px;">
				<input type="submit" class="btn btn-primary" value="입력">&nbsp;&nbsp;
				<input type="button" class="btn btn-primary" value="취소" onclick='window.close()'>
			</div>
		</form>
	</div>
</body>
</html>