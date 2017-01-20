<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/header.jsp"%>
<div class="page-content-wrap">
                            <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                     <li><a href="../realTime/realTime.jsp">잠깐모여</a></li>
                    <li class="active">모임등록</li>
                </ul>
    <div class="row">
        <div class="col-md-12-1">
            
            <form class="form-horizontal">
            <div class="panel panel-default">
             <div class="panel-body">                                                                        
                    
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label">제 목</label>
                        <div class="col-md-6 col-xs-12">                                            
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                <input type="text" class="form-control"/>
                            </div>                                            
                            <span class="help-block">모임 제목을 적으세요</span>
                        </div>
                    </div>     
                    
                    <div class="form-group">                                        
                        <label class="col-md-3 col-xs-12 control-label">모임일 수</label>
                        <div class="col-md-6 col-xs-12">
                            <div class="input-group">
                                <span class="input-group-addon"><span class="fa fa-calendar"></span></span>
                                <input type="text" class="form-control datepicker" value="2017-01-01">                                            
                            </div>
                            <span class="help-block">클릭해서 날짜를 설정하세요</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label">상세내용</label>
                        <div class="col-md-6 col-xs-12">                                            
                            <textarea class="form-control" rows="5"></textarea>
                            <span class="help-block">모임의 상세 내용을 적으세요</span>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label class="col-md-3 control-label">참여인원</label>
                        <div class="col-md-5">                            
                            <span class="ui-spinner ui-widget ui-widget-content ui-corner-all">
								<input type="text" class="form-control spinner_default ui-spinner-input" value="1" aria-valuenow="5" autocomplete="off" role="spinbutton">
								<a class="ui-spinner-button ui-spinner-up ui-corner-tr" tabindex="-1">
									<span class="ui-icon ui-icon-triangle-1-n">▲</span>
								</a>
								<a class="ui-spinner-button ui-spinner-down ui-corner-br" tabindex="-1">
									<span class="ui-icon ui-icon-triangle-1-s">▼</span>
								</a>
							</span>
                        </div>                        
                    </div>
                   
                    
                    <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label">지역</label>
                        <div class="col-md-6 col-xs-12">                                                                                            
                            <select class="form-control select">
                                <option>서울</option>
                                <option>인천</option>
                                <option>부산</option>
                                <option>울산</option>
                                <option>광주</option>
                            </select>                            
                        </div>
                     </div>
                     <div class="form-group">    
                        <label class="col-md-3 col-xs-12 control-label">연령</label>
                        <div class="col-md-6 col-xs-12">                                                                                            
                            <select class="form-control select">
                                <option>10대</option>
                                <option>20대</option>
                                <option>30대</option>
                                <option>40대</option>
                                <option>50대 이상</option>
                            </select>                            
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-md-3 col-xs-12 control-label">분류</label>
                        <div class="col-md-6 col-xs-12">                                                                                            
                            <select class="form-control select">
                                <option>택시, 개인차 동승</option>
                				<option>식사</option>
				                <option>영화</option>
				                <option>게임</option>
				                <option>쇼핑</option>
                            </select>                            
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <button class="btn btn-default">Clear Form</button>                                    
                    <button class="btn btn-primary pull-right">등록</button>
                </div>
            </div>
            </form>
            
        </div>
    </div>                    
    
</div>
 		<script>
            $(function(){
                //Spinner
                $(".spinner_default").spinner()
                $(".spinner_decimal").spinner({step: 0.01, numberFormat: "n"});                
                //End spinner
                
                //Datepicker
                $('#dp-2').datepicker();
                $('#dp-3').datepicker({startView: 2});
                $('#dp-4').datepicker({startView: 1});                
                //End Datepicker
            });
        </script>		
<%@ include file="../etc/footer.jsp"%>