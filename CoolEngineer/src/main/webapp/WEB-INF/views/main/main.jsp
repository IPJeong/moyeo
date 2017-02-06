<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../etc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
li {
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}
</style>

<!-- START ROW -->
<div class="row">

	<!-- START LOGIN BLOCK -->
	<div class="col-md-21">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<font size="4px;">${sessionScope.mem_id}님 로그인됨</font><br> 
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
					<font size="4px;">워드클라우드</font><br>
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
			<div class="panel-heading">
				<div class="panel-title-box">
					<font size="4px;">검색창</font><br>
					<span>모임, 모임 후기 등 다양한 정보를 한 번에 검색할 수 있습니다.</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-donut-1"
					style="height: 200px;"></div>
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
					<ul style="padding:0px;">
						<c:forEach var="dto" items="${dtos}" begin="0" end="5">
							<li style="float:none; font-size:13px; margin:10px;">
								<a href="../six/notice/noticeContent?noti_num=${dto.noti_num}&pageNum=${pageNum}">
									${dto.noti_title}
								</a>
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
						<a class="fa fa-plus-square-o" href="#"><font size="2">더보기</font></a>
					</font><br>
					<span>더 많은 모임에 가입해보세요!</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-line-1"
					style="height: 200px;"></div>
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
					<a class="fa fa-plus-square-o" href="#"><font size="2">더보기</font></a>

				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;"></div>
				<ul>
					<li>
						<img src="/moyeo/resources/resource/assets/images/gallery/nature-1.jpg" width="100px" height="75px">
					</li>
					<li>
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
					</li>
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
					<a class="fa fa-plus-square-o" href="#"><font size="2">더보기</font></a>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-bar-1" style="height: 10px;"></div>
				<ul>
					<li><video src="/moyeo/resources/resource/assets/video/12.mp4" width="200px" height="150px" controls></video></li>
					<li><video src="/moyeo/resources/resource/assets/video/12.mp4" width="200px" height="150px" controls></video></li>
					<li><video src="/moyeo/resources/resource/assets/video/12.mp4" width="200px" height="150px" controls></video></li>
					<li><video src="/moyeo/resources/resource/assets/video/12.mp4" width="200px" height="150px" controls></video></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- END MOVIE BLOCK -->

	<!-- START REALTIME MEET BLOCK -->
	<div class="col-md-28">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<font size="4px;">실시간모임</font>&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="fa fa-plus-square-o" href="#"><font size="2">더보기</font></a><br>
					<span>번개같은 만남. 실시간 모임 입니다.</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-line-1"
					style="height: 200px;"></div>
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
						<a href="/moyeo/places/places.jsp">추천장소</a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="fa fa-plus-square-o" href="#"><font size="2">더보기</font></a>
					</font><br>
					<span>회원님들이 모임장소로 추천한 곳입니다.</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-bar-1" style="height: 200px;"></div>
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
	<div class="col-md-32">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<font size="4px;">후기</font>&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="fa fa-plus-square-o" href="#"><font size="2">더보기</font></a><br>
					<span>모임의 후기 리스트 입니다. 모임의 후기를 추천해 주세요.</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-donut-1" style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<!-- END REVIEW BLOCK -->
</div>
<!-- END ROW -->

<%@ include file="../etc/footer.jsp"%>