<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<script type="text/javascript" src="/moyeo/resources/customScript/two.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<%@ include file="../../etc/header2.jsp"%>       
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
                    <li><a href="/moyeo/main/home">Home</a></li>
                    <li><a href="/moyeo/two/placeMainLoc">추천장소 메인</a></li>
                    <li class="active">장소정보</li>
                </ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->
	<div class="col-md-56" style="margin-top:20px; margin-left:10%; height:1220px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>장소정보 리스트 페이지</h3>
				</div>
			</div>
			
			<div style="text-align: center; font-size: 25px">
				<div class="chart-holder" id="dashboard-bar-1" style="height:10px;">
					<br><br>
					<h2>장소정보 리스트</h2>
					
					<br><br>
					
					<form name="placelistform">
						<div style="float: right; margin-right:10%;">
							<input type="button" class="btn btn-info" value="장소 추가" onclick="placeInput()">
						</div>
					</form>
					
					<br>
					
					<div>
					<c:if test="${cnt > 0}">
						<table class="table table-striped table-hover"
							style="width:50%; margin-left: 10%; float:left;">
							<tr class="info">
								<td style="width:3%;" align="center">장소번호</td>
								<td style="width:10%;" align="center">장소명</td>
							</tr>
					
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
									<a href="placeContentForm?place_num=${pidtos.place_num}">
										${pidtos.place_name}
									</a>	
								</td>
							</tr>	
						</c:forEach>
						</table>
					</c:if>
					<c:if test="${cnt > 0}">		
						<table class="table table-striped table-hover"
							style="width:30%; float:right; margin-right:10%;">	
							<tr class="info">	
								<td style="width:10%;" align="center">장소사진</td>
							</tr>
						<c:forEach var="ppdtos" items="${ppdtos}">	
							<tr style="border:0;">
								<td style="border:0; height:150px;" align="center">
									<img src="${ppdtos.place_pic_path}/${ppdtos.place_pic_name}" style="width:70%; height:99%;"> 
								</td>
							</tr>	
						</c:forEach>
						</table>
					</c:if>
					
				   <c:if test="${cnt == 0}">
					   <table class="table table-striped table-hover"
					   		style="width:80%; margin-left:10%; float:left;">
					   		<tr class="info">
								<td style="width:10%;" align="center">장소번호</td>
								<td style="width:45%;" align="center">장소명</td>
								<td style="width:45%;" align="center">장소사진</td>
							</tr>
						   <tr class="info">	
							   <td colspan="3" align="center" style="height:40px">
							      등록된 장소가 없습니다.
							   </td>
						   </tr>
					   </table>
				   </c:if>
			   </div>
					<br><br>
					
					
				<div style="float:right; margin-right:50%;">	
					<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
	
						<c:if test="${cnt > 0}">
				
							<c:if test="${startPage > pageBlock}">
								<li class=""><a href="placeList?pageNum=${startPage - pageBlock}"><font
											size="3"> «</font></a></li>
							</c:if>
				
				
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class=""><a href="#"><font size="3">${i}</font></a></li>
								</c:if>
				
								<c:if test="${i != currentPage}">
									<li class=""><a href="placeList?pageNum=${i}"><font size="3">${i}</font></a></li>
								</c:if>
				
							</c:forEach>
							<c:if test="${pageCount > endPage}">
								<li><a href="placeList?pageNum=${startPage + pageBlock}"><font
											size="3">»</font></a></li>
							</c:if>
						</c:if>
							
					</ul>
				</div>
					
					<br><br><br><br>
			 <%-- 
				  <div style="float:left; margin-left:9%; margin-top:4%;">
				  	  <jsp:include page="placeSearchForm.jsp"/>
				  </div> 
			 --%>
			  </div>
			  <br>
		</div>

	</div>
</div>
<!-- END ROW -->
<%@ include file="../../etc/footer2.jsp"%>