<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<script type="text/javascript" src="/moyeo/resources/customScript/two.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<%@ include file="../../etc/header.jsp"%>       
<!-- START SCRIPTS -->
<!--         START PLUGINS -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>                
        
        <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
		
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js"></script>                
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-file-input.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>        
        <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>        
        <!-- END TEMPLATE -->
        
        <script type="text/javascript" src="/moyeo/resources/customScript/five.js"></script>
    <!-- END SCRIPTS -->   
    
  
<script type="text/javascript">

function placeInput() {
	window.location = "placeInputForm";
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
		<!-- START LOGIN BLOCK -->

		<!-- START RECOMMENDATION MEET BLOCK -->
	
	<!-- END LOGIN BLOCK -->


	<!-- START SEARCH BLOCK -->

	<!-- END SEARCH BLOCK -->

	<!-- START NOTICE BLOCK -->

	<!-- END NOTICE BLOCK -->

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top:20px; margin-bottom:20px; margin-left:10%; height:1200px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>장소정보 리스트 페이지</h3>
				</div>
			</div>
			
			<div style="text-align: center; font-size: 25px">
				<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;">
					<br><br>
					<h2>장소정보 리스트</h2>
					
					<br><br>
					
					<form name="placelistform">
						<div style="float: right; margin-right:10%;">
							<input type="button" class="btn btn-default" value="장소 추가" onclick="placeInput()">
						</div>
					</form>
					
					<br>
					
					<div>
						<table class="table table-striped table-hover"
							style="width:50%; margin-left: 10%; float:left;">
							<tr class="info">
								<td style="width:3%;" align="center">장소번호</td>
								<td style="width:10%;" align="center">장소명</td>
							</tr>
					<c:if test="${cnt > 0}">
						<c:forEach var="pidtos" items="${pidtos}">
							<tr style="border:0;">
<!-- 								<td style="border:0; height:150px;" align="center"> -->
<%-- 									${pidtos.place_num} --%>
<!-- 								</td> -->
								<td style="border:0; height:150px;" align="center">
									${place_num}
								</td>
								<c:set var="place_num" value="${place_num-1}" />
								<td style="border:0; height:150px;" align="center">
									<a href="placeContentForm?place_num=${pidtos.place_num}&pageNum=${pageNum}">
										${pidtos.place_name}
									</a>	
								</td>
							</tr>	
						</c:forEach>
						
						<table class="table table-striped table-hover"
							style="width:30%; float:right; margin-right:10%;">	
							<tr class="info">	
								<td style="width:10%;" align="center">장소사진</td>
							</tr>
						<c:forEach var="ppdtos" items="${ppdtos}">	
							<tr style="border:0;">
								<td style="border:0; height:150px;" align="center">
									<img src="/placeImgPath/${ppdtos.place_pic_path}${ppdtos.place_pic_name}" style="width:70%; height:99%;"> 
								</td>
							</tr>	
						</c:forEach>
						</table>
					</c:if>
					
					<!-- 책이 없으면 -->
						<c:if test="${cnt == 0}">
							<tr class="info">	
								<td colspan="3" align="center" style="height:40px">
									등록된 장소가 없습니다.
								</td>
							</tr>
						</c:if>
						</table>
				 </div>
					<br><br>
					<div class="dataTables_paginate paging_simple_numbers" id="customers2_paginate" style="margin-right:10%;">
						<a class="paginate_button previous disabled" aria-controls="customers2" data-dt-idx="0" tabindex="0" id="customers2_previous">Previous</a>
						<span>
						<a class="paginate_button current" aria-controls="customers2" data-dt-idx="1" tabindex="0">1</a>
						<a class="paginate_button " aria-controls="customers2" data-dt-idx="2" tabindex="0">2</a>
						<a class="paginate_button " aria-controls="customers2" data-dt-idx="3" tabindex="0">3</a>
						<a class="paginate_button " aria-controls="customers2" data-dt-idx="4" tabindex="0">4</a>
						</span><a class="paginate_button next" aria-controls="customers2" data-dt-idx="7" tabindex="0" id="customers2_next">Next</a>
					</div>
					<br><br><br><br>
				  <div style="float:left; margin-left:9%;">
					  <jsp:include page="placeSearchForm.jsp"/>
				  </div>
			  </div>
			  <br>
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
<%@ include file="../../etc/footer.jsp"%>