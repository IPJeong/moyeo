<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../etc/header2.jsp"%>

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<script type='text/javascript'
	src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>

<script type="text/javascript"
	src="/moyeo/resources/resource/js/plugins/highlight/jquery.highlight-4.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->
<script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>

<script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/faq.js"></script>
<script type="text/javascript" src="/moyeo/resources/resource/js/jquery-1.12.4.js"></script>
<!-- END TEMPLATE -->

<!-- END SCRIPTS -->
<script type="text/javascript">
	
	$(function(){
		$("#fade > #button").fadeToggle(0);
		$("#fadeButton > #modifyButton").click(function() {
			$("#fade > #button").fadeToggle(200);
		});		
	});
	
	$(function(){
		$("#fade > #button2").fadeToggle(0);
		$("#dfadeButton > #deleteButton").click(function() {
			$("#fade > #button2").fadeToggle(200);
		});		
	});
	
	$(function(){
		$("#fade2 > #button3").fadeToggle(0);
		$("#dCtgfadeButton > #deleteCtgButton").click(function() {
			$("#fade2 > #button3").fadeToggle(200);
		});		
	});
</script>

<ul class="breadcrumb">
	<li><a href="#">Home</a></li>
	<li><a href="#">고객지원</a></li>
	<li class="active">FAQ</li>
</ul>
<!-- END BREADCRUMB -->

<!-- PAGE TITLE -->
<div class="page-title">
	<h2>
		<span class="fa fa-arrow-circle-o-left"></span> Frequently Asked
		Questions
	</h2>
</div>
<!-- END PAGE TITLE -->

<!-- PAGE CONTENT WRAPPER -->

<div class="page-content-wrap">
	<div class="row">
		<div class="col-md-6-3">
			<div class="panel panel-default">	
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>FAQ 카테고리</h3>										
					</div>
				</div>			
				<div class="panel-body padding-0">
					<div class="col-md-12-8">
						<table >
						<c:if test="${cnt > 0}">										
							<tr>
								<td>
									<c:forEach var="dto" items="${dtos}">
										<a href="#${dto.ctgName}"><span class="fa fa-angle-double-down" ></span>${dto.ctgName}</a><br>
									</c:forEach>
								</td>
							</tr>											
						</c:if>
						<c:if test="${cnt == 0}">									
							<tr>
								<td>등록된 FAQ카테고리가 없습니다.</td>
							</tr>										
						</c:if>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6-4">
			<div class="col-md-6-5">
				<c:if test="${sessionScope.mem_id == 'admin'}">				
					<div class="panel panel-default">
	                     <div class="panel-heading">
	                     	  <div class="form-group">
	                     	  	  <c:if test="${cnt > 0}">                                       
		                              <div class="col-md-4">
		                                  <button class="btn btn-primary btn-block" onclick="window.location='/moyeo/three/faqCategory'">카테고리 생성</button>
		                              </div>
		                              <div class="col-md-4">
		                                  <button class="btn btn-info btn-block" onclick="window.location='/moyeo/three/faqCtgModify'">카테고리 수정</button>
		                              </div>		                                        
                                      <div class="col-md-4" id="dCtgfadeButton">
                                          <button class="btn btn-warning btn-block" id="deleteCtgButton">카테고리 삭제</button>
                                      </div>                                     
	                              </c:if>
	                              <c:if test="${cnt == 0}">                                       
		                              <div class="col-md-12">
		                                  <button class="btn btn-primary btn-block" onclick="window.location='/moyeo/three/faqCategory'">카테고리 생성</button>
		                              </div> 
	                              </c:if>  
	                              <c:if test="${cnt2 > 0}">
                                      	  <br><br>	                                      
	                                      <div class="col-md-4">
			                                  <button class="btn btn-primary btn-block" onclick="window.location='/moyeo/three/faqInsertForm'">FAQ 생성</button>
			                              </div>
			                              <div class="col-md-4" id="fadeButton">
			                                  <button class="btn btn-info btn-block" id="modifyButton">FAQ 수정</button>
			                              </div>		                                        
	                                      <div class="col-md-4" id="dfadeButton">
	                                          <button class="btn btn-warning btn-block" id="deleteButton">FAQ 삭제</button>
	                                      </div>
                                  </c:if>
                                  <c:if test="${cnt2 == 0 && cnt != 0}">
                                  	  <br><br>
                                  	  <div class="col-md-12">
			                                  <button class="btn btn-info btn-block" onclick="window.location='/moyeo/three/faqInsertForm'">FAQ 생성</button>
			                          </div>
                                   </c:if>	                                                                 
	                          </div>      
	                     </div>
	                </div>
                
                </c:if>
                <c:if test="${sessionScope.mem_id != 'admin'}">
                
                </c:if>                
				<c:if test="${cnt > 0}">
					<c:forEach var="dto" items="${dtos}">										
							<div class="panel panel-default">
								<div class="panel-body" id="fade2">
									<h3 class="push-down-0" id="${dto.ctgName}" style="display: inline;">${dto.ctgName}</h3>
									<button type="button" class="btn btn-warning" id="button3" onclick="if(confirm('삭제하시겠습니까?'))window.location='/moyeo/three/faqCtgDelete?ctgNum=${dto.ctgNum}&ctgName=${dto.ctgName}'">삭제</button>
								</div>
								<c:if test="${cnt2 > 0}">									
									<c:forEach var="dto2" items="${dtos2}">	
										<c:if test="${dto.ctgName == dto2.ctgName2}">						
											<div class="panel-body faq">
												<table style="width:100%">									
													<tr>
														<td>
															<div class="faq-item">
																<div class="faq-title" id="fade">
																	<span class="fa fa-angle-down"></span>${dto2.faqTitle}																							                                        
									                                <button type="button" class="btn btn-info" id="button" onclick="window.location='/moyeo/three/faqModifyForm?faqNum=${dto2.faqNum}'">수정</button>									                                 
																	<button type="button" class="btn btn-warning" id="button2" onclick="if(confirm('삭제하시겠습니까?'))window.location='/moyeo/three/faqDelete?faqNum=${dto2.faqNum}'">삭제</button>
																</div>
																<div class="faq-text">														
																	<p>${dto2.faqContent}</p>
																</div>
															</div>
														</td>
													</tr>
												</table>
											</div>
										</c:if>
									</c:forEach>									
								</c:if>
								<c:if test="${cnt2 == 0}">											
									<div class="panel-body faq">
										<table style="width:100%">
											<tr>
												<td>
													등록된 답변이 없습니다.
												</td>
											</tr>																		
										</table>
									</div>										
								</c:if>	
							</div>
						</c:forEach>
					</c:if>													
				<c:if test="${cnt == 0}">					
					<div class="panel panel-default">	
						<div class="panel-body padding-0">
							&nbsp;<br><br>
							<h3 align="center">카테고리를 등록하세요</h3><br>
							&nbsp;
						</div>
					</div>							
				</c:if>				
			</div>
		</div>	
	</div>
</div>

<!-- END PAGE CONTENT WRAPPER -->

<%@ include file="../../etc/footer2.jsp"%>
