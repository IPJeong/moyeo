<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../etc/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fmt2" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fmt3" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<jsp:useBean id="today" class="java.util.Date"/>
<jsp:useBean id="sysdate" class="java.util.Date"/>
<fmt2:formatDate value="${today}" pattern="yyyy-MM-dd" var="today"/>
<fmt3:formatDate value="${sysdate}" pattern="HH:mm:ss" var="sysdate"/>
<script type="text/javascript" src="/moyeo/resources/customScript/five.js"></script>
<style type="text/css">
	.layer {
    display: none;
    position: fixed;
    _position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 100;
	}
	.layer .bg {
	    position: absolute;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background: #000;
	    opacity: 0.5;
	    filter:alpha(opacity=50);
	}
	.layer .pop-layer {
	    display: block;
	}
	
	.pop-layer {
	    display: none;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width: 1000px;
	    height: auto;
	    background-color: #fff;
	    border: 0px;
	    z-index: 10;
	}
	.pop-layer .pop-container {
	    padding: 20px 25px;
	}
	.pop-layer p.ctxt {
	    color: #666;
	    line-height: 25px;
	}
	.pop-layer .btn-r {
	    width: 100%;
	    margin: 10px 0 20px;
	    padding-top: 10px;
	    border-top: 1px solid #DDD;
	    text-align: right;
	}
	
	a.cbtn { /* 닫기 버튼 */
	    display: inline-block;
	    height: 25px;
	    padding: 0 14px;
	    border: 1px solid #304a8a;
	    background-color: #3f5a9d;
	    font-size: 13px;
	    color: #fff;
	    line-height: 25px;
	}
	a.cbtn:hover {
	    border: 1px solid #091940;
	    background-color: #1f326a;
	    color: #fff;
	}
	
	.btn-example {
		
	}
</style>

