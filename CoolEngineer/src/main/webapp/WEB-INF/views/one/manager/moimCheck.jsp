<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../etc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="panel panel-default" >
	<div class="panel-heading">
		<div class="panel-title-box">
			<h3>회원관리</h3>
			<span>설명</span>
		</div>
	</div>
	<c:forEach var="dto" items="${dtos}" begin="0">
	
	<div class="page-content-wrap" style="margin-left:1%">
		<div class="row" style="float:left; width:465px;" >
	
			<div class="col-md-3" style="height: 300px; width:100%; margin: 20px auto">
				<!-- CONTACT ITEM -->
				<div class="panel panel-default" style="height:300px;">
					<div class="panel-body profile">
						<div class="profile-image">
							<img src="${dto.propic_path}/${dto.propic_name}" alt="Nadia Ali" width=100px; height=100px/>
						</div>
						<div class="profile-data">
							<div class="profile-data-name">${dto.name}</div>
							<div class="profile-data-title">${dto.tel}</div>
						</div>
						<div class="profile-controls form-group">
							<a href="" onclick="return getInfo('${dto.mem_id}')" class="profile-control-left">
							<span class="fa fa-info" style="margin-top:5px"></span></a> 
							<a onclick="if(confirm('정말 탈퇴처리를 하시겠습니까?'))
	      						window.location='/moyeo/one/guestDelete?mem_id=${dto.mem_id}&pageNum=${pageNum}'" class="profile-control-right">
							<span class="fa fa-bitbucket" style="margin-top:5px"></span></a>
						</div>
					</div>
					<div class="panel-body" style="">
						<div class="contact-info" style="">
							<p>
								<font size="2"><small>이메일</small><br />${dto.email}</font>
							</p>
							<p>
								<font size="2"><small>주소</small><br />${dto.address}</font>
							</p>
							<p>
								<font size="2"><small>생년월일</small><br />${dto.birth}</font>
							</p>
						</div>
					</div>
				</div>
				<!-- END CONTACT ITEM -->
			</div>
			
		</div>
	
	</div>
	</c:forEach>
</div>
<%@ include file="../../etc/footer.jsp"%>