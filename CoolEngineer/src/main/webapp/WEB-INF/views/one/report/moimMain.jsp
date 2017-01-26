<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../../etc/moim_header.jsp"%>

<style>
@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features {
    width: 100%;
    background-color: #FBFBFB;
    padding: 0px 20px;
}
}

@media (min-width: 1100px){
.col-md-56 {
    width: 60%;
    height: 870px;
}
}

@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open {
    display: block;
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
float:left;
margin: 1px 1px 1px;
list-style: none;
left: -3px;
}

img {
margin: 10px 10px 10px 10px;

}

</style>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li><a href="../category/category_hobby.jsp">모임</a></li>
                    <li class="active">영등포 볼링</li>
                </ul>
               <!-- END BREADCRUMB -->   



<!-- START ROW -->
<div class="row">
<div class="col-md-50" style="margin-top:10px; margin-left:10%;">
	<!-- START LOGIN BLOCK -->
	<div class="col-md-51" style="height: 310px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>모임 정보</h3>
				</div>
			</div>
				<div class="panel-body padding-0"  style="height:270px;">
				<div class="chart-holder" id="dashboard-line-1"
					style="height: 180px;">
					<img src="../resources/assets/images/gallery/pin.jpg" width="180x" height="130px" style="magin:5px 5px"><font size="3">XENO_B.C - 영등포 볼링</font><br>
					<br><br>
					<h3><center>스포츠/운동 -> 볼링</center></h3>
					<center><input type="button" value="모임정보 수정"></center>

				</div>
			</div>
		</div>
	</div>
	<!-- END LOGIN BLOCK -->


	<!-- START SEARCH BLOCK -->

	<!-- END SEARCH BLOCK -->

	<!-- START NOTICE BLOCK -->
	
	<!-- END NOTICE BLOCK -->

		<!-- START RECOMMENDATION MEET BLOCK -->
		<div class="col-md-55" style="margin-top:10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>멤버리스트</h3>
					</div>
				</div>
				<div class="panel-body padding-0" style="height:550px;">
					<div class="chart-holder" id="dashboard-line-1">
						<div class="main">
						<img src="../resources/assets/images/gallery/피카츄.png" width="150px"
							height="110px" style="magin: 5px 5px">피카츄 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[모임장]<br>
						<img src="../resources/assets/images/gallery/라이츄.png" width="150px"
							height="110px" style="magin: 5px 5px">라이츄 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
						<img src="../resources/assets/images/gallery/파이리.png" width="150px"
							height="110px" style="magin: 5px 5px">파이리 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>
						<img src="../resources/assets/images/gallery/꼬부기.jpg" width="150px"
							height="110px" style="magin: 5px 5px">꼬부기 <a href="#">[상세보기]</a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[회원]<br>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END RECOMMENDATION MEET BLOCK -->

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top:10px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<a href="../gallery/gallery.jsp"><h3>모임소개</h3></a>
				</div>
			</div>
			<div class="panel-body padding-0" style="text-align:center; font-size: 25px;">
				<div class="chart-hodler" style="width:97%; height:300px; margin-top:0px; /* border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; */ margin: 10px; margin-top: 20px">
					<img src="../resources/assets/images/gallery/coffee.png" width="600px" height="250px" style="float:left;"><br>
					<div style="width:500px; float:left;">
					#자전거 #운동 #산책 #친목 #라이딩
					</div>
				</div>
				
		
			<p style="margin-left:650px; margin-top:-60px;"><a href="../moim/moim_cheif_member.jsp"><input type="button" value="모임가입" style="width:100px; height:30px; font-size: 13px"></a>
					<a href="../moim/moim_schedule.jsp"><input type="button" value="모임탈퇴" style="width:100px; height:30px; font-size: 13px"></a>
					<input type="button" value="모임신고" style="width:100px; height:30px;  font-size: 13px"
					       onclick="window.location='moimReportMain'"></p><br>
			
				<div class="panel-heading" style="margin-top:30px">
						<h3>XENO_B.C - 영등포 볼링</h3>
				</div>
					
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 10px;">
					
					<div class="chart-hodler" style="width:97%; height:420px; border-bottom:3px solid #D5D5D5; border-top:3px solid #D5D5D5; border-left:3px solid #D5D5D5; border-right:3px solid #D5D5D5; margin: 10px; margin-top: 90px"> 
						<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>공지사항 게시판</h3>
				</div>
			</div>
			<div class="" style="text-align:center; font-size: 25px" >
				<div class="chart-holder" id="dashboard-bar-1"
					style="height: 10px;">
					<br>
					
					
					<br><br>
					<div>
						<table class="table table-striped table-hover" style="width:90%; margin-left:5%;">
							<thead>
								<tr class="info">
									<td>번호</td>
									<td>제목</td>
									<td>작성자</td>
									<td>작성일</td>
									<td>조회수</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div style="text-align:center; float:right; margin-right:5%;">  
						<ul class="pagination pagination-sm pull-right push-down-20 push-up-20">
							<li class="disabled"><a href="#">≪</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>                                    
							<li><a href="#">≫</a></li>
						</ul>
					</div>   
					<div class="" style="text-align:center; font-size: 15px" >
						<div class="chart-holder" id="dashboard-bar-1"
							style="height:15px; margin-left:5%">
											
							<form class="navbar-form navbar-left" role="search" style="margin-top: 70px; padding-top: 30px;">
								<select name="">
									<option value="1">ID</option>
									<option value="2">닉네임</option>
									<option value="3">IP</option>
								</select>
								
			       				<div class="form-group">
			        				<input class="form-control" type="text" placeholder="Search">
			        	  		</div>
			       					<button class="btn btn-default" type="submit">입력</button>
			     		    </form>
			     		</div>
	     		    </div>
				</div>
		</div>
					</div>
				</div>
				
			</div>
			<div id="aba" style="text-align:right">
			
			</div>
		</div>
	</div>
	<!-- END PHOTO BLOCK -->

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
<!-- END ROW -->

<%@ include file="../../etc/footer.jsp"%>