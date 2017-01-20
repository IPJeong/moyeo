<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../etc/moim_header.jsp"%>

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
	<div class="col-md-21" style="height:400px; margin-left:10%;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>모임개요</h3>
					<span></span>
				</div>
			</div>
			<div class="panel-body padding-0">
				<div class="chart-holder" id="dashboard-line-1"
					style="height: 200px;"></div>
			</div>
		</div>
	</div>
	<!-- END LOGIN BLOCK -->


	<!-- START SEARCH BLOCK -->

	<!-- END SEARCH BLOCK -->

	<!-- START NOTICE BLOCK -->
	
	<!-- END NOTICE BLOCK -->

	<!-- START RECOMMENDATION MEET BLOCK -->
	<div class="col-md-25" style="margin-left:10%;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>멤버리스트</h3>
					<span></span>
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
	<div class="col-md-26" style="top: -390px; width:60%; height:810px">
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>모임원 관리</h3>
				</div>
			</div>
			
			<div class="panel-body padding-0" style="text-align:center; font-size: 15px" >
				<div class="chart-holder" id="dashboard-bar-1"
					style="height:15px; margin:15px;">
									
					<form class="navbar-form navbar-left" role="search">
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
					
					<br><br>
					<div style="width:99%; height:50%;">
						<form action="" name="">
							<div style="float:right">
								해당 모임원을
								<button class="btn btn-default" type="button">등급변경</button>
								<button class="btn btn-default" type="button">강제탈퇴</button>
							</div>
						<br><br>
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<td><input type="checkbox" class="input_check _chSelectAll" title="전체선택"></td>
										<td>신청번호</td>
										<td>아이디</td>
										<td>신청일</td>
										<td>상태</td>
									</tr>
								</thead>
								<tbody>
									 <tr>
									      <td><input type="checkbox" class="input_check"></td>
									      <td>ㅇ</td>
									      <td>ㅇ</td>
									      <td>ㅇ</td>
									      <td>ㅇ</td>
									</tr>
								</tbody>
							</table>
						</form>	
					<br><br>
							
					<div align="center">					
					<table style="width:18%">
						<tr>
							<th>
							<c:if test="${cnt > 0}">
								<!-- 처음[◀◀] 이전블록[◀]-->
								<c:if test="${startPage > pageBlock}">
								 	<a href="list.do">[◀◀]</a>
									<a href="list.do?pageNum=${startPage - pageBlock}">[◀] </a>
								</c:if>
									
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage }">
										<span><b>[${i}]</b></span>
									</c:if>
										
									<c:if test="${i != currentPage}">
										<a href="list.do?pageNum=${i}">[${i}]</a>
									</c:if>
								</c:forEach>
									
								<!-- 다음블록[▶] 끝[▶▶]-->
								<c:if test="${pageCount > endPage}">
									<a href="list.do?pageNum=${startPage + pageBlock}">[▶]</a>
									<a href="list.do?pageNum=${pageCount}">[▶▶]</a>
								</c:if>
							</c:if>
							</th>
						</tr>
					</table>
				</div>
			</div>
			
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

<%@ include file="../etc/footer.jsp"%>