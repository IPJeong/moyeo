<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../../etc/moim_header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features
		{
		width: 100%;
		background-color: #FBFBFB;
		padding: 0px 20px;
	}
}



@media ( min-width : 1100px) {
	.col-md-56 {
		width: 60%;
		height: 870px;
	}
}

@media only screen and (max-width: 1010px) {
	.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open
		{
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
	overflow: auto;
}

.col-md-25 {
	display: block;
}

li {
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}

img {
	margin: 10px 10px 10px 10px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	//데이트형 타입으로 변환 (예. 2017년 2월 2월 -> 2017/2/2)
	function toDate(timestamp) {
		var date = new Date(timestamp);
		var year = date.getFullYear();
		var month = date.getMonth();
		month = month+1;
		var day = date.getDate();
		var hour = date.getHours();
		var minutes = date.getMinutes();
		var fullDate = year+"년 "+month+"월 "+day+"일  " + hour + ":" + minutes;
		return fullDate;
	}



	$(document).ready(function(){
		$("#msgBox").scrollTop($("#msgBox")[0].scrollHeight);
		setInterval(readAjax, 300); 
		
	});
	
	function readAjax(compareTime){
	    $.ajax({
	        method: "POST",
	        url: "/moyeo/six/moimChat/getChat",
	        dataType: "json",
	        cache: false,
	        async: false,
	        data: {
	         
	        },
	        success: function(data) {
	          
	                $.each(data.dtos, function(index, dto){
	                	var fullDate = toDate(dto.msg_date);
	                	
	                	if(dto.mem_id == $('#mem_id').val()) {
	                		var msg = '<div class="item in item-visible" style="width:750px;" id="reply' + dto.msg_num +'">' +
	                		'<div class="image">' + 
	                		'<img src="' + dto.propic_path +'/' + dto.propic_name + '" style="height:40px;">' +
			            '</div>' +                                
			            '<div class="text" style="margin-right:0px;">' + 
			                '<div class="heading">' + 
			                    '<a href="#">' + dto.mem_id + '</a>' +
			                    '<span class="date">' + fullDate + '</span>' +
			                '</div>'+                                    
			                dto.msg_content +
			            '</div>'+
				          '</div>';
				          $('#msgBox').append(msg);
		                  $("#msgBox").scrollTop($("#msgBox")[0].scrollHeight); // 스크롤바 항상 맨 밑으로 유지
	                	}
	                	
	                	if(dto.mem_id != $('#mem_id').val()) {
	                		var msg = '<div class="item item-visible" style="width:750px;" id="reply' + dto.msg_num +'">' +
	                   		'<div class="image">' + 
	                        '<img src="' + dto.propic_path +'/' + dto.propic_name + '" style="height:40px;">' +
	                    '</div>' +                                
	                    '<div class="text">' + 
	                        '<div class="heading">' + 
	                            '<a>' + dto.mem_id + '</a>' +
	                            '<span class="date">' + fullDate + '</span>' +
	                        '</div>'+                                    
	                        dto.msg_content +
	                    '</div>'+
		                  '</div>';
		                  $('#msgBox').append(msg);
		                  $("#msgBox").scrollTop($("#msgBox")[0].scrollHeight); // 스크롤바 항상 맨 밑으로 유지
	                	}
	                	
	               });
	         } 
	       
	    });
	}

</script>

<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="/moyeo/main/home">Home</a></li>
	<li><a href="/moyeo/six/category/category_hobby">모임</a></li>
	<li><a href="/moyeo/six/moimMain/moimMain?group_num=${group_num}">${open_dto.group_name}</a></li>
	<li class="active">모임 채팅</li>
</ul>
<!-- END BREADCRUMB -->

<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top: 10px; margin-left: 10%;">
		<!-- 모임페이지 사이드바 시작 -->
		<%@include file="../../etc/moim_side.jsp"%>
		<!-- 모임페이지 사이드바 종료 -->

		<!-- START PHOTO BLOCK -->
		<div class="col-md-56" style="margin-top: 10px;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임채팅</h3>
					</div>
				</div>
				<div class="panel-body padding-0">
				<input type="hidden" id="chat_num" value="${chat_room_num}">
				<input type="hidden" id="mem_id" value="${mem_id}">
					<div class="page-content">
		               <div class="content-frame">                                    
		                    
		                    <!-- START CONTENT FRAME RIGHT -->
		                    <div class="content-frame-right" style="width:25%;">
		                        <c:forEach var="member_dto" items="${member_dtos}">
		                        <div class="list-group list-group-contacts border-bottom push-down-10">
		                           
			                            <a class="list-group-item">                                 
			                                <div class="list-group-status status-online"></div>
			                                <div style="height:40px; width:40px; float:left;"><img src="${member_dto.propic_path}/${member_dto.propic_name}" class="pull-left" style="margin:0px; height:40px;"></div>
			                                &nbsp;&nbsp;<span class="contacts-title">${member_dto.mem_id}</span>
			                                <p>&nbsp;&nbsp;${member_dto.name}</p>
			                            </a>                                
		         
		                        </div>
		                        </c:forEach>

		                        
		                    </div>
		                    <!-- END CONTENT FRAME RIGHT -->
		                
		                    <!-- START CONTENT FRAME BODY -->
		                    <div class="content-frame-body content-frame-body-left" style="width:75%; height:776px; padding: 10px;">
		                        	
		                        <div class="messages messages-img" id="msgBox" style="overflow:auto; width:100%; height: 720px;">
		                           	 <c:if test="${cnt == 0}">
		                           	 	<div style="width:600px;"><a>채팅방에 입장했습니다.</a><br><br></div>
		                           	 </c:if>  
		                           	 <c:if test="${cnt != 0}"> 
		                           	    <c:forEach var = "dto" items="${dtos}">
				                            <c:if test="${dto.mem_id eq mem_id}">
					                            <div class="item in item-visible" style="width:600px;">
					                        </c:if>
					                        <c:if test="${dto.mem_id ne mem_id}">
					                        	<div class="item item-visible" style="width:600px;">
					                        </c:if>
					                                <div class="image">
					                                    <img src="${dto.propic_path}/${dto.propic_name}">
					                                </div>                                
					                                <div class="text">
					                                    <div class="heading">
					                                        <a href="#">${dto.mem_id}</a>
					                                        <span class="date">${fn:substring(dto.msg_date, 0, 16)}</span>
					                                    </div>                                    
					                                    ${dto.msg_content}
					                                </div>
					                            </div>
				                         </c:forEach>
			                            <div style="width:600px;"><a>여기까지 읽으셨습니다.</a><br><br></div>
	   						    	</c:if>
	   						    </div>                        
		                        	
		                        <div class="panel panel-default push-up-10" style="height:50px;">
		                            <div class="panel-body panel-body-search">
		                                <div class="input-group">
		                                    <input type="text" class="form-control" id="msg_content" placeholder="Your message..." onkeypress="keycheck(event);"/>
		                                    <div class="input-group-btn">
		                                        <button class="btn btn-default" id="enter_chat" onclick="addChat()">Send</button>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                    <!-- END CONTENT FRAME BODY -->      
		                </div>
					</div>







				</div>
				<div id="aba" style="text-align: right"></div>
			</div>
		</div>
		<!-- END PHOTO BLOCK -->
	</div>
</div>
<!-- END ROW -->

    <!-- START SCRIPTS -->
        <!-- START PLUGINS -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>        
        <!-- END PLUGINS -->

        <!-- THIS PAGE PLUGINS -->
        <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
		<!-- END PAGE PLUGINS -->     

        <!-- START TEMPLATE -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>        
        <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>        
        
        <script src="/moyeo/resources/customScript/six.js" type="text/javascript"></script>
        <!-- END TEMPLATE -->
    <!-- END SCRIPTS --> 

<%@ include file="../../etc/footer.jsp"%>