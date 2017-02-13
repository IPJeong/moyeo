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

.panel .panel-body {
	height: 100%;
	overflow: auto;
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
							<li><a href="/moyeo/two/moimStatisticsArticle?group_num=${group_num}&stats_type=stats_article&term=best10"><span class="fa fa-caret-right"></span>BEST 10</a></li>
						</ul>
					</li>
					<li class="xn-openable"><a href="#">출석일 분석</a>
						<ul>
							<li><a href="/moyeo/two/moimStatisticsPresent?group_num=${group_num}&stats_type=stats_article&term=year"><span class="fa fa-caret-right"></span>1년간</a></li>
							<li><a href="/moyeo/two/moimStatisticsPresent?group_num=${group_num}&stats_type=stats_article&term=month"><span class="fa fa-caret-right"></span>1개월간</a></li>
							<li><a href="/moyeo/two/moimStatisticsPresent?group_num=${group_num}&stats_type=stats_article&term=best10"><span class="fa fa-caret-right"></span>BEST 10</a></li>
						</ul>
					</li>
					<li class="xn-openable"><a href="#">가입자 분석</a>
						<ul>
							<li><a href="/moyeo/two/moimStatisticsJoin?group_num=${group_num}&stats_type=stats_article&term=year"><span class="fa fa-caret-right"></span>1년간</a></li>
							<li><a href="/moyeo/two/moimStatisticsJoin?group_num=${group_num}&stats_type=stats_article&term=month"><span class="fa fa-caret-right"></span>1개월간</a></li>
						</ul>
					</li>
				</ul>	
			</div>			
				
 			<c:if test="${term.equals('month')}">
				<div style="width:80%; height:30%; margin-top:10%; margin-left:10%;">
					<script type="text/javascript">
					google.charts.load('current', {packages: ['corechart','line']});  
					function drawChart() {
					   // Define the chart to be drawn.
					   var data = new google.visualization.DataTable();
					   data.addColumn('string', '주');
					   data.addColumn('number', '가입자수');

					   data.addRows([
					      ['3주 전',  ${first_week}], //오류로 표시되더라도 무시
					      ['2주 전',  ${second_week}], //오류로 표시되더라도 무시
					      ['1주 전',  ${third_week}], //오류로 표시되더라도 무시
					      ['이번주',  ${fourth_week}] //오류로 표시되더라도 무시
					   ]);
					   
					   // Set chart options
					   var options = {'title' : '1개월간 가입자수 통계',
					      hAxis: {
					         title: '주'
					      },
					      vAxis: {
					         title: '가입자수'
					      },   
					      'width':700,
					      'height':400	  
					   };
					
					   // Instantiate and draw the chart.
					   var chart = new google.visualization.LineChart(document.getElementById('container'));
					   chart.draw(data, options);
					}
					google.charts.setOnLoadCallback(drawChart); //오류로 표시되더라도 무시
					</script>
					
					<div id="container" style="width: 700px; height: 300px; margin: 0 auto">
					</div>
				</div>
			
				<table class="table table-bordered" style="width:90%; margin-left:5%; margin-top:18%;">
					<tr>
						<td style="border:1px solid #D9E5FF; width:12%;" align="center">기간</td>
						<td style="border:1px solid #D9E5FF;" align="center">
							<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${four_weeks_ago}" /> ~
							<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${three_weeks_ago}" />
						<td style="border:1px solid #D9E5FF;" align="center">
							<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${three_weeks_ago}" /> ~
							<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${two_weeks_ago}" />
						</td>
						<td style="border:1px solid #D9E5FF;" align="center">
							<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${two_weeks_ago}" /> ~
							<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${a_week_ago}" />
						</td>
						<td style="border:1px solid #D9E5FF;" align="center">
							<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${a_week_ago}" /> ~
							<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${today}" />
						</td>
					</tr>
					<tr>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">가입자수</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${first_week}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${second_week}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${third_week}</td>
						<td style="background:white; border:1px solid #D9E5FF;"align="center">${fourth_week}</td>
					</tr>
					<tr>
					<c:set var="week_check" value="${first_week + second_week + third_week + fourth_week}" />
					<c:if test="${week_check != 0}">
						<td style="background:white; border:1px solid #D9E5FF;" align="center">비율</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="first_ratio" value="${(first_week)/(first_week + second_week + third_week + fourth_week)}" />
							<fmt:formatNumber value="${first_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="second_ratio" value="${(second_week)/(first_week + second_week + third_week + fourth_week)}" />
							<fmt:formatNumber value="${second_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="third_ratio" value="${(third_week)/(first_week + second_week + third_week + fourth_week)}" />
							<fmt:formatNumber value="${third_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="fourth_ratio" value="${(fourth_week)/(first_week + second_week + third_week + fourth_week)}" />
							<fmt:formatNumber value="${fourth_ratio}" type="percent"/>
						</td>
					</c:if>
					<c:if test="${week_check == 0}">
						<td style="background:white; border:1px solid #D9E5FF;" align="center">비율</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>	
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>	
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>	
					</c:if>			
					</tr>
				</table>	
 			</c:if>
 			
 			<c:if test="${term.equals('year')}">
				<div style="width:80%; height:30%; margin-top:10%; margin-left:-7%;">
					<script type="text/javascript">
					google.charts.load('current', {packages: ['corechart','line']});  
					function drawChart() {
					   // Define the chart to be drawn.
					   var data = new google.visualization.DataTable();
					   data.addColumn('string', '월');
					   data.addColumn('number', '가입자수');

					   data.addRows([
					      ['11달 전',  ${month1}], //오류로 표시되더라도 무시
					      ['10달 전',  ${month2}], //오류로 표시되더라도 무시
					      ['9달 전',  ${month3}], //오류로 표시되더라도 무시
					      ['8달 전',  ${month4}], //오류로 표시되더라도 무시
					      ['7달 전',  ${month5}], //오류로 표시되더라도 무시
					      ['6달 전',  ${month6}], //오류로 표시되더라도 무시
					      ['5달 전',  ${month7}], //오류로 표시되더라도 무시
					      ['4달 전',  ${month8}], //오류로 표시되더라도 무시
					      ['3달 전',  ${month9}], //오류로 표시되더라도 무시
					      ['2달 전',  ${month10}], //오류로 표시되더라도 무시
					      ['1달 전',  ${month11}], //오류로 표시되더라도 무시
					      ['이번달',  ${month12}] //오류로 표시되더라도 무시
					   ]);
					   
					   // Set chart options
					   var options = {'title' : '1년간 가입자수 통계',
					      hAxis: {
					         title: '월'
					      },
					      vAxis: {
					         title: '가입자수'
					      },   
					      'width':1100,
					      'height':400	  
					   };
					
					   // Instantiate and draw the chart.
					   var chart = new google.visualization.LineChart(document.getElementById('container'));
					   chart.draw(data, options);
					}
					google.charts.setOnLoadCallback(drawChart); //오류로 표시되더라도 무시
					</script>
					
					<div id="container" style="width: 700px; height: 300px; margin: 0 auto">
					</div>
				</div>
			
				<table class="table table-bordered" style="width:90%; margin-left:5%; margin-top:18%;">
					<tr>
						<td style="border:1px solid #D9E5FF; width:6.4%;" align="center">기간</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">11달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">10달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">9달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">8달 전 </td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">7달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">6달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">5달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">4달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">3달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">2달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">1달 전</td>
						<td style="border:1px solid #D9E5FF; width:7.8%;" align="center">이번달</td>
					</tr>
					<tr>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">수</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month1}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month2}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month3}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month4}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month5}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month6}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month7}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month8}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month9}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month10}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month11}</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">${month12}</td>
					</tr>
					<tr>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">비율</td>
					<c:set var="month_check" value="${month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12}" />
					<c:if test="${month_check != 0}">
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month1_ratio" value="${(month1)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month1_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month2_ratio" value="${(month2)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month2_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month3_ratio" value="${(month3)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month3_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month4_ratio" value="${(month4)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month4_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month5_ratio" value="${(month5)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month5_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month6_ratio" value="${(month6)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month6_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month7_ratio" value="${(month7)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month7_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month8_ratio" value="${(month8)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month8_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month9_ratio" value="${(month9)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month9_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month10_ratio" value="${(month10)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month10_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month11_ratio" value="${(month11)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month11_ratio}" type="percent"/>
						</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">
							<c:set var="month12_ratio" value="${(month12)/(month1 + month2 + month3 + month4 + month5 + month6 + month7 + month8 + month9 + month10 + month11 + month12)}" /><fmt:formatNumber value="${month12_ratio}" type="percent"/>
						</td>
					</c:if>
					<c:if test="${month_check == 0}">
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
						<td style="background:white; border:1px solid #D9E5FF;" align="center">0%</td>
					</c:if>
					</tr>
				</table>	
 			</c:if>
			<!-- END PHOTO BLOCK -->
	  </div>
   </div>
<!-- END ROW -->
</div>

<%@ include file="../../etc/footer.jsp"%>