<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/header.jsp"%>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li class="active">추천장소</li>
                </ul>
               <!-- END BREADCRUMB -->     

<div class="col-md-13-2">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title-box">
				<h3>추천장소 검색</h3>										
			</div>
		</div>
		<div class="panel-body padding-0">
			<select class="form-control-1 select">
				<option>전체검색</option>
                <option>시 1</option>
                <option>시 2</option>
                <option>시 3</option>
                <option>시 4</option>
                <option>시 5</option>
            </select>
            <select class="form-control-1 select">
            	<option>전체검색</option>
                <option>구 1</option>
                <option>구 2</option>
                <option>구 3</option>
                <option>구 4</option>
                <option>구 5</option>
            </select>
            <select class="form-control-1 select">
            	<option>전체검색</option>
                <option>동 1</option>
                <option>동 2</option>
                <option>동 3</option>
                <option>동 4</option>
                <option>동 5</option>
            </select>
		</div>
		<div class="col-md-6-2">
		    <div class="input-group push-down-10">
		        <span class="input-group-addon"><span class="fa fa-search"></span></span>
		        <input type="text" class="form-control" placeholder="Keywords..."/>
		        <div class="input-group-btn">
		            <button class="btn btn-primary">Search</button>
		        </div>
		    </div>
		</div> 
	</div>
</div>
<div class="col-md-13-3">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title-box">
				<h3>지금 뜨는 장소</h3>										
			</div>
		</div>		
	</div>
</div>
<div class="col-md-13-4">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title-box">
				<h3>검색 결과</h3>										
			</div>
		</div>		
	</div>
</div> 

<%@ include file="../etc/footer.jsp"%>  