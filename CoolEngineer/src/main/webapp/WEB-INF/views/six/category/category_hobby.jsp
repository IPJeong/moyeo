<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../etc/header.jsp"%>
<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="/moyeo/main/home">Home</a></li>
	<li class="active">모임</li>
</ul>
<!-- END BREADCRUMB -->

<style>
.btn-primary {
	background-color: rgb(239, 238, 238);;
	border-color: #4e7aa2;
	color: #3c44ab;
}
</style>

<div class="row-1">

	<div class="col-md-0">

		<form class="form-horizontal">

			<div class="panel panel-default tabs">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#tab-first" role="tab"
						data-toggle="tab">관심사별</a></li>
				</ul>

				<div class="col-md-6-1"
					style="width: 95%; height: 50px; margin: 20px 0px 5px 0px;">
					<div class="col-md-6" style="width: 20%; margin-left: 50px;">
						<input type="button" class="btn btn-primary btn-block"
							value="모임만들기" onclick="window.location='moimOpen'">
					</div>

					<div class="input-group push-down-10"
						style="width: 40%; float: right;">
						<span class="input-group-addon"><span class="fa fa-search"></span></span>
						<input type="text" class="form-control" placeholder="Keywords..." />
						<div class="input-group-btn">
							<button class="btn btn-primary">Search</button>
						</div>
					</div>
				</div>


				<div class="panel-body tab-content">
					<div class="tab-pane active" id="tab-first">
						<div class="col-md-13" style="height: auto;">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>관심사별</h3>
									</div>
								</div>
								<div class="panel-body padding-0">

									<div style="width: 100%; height: 250px;">
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>아웃도어/여행</h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="">
												<ul>
													<c:forEach var="dto" items="${dtos1}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>운동/스포츠</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos2}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>인문학/책/글</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos3}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>외국/언어</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos4}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>문화/공연</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos5}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
									<div style="width: 100%; height: 250px;">
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>음악/악기</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos6}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>공예/만들기</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos7}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>댄스/무용</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos8}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>봉사활동</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos9}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>사교/인맥</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos10}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
									<div style="width: 100%; height: 250px;">
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>차/오토바이</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos11}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>사진</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos12}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>야구관람</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos13}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>게임/오락</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos14}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>요리/제조</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos15}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
									<div style="width: 100%; height: 250px;">
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>반려동물</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos16}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>가족/결혼</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos17}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5; overflow: hidden;">
											<div class="panel-heading" style="background: #8ff9ff">
												<div class="panel-title-box">
													<h3>자유주제</h3>
												</div>
											</div>
											<div class="panel-body padding-0">
												<ul>
													<c:forEach var="dto" items="${dtos18}" begin="0" end="8">
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																${dto.group_name} </a>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 0px solid #E5E5E5;">

										</div>
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 0px solid #E5E5E5;">

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-14" style="width: 95%; height: auto;">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>인기모임</h3>
									</div>
								</div>
								<div class="panel-body padding-0">
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>

							</div>
						</div>
						<div class="col-md-13-1" style="width: 93%; height: auto;">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>추천모임 리스트</h3>
									</div>
								</div>
								<div class="panel-body padding-0">
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>



<!-- END PAGE CONTENT WRAPPER -->

<!-- END PAGE CONTENT -->

<!-- END PAGE CONTAINER -->




<%@ include file="../../etc/footer.jsp"%>