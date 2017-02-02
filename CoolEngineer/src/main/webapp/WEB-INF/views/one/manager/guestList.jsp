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
								<a onclick="if(confirm('정말 삭제하시겠습니까?'))
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
		
		<div class="row" style="align:center; height:800px;">
			<div class="col-md-12" style="margin-left:47%">
			<table style="width:100%; align:center">
				<th align="center">
				<c:if test="${cnt > 0}">
				<!-- 처음[◀◀] 이전[◀] ▶-->
					<c:if test="${startPage > pageBlock}">
						<a href="/moyeo/one/guestList">[◀◀]</a>
						<a href="/moyeo/one/guestList?pageNum=${startPage - pageBlock}">[◀]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${i == currentPage}" >

							<span><font size="4">[${i}]</font></span>
						</c:if>
						
						<c:if test="${i != currentPage}">

							<font size="4"><a href="/moyeo/one/guestList?pageNum=${i}">[${i}]</a></font>
						</c:if>
					</c:forEach>
					
					<!-- 다음블록[▶] 끝[▶▶]-->
					<c:if test="${pageCount > endPage}">
						<a href="/moyeo/one/guestList?pageNum=${startPage + pageBlock}">[▶]</a>
						<a href="/moyeo/one/guestList?pageNum=${pageCount}">[▶▶]</a>
					</c:if>
				</c:if>
				
				</th>
			</table>
			</div>
		</div>
	</div>

<!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- START THIS PAGE PLUGINS-->        
        <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
		<!-- END THIS PAGE PLUGINS-->        

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>        
        <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>        
        <!-- END TEMPLATE -->
        
        <script type="text/javascript">
        	function getInfo(mem_id) {
        		window.open('guestInform?mem_id='+mem_id, 'guestInform', 'menubar=no, width=700, height=700, top=100, left=500');
        		return false;
        	}
        	
        	/* function deleteInfo(mem_id) {
        		if(confirm("정말 삭제하시겠습니까?")) {
        			window.location='/moyeo/one/guestDelete?mem_id='+ mem_id;
        		} else {
        			return false;
        		}
        	} */
        </script>

<!-- END SCRIPTS -->

<%@ include file="../../etc/footer.jsp"%>
