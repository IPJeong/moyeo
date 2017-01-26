<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../../etc/header.jsp"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>

<head>
<style>
.col-md-12 {
	width: 75%;
	margin: auto;
	float: none;
}

.panel.panel-default {
	margin: 30px;
}

.panel .panel-body {
	padding: 0px;
}

.col-md-6 {
	border-left-color: #F5F5F5;
	border-left-width: 1px;
	border-left-style: solid;
}

.x-content-footer {
	position: relative;
}

.x-dashboard .page-container .page-content {
	background: #e3f8ff;
}

table {
	width: 100%;
	
}

th {
	border: 1px solid #9d9fbc;
	background: #e5ecf1;
    text-align: center;
}


td {
	border: 1px solid #9d9fbc;
}

tr {
	height: 20px;
}

.num {
	width: 7%
}
.subject {
	width: 48%;
}

.writer {
	width: 10%
}
.announce {
	width: 15%;
}

.count {
	width: 10%;
}

.answer {
	width: 10%;
}

.x-dashboard .page-container .page-content {
	height: 837px;
}

.button {
	font-size:15px;  
	width:100px;
	height:30px; 
	align:center; 
	margin-left: 95%; 
	margin-top:-20px"
}
</style>
</head>


<body>
<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="../main/main.jsp">Home</a></li>
	<li><a href="../customer-support/customer_support_main.jsp">고객지원</a></li>
	<li class="active">공지사항</li>
</ul>
<!-- END BREADCRUMB -->

<div class="page-title">
	<h2>
		<span class="fa fa-users"></span> Q&A <small> NOTICEBOARD </small>
	</h2>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<table>
					<tr>
						<th align="center" class="num"><font size="5">글 번호</font>
						</th>
						<th align="center" class="subject"><font size="5">제목</font>
						</th>
						<th align="center" class="writer"><font size="5">작성자</font>
						</th>
						<th align="center" class="announce"><font size="5">작성일</font>
						</th>
						<th align="center" class="count"><font size="5">조회수</font>
						</th>
						<th align="center" class="answer"><font size="5">답변여부</font>
						</th>
					</tr>
					
				<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td align="center">
								${number}
								<c:set var="number" value="${number-1}" />
							</td>
							
							<td align="center">
								<a href="qnaContentForm?qboard_num=${dto.qboard_num}&pageNum=${pageNum}&number=${number+1}">${dto.title}</a>
							</td>
								
							<td align="center">
								${dto.mem_id}
							</td>
							
							<td align="center">
								<fmt:formatDate value="${dto.write_date}" type="both" pattern="yyyy-MM-dd HH:mm"/> 
							</td>
							
							<td align="center">
								${dto.hit}
							</td>
							
							<c:if test="${dto.status == 'YES'}">
							<td align="center">
								<font style="color:blue">답변완료</font>
							</td>
							</c:if>
							
							<c:if test="${dto.status != 'YES'}">
							<td align="center">
								답변전
							</td>
							</c:if>
					</c:forEach>
				</c:if>
				
				<table style="width:1400px" align="center">
				<th align="center">
				<c:if test="${cnt > 0}">
				<!-- 처음[◀◀] 이전[◀] ▶-->
					<c:if test="${startPage > pageBlock}">
						<a href="qna">[◀◀]</a>
						<a href="qna?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}" >
							<span><b>[${i}]</b></span>
						</c:if>
						
						<c:if test="${i != currentPage}">
							<a href="qna?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록[▶] 끝[▶▶]-->
					<c:if test="${pageCount > endPage}">
						<a href="qna?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="qna?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
				
				<c:if test="${cnt ==0}">
					<tr>
						<td colspan="6" align="center">
							게시판에 글이 없습니다.
						</td>
					</tr>
				</c:if>
				</th>
				</table>
				</table>
				
			</div>
		</div>
		<a href="../one/qnaWrite"><input type="button" class="button" value="글 쓰기"></a>
		<ul
			class="pagination pagination-sm pull-right push-down-20 push-up-20"
			style="align: center;">
			
		</ul>

	</div>
</div>
</body>
</html>
<%@ include file="../../etc/footer.jsp"%>  