<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script src="//www.google.com/jsapi"></script>
<%@ include file="../../etc/moim_header.jsp"%>

<script type="text/javascript">


</script>

<style>
@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features
		{
		width: 100%;
		background-color: #FBFBFB;
		padding: 0px 20px;
	}
}

@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open
		{
		display: block;
	}
}

@media (min-width: 1100px){
	.col-md-56 {
	    width: 60%;
	    height: 870px;
	}
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
	<li><a href="/moyeo/six/category/category_hobby">모임</a></li>
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${open_dto.group_name}</a></li>
	<li class="active">모임 통계</li>
</ul>
<!-- END BREADCRUMB -->  

<!-- START ROW -->


<!-- 모임 사이드바 시작 -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
		<!-- START LOGIN BLOCK -->
	
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->
		
		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임통계 페이지</h3>
					</div>
				</div>	 
 			<div class="x-hnavigation" style="width:80%; margin-left:10%; background:#F6F6F6;">
				<ul>
					<li><a href="/moyeo/two/moimStatistics?group_num=${group_num}">모임원 분석</a></li>
					<li class="xn-openable"><a href="#">게시글 분석</a>
						<ul>
							<li><a href="/moyeo/two/moimStatisticsArticle?group_num=${group_num}&stats_type=stats_article&term=year"><span class="fa fa-caret-right"></span>1년간</a></li>
							<li><a href="/moyeo/two/moimStatisticsArticle?group_num=${group_num}&stats_type=stats_article&term=month"><span class="fa fa-caret-right"></span>1개월간</a></li>
						</ul>
					</li>
					<li class="xn-openable"><a href="#">방문 분석</a>
						<ul>
							<li><a href="/moyeo/two/moimStatisticsPresent?group_num=${group_num}&stats_type=stats_article&term=year"><span class="fa fa-caret-right"></span>1년간</a></li>
							<li><a href="/moyeo/two/moimStatisticsPresent?group_num=${group_num}&stats_type=stats_article&term=month"><span class="fa fa-caret-right"></span>1개월간</a></li>
						</ul>
					</li>
				</ul>	
			</div>		
				
 		<c:if test="${stats_type.equals('stats_member')}">		 
			<div style="float:left; width:30%; height:25%; margin-top:1%; margin-left:15%;">
			    <script type="text/javascript">
					google.charts.load('current', {'packages':['corechart']});
		
					google.charts.setOnLoadCallback(drawChart);
		
					function drawChart() {
					
					var man_cnt = ${man_cnt};
					var woman_cnt = ${woman_cnt};
					// Create the data table.
					var data = new google.visualization.DataTable();
					data.addColumn('string', '성비');
					data.addColumn('number', '명수');
					data.addRows([
						['남성', ${man_cnt}], //오류로 표시되더라도 무시
						['여성', ${woman_cnt}] //오류로 표시되더라도 무시
					]);
					
					// Set chart options
					var options = {'title':'모임의 성비 차트',
					               'width':400,
					               'height':280};
		
					var chart = new google.visualization.PieChart(document.getElementById('chart_by_gender'));
					chart.draw(data, options);
					}
				</script>
				<form name="gender_ratio_form">
					<input type="hidden" name="man_cnt" id="man_cnt" value="${man_cnt}">
					<input type="hidden" name="woman_cnt" id="woman_cnt" value="${woman_cnt}">
				</form>				
				<div id="chart_by_gender" style="width:100%; height:100%;">
					
				</div>
			</div>
		
			<div style="float:right; width:30%; height:25%; margin-top:1%; margin-right:15%;">
			    <script type="text/javascript">
					google.charts.load('current', {'packages':['corechart']});
		
					google.charts.setOnLoadCallback(drawChart);
		
					function drawChart() {
					
					// Create the data table.
					var data = new google.visualization.DataTable();
					data.addColumn('string', '연령대');
					data.addColumn('number', '명수');
					data.addRows([
					['10대 이하', ${teen_cnt}], //오류로 표시되더라도 무시
					['20대', ${twenty_cnt}], //오류로 표시되더라도 무시
					['30대', ${thirty_cnt}], //오류로 표시되더라도 무시
					['40대', ${fourty_cnt}], //오류로 표시되더라도 무시
					['50대', ${fifty_cnt}], //오류로 표시되더라도 무시
					['60대 이상', ${sixty_cnt}] //오류로 표시되더라도 무시
					]);
					
					// Set chart options
					var options = {'title':'모임의 연령비 차트',
					               'width':400,
					               'height':280};
		
					var chart = new google.visualization.PieChart(document.getElementById('chart_by_age'));
					chart.draw(data, options);
					}
				</script>
								
				<div id="chart_by_age" style="width:100%; height:100%;">
					
				</div>
			</div>
			
				<table class="table table-bordered" style="width:80%; margin-left:10%; margin-top:35%; border:1px solid #D9E5FF;">
						<colgroup>
							<col width="21%">
							<col width="*">
							<col width="15%">
							<col width="17%">
						</colgroup>
							<tr style="border:1px solid #D9E5FF;">
								<td rowspan="2" style="border:1px solid #D9E5FF;"><span style="font-weight:bold;">성별 분포</span></td>
								<td style="background:white; border:1px solid #D9E5FF;">남성</td>
								<td style="background:white; border:1px solid #D9E5FF;">${man_cnt}명</td>
								<td style="background:white; border:1px solid #D9E5FF;">
									<c:set var="man_ratio" value="${man_cnt/(man_cnt + woman_cnt)}" /><fmt:formatNumber value="${man_ratio}" type="percent"/>
								</td>
							</tr>
							<tr style="border:1px solid #D9E5FF;">
								<td style="background:white; border:1px solid #D9E5FF;">여성</td>
								<td style="background:white; border:1px solid #D9E5FF;">${woman_cnt}명</td>
								<td style="background:white; border:1px solid #D9E5FF;">
									<c:set var="woman_ratio" value="${woman_cnt/(man_cnt + woman_cnt)}" /><fmt:formatNumber value="${woman_ratio}" type="percent"/>
								</td>
							</tr>
							<tr>
								<td rowspan="6" style="border:1px solid #D9E5FF;"><span style="font-weight:bold;">연령별 분포</span></td>
								<td style="background:white;">
									<span>10대 이하</span>
								</td>
								<td style="background:white;">${teen_cnt}명</td>
								<td style="background:white;"><c:set var="teen_ratio" value="${teen_cnt/(teen_cnt + twenty_cnt + thirty_cnt + fourty_cnt + fifty_cnt + sixth_cnt)}" /><fmt:formatNumber value="${teen_ratio}" type="percent"/></td>
							</tr>
							<tr>
								<td style="background:white;">
									<span>20대</span>
								</td>
								<td style="background:white;">${twenty_cnt}명</td>
								<td style="background:white;"><c:set var="twenty_ratio" value="${twenty_cnt/(teen_cnt + twenty_cnt + thirty_cnt + fourty_cnt + fifty_cnt + sixth_cnt)}" /><fmt:formatNumber value="${twenty_ratio}" type="percent"/></td>
							</tr>
							<tr>
								<td style="background:white;">
									<span>30대</span>
								</td>
								<td style="background:white;">${thirty_cnt}명</td>
								<td style="background:white;"><c:set var="thirty_ratio" value="${thirty_cnt/(teen_cnt + twenty_cnt + thirty_cnt + fourty_cnt + fifty_cnt + sixth_cnt)}" /><fmt:formatNumber value="${thirty_ratio}" type="percent"/></td>
							</tr>
							<tr>
								<td style="background:white;">
									<span>40대</span>
								</td>
								<td style="background:white;">${fourty_cnt}명</td>
								<td style="background:white;"><c:set var="fourty_ratio" value="${fourty_cnt/(teen_cnt + twenty_cnt + thirty_cnt + fourty_cnt + fifty_cnt + sixth_cnt)}" /><fmt:formatNumber value="${fourty_ratio}" type="percent"/></td>
							</tr>
							<tr>
								<td style="background:white;">
									<span>50대</span>
								</td>
								<td style="background:white;">${fifty_cnt}명</td>
								<td style="background:white;"><c:set var="fifty_ratio" value="${fifty_cnt/(teen_cnt + twenty_cnt + thirty_cnt + fourty_cnt + fifty_cnt + sixth_cnt)}" /><fmt:formatNumber value="${fifty_ratio}" type="percent"/></td>
							</tr>
							<tr>
								<td style="background:white;">
									<span>60대 이상</span>
								</td>
								<td style="background:white;">${sixty_cnt}명</td>
								<td style="background:white;"><c:set var="sixty_ratio" value="${sixty_cnt/(teen_cnt + twenty_cnt + thirty_cnt + fourty_cnt + fifty_cnt + sixth_cnt)}" /><fmt:formatNumber value="${sixty_ratio}" type="percent"/></td>
							</tr>
				</table>
			</c:if>
		</div>
			<!-- END PHOTO BLOCK -->
	  </div>
   </div>
<!-- END ROW -->
</div>

<%@ include file="../../etc/footer.jsp"%>