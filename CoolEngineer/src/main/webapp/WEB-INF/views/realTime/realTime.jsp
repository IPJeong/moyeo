<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/header.jsp"%>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li class="active">잠깐모여</li>
                </ul>
               <!-- END BREADCRUMB -->            
               

<div class="row-1">
<div class="col-md-13-2">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title-box">
				<h3>검색</h3>										
			</div>
		</div>
		<div class="panel-body padding-0">
			<select class="form-control-1 select">
				<option>전체검색</option>
                <option>서울</option>
                <option>인천</option>
                <option>부산</option>
                <option>울산</option>
                <option>대구</option>
            </select>
            <select class="form-control-1 select">
            	<option>전체검색</option>
                <option>10대</option>
                <option>20대</option>
                <option>30대</option>
                <option>40대</option>
                <option>50대이상</option>
            </select>
            <select class="form-control-1 select">
            	<option>전체검색</option>
                <option>택시, 개인차 동승</option>
                <option>식사</option>
                <option>영화</option>
                <option>게임</option>
                <option>쇼핑</option>
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
<div class="col-md-6-3">
	<div class="panel panel-default">
	    <div class="panel-heading">
	        <h3 class="panel-title">잠깐 모여!</h3>
	    </div>
	    <div class="panel-body">
	        <div class="table-responsive">
	            <table class="table table-bordered">
	                <thead>
	                    <tr>
	                        <th style="15%">글번호</th>
	                        <th style="50%">잠깐모여</th>
	                        <th style="15%">참석</th>
	                        <th style="10%">등록일</th>
	                        <th style="10%">참석인원</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr class="active">
	                        <td>5</td>
	                        <td>대왕돈가스 도전하러 가실 3분 모여</td>
	                        <td align="center">
	                         <button type="button" class="btn btn-info">참석</button>
	                        </td>
	                        <td>1분전</td>
	                        <td>2/3</td>
	                    </tr>
	                    <tr class="success">
	                        <td>4</td>
	                        <td>에슐리 5명할인 같이 갈 사람 모여</td>
	                        <td align="center">
	                         <button type="button" class="btn btn-info">참석</button>
	                        </td>
	                        <td>3분전</td>
	                        <td>4/5</td>
	                    </tr>
	                    <tr class="info">
	                        <td>3</td>
	                        <td>급 고기 땡긴다 4명 모여</td>
	                        <td align="center">
	                         <button type="button" class="btn btn-info">참석</button>
	                        </td>
	                        <td>5분전</td>
	                        <td>4/4</td>
	                    </tr>
	                    <tr class="warning">
	                        <td>2</td>
	                        <td>만수6동에서 송내역까지 택시타고 같이갈 3분 모여</td>
	                        <td align="center">
	                         <button type="button" class="btn btn-info">참석</button>
	                        </td>
	                        <td>10분전</td>
	                        <td>3/3</td>
	                    </tr>
	                    <tr class="danger">
	                        <td>1</td>
	                        <td>라라랜드 아직 안본사람 3분 모여</td>
	                        <td align="center">
	                         <button type="button" class="btn btn-info">참석</button>
	                        </td>
	                        <td>1분전</td>
	                        <td>3/3</td>
	                    </tr>
	                </tbody>
	            </table>
	             <button type="button" class="btn btn-info" onclick="window.location='../realTime/realTimeReg.jsp'">등록</button>   
	        </div>
	    </div>
	</div>
</div>
</div>
<%@ include file="../etc/footer.jsp"%>