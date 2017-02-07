<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<body>
<!-- START LOGIN BLOCK -->
		<div class="col-md-51" style="height: 310px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>${open_dto.group_name}</h3>

					</div>
				</div>
				<div class="panel-body padding-0" style="height: 270px;">
					<div class="chart-holder" id="dashboard-line-1"	style="height: 180px;">
						<center><img src="${picture_dto.main_pic_path}/${picture_dto.main_pic_name}" width="200px" height="150px" style="margin-top: 10px;"><br></center> 
<%-- 						<center><font size="5">${group_name}</font></center> --%>
						<br>
						<h3>
							<center>${open_dto.group_inte1} -> ${open_dto.group_inte2}</center>
						</h3>
						
						<c:if test="${group_per == 1}">
							<center>
								<input class="btn btn-default" type="button" style="margin-left:10px;" value="사진등록" onclick="window.open('/moyeo/six/moimMain/moimAddImage','','menubar=no, toolbar=no, width=450, height=170')">
								<input class="btn btn-info" type="button" style="margin-left:10px;" value="모임정보 수정" onclick="window.location='/moyeo/six/moimMain/moimModify?group_num=${group_num}'">
								<input class="btn btn-warning" type="button" style="margin-left:10px;" value="모임폐쇄" onclick="window.location='/moyeo/six/moimMain/moimDelete?group_num=${group_num}'">
							</center>
						</c:if>

					</div>
				</div>
			</div>
		</div>
		<!-- END LOGIN BLOCK -->
		
			<!-- START RECOMMENDATION MEET BLOCK -->
		<div class="col-md-55" style="margin-top: 10px; height:550px;">
			<div class="panel panel-default" style="margin-bottom:0px;">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>멤버리스트</h3>

					</div>
				</div>
				<div class="panel-body padding-0" style="height: 510px;">
					<div class="chart-holder" id="dashboard-line-1">
						<div class="main">
							
							<c:forEach var="member_dto" items="${member_dtos}">
								<div style="height: 60px; margin-top:10px; margin-left:15px;">
									<div style="height: 60px; width: 16.5%; float:left;">
										<img
											src="${member_dto.propic_path}/${member_dto.propic_name}"
											width="100%" height="60px" style="margin:0px">
									</div>
									<div style="height: 60px; width: 60%; float:left; margin-left:5px; font-size:13px;">
										${member_dto.name}(${member_dto.mem_id}) <br> 
										<a href="#" onclick="window.open('/moyeo/six/moimMain/moimMemberDetail?mem_id=${member_dto.mem_id}&group_num=${group_num}', '모임멤버보기', 'width=700, height=700, top=100, left=500')">[상세보기]</a>
									</div>
									<div style="height: 60px; width: 20%; float:left; text-align:left; font-size:13px;">
										<c:if test="${member_dto.group_per == 1}">[모임장]</c:if>
										<c:if test="${member_dto.group_per == 2}">[운영진]</c:if>
										<c:if test="${member_dto.group_per == 3}">[회원]</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END RECOMMENDATION MEET BLOCK -->
</body>
</html>