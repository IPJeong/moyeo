<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<script type="text/javascript" src="/moyeo/resources/customScript/two.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<div style="height:99%;">
<%@ include file="../../etc/header2.jsp"%>       
</div>
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


</script>

<style>
.page-content {
	height:99%;
}

@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features {
    width: 100%;
    background-color: #FBFBFB;
    padding: 0px 20px;
    height:900px;
}
}

@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open {
    display: block;
}
}

@media (min-width: 900px){
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

div.page-content {
	height:800px;
}

</style>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="/moyeo/main/home">Home</a></li>
                    <li><a href="#">검색 결과</a></li>
                </ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->

<div class="row">

	<c:if test="${mscnt == 0 && mpscnt == 0 && picnt == 0 && rpcnt == 0}">
		<div class="col-md-56" style="margin-top:20px; margin-left:10%; height:700px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>검색 결과</h3>
					</div>
				</div>
				
				<br><br>
				
				<div style="width:80%; font-size:15px; text-align:left; margin-top:20px; margin-left:20px;">
					<h2>검색 결과가 없습니다.</h2>
					<br>
					&nbsp;&nbsp;&nbsp;단어의 철자가 정확한지 확인해 보세요.<br>
					&nbsp;&nbsp;&nbsp;한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
					&nbsp;&nbsp;&nbsp;검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
					&nbsp;&nbsp;&nbsp;두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.<br>
					&nbsp;&nbsp;&nbsp;검색 옵션을 변경해서 다시 검색해 보세요.<br>
				</div>
			</div>
		</div>					
	</c:if>
	<!-- START PHOTO BLOCK -->
	<c:if test="${mscnt > 0}">
	<div class="col-md-56" style="margin-top:20px; margin-left:10%; height:700px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>모임 검색 결과</h3>
				</div>
			</div>
			
			<div style="text-align: center; font-size: 25px">
				<div class="chart-holder" id="dashboard-bar-1" style="height:10px;">
					<br>
					<c:if test="${mscnt > 0}">
					<br>
						<span style="float:left; font-size:15px; color:black; margin-left:2%">검색결과 ${mscnt}개</span>
					</c:if>
					<br>
					
					<c:if test="${mscnt > 0}">
						<div class="inner">
				            <div class="info" style="float:left; margin-left:5%; width:15%; height:100px;">
					            <c:forEach var="mopdto" items="${mopdtos}">
									<img src="${mopdto.main_pic_path}/${mopdto.main_pic_name}" alt="모임 사진" style="width:50%; height:80px; margin-top:20px;"> 
									<br>
								</c:forEach>		      
						    </div>
						   <div class="info" style="float:right; text-align:left; margin-right:10%; width:70%; height:100px;">  
						        <c:forEach var="moidto" items="${moidtos}">
						        	<div style="width:80%; font-size:15px; height:80px; margin-top:20px;">
									     <a href="../six/moimMain/moimMain?group_num=${moidto.group_num}">
									     	이름 : ${moidto.group_name}
									     </a><br>
										 소개 : ${moidto.group_intro}<br>
										 <span style="color:blue;">관심사 (${moidto.group_inte1}, ${moidto.group_inte2})</span>&nbsp;|&nbsp;<span style="color:green">지역 (${moidto.group_location})</span>
									     &nbsp;|&nbsp;<span style="color:red;">규모 (${moidto.group_mem_cnt}명)</span>
									</div>
								    </c:forEach>
					        </div>         	 	
					    </div>
			       </c:if>	
						
						<br>
							
				</div>
				
					<div style="float:right; margin-top:540px; margin-right:50%;">	
							<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
					
								<c:if test="${mscnt > 0}">
								
									<c:if test="${startPage1 > pageBlock1}">
										<li class=""><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum1=${startPage1 - pageBlock1}"><font
															size="3"> «</font></a></li>
									</c:if>
								
								
									<c:forEach var="i" begin="${startPage1}" end="${endPage1}">
										<c:if test="${i == currentPage1}">
											<li class=""><a href="#"><font size="3">${i}</font></a></li>
										</c:if>
								
										<c:if test="${i != currentPage1}">
											<li class=""><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum1=${i}"><font size="3">${i}</font></a></li>
										</c:if>
								
									</c:forEach>
									<c:if test="${pageCount1 > endPage1}">
										<li><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum1=${startPage1 + pageBlock1}"><font
												size="3">»</font></a></li>
									</c:if>
									</c:if>
											
							  </ul>	
						</div>
		  		</div>
		  </div>  

   </div>
   </c:if>
	<!-- END PHOTO BLOCK -->
	<c:if test="${mpscnt > 0}">
	<div class="col-md-56" style="margin-top:20px; margin-left:10%; height:700px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>모임후기 검색 결과</h3>
				</div>
			</div>
			
			<div style="text-align: center; font-size: 25px">
				<div class="chart-holder" id="dashboard-bar-1" style="height:10px;">
					<br>
					<c:if test="${mpscnt > 0}">
					<br>
						<span style="float:left; font-size:15px; color:black; margin-left:2%">검색결과 ${mpscnt}개</span>
					</c:if>
					<br>
							
					<c:if test="${mpscnt > 0}">
						<div class="inner">
				            <div class="info" style="float:left; margin-left:5%; width:15%; height:100px;">
						        <c:forEach var="ppdtos" items="${ppdtos}">
						        	<c:if test="${ppdtos.pic_path != null && ppdtos.pic_name != null}">
							        	<img src="${ppdtos.pic_path}/${ppdtos.pic_name}" alt="모임후기 사진" style="width:50%; height:80px; margin-top:20px;"> 
							        </c:if>
							        <c:if test="${ppdtos.pic_path == null || ppdtos.pic_name == null}">
							        	<img src="/moyeo/resources/resource/img/custom/noimages.jpg" alt="모임후기 사진" style="width:50%; height:80px; margin-top:20px;"> 
							        </c:if>
							        <br>	
						        </c:forEach>
						   </div>
						   <div class="info" style="float:right; text-align:left; margin-right:10%; width:70%; height:100px;">  
						        <c:forEach var="mpdto" items="${mpdtos}">
							        <div style="width:80%; font-size:15px; height:80px; margin-top:20px;"> 
											<a href="../five/postDetailView?post_num=${mpdto.post_num}&pageNum=1&group_num=${mpdto.group_num}&search=dsearch">
											제목 : ${mpdto.post_title}
											</a>
											&nbsp;|&nbsp;<span style="color:blue;">작성일 : <fmt:formatDate type="both" pattern="yyyy. MM. dd" value="${mpdto.post_date}" /></span>&nbsp;|&nbsp;<span style="color:green;">작성자 : ${mpdto.mem_id}</span><br>
											내용 : ${mpdto.post_content}<br>
											<c:if test="${mpdto.post_tag != null}">
											<span style="color:red;">태그 : ${mpdto.post_tag}</span>
											</c:if>
									</div>   		
								</c:forEach>               	 	
							</div>
						</div>
					</c:if>	

			  </div>
		</div>
	</div>
	
		<div style="float:right; margin-top:-110px; margin-right:50%;">	
			<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
	
				<c:if test="${mpscnt > 0}">
				
					<c:if test="${startPage2 > pageBlock2}">
						<li class=""><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum2=${startPage2 - pageBlock2}"><font
											size="3"> «</font></a></li>
					</c:if>
				
				
					<c:forEach var="i" begin="${startPage2}" end="${endPage2}">
						<c:if test="${i == currentPage2}">
							<li class=""><a href="#"><font size="3">${i}</font></a></li>
						</c:if>
				
						<c:if test="${i != currentPage2}">
							<li class=""><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum2=${i}"><font size="3">${i}</font></a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageCount2 > endPage2}">
						<li><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum2=${startPage2 + pageBlock2}"><font
								size="3">»</font></a></li>
					</c:if>
			   </c:if>
							
			</ul>	
	   </div>	
		  
	</div>
	</c:if>
	
	<!-- END PHOTO BLOCK -->
	<c:if test="${picnt > 0}">
	<div class="col-md-56" style="margin-top:20px; margin-left:10%; height:700px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>장소 검색 결과</h3>
				</div>
			</div>
			
			<div style="text-align: center; font-size: 25px">
				<div class="chart-holder" id="dashboard-bar-1" style="height:10px;">
					<br>
					<c:if test="${picnt > 0}">
					<br>
						<span style="float:left; font-size:15px; color:black; margin-left:2%">검색결과 ${picnt}개</span>
					</c:if>
					<br>
							
					<c:if test="${picnt > 0}">
						<div class="inner">
				            <div class="info" style="float:left; margin-left:5%; width:15%; height:100px;">
						        <c:forEach var="plapicdto" items="${plapicdtos}">
							        <img src="${plapicdto.place_pic_path}/${plapicdto.place_pic_name}" alt="장소 사진" style="width:50%; height:80px; margin-top:20px;">
							        <br>	
						        </c:forEach>
						   </div>
						   <div class="info" style="float:right; text-align:left; margin-right:10%; width:70%; height:100px;">  
						        <c:forEach var="plainfodto" items="${plainfodtos}">
							        <div style="width:80%; font-size:15px; height:80px; margin-top:20px;"> 
										<a href="placeContentForm?place_num=${plainfodto.place_num}">
											제목 : ${plainfodto.place_name}
										</a><br>
										설명 : ${plainfodto.place_detail}<br>
										<span style="color:green;">주소 : ${plainfodto.place_address}</span>
									</div>   		
								</c:forEach>               	 	
							</div>
						</div>
					</c:if>	

			  </div>
		</div>
	</div>
	
		<div style="float:right; margin-top:-110px; margin-right:50%;">	
			<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
	
				<c:if test="${picnt > 0}">
				
					<c:if test="${startPage3 > pageBlock3}">
						<li class=""><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum3=${startPage3 - pageBlock3}"><font
											size="3"> «</font></a></li>
					</c:if>
				
				
					<c:forEach var="i" begin="${startPage3}" end="${endPage3}">
						<c:if test="${i == currentPage3}">
							<li class=""><a href="#"><font size="3">${i}</font></a></li>
						</c:if>
				
						<c:if test="${i != currentPage3}">
							<li class=""><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum3=${i}"><font size="3">${i}</font></a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageCount3 > endPage3}">
						<li><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum3=${startPage3 + pageBlock3}"><font
								size="3">»</font></a></li>
					</c:if>
			   </c:if>
							
			</ul>	
	   </div>	
		  
	</div>
	</c:if>
	
	<c:if test="${rpcnt > 0}">
	<div class="col-md-56" style="margin-top:20px; margin-left:10%; height:700px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>모임후기 검색 결과</h3>
				</div>
			</div>
			
			<div style="text-align: center; font-size: 25px">
				<div class="chart-holder" id="dashboard-bar-1" style="height:10px;">
					<br>
					<c:if test="${rpcnt > 0}">
					<br>
						<span style="float:left; font-size:15px; color:black; margin-left:2%">검색결과 ${rpcnt}개</span>
					</c:if>
					<br>
					
					<c:if test="${rpcnt > 0}">
						<div class="inner">
				            <div class="info" style="float:left; margin-left:5%; width:15%; height:100px;">
					            <c:forEach var="recpicppto" items="${recpicpptos}">
									<img src="${recpicppto.place_pic_path}/${recpicppto.place_pic_name}" alt="장소 사진" style="width:50%; height:80px; margin-top:20px;"> 
									<br>
								</c:forEach>		      
						    </div>
						   <div class="info" style="float:right; text-align:left; margin-right:10%; width:70%; height:100px;">  
						        <c:forEach var="recpladto" items="${recpladtos}">
						        	<div style="width:80%; font-size:15px; height:80px; margin-top:20px;">
									     <a href="../two/recPlaceContentForm?recpla_num=${recpladto.recpla_num}">
									     	이름 : ${recpladto.recpla_title}
									     </a>&nbsp;|&nbsp;<span style="color:green">작성자 : ${recpladto.mem_id}</span>
									     <br>
										 내용 : ${recpladto.recpla_content}<br>
										 <c:if test="${recpladto.recpla_tag != null}">
										 <span style="color:red;">태그 : ${recpladto.recpla_tag}</span>
										 </c:if>
									</div>
								    </c:forEach>
					        </div>         	 	
					    </div>
			       </c:if>	
						
						<br>
							
				</div>
				
					<div style="float:right; margin-top:540px; margin-right:50%;">	
							<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
					
								<c:if test="${rpcnt > 0}">
								
									<c:if test="${startPage4 > pageBlock4}">
										<li class=""><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum4=${startPage4 - pageBlock4}"><font
															size="3"> «</font></a></li>
									</c:if>
								
								
									<c:forEach var="i" begin="${startPage4}" end="${endPage4}">
										<c:if test="${i == currentPage4}">
											<li class=""><a href="#"><font size="3">${i}</font></a></li>
										</c:if>
								
										<c:if test="${i != currentPage4}">
											<li class=""><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum4=${i}"><font size="3">${i}</font></a></li>
										</c:if>
								
									</c:forEach>
									<c:if test="${pageCount4 > endPage4}">
										<li><a href="mainSearch?search_keyword=${search_keyword}&search_radio1=${search_radio1}&search_radio2=${search_radio2}&search_radio3=${search_radio3}&search_radio4=${search_radio4}&pageNum4=${startPage4 + pageBlock4}"><font
												size="3">»</font></a></li>
									</c:if>
									</c:if>
											
							  </ul>	
						</div>
		  		</div>
		  </div>  

   </div>
   </c:if>
	
</div>

<!-- END ROW -->
<%@ include file="../../etc/footer2.jsp"%>