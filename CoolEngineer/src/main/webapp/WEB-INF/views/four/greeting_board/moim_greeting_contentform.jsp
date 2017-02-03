<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/moim_header.jsp"%>
<!-- <script type="text/javascript">
	function daetgul() {
		if(document.greeting_reple.replecontent.value == null) {
			alert("댓글을 입력해주세요.")
			return false;
		}
	}
</script> -->
<style>

@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features {
    width: 100%;
    background-color: #FBFBFB;
    padding: 0px 20px;
}
}

@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open {
    display: block;
}
}

@media (min-width: 1100px){
.col-md-56 {
    width: 60%;
    height: 870px;
}
}
.chart-holder {
	height: 100%;
}

.main {
	
	height: 100%;
}

.panel .panel-body {
	height: 100%;
	overflow: scroll;
}

.col-md-25 {
	display: block;
}
li {
float:left;
margin: 1px 1px 1px;
list-style: none;
left: -3px;
}

</style>

  <ul class="breadcrumb push-down-0">
      <li><a href="../main/main.jsp">Home</a></li>
      <li><a href="../category/category_hobby.jsp">모임</a></li>
      <li><a href="../moim/moim_main.jsp">중앙2팀</a></li>
      <li><a href="../moim/moim_main.jsp">모임공지 게시판</a></li>
      <li class="active">게시글 보기</li>
  </ul>

<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top:10px; margin-left:10%;">
	
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->

		<!-- START PHOTO BLOCK -->
		
		
	
		<div class="col-md-56" style="margin-top:10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>게시글 보기</h3>
					</div>
				</div>
				
				
				<div class="panel-body padding-0" style="text-align:center; font-size: 25px" >
					<div class="chart-holder" id="dashboard-bar-1"
						style="height: 10px;">
				
				<!-- 메인 내용 시작 -->
				<br>
				<div style="width:80%; margin-left:7%;">
	
					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								<td width="10%">${dto.mem_id}</td>
								<td width="40%">제목 : ${dto.greeting_title}</td>
								<td width="17%">
				  					<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dto.greeting_date}" />
								</td>
								<td width="15%">좋아요 수 : ${dto.like_num}</td>
								<td width="15%">조회수 : ${dto.greeting_hit}</td>
							</tr>
						
						</thead>
						<tbody>
						
						
						
							<tr>
								<td colspan="5" style="height:300px;">${dto.greeting_content}</td>
							</tr>
						</tbody>
						</table>
						
				<!-- Form'좋아요'하는 작은 폼 -->
				<c:if test="${sessionScope.mem_id == dto.mem_id}">
					<form action="likeyo" method="post">
					<input type="hidden" name="num" value="${num}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="number" value="${number}">
					<input type="hidden" name="greeting_num" value="${dto.greeting_num}">
					<input type="submit" name="likename" class="btn btn-info" value="좋아요 +1">
					</form>
				</c:if>
				<!-- 폼 종료 -->	
					<br>
					
				
					 <div style="float:right; margin-right:5%;">
					 			<!-- 로그인 되어 있으면, 수정, 삭제 가능 -->
					 			<c:if test="${sessionScope.mem_id == dto.mem_id}">
								<input class="btn btn-default" value="수정" type="button" onclick="location.href='moim_greeting_modifyView?num=${dto.greeting_num}&pageNum=${pageNum}'">
								<input class="btn btn-default" value="삭제" type="button"  onclick="location.href='moim_greeting_delete?num=${dto.greeting_num}&pageNum=${pageNum}'">
								</c:if>
								<input class="btn btn-default" value="목록" type="button" onclick="location.href='moim_greeting_board'">
					</div>	  
				</div>				
					<br>
					<br>
					<br>
		
		
		<!-- 댓글 -->	
			<div style="overflow:scroll; width:100%">
			<!-- Arraylist 댓글 보여주는 창 -->
				 <div style="width:80%; margin-left:7%;">
					
					<c:forEach var="dtore" items="${dtos}" varStatus="status">
					<table class="table table-striped table-hover ">	
						
						<tr>
							<td width="5%" >${status.index+1}</td>
							<td width="5%" >${dtore.mem_id}</td>
							<td width="5%" >|</td>
							<td width="60%" style="text-align: left;">${dtore.gre_reply_content}</td>
							
							<!-- 로그인이 되어 있지 않으면,  -->
							<c:if test="${sessionScope.mem_id != dtore.mem_id}">
							<td width="40%" colspan="2">
							<fmt:formatDate type="both"
										pattern="yyyy-MM-dd HH:mm" value="${dtore.gre_reply_date}" /></td>
							</c:if>
							
							<!-- 로그인이 되어 있으면,  -->
							<c:if test="${sessionScope.mem_id == dtore.mem_id}">
								<td width="30%" style="text-align: center;">
								<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dtore.gre_reply_date}" /></td>
								<td width="30%" style="text-align: center;">
								<input class="btn btn-default" value="삭제" type="button"  onclick="location.href='repledelete?&num=${num}&pageNum=${pageNum}&number=${number}&gre_reply_num=${dtore.gre_reply_num}'">
								</td>
							</c:if>
							
							
						</tr>
					
					
					
					
					</table>
					</c:forEach>
					
				<!-- Form 댓글 입력창 : 아이디가 로그인되어 있으면 댓글을 입력할 수 있는 창이 보입니다.  -->
					<c:if test="${sessionScope.mem_id == dto.mem_id}">
				  
					<form action="greeting_reple" method="post"class="form-horizontal" >
						<input type="hidden" name="num" value="${num}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<input type="hidden" name="number" value="${number}">
						<input type="hidden" name="greeting_num" value="${dto.greeting_num}">
						
						<fieldset>
							   <div class="form-group">
							   <div class="col-lg-10" style="width:89%">
									<textarea class="form-control" name="replecontent" rows="1" id="textArea" maxlength="100" required></textarea>
								</div>
								<div class="col-lg-10" style="width:10%">
									<input class="btn btn-primary" style="float:right;" value="댓글입력" type="submit">
								</div>
							</div>
						 </fieldset>
					</form>	
					</c:if>
					
					<br>
					<br>
					<br>
					<!-- 폼 종료 -->	
					<!-- 댓글 입력창 종료 -->
				</div>
		<!-- 댓글 종료 -->	
	<!--메인내용 종료  -->
					</div>
					</div>			
				</div>	 
			</div>
		</div>
	</div>
</div>


<%@ include file="../../etc/footer.jsp"%>