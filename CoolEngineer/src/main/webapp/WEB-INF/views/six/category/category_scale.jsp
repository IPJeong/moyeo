<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../../etc/header2.jsp"%>
<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="/moyeo/main/home">Home</a></li>
	<li class="active">모임</li>
</ul>
<!-- END BREADCRUMB -->

<style>
.nav-tabs>li.active>a {
	border-top: 2px solid #5caefb;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover {
	border-top: 2px solid #1662a9;
}

.btn.btn-rounded.btn-info {
	color: #179ecc;
}
</style>

<style>
.btn-primary {
	background-color: rgb(239, 238, 238);;
	border-color: #4e7aa2;
	color: #3c44ab;
}

.panel-default .panel-heading {
	background-color: rgba(255, 152, 0, 0.31);
}
</style>

<div class="row-1">

	<div class="col-md-0">

		

			<div class="panel panel-default tabs">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#tab-first" role="tab"
						data-toggle="tab">규모별</a></li>
				</ul>

				<div class="col-md-6-1"
					style="width: 95%; height: 50px; margin: 20px 0px 5px 0px;">
					<div class="col-md-6" style="width: 20%; margin-left: 50px;">
						<input type="button" class="btn btn-info btn-rounded" style="width:150px; height:30px; font-size:12pt; margin-top:5px; margin-left:5px;"
							value="모임만들기" onclick="window.location='moimOpen'">
					</div>

					<form name="mainsearchfrom" action="/moyeo/two/mainSearch" onsubmit="return searchKeywordCheck();">
						<div class="input-group push-down-10"
							style="width: 40%; float: right;">
							<span class="input-group-addon"><span
								class="fa fa-search"></span></span> <input type="text"
								class="form-control" name="search_keyword" placeholder="Keywords..." />
							<div class="input-group-btn">
								<input type="hidden" name="search_radio1" value="gl1">
								<input type="submit" class="btn btn-primary" value="Search">
							</div>
						</div>
					</form>
				</div>


				<div class="panel-body tab-content">
					<div class="tab-pane active" id="tab-first">
						<div class="col-md-13" style="height: auto;">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>규모별</h3>
									</div>
								</div>
								<div class="panel-body padding-0">

									<div style="width: 100%; height: 250px;">
										<div class="panel panel-default"
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>5명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=5명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>10명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=10명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>20명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=20명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>30명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=30명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>40명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=40명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>50명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=50명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>100명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=100명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>150명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=150명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>200명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=200명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>250명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=250명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>300명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=300명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>350명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=350명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>400명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=400명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>450명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=450명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>500명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=500명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>600명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=600명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>700명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=700명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											style="width: 19%; height: 100%; margin: 5px; float: left; border: 1px solid #E5E5E5;">
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>800명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=800명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
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
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>900명 이하&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=900명 이하"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
												<ul>
													<c:forEach var="dto" items="${dtos19}" begin="0" end="8">
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
											<div class="panel-heading" style="background: rgba(255, 219, 34, 0.24);">
												<div class="panel-title-box">
													<h3>1000명 이상&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=규모별&subject=1000명 이상"><font size="2">더보기</font></a></h3>
												</div>
											</div>
											<div class="panel-body padding-0" style="overflow:hidden; height:211px;">
												<ul>
													<c:forEach var="dto" items="${dtos20}" begin="0" end="8">
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
										<h3>인기모임&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="category_detail?category=인기모임&subject=인기모임"><font size="2">더보기</font></a></h3>
									</div>
								</div>
								<div class="panel-body padding-0">
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 210px;">
										<c:forEach var="dto" items="${hotDtos}" begin="0" end="14" >
										<div class="panel-body padding-0" style="height:33px; width:480px; float:left; margin-bottom: 12px;">
											<ul>
												<li
													style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
													<a
													href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
														<font size="3px">${dto.group_name}</font> <br> <font size="2em;"color="#a7adb5"><div style="float:right; margin-right:20px;">(${dto.group_inte1}-${dto.group_inte2} , ${dto.group_location})</div></font></a>
												</li>
											</ul>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-13-1" style="width: 93%; height: auto;">
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="panel-title-box">
										<h3>추천모임&nbsp;&nbsp;<a class="fa fa-plus-square-o" href="recommend_detail?category=추천모임&subject=추천모임"><font size="2">더보기</font></a></h3>
									</div>
								</div>
								<div class="panel-body padding-0">
									<div class="chart-holder" id="dashboard-bar-1"
										style="height: 200px;">
										<c:forEach var="dto" items="${recommendDtos}" begin="0" end="14" >
											<c:if test="${dto.group_inte1 eq group_inte1 && dto.group_inte2 eq group_inte2 && dto.group_location eq group_location}">
												<div class="panel-body padding-0" style="height:33px; width:480px; float:left; margin-bottom: 12px;">
													<ul>
														<li
															style="float: none; font-size: 13px; margin: 5px 0px 5px -10px;">
															<a
															href="/moyeo/six/moimMain/moimMain?group_num=${dto.group_num}">
																<font size="3px">${dto.group_name}</font> <br> <font size="2em;"color="#a7adb5"><div style="float:right; margin-right:20px;">(${dto.group_inte1}-${dto.group_inte2} , ${dto.group_location})</div></font></a>
														</li>
													</ul>
												</div>
											</c:if>
										</c:forEach>									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
	</div>
</div>

<!-- END PAGE CONTENT WRAPPER -->

<!-- END PAGE CONTENT -->

<!-- END PAGE CONTAINER -->




<%@ include file="../../etc/footer2.jsp"%>