<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();	//'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
		}else{
			temp.fadeIn();
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
			}else{
				temp.fadeOut();
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){	//배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}
	
	function dateChk() { //시작일 선택시 종료일과 발표일 동기화
		if(eventInsertForm.startDate.value != eventInsertForm.endDate.value) {
			document.eventInsertForm.endDate.value = document.eventInsertForm.startDate.value;
			document.eventInsertForm.notiDate.value = document.eventInsertForm.startDate.value;
		};
	}
	
	function dateChk2() { //종료일이 시작일보다 빠르지 않게, 종료일 선택시 발표일과 동기화
		if(eventInsertForm.endDate.value != eventInsertForm.notiDate.value)	{
			document.eventInsertForm.notiDate.value = document.eventInsertForm.endDate.value;
		};
		if(eventInsertForm.endDate.value < eventInsertForm.startDate.value) {
			alert("종료일이 시작일 보다 빠를수는 없습니다.");
			document.eventInsertForm.endDate.value = document.eventInsertForm.startDate.value;
			document.eventInsertForm.notiDate.value = document.eventInsertForm.startDate.value;
		}
	}
	
	function dateChk3() { //발표일이 종료일보다 빠르지 않게		
		if(eventInsertForm.notiDate.value < eventInsertForm.endDate.value) {
			alert("당첨자발표일이 종료일 보다 빠를수는 없습니다.");			
			document.eventInsertForm.notiDate.value = document.eventInsertForm.endDate.value;
		}
	}
	
	function participate(id, eventNum) {		
		if(id == null) {
			alert("로그인이 필요합니다.");
			window.location="/moyeo/main/memberLoginForm";
		} else if(id != 'admin') {
			window.location='eParticipate?=' + eventNum;
		} else {
			alert("관리자는 참여할 수 없습니다.");
		}
	}
	
	
</script>
<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="#">Home</a></li>
	<li class="active">이벤트</li>
</ul>
<!-- END BREADCRUMB -->


<!-- PAGE CONTENT TABBED -->
<div class="page-tabs">
	<a href="#first-tab" class="active">진행중인 이벤트</a> 
	<a href="#second-tab"> 당첨자 발표</a>
</div>

<div class="page-content-wrap page-tabs-item active" id="first-tab">
	<c:if test="${sessionScope.mem_id == 'admin'}">
		<div class="form-group"> 
			<div class="col-md-6-3" style="width:70%;">                                       
		        <div class="col-md-2" style="float:right;">
		        	<button class="btn btn-info btn-block" data-toggle="modal" data-target="#modal_change_password" data-backdrop="static">EVENT 등록</button>	            
		        </div>
		    </div>
	    </div>
    </c:if>
    <div class="col-md-6-3 " style="width:70%;">
    	<div class="col-md-12">
	    <table style="width:100%;">
	    	<thead>
	    		<tr>
	    			<th style="padding-top:5px;"><h2>진행중인 이벤트</h2></th>
	    		</tr>
	    	</thead>
	    	<tbody>
	    	<c:if test="${cnt > 0}">    	
	    		<c:forEach var="dto" items="${dtos}">
		    		<%-- <c:forEach var="dto2" items="${dtos2}"> --%>
			    		<c:if test="${dto.ing == 'Ing'}">
				    		<tr>
				    			<td style="padding-top:5px;"> 
					    			<div class="col-md-3" style="width:25%;height:180px;padding:0px;">
					    				<div class="panel panel-default" style="width:100%">                                
				                             <div class="panel-body" style="height:100%">
				                                  <div class="text-center" id="user_image" style="width:100%;height:100%;padding:3px;">
				                                  		<a href="#" data-toggle="modal" data-target="#${dto.eventNum}" style="text-decoration:none;">
				                                  			<img src="${dto.picPath}/${dto.picName}" style="width:100%;height:100%;">
				                                  		</a>
				                                  </div>
				                             </div>
				                        </div>
					    			</div>
					    			<div class="col-md-8" style="width:75%;height:180px;padding:0px;padding-left:10px;">
						    			<div class="panel panel-default form-horizontal">
							    			<div class="panel-body" style="padding-left:0px;height:20%;"> 
								    			<div class="form-group" style="height:100%;">
								    				<label class="col-md-12 col-xs-12" style="padding:0px;padding-left:10px;"><a href="#" data-toggle="modal" data-target="#${dto.eventNum}" style="text-decoration:none;">${dto.eventTitle}</a></label>
								    			</div>
								    		</div>								    		
								    		<div class="panel-body form-group-separated" style="height:80%;">
								    			<div class="form-group" style="height:60%;">
							    				<label class="col-md-12 col-xs-12 line-height-15" style="max-height:31px;">${dto.eventCon}</label>
								    			</div>
								    			<div class="form-group" style="height:40%;">	
								    				<label class="col-md-10 col-xs-12 line-height-15">기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간&nbsp;&nbsp;
								    				<fmt:formatDate type="both" pattern="yy-MM-dd" value="${dto.startDate}"/>&nbsp;~
								    				<fmt:formatDate type="both" pattern="yy-MM-dd" value="${dto.endDate}"/><br>당첨자발표&nbsp;&nbsp;
								    				<font color="#8BC34A"><fmt:formatDate type="both" pattern="yy-MM-dd" value="${dto.notiDate}"/></font></label>
								    				<c:if test="${sessionScope.mem_id == 'admin'}">
								    				<div class="col-md-2">
								    					<button class="btn btn-success btn-block" data-toggle="modal" data-target="#partic" data-backdrop="static">참여자</button>
								    				</div>
								    				</c:if>				    				
								    			</div>
								    		</div>
							    		</div>
					    			</div>
					    			<!-- 이벤트 상세 페이지 모달 -->					    					    			
			    					<div class="modal animated fadeIn" id="${dto.eventNum}" tabindex="-1" role="dialog" aria-labelledby="smallModalHead" aria-hidden="true">
										<div class="modal-dialog">
										    <div class="modal-content" style="max-height:85%;border-width:0px;">
										        <div class="modal-header">
										            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
										            <h4 class="modal-title" id="smallModalHead" style="font-weight:bold;">${dto.eventTitle}</h4>
										        </div>
									        	<div class="modal-body form-horizontal form-group-separated">                        
										            <div class="form-group col-md-12" style="padding:0px;">
										                <div class="col-md-3" style="width:30%">
										                	<div class="text-center" id="user_image" style="width:100%;height:100%;padding:3px;">
							                                	<img src="${dto.picPath}/${dto.picName}" style="width:100%;height:100%;">
							                                </div>
										                </div>
										                <div class="col-md-9" style="width:70%;padding:0px;">
										                	<div class="form-group" style="height:50%;">
										                    	<label class="col-md-12 col-xs-12 line-height-30">등록자 : ${dto.adminId}</label>										                    	
										                    </div>
										                    <div class="form-group" style="height:50%;">	
											    				<label class="col-md-12 col-xs-12 line-height-15" style="margin:0px;">기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;간&nbsp;&nbsp;
											    				<fmt:formatDate type="both" pattern="yy-MM-dd" value="${dto.startDate}"/>&nbsp;~
											    				<fmt:formatDate type="both" pattern="yy-MM-dd" value="${dto.endDate}"/><br>당첨자발표&nbsp;&nbsp;
											    				<font color="#8BC34A"><fmt:formatDate type="both" pattern="yy-MM-dd" value="${dto.notiDate}"/></font></label>				    				
											    			</div>
										                </div>
										            </div>
										            <div class="form-group col-md-12" style="padding:5px;text-align:center;">
										            	<c:forEach var="dto2" items="${dtos2}">
											            	<c:if test="${dto2.eventNum2 == dto.eventNum}">
											            		<div class="col-md-12">
											            			<div class="col-md-8" style="margin:auto;width:80%;float:none;">
											            				<img src="${dto2.picPath2}/${dto2.picName2}" style="width:100%;">
											            			</div>
											            		</div>
											            	</c:if>
										            	</c:forEach>										            	
										            	${dto.eventCon}										            	
										            </div>										           														            
										             <div class="modal-footer">
										                <button type="button" class="btn btn-danger" onclick="window.location='eventParticipate?memid=${sessionScope.mem_id}&evenum=${dto.eventNum}'">참여</button><!--  -->
										                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										             </div>													        
										        </div>
										    </div>
										</div>
									</div>
									<!-- 이벤트 상세 페이지 모달 -->
									<!-- 참여자 리스트 모달 -->
									<div class="modal animated fadeIn" id="partic" tabindex="-1" role="dialog" style="height:50%;overflow:hidden;" aria-labelledby="smallModalHead" aria-hidden="true">
										<div class="modal-dialog" style="width:25%;max-height:50%;">
										    <div class="modal-content" style="border-width:0px;">
										        <div class="modal-header">
										            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
										            <h4 class="modal-title" id="smallModalHead" style="font-weight:bold;">참여자 리스트</h4>
										        </div>
										        <div class="modal-body" style="width:100%;max-height:50%;padding:0px;">
										        	<div class="panel-body panel-body-table" style="display:block;height:50%;">                                
					                                    <table class="table table-bordered" style="width:50%;overflow:hidden;">
					                                        <thead style="width:100%;">
					                                            <tr>					                                                
					                                                <th>First Name</th>
					                                                <th>Last Name</th>
					                                                <th>Username</th>
					                                            </tr>
					                                        </thead>
					                                        <tbody style="display:block;width:100%;height:50%;overflow-y:auto;">
					                                            <tr>					                                                
					                                                <td style="width">Mark</td>
					                                                <td>Otto</td>
					                                                <td>@mdo</td>
					                                            </tr>
					                                            <tr>					                                                
					                                                <td>Jacob</td>
					                                                <td>Thornton</td>
					                                                <td>@fat</td>
					                                            </tr>
					                                            <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                            <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                            <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                            <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                            <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                             <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                             <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                             <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                            <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                             <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                            <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                             <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                            <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                             <tr>					                                                
					                                                <td>Larry</td>
					                                                <td>the Bird</td>
					                                                <td>@twitter</td>
					                                            </tr>
					                                        </tbody>
					                                    </table>                                
					                                </div>
										        </div>
										        <div class="modal-footer">
									                <button type="button" class="btn btn-danger" onclick="window.location='eParticipate'">선정</button><!-- participate(<%-- <%= memId %> --%>); -->
									                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									             </div>	
										     </div>
										</div>
									</div>
									<!-- 참여자 리스트 모달 -->																		
				    			</td>
				    		</tr>
			    		</c:if>
		    		<%-- </c:forEach> --%>	    		
	    		</c:forEach>
	    	</c:if>
	    	<c:if test="${cnt == 0}">
	    		<tr>
	    			<td> 
		    			<div class="col-md-3" style="width:25%;height:180px;padding:0px;">
		    				<div class="panel panel-default" style="width:100%">                                
	                             <div class="panel-body" style="padding:3px;text-align:center;">
	                                  <div class="text-center" id="user_image" style="height:100%;">
	                                  		등록된 이벤트가 없습니다.
	                                  </div>
	                             </div>
	                        </div>
		    			</div>
		    			<div class="col-md-8" style="width:75%;height:180px;padding:0px;padding-left:10px;">
			    			<div class="panel panel-default form-horizontal">
				    			<div class="panel-body" style="padding-left:0px;height:20%;"> 
					    			<div class="form-group" style="height:100%;">
					    				<label class="col-md-12 col-xs-12" style="padding:0px;padding-left:10px;"></label>
					    			</div>
					    		</div>
					    		<div class="panel-body form-group-separated" style="height:80%;">
					    			<div class="form-group" style="height:60%;">
					    				<label class="col-md-12 col-xs-12 line-height-30"></label>
					    			</div>
					    			<div class="form-group" style="height:40%;">	
					    				<label class="col-md-12 col-xs-12 line-height-15"></label>				    				
					    			</div>
					    		</div>
				    		</div>
		    			</div>
	    			</td>
	    		</tr>
	    	</c:if>
	    	</tbody>
	    </table>
	    </div>
	    <div class="row">
            <div class="col-md-12">
                <ul class="pagination pagination-sm pull-right push-down-10 push-up-10">
                	<c:if test="${cnt > 0}">
						<!-- 처음[◀◀] 이전[◀]-->
						<c:if test="${startPage > pageBlock}">
							<li><a href="ing_event">«</a></li>
							<li><a href="ing_event?pageNum=${startPage - pageBlock}" >‹</a></li>
						</c:if>
						
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${i == currentPage}">
								<li class="active"><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i != currentPage}">
								<li><a href="ing_event?pageNum=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
						
						<!-- 다음[▶] 끝[▶▶] -->
						<c:if test="${pageCount > endPage}">				
							<li><a href="ing_event?pageNum=${startPage + pageBlock}" >›</a></li>
							<li><a href="ing_event?pageNum=${pageCount}" >»</a></li>
						</c:if>
					</c:if>                    
                </ul>                            
            </div>
        </div>
    </div>	
