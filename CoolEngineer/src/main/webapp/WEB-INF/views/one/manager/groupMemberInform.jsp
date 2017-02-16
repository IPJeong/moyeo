<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link rel="stylesheet" type="text/css" id="theme"
	href="/moyeo/resources/resource/css/theme-default.css" />
</head>

<body>
	<div class="col-md-3" style="margin-left: -2%; width: 105%; overflow: hidden;">

		<div class="panel panel-default">
			<div class="panel-body profile"
				style="background: url('assets/images/gallery/music-4.jpg') center center no-repeat;">
				<div class="profile-image">
					<img src="${pdto.main_pic_path}/${pdto.main_pic_name}"
						class="img-thumbnail" style="width: 200px; height: 200px;" />
				</div>


			</div>
			<div class="panel-body">
				<div class="row">
					<div class="profile-image">
						<button class="btn btn-info btn-rounded btn-block" onclick="return getInfo('${ldto.mem_id}', '${pageNum}')">모임장
							[${ldto.mem_id}]</button>
					</div>

				</div>
			</div>
			<div class="panel-body list-group border-bottom" style="width: 520px">
				<a href="#" class="list-group-item active"><span
					class="glyphicon glyphicon-user"></span> 모임 멤버리스트</a>
				<div style="border-bottom: 1px solid">
					<c:forEach var="dto" items="${dtos}">
						<a href="" onclick="return getInfo('${dto.mem_id}','${pageNum}')"
							class="list-group-item"> <span
							class="glyphicon glyphicon-user"></span> ${dto.mem_id} <font
							class="pull-right" color="grey">아이디 클릭시 상세보기 가능</font></a>
					</c:forEach>
				</div>
			</div>

			<div class="row" style="align: center; height: 800px;">
				<div class="col-md-12" style="margin-left: 85%; height: 100%">
					<table style="width: 100%; align: center">
						<th align="center"><c:if test="${cnt > 0}">
								<!-- 처음[◀◀] 이전[◀] ▶-->
								<c:if test="${startPage > pageBlock}">
									<a href="/moyeo/one/groupMemberInform">[◀◀]</a>
									<a
										href="/moyeo/one/groupMemberInform?group_num=${group_num}&pageNum=${startPage - pageBlock}">[◀]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${i == currentPage}">

										<span><font size="3">[${i}]</font></span>
									</c:if>

									<c:if test="${i != currentPage}">

										<font size="3"><a
											href="/moyeo/one/groupMemberInform?group_num=${group_num}&pageNum=${i}">[${i}]</a></font>
									</c:if>
								</c:forEach>

								<!-- 다음블록[▶] 끝[▶▶]-->
								<c:if test="${pageCount > endPage}">
									<a
										href="/moyeo/one/groupMemberInform?pageNum=${startPage + pageBlock}">[▶]</a>
									<a href="/moyeo/one/groupMemberInform?pageNum=${pageCount}">[▶▶]</a>
								</c:if>
							</c:if></th>
					</table>
				</div>

				<script type="text/javascript">
	        	function getInfo(mem_id,pageNum) {
	        		window.open('guestInform?mem_id='+mem_id+'&pageNum='+pageNum+'&openType=ginfo', 'guestInform', 'menubar=no, width=540, height=620, top=80, left=600');
	        		return false;
	        	}    
       	 	</script>
			</div>
		</div>


	</div>

</body>
</html>



