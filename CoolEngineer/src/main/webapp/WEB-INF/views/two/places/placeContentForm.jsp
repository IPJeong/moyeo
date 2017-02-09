<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../etc/header2.jsp"%>

<script type="text/javascript">

function placeModify() {
	var place_num = document.placecontentform.place_num.value;
	window.location = "placeModifyForm?place_num=" + place_num;
}

function placeDelete() {
	var place_num = document.placecontentform.place_num.value;
	if(confirm("정말 삭제하시겠습니까?")) {
		window.location = "placeDeletePro?place_num=" + place_num;
	} else {
		return false;
	}
}

function recPlaceWrite() {
	var place_num = document.placecontentform.place_num.value;
	window.location = "recPlaceWriteForm?place_num=" + place_num;
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
    width: 70%;
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
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}

</style>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="/moyeo/main/home">Home</a></li>
                    <li><a href="/moyeo/two/placeMainLoc">추천장소 메인</a></li>
                    <li class="active">장소정보</li>
                </ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->
<div class="row">

	<div class="col-md-56" style="margin-top:30px; margin-bottom:30px; margin-left:15%; height:1200px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>장소정보 상세보기</h3>
				</div>
			</div>

			<br> <br> <br> <br>
			<h3 style="float:left; margin-left: 20%;">장소정보</h3>
			
			<br><br><br>
			<div class="inner" style="width:60%; height:350px; margin-left:20%; border:1px solid #000000;">
	            <div class="img" style="border:1; float:left; width:44%; height:300px; margin-top:25px; margin-left:5%;">
	            	<img src="${ppdto.place_pic_path}/${ppdto.place_pic_name}" alt="장소 사진" style="width:99%; height:99%;"> 
	            </div>  
	                                  
	            <div class="info" style="border:1; float:right; width:44%; height:300px; margin-top:25px; margin-right:5%;">
		            <ul>
		            <br>
			            <li>
			            <strong>이름</strong> &nbsp; ${pidto.place_name}
			            </li> 
		            <br><br>
			            <li>
			            <strong>주소</strong> &nbsp; ${pidto.place_address}
			            </li>
		            <br><br>
			            <li>
			            <strong>링크</strong> &nbsp; <a href="${pidto.place_link}">${pidto.place_link}</a>
			            </li>
		            <br><br>
			            <li>
			            <strong>상세설명</strong>
			            </li>
		            <br><br>
			            <li style="width:99%; height:140px;">
			            	${pidto.place_detail}
			            </li>
		            <br><br>
					</ul>
	            </div>
            </div>
            <br>
                <form name="placecontentform">
                	<input type="hidden" name="place_num" value="${place_num}">
                	<input type="hidden" name="pageNum" value="${pageNum}">
					<div style="float: right; margin-right:20%;">
						<input type="button" class="btn btn-info" value="수정" onclick="placeModify()">
						<input type="button" class="btn btn-info" value="삭제" onclick="placeDelete()">
						<input type="button" class="btn btn-info" value="목록" onclick="window.location='placeList'">
					</div>
				</form>
			<br> <br> 
				
				
			<div style="font-size:25px; width:80%; margin-left:10%;">
				<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;">
						<br><br>
					<h3 style="float:left; margin-left: 5%;">추천장소 후기</h3>
						
					<br><br>
				<form name="recplalistform">
                	<input type="hidden" name="place_num" value="${place_num}">
					<div style="float:left; margin-left:6%;">
						<input type="button" class="btn btn-info" value="추천후기 작성" onclick="recPlaceWrite()">
					</div>
				</form>
					
						<br>
										
						<div>
							<table class="table table-striped table-hover"
								style="width: 90%; margin-left: 5%;">
								<tr class="info">
									<td style="width:15%" align="center">번호</td>
									<td style="width:65%">제목</td>
									<td style="width:20%" align="center">아이디</td>
								</tr>
						<c:if test="${cnt > 0}">
							<c:forEach var="rpdtos" items="${rpdtos}">
								<tr style="border:0;">
									<td style="border:0;" align="center">
										${recpla_num}
									</td>
									<c:set var="recpla_num" value="${recpla_num - 1}" />
									<td style="border:0;">
										<a href="recPlaceContentForm?recpla_num=${rpdtos.recpla_num}">
											${rpdtos.recpla_title}
										</a>	
									</td>
									<td style="border:0;" align="center">
										${rpdtos.mem_id}
									</td>		
								</tr>
							</c:forEach>
						</c:if>
						
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="4" align="center" style="height:40px">
										추천장소 후기가 존재하지 않습니다.
									</td>
								</tr>
							</c:if>
							</table>
					 </div>
	
						
					    <div style="float:right; margin-right:50%;">	
							<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
			
								<c:if test="${cnt > 0}">
						
									<c:if test="${startPage > pageBlock}">
										<li class=""><a href="placeContentForm?place_num=${place_num}&recPlacePageNum=${startPage - pageBlock}"><font
													size="3"> «</font></a></li>
									</c:if>
						
						
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${i == currentPage}">
											<li class=""><a href="#"><font size="3">${i}</font></a></li>
										</c:if>
						
										<c:if test="${i != currentPage}">
											<li class=""><a href="placeContentForm?place_num=${place_num}&recPlacePageNum=${i}"><font size="3">${i}</font></a></li>
										</c:if>
						
									</c:forEach>
									<c:if test="${pageCount > endPage}">
										<li><a href="placeContentForm?place_num=${place_num}&recPlacePageNum=${startPage + pageBlock}"><font
													size="3">»</font></a></li>
									</c:if>
								</c:if>
									
							</ul>
					  </div>
					
				  </div>
				  <br>
			</div>
			
		</div>
	</div>

</div>
<!-- END ROW -->
<%@ include file="../../etc/footer2.jsp"%>