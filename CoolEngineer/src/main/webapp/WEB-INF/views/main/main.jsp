<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../etc/header.jsp"%>

<style>
li {
float:left;
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
					<a href="../member/login.jsp"><h3>로그인</h3></a>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-line-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<!-- END LOGIN BLOCK -->

	<!-- START WORDCLOUD BLOCK -->
	<div class="col-md-22">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>워드클라우드</h3>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<!-- END WORDCLOUD BLOCK -->

	<!-- START SEARCH BLOCK -->
	<div class="col-md-23">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>검색창</h3>
					<span>설명</span>
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
					<a href="../customer-support/notice.jsp"><h3>공지</h3></a>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-donut-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<!-- END NOTICE BLOCK -->

	<!-- START RECOMMENDATION MEET BLOCK -->
	<div class="col-md-25">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>추천모임</h3>
					<span>설명</span>
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
					<a href="../gallery/gallery.jsp"><h3>사진</h3></a>

				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 10px;"></div>
				<ul>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/nature-1.jpg" width="100px" height="75px"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/music-1.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/girls-1.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/nature-2.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/nature-2.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/space-1.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/music-2.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/nature-3.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/girls-2.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/space-2.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/nature-4.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/music-3.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/nature-6.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/girls-3.jpg" width="100" height="75"></li>
					<li><img src="/moyeo/resources/resource/assets/images/gallery/music-5.jpg" width="100" height="75"></li>
				
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
					<a href="../movie/movie.jsp"><h3>동영상</h3></a>

				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 10px;"></div>
				<ul>
					<li><video src="/moyeo/resources/resource/assets/video/12.mp4" widht="200px" height="150px" controls></video>  </li>
					<li><video src="/moyeo/resources/resource/assets/video/12.mp4" widht="200px" height="150px" controls></video>  </li>	
					<li><video src="/moyeo/resources/resource/assets/video/12.mp4" widht="200px" height="150px" controls></video>  </li>
					<li><video src="/moyeo/resources/resource/assets/video/12.mp4" widht="200px" height="150px" controls></video>  </li>
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
					<h3>실시간모임</h3>
					<span>설명</span>
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
					<a href="../places/places.jsp"><h3>추천장소</h3></a>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<!-- END RECOMMENDATION LOCATION BLOCK -->

	<!-- START EVENT BLOCK -->
	<div class="col-md-30">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<a href="../event/ing-event.jsp"><h3>이벤트</h3></a>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-donut-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<!-- END EVENT BLOCK -->

	<!-- START ADVERTISE BLOCK -->
	<div class="col-md-31">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>광고</h3>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-donut-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<!-- END ADVERTISE BLOCK -->

	<!-- START REVIEW BLOCK -->
	<div class="col-md-32">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>후기</h3>
					<span>설명</span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-donut-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<!-- END REVIEW BLOCK -->
</div>
<!-- END ROW -->

<%@ include file="../etc/footer.jsp"%>