</div>
	
<div class="page-content-wrap page-tabs-item" id="second-tab">
	<div class="row">
		<div class="col-md-6-3">
			<div class="panel panel-default">
				<div class="panel-body">	                   
                  <div class="table-responsive">
	                  <table class="table table-striped">
	                  	  <thead>
	                  	  	  <tr>
	               	  	  	      <th width="75%">제목</th>
	               	  	  	      <th width="15%">발표일</th>
	               	  	  	      <th width="10%">조회수</th>
	                  	  	  </tr>
	                  	  </thead>	
		                  <tbody>			
							  <tr>						  	  
								  <td>
									  <a href="#" class="btn-example" onclick="layer_open('layer2');return false;">당첨자</a>								  
								   		<div class="layer">
										  <div class="bg"></div>
										  <div id="layer2" class="pop-layer">
											  <div class="pop-container">
												  <div class="pop-conts">
														<!--content //-->
														<p class="ctxt mb20">Thank you.<br>
															Your registration was submitted successfully.<br>
															Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
															Hope to see you soon!
														</p>
										
														<div class="btn-r">
															<a href="#" class="cbtn">Close</a>
														</div>
														<!--// content-->
												  </div>
											   </div>
										   </div>
										</div>
								   </td>
								   <td>2017.01.25</td>
								   <td>55</td>
							   </tr>
						   </tbody>					
					   </table>
				   	    <div class="row">
				            <div class="col-md-12">
				                <ul class="pagination pagination-sm pull-right push-down-10 push-up-10">
				                    <li class="disabled"><a href="#">«</a></li>
				                    <li class="active"><a href="#">1</a></li>
				                    <li><a href="#">2</a></li>
				                    <li><a href="#">3</a></li>
				                    <li><a href="#">4</a></li>                                    
				                    <li><a href="#">»</a></li>
				                </ul>                            
				            </div>
				        </div>
				   </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달창 -->
<!-- 이벤트 등록 -->
<div class="modal animated fadeIn" id="modal_change_password" tabindex="-1" role="dialog" aria-labelledby="smallModalHead" aria-hidden="true" style="border-width:0px;">
	<div class="modal-dialog">
	    <div class="modal-content" style="border-width:0px;">
	        <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	            <h4 class="modal-title" id="smallModalHead">EVENT 등록</h4>
	        </div>
	        	<form:form class="form-horizontal" action="eventInsert" method="post" name="eventInsertForm" modelAttribute="uploadForm" enctype="multipart/form-data">		                           
			        <div class="modal-body form-horizontal form-group-separated">                        
			            <div class="form-group">
			                <label class="col-md-3 control-label">이벤트제목</label>
			                <div class="col-md-9">
			                    <input type="text" class="form-control" name="eventTitle" required/>
			                </div>
			            </div>
			            <div class="form-group">
			                <label class="col-md-3 control-label">이벤트내용</label>
			                <div class="col-md-9">
			                    <textarea class="form-control" name="eventCon" style="height:100px;resize:none;" required></textarea>
				            </div>
				        </div>                        
				        <div class="form-group">
				           <label class="col-md-3 control-label">이벤트기간</label>
				           <div class="col-md-5">
				               <div class="input-group">
				                   <input type="text" class="form-control datepicker" name="startDate" value="${today}" onchange="dateChk();" required/>
				                   <span class="input-group-addon add-on" style="line-height:0px;vertical-align:middle;"> - </span>
				                   <input type="text" class="form-control datepicker" name="endDate" value="${today}" onchange="dateChk2();" required/>
				               </div>
				           </div>
					     </div>
					     <div class="form-group">
				        	<label class="col-md-3 control-label">당첨자발표</label>
				        	<div class="col-md-9">
			           		<input type="text" class="form-control datepicker" name="notiDate" value="${today}" onchange="dateChk3();"required/>
			                </div>
			             </div>
		             	 <div class="form-group">
		                    <label class="col-md-3 control-label">썸네일</label>                            
		                    <div class="col-md-9">
		                        <input type="file" id="filename1" name="files[0]" onchange="chkType('files[0]')" required/>
		                    </div>                            
		                 </div>
		                 <div class="form-group">
		                    <label class="col-md-3 control-label">이벤트내용</label>                            
		                    <div class="col-md-9">
		                        <input type="file" id="filename2" name="files[1]" onchange="chkType('files[1]')" required/>
		                    </div>                            
		                 </div>	                
			         </div>
		             <div class="modal-footer">
		                <button type="submit" class="btn btn-danger">등록</button>
		                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		             </div>
		        </form:form>
	        </div>
	    </div>
	</div>
<!-- 이벤트 등록 끝 --> 
<!-- 모달창 끝 -->
<!-- END PAGE CONTENT TABBED -->

<%@ include file="../../etc/footer.jsp"%>
