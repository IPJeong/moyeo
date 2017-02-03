<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../etc/header.jsp"%>
<script type="text/javascript">

function sugStatusSelect() {
 	var select = document.getElementsByName("sug_status_select"); 
	for(var i=0; i<select.length; i++) {
		if (select[i].value == "Y") {
			window.location = "suggestionList?sug_status=Y";
		} else {
			window.location = "suggestionList?sug_status=N";
		}
	}
}

</script>

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
    width: 80%;
    height: 700px;
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
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}

</style>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li><a href="../category/category_hobby.jsp">모임</a></li>
                    <li><a href="../moim/moim_main.jsp">영등포 볼링</a></li>
                    <li class="active">모임관리</li>
                </ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->
<div class="row">
		<!-- START LOGIN BLOCK -->

		<!-- START RECOMMENDATION MEET BLOCK -->
	
	<!-- END LOGIN BLOCK -->


	<!-- START SEARCH BLOCK -->

	<!-- END SEARCH BLOCK -->

	<!-- START NOTICE BLOCK -->

	<!-- END NOTICE BLOCK -->

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top:20px; margin-bottom:20px; margin-left:10%; height:750px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>건의사항 리스트 페이지</h3>
				</div>
			</div>
			
			<div style="text-align: center; font-size: 25px">
				<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;">
					<br><br>
					<h2>건의사항 리스트</h2>
					
					<br><br>
					
					<div>
						<table class="table table-striped table-hover"
							style="width: 90%; margin-left: 5%;">
							<tr class="info">
								<td style="width:3%">선택</td>
								<td style="width:3%">건의번호</td>
								<td style="width:5%">건의제목</td>
								<td style="width:7%">작성일</td>
								<td style="width:5%">회신이메일</td>
								<td style="width:5%">회원아이디</td>
								<td style="width:5%">								
									<select class="form-control" id="test" name="sug_status_select" onchange="sugStatusSelect()">
										<option value="">처리여부 선택</option>
										<option value="N">처리 안 됨</option>
										<option value="Y">처리 됨</option>
									</select>
								</td>
								<td style="width:5%">관리자아이디</td>
								<td style="width:7%">처리날짜</td>
							</tr>
					<c:if test="${cnt > 0}">
						<c:forEach var="dtos" items="${dtos}">
							<tr style="border:0;">
								<td style="border:0;" align="center">
									<a href="suggestionContentForm?sug_num=${dtos.sug_num}&pageNum=${pageNum}">
										<button class="btn btn-default">
											건의 처리
										</button>
									</a>
								</td>
								<td style="border:0;" align="center">
									${sug_num}
								</td>
								<c:set var="sug_num" value="${sug_num-1}" />
								<td style="border:0;" align="center">
									${dtos.sug_title}
								</td>		
								<td style="border:0;" align="center">
									<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dtos.sug_date}" />
								</td>
								<td style="border:0;" align="center">
									${dtos.re_email}
								</td>
								<td style="border:0;" align="center">
									${dtos.mem_id}
								</td>
								<td style="border:0;" align="center">
									${dtos.sug_status}
								</td>
								<td style="border:0;" align="center">
									${dtos.manager_id}
								</td>
								<td style="border:0;" align="center">
									<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${dtos.sol_date}" />
								</td>
							</tr>
						</c:forEach>
					</c:if>
					
					<!-- 책이 없으면 -->
						<c:if test="${cnt == 0}">
							<tr>
								<td colspan="9" align="center" style="height:40px">
									현재 고객의 건의사항이 없습니다.
								</td>
							</tr>
						</c:if>
						</table>
				 </div>

				 <div style="float:right; margin-right:50%;">	
					<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
	
						<c:if test="${cnt > 0}">
				
							<c:if test="${startPage > pageBlock}">
								<li class=""><a href="suggestionList?pageNum=${startPage - pageBlock}"><font
											size="3"> «</font></a></li>
							</c:if>
				
				
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class=""><a href="#"><font size="3">${i}</font></a></li>
								</c:if>
				
								<c:if test="${i != currentPage}">
									<li class=""><a href="suggestionList?pageNum=${i}"><font size="3">${i}</font></a></li>
								</c:if>
				
							</c:forEach>
							<c:if test="${pageCount > endPage}">
								<li><a href="suggestionList?pageNum=${startPage + pageBlock}"><font
											size="3">»</font></a></li>
							</c:if>
						</c:if>
							
					</ul>
			  </div>
				  			
		</div>
	</div>
	<!-- END PHOTO BLOCK -->





	<!-- END RECOMMENDATION MEET BLOCK -->


	<!-- START MOVIE BLOCK -->

	<!-- END MOVIE BLOCK -->

	<!-- START REALTIME MEET BLOCK -->

	<!-- END REALTIME MEET BLOCK -->

	<!-- START RECOMMENDATION LOCATION BLOCK -->

	<!-- END RECOMMENDATION LOCATION BLOCK -->

	<!-- START EVENT BLOCK -->

	<!-- END EVENT BLOCK -->

	<!-- START ADVERTISE BLOCK -->

	<!-- END ADVERTISE BLOCK -->

	<!-- START REVIEW BLOCK -->

	<!-- END REVIEW BLOCK -->
		</div>
	</div>
<!-- END ROW -->
</div>
<%@ include file="../../etc/footer.jsp"%>