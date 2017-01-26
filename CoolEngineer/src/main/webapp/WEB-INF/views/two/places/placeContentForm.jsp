<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../etc/header.jsp"%>

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
	
	
<!-- 
그림 불러오는 방법
<img src="/placeImgPath/${dto.imgPath}${dto.imgName}"> 
-->
	
	<div class="col-md-56" style="margin-top:30px; margin-bottom:30px; margin-left:15%; height:1200px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>장소정보 상세보기</h3>
				</div>
			</div>

			<br> <br> <br> <br>
			<h3 style="float:left; margin-left: 20%;">장소정보</h3>
			
			<br><br>
			<div class="inner" style="width:60%; height:350px; margin-left:20%; border:1px solid #000000;">
	            <div class="img" style="border:1; float:left; width:44%; height:300px; margin-top:25px; margin-left:5%;">
	            	<img src="/placeImgPath/${ppdto.place_pic_path}${ppdto.place_pic_name}" alt="장소 사진" style="width:99%; height:99%;"> 
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
                	<input type="hidden" name="place_num" value="${pidto.place_num}">
					<div style="float: right; margin-right:20%;">
						<input type="button" class="btn btn-default" value="수정" onclick="placeModify()">
						<input type="button" class="btn btn-danger" value="삭제" onclick="placeDelete()">
					</div>
				</form>
			<br> <br> 
				
				
			<div style="font-size:25px; width:80%; margin-left:10%;">
				<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;">
						<br><br>
					<h3 style="float:left; margin-left: 5%;">추천장소 후기</h3>
						
						<br>
						
						<div>
							<table class="table table-striped table-hover"
								style="width: 90%; margin-left: 5%;">
								<tr class="info">
									<td style="width:3%">번호</td>
									<td style="width:10%">제목</td>
									<td style="width:5%">아이디</td>
									<td style="width:3%">좋아요</td>
								</tr>
						<c:if test="${cnt > 0}">
							<c:forEach var="dtos" items="${dtos}">
								<tr style="border:0;">
									<td style="border:0;" align="center">

									</td>
									<td style="border:0;" align="center">
										
									</td>
									<td style="border:0;" align="center">
									
									</td>		
									<td style="border:0;" align="center">
										
									</td>
								</tr>
							</c:forEach>
						</c:if>
						
						<!-- 책이 없으면 -->
							<c:if test="${cnt == 0}">
								<tr>
									<td colspan="4" align="center" style="height:40px">
										추천장소 후기가 존재하지 않습니다.
									</td>
								</tr>
							</c:if>
							</table>
					 </div>
	
						<div class="dataTables_paginate paging_simple_numbers" id="customers2_paginate" style="margin-right:5%;">
							<a class="paginate_button previous disabled" aria-controls="customers2" data-dt-idx="0" tabindex="0" id="customers2_previous">Previous</a>
							<span>
							<a class="paginate_button current" aria-controls="customers2" data-dt-idx="1" tabindex="0">1</a>
							<a class="paginate_button " aria-controls="customers2" data-dt-idx="2" tabindex="0">2</a>
							<a class="paginate_button " aria-controls="customers2" data-dt-idx="3" tabindex="0">3</a>
							<a class="paginate_button " aria-controls="customers2" data-dt-idx="4" tabindex="0">4</a>
							</span><a class="paginate_button next" aria-controls="customers2" data-dt-idx="7" tabindex="0" id="customers2_next">Next</a>
						</div>
					
				  </div>
				  <br>
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
<!-- END ROW -->