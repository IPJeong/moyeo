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
	<li><a href="/moyeo/one/main/main.jsp">Home</a></li>
	<li><a href="/moyeo/one/customer-support/customer_support_main.jsp">고객지원</a></li>
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
						<th align="center" class="num"><font size="4">글 번호</font>
						</th>
						<th align="center" class="subject"><font size="4">제목</font>
						</th>
						<th align="center" class="writer"><font size="4">작성자</font>
						</th>
						<th align="center" class="announce"><font size="4">작성일</font>
						</th>
						<th align="center" class="count"><font size="4">조회수</font>
						</th>
						<th align="center" class="answer"><font size="4">답변여부</font>
						</th>
					</tr>
					
				<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">
						<tr>
							<td align="center">
								<font size="4">
									${number}
								</font>
								<c:set var="number" value="${number-1}" />
							</td>
							
							<td align="center">
								<font size="4">
									<a href="/moyeo/one/qnaContentForm?qboard_num=${dto.qboard_num}&pageNum=${pageNum}&number=${number+1}">${dto.title}</a>
								</font>
							</td>
								
							<td align="center">
								<font size="4">
									${dto.mem_id}
								</font>	
							</td>
							
							<td align="center">
								<font size="4">
									<fmt:formatDate value="${dto.write_date}" type="both" pattern="yyyy-MM-dd HH:mm"/>
								</font> 
							</td>
							
							<td align="center">
								<font size="4">
									${dto.hit}
								</font>
							</td>
							
							<c:if test="${dto.status == 'YES'}">
							<td align="center">
								<font style="color:blue" size="4">답변완료</font>
							</td>
							</c:if>
							
							<c:if test="${dto.status != 'YES'}">
							<td align="center">
								<font size="4">
									답변전
								</font>
							</td>
							</c:if>
					</c:forEach>
				</c:if>
				
				<table style="width:1400pxalign="center"" >
				<th align="center">
				<c:if test="${cnt > 0}">
				<!-- 처음[◀◀] 이전[◀] ▶-->
					<c:if test="${startPage > pageBlock}">
						<a href="/moyeo/one/qna">[◀◀]</a>
						<a href="/moyeo/one/qna?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}" >
							<span><b>[${i}]</b></span>
						</c:if>
						
						<c:if test="${i != currentPage}">
							<a href="/moyeo/one/qna?pageNum=${i}">[${i}]</a>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록[▶] 끝[▶▶]-->
					<c:if test="${pageCount > endPage}">
						<a href="/moyeo/one/qna?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="/moyeo/one/qna?pageNum=${pageCount}">[▶▶]</a>
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
		<a href="/moyeo/one/qnaWrite"><input type="button" class="button" value="글 쓰기"></a>
		<ul
			class="pagination pagination-sm pull-right push-down-20 push-up-20"
			style="align: center;">
			
		</ul>

	</div>
</div>
</body>
</html>
<%@ include file="../../etc/footer.jsp"%>  