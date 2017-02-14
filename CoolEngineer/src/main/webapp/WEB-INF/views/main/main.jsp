<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- META SECTION -->
<title>MoYeo-새로운 만남의 시작</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" href="/moyeo/resources/resource/favicon.ico" type="image/x-icon" />
<!-- END META SECTION -->
<!-- CSS INCLUDE -->
<link rel="stylesheet" type="text/css" id="theme" href="/moyeo/resources/resource/css/theme-default.css" />
<!-- EOF CSS INCLUDE -->

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script> -->
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<!-- <script type='text/javascript' src="/moyeo/resources/resource/js/plugins/icheck/icheck.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/scrolltotop/scrolltopcontrol.js"></script> -->

<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/morris/raphael-min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/morris/morris.min.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/rickshaw/d3.v3.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/rickshaw/rickshaw.min.js"></script> -->
<!-- <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script> -->
<!-- <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script> -->
<script type='text/javascript' src='/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/owl/owl.carousel.min.js"></script> -->

<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/moment.min.js"></script> -->
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins/daterangepicker/daterangepicker.js"></script>
<!-- END THIS PAGE PLUGINS -->

<!-- START TEMPLATE -->
<script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script> -->
<!-- <script type="text/javascript" src="/moyeo/resources/resource/js/demo_dashboard_x.js"></script> -->
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->

	
<style>
li {
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}
	
</style>
</head>
<body class="x-dashboard">
	<!-- START PAGE CONTAINER -->
	
	<div class="page-container">

		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- PAGE CONTENT WRAPPER -->
			<div class="page-content-wrap">

				<%@ include file="../etc/header.jsp"%>

				<!-- START ROW -->
				<div class="row">
					<!-- START LOGIN BLOCK -->
					<div class="col-md-21">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<a href="/moyeo/three/myPage"><font size="4px;">${sessionScope.mem_id}님 로그인됨</font><br></a>
									<span></span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<div class="chart-holder" id="dashboard-line-1" style="height: 200px;">
								</div>
							</div>
						</div>
					</div>
					<!-- END LOGIN BLOCK -->
				
					<!-- START WORDCLOUD BLOCK -->
					<div class="col-md-22">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<font size="4px;">Word Cloud</font><br>
									<span>Moyeo에서 자주 사용되는 용어들 입니다.</span>
								</div>
							</div>
							<div class="panel-body padding-0" style="height:85%;">
								<%@ include file="../five/wordCloud/wordCloud.jsp" %>
				<!-- 				<div class="chart-holder" id="dashboard-bar-1" -->
				<!-- 					style="height: 200px;"></div> -->
							</div>
						</div>
					</div>
					<!-- END WORDCLOUD BLOCK -->
				
					<!-- START SEARCH BLOCK -->
					<div class="col-md-23">
						
						<div class="panel panel-default">
							<div class="panel-heading" style="height:30px">
								<div class="panel-title-box" style="margin-top:-5px;">
									<h3>검색창&nbsp;&nbsp;<span style="font-size:12px;">모임, 모임 후기 등 다양한 정보를 한 번에 검색할 수 있습니다.</span></h3>
								</div>
							</div>
							<div class="panel-body padding-0">
								<form name="mainsearchfrom" action="../two/mainSearch" onsubmit="return searchKeywordCheck();">
									<div class="col-md-6-2" style="float:left; margin-top:7px; width:90%; margin-left:5%;">	
										<div class="input-group push-down-10" >
									        <span class="input-group-addon"><span class="fa fa-search"></span></span>
									        <input type="text" class="form-control" name="search_keyword" placeholder="">
									        <div class="input-group-btn">
									            <input type="submit" class="btn btn-primary" value="검색">
									        </div>
									    </div>
									    <div style="float:left; margin-top:0px; margin-left:3px; width:90%;">
									    	&nbsp;&nbsp;&nbsp;모임 검색&nbsp;&nbsp;&nbsp; | 
											&nbsp;&nbsp;<input type="radio" name="search_radio1" value="gl1">&nbsp;이름
						                    &nbsp;&nbsp;<input type="radio" name="search_radio1" value="gl2">&nbsp;소개
						                    &nbsp;&nbsp;<input type="radio" name="search_radio1" value="gl3">&nbsp;이름+소개
						                </div>
						                <div style="float:left; margin-top:5px; width:90%;">
						                	모임후기 검색&nbsp; | 
						                    &nbsp;&nbsp;<input type="radio" name="search_radio2" value="mp1">&nbsp;제목
						                    &nbsp;&nbsp;<input type="radio" name="search_radio2" value="mp2">&nbsp;내용
						                    &nbsp;&nbsp;<input type="radio" name="search_radio2" value="mp3">&nbsp;제목+내용
						                    &nbsp;&nbsp;<input type="radio" name="search_radio2" value="mp4">&nbsp;태그
								    	</div>
								    	<div style="float:left; margin-top:5px; margin-left:3px; width:90%;">
						                	&nbsp;&nbsp;&nbsp;장소 검색&nbsp;&nbsp;&nbsp; |
						                    &nbsp;&nbsp;<input type="radio" name="search_radio3" value="pi1">&nbsp;제목
						                    &nbsp;&nbsp;<input type="radio" name="search_radio3" value="pi2">&nbsp;설명
						                    &nbsp;&nbsp;<input type="radio" name="search_radio3" value="pi3">&nbsp;제목+설명
						                    &nbsp;&nbsp;<input type="radio" name="search_radio3" value="pi4">&nbsp;주소
						                    &nbsp;&nbsp;<input type="radio" name="search_radio3" value="pi5">&nbsp;태그
								    	</div>
							    	</div>  
							    </form>
							</div>
						</div>
					</div>
					<!-- END SEARCH BLOCK -->
				
					<!-- START NOTICE BLOCK -->
					<div class="col-md-24">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<font size="4px;">공지사항 &nbsp;&nbsp;</font>
										<a class="fa fa-plus-square-o" href="/moyeo/six/notice/notice">
											<font size="2">더보기</font>
										</a><br>
									<span>&nbsp;&nbsp;&nbsp;모여의 서비스 신규, 업데이트 및 새로운 소식을 알려드립니다</span>
								</div>
							</div>
							<div class="panel-body padding-0" style="padding:0px;">
								<div class="chart-holder" id="dashboard-donut-1"
									style="height: 200px;">
									<ul style="padding:0px; margin-left:15px;">
										<c:forEach var="dto" items="${dtos}" begin="0" end="5">
											<li style="float:none; font-size:13px; margin:10px;">
												<a href="../six/notice/noticeContent?noti_num=${dto.noti_num}&pageNum=${pageNum}"><font color="#373a3e">
													${dto.noti_title}
												</font></a>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- END NOTICE BLOCK -->
				
					<!-- START RECOMMENDATION MEET BLOCK -->
					<div class="col-md-25">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<font size="4px;">
										추천모임&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="fa fa-plus-square-o" href="/moyeo/six/category/recommend_detail?category=추천모임&subject=추천모임"><font size="2">더보기</font></a>
									</font><br>
									<span>더 많은 모임에 가입해보세요!</span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<div class="chart-holder" id="dashboard-line-1"
									style="height: 200px;">
									<c:if test="${empty recommendDtos}">
											<font size="3px">추천모임이 없습니다. <br> 관심사나 관심지역을 변경해보세요.</font>
									</c:if>
	
									<c:if test="${!empty recommendDtos}">									
										<c:forEach var="dto" items="${recommendDtos}" begin="0" end="9" >
											<c:if test="${dto.group_inte1 eq group_inte1 && dto.group_inte2 eq group_inte2 && dto.group_location eq group_location}">
												<div class="panel-body padding-0" style="height:36px; width:100%; float:left; margin-bottom:13px;">
													<ul>
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																<font size="3px">${dto.group_name}</font> <br> <font size="2em;"color="#a7adb5"><div style="float:right; margin-right:20px;">(${dto.group_inte1}-${dto.group_inte2}, ${dto.group_location})</div></font></a>
														</li>
													</ul>
												</div>
											</c:if>
										</c:forEach>	
									</c:if>	
								</div>
							</div>
						</div>
					</div>
					<!-- END RECOMMENDATION MEET BLOCK -->
				
					<!-- START PHOTO BLOCK -->
					<div class="col-md-26">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<a href="../gallery/gallery.jsp"><font size="4px;">사진</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="fa fa-plus-square-o" href="/moyeo/main/main_gallery"><font size="2">더보기</font></a>
				
								</div>
							</div>
							<div class="panel-body padding-0">
								<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;"></div>
								<ul>
									<c:forEach var="picDto" items="${picDtos}">
										<li>
											<a href="/moyeo/five/postDetailView?group_num=${picDto.group_num}&post_num=${picDto.post_num}&search=dsearch"><img src="${picDto.pic_path}/${picDto.pic_name}" width="100px" height="75px"></a>
										</li>
									</c:forEach>
									<!-- <li>
										<img src="/moyeo/resources/resource/assets/images/gallery/music-1.jpg" width="100" height="75">
									</li>
									<li>
										<img src="/moyeo/resources/resource/assets/images/gallery/girls-1.jpg" width="100" height="75">
									</li>
									<li>
										<img src="/moyeo/resources/resource/assets/images/gallery/nature-2.jpg" width="100" height="75">
									</li>
									<li>
										<img src="/moyeo/resources/resource/assets/images/gallery/nature-2.jpg" width="100" height="75">
									</li>
									<li>
										<img src="/moyeo/resources/resource/assets/images/gallery/space-1.jpg" width="100" height="75">
									</li>
									<li>
										<img src="/moyeo/resources/resource/assets/images/gallery/music-2.jpg" width="100" height="75">
									</li> -->
								</ul>
							</div>
						</div>
					</div>
					<!-- END PHOTO BLOCK -->
				
					<!-- START MOVIE BLOCK -->
					<div class="col-md-27">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<a href="../movie/movie.jsp"><font size="4px;">동영상</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="fa fa-plus-square-o" href="/moyeo/main/main_gallery_video"><font size="2">더보기</font></a>
								</div>
							</div>
							<div class="panel-body padding-0">
								<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;"></div>
								<ul>
									<c:forEach var="videoDto" items="${videoDtos}">
										<li>
											<a href="/moyeo/five/postDetailView?group_num=${videoDto.group_num}&post_num=${videoDto.post_num}&search=dsearch">
												<video style="width:200px; height:150px;" controls>
													<source src="${videoDto.video_path}/${videoDto.video_name}" >
												</video>
											</a>
										</li>
									</c:forEach>
									<!-- <li><video src="/moyeo/resources/resource/assets/video/12.mp4" width="200px" height="150px" controls></video></li>
									<li><video src="/moyeo/resources/resource/assets/video/12.mp4" width="200px" height="150px" controls></video></li>
									<li><video src="/moyeo/resources/resource/assets/video/12.mp4" width="200px" height="150px" controls></video></li> -->
								</ul>
							</div>
						</div>
					</div>
					<!-- END MOVIE BLOCK -->
				
					<!-- START REALTIME MEET BLOCK -->
					<div class="col-md-28" style="height:562px;">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<font size="4px;">인기모임</font>&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="fa fa-plus-square-o" href="/moyeo/six/category/category_detail?category=인기모임&subject=인기모임"><font size="2">더보기</font></a><br>
									<span>회원들의 활동이 가장 활발한 모임들입니다.</span>
								</div>
							</div>
							<div class="panel-body padding-0" style="height:490px;">
									
									<c:forEach var="dto" items="${hotDtos}" begin="0" end="9" >
										<div class="panel-body padding-0" style="height:36px; width:100%; float:left; margin-bottom:15px;">
											<ul>
												<li
													style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
													<a
													href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
														<font size="3px" color="#333">${dto.group_name}</font><br><div style="float:right; margin-right:20px;"><font size="2em;"color="#a7adb5">(${dto.group_inte1}-${dto.group_inte2})</font></div></a>
												</li>
											</ul>
										</div>
									</c:forEach>	
								
							</div>
						</div>
					</div>
					<!-- END REALTIME MEET BLOCK -->
				
					<!-- START RECOMMENDATION LOCATION BLOCK -->
					<div class="col-md-29">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<font size="4px;">
										<a href="/moyeo/two/placeMainLoc">추천장소</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="fa fa-plus-square-o" href="/moyeo/two/placeList"><font size="2">더보기</font></a>
									</font><br>
									<span>회원님들이 모임장소로 추천한 곳입니다.</span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<div class="chart-holder" id="dashboard-bar-1" style="height: 200px;">
									<c:if test="${lcnt > 0}">
										<c:forEach var="lpodtos" items="${lpodtos}">
											<li>
												<a href="/moyeo/two/placeContentForm?place_num=${lpodtos.place_num}">
						        					<img src="${lpodtos.place_pic_path}/${lpodtos.place_pic_name}" alt="장소 사진" style="width:120px; height:150px; margin-top:25px; margin-left:20px;"><br>
						        				</a>
											</li>
										</c:forEach>
									</c:if>	
								</div>
							</div>
						</div>
					</div>
					<!-- END RECOMMENDATION LOCATION BLOCK -->
				
					<!-- START EVENT BLOCK -->
					<div class="col-md-30">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<font size="4px;">
										<a href="/moyeo/event/ing-event.jsp">이벤트</a>&nbsp;&nbsp;&nbsp;&nbsp;
										<a class="fa fa-plus-square-o" href="#"><font size="2">더보기</font></a>
									</font><br>
									<span>Moyeo에서 진행하는 다양한 이벤트에 참여해 보세요.</span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<div class="chart-holder" id="dashboard-donut-1" style="height: 200px;"></div>
							</div>
						</div>
					</div>
					<!-- END EVENT BLOCK -->
				
					<!-- START ADVERTISE BLOCK -->
					<div class="col-md-31">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<font size="4px;">광고</font>&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="fa fa-plus-square-o" href="#"><font size="2">더보기</font></a><br>
									<span>설명</span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<div class="chart-holder" id="dashboard-donut-1" style="height: 200px;"></div>
							</div>
						</div>
					</div>
					<!-- END ADVERTISE BLOCK -->
				
					<!-- START REVIEW BLOCK -->
					<div class="col-md-32" style="height:240px;">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="panel-title-box">
									<font size="4px;">후기</font>&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="fa fa-plus-square-o" href="#"><font size="2">더보기</font></a><br>
									<span>모임의 후기 리스트 입니다. 모임의 후기를 추천해 주세요.</span>
								</div>
							</div>
							<div class="panel-body padding-0">
								<div class="chart-holder" id="dashboard-donut-1"
									style="height: 200px;">
									<%-- <ul style="padding:0px; margin-left:15px;">
										<c:forEach var="postDto" items="${postDtos}" begin="0" end="5">
											<li style="float:none; font-size:13px; margin:10px;">
												<a href="/moyeo/five/postDetailView?group_num=${postDto.group_num}&post_num=${postDto.post_num}&search=dsearch"><font color="#373a3e">
													${postDto.post_title}
												</font></a>
												<font style="float:right;">
													<fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm" value="${postDto.post_date}" />
												</font>
												<span class="badge badge-success" style="float:right; margin-right:15px;">${postDto.post_hit}</span>
	                              				<span class="badge badge-info" style="float:right; margin-right:30px;">${postDto.like_num}</span>
												
											</li>
										</c:forEach>
									</ul> --%>
									<table style="padding-top:20px; width:95%;">
										<thead>
											<tr>
												<td align="center" width="10%;">순번</td>
												<td align="center" width="50%;" >제목</td>
												<td align="center" width="10%;" >조회수</td>
												<td align="center" width="10%" >좋아요</td>
												<td align="center" width="20%;" >등록일</td>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="postDto" items="${postDtos}" varStatus="status">
												<tr>
													<td align="center">${status.count}</td>
													<td style="margin-bottom: 5px;">
														<a href="/moyeo/five/postDetailView?group_num=${postDto.group_num}&post_num=${postDto.post_num}&search=dsearch"><font color="#373a3e">
															${postDto.post_title}
														</font></a>
													</td>
													<td align="center" style="margin-bottom: 5px;">
														<span class="badge badge-success" >${postDto.post_hit}</span>
													</td>
													<td align="center"  style="margin-bottom: 5px;">
		                              					<span class="badge badge-info" >${postDto.like_num}</span>
		                              				</td>
		                              				<td align="center"  style="margin-bottom: 5px;">
														<font style="float:center;">
															<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${postDto.post_date}" />
														</font>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- END REVIEW BLOCK -->
				</div>
				<!-- END ROW -->
			</div>
			<!-- END PAGE CONTENT WRAPPER -->
		</div>
		<!-- END PAGE CONTENT -->
	</div>
	<!-- END PAGE CONTAINER -->
<%@ include file="../etc/footer.jsp"%>

<script src="/moyeo/resources/customScript/five/tagCanvas.js"></script>
<script src="/moyeo/resources/customScript/five/tagCloud.js"></script>
<script src="/moyeo/resources/customScript/five/wordCloudScript.js"></script>

<script>
     $(function(){
         //Spinner
         $(".spinner_default").spinner()
         //End spinner
         
         //Datepicker
         $('#dp-2').datepicker();
         $('#dp-3').datepicker({startView: 2});
         $('#dp-4').datepicker({startView: 1});                
         //End Datepicker
     });
</script>
</body>

</html>