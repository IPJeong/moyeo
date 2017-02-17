<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../etc/header2.jsp"%>


<script type="text/javascript">

function recPlaceModify() {
	var modifyChk = confirm("정말 수정하시겠습니까?");
	
	if(modifyChk == true) {
		var recpla_num = document.recplacecontentform2.recpla_num.value;
		var mem_id = document.recplacecontentform2.mem_id.value;
		
		window.location = "recPlaceModifyForm?recpla_num=" + recpla_num + "&mem_id=" + mem_id;
	}
}

function recPlaceDelete() {
	var deleteChk = confirm("정말 삭제하시겠습니까?");
	
	if(deleteChk == true) {
		var recpla_num = document.recplacecontentform2.recpla_num.value;
		var place_num = document.recplacecontentform2.place_num.value;
		window.location = "recPlaceDeletePro?recpla_num=" + recpla_num + "&place_num=" + place_num;
	}
	
}

function plusLikeNumber() {
	var recpla_num = document.recplacecontentform1.recpla_num.value;
	window.location = "plusPlaceLike?recpla_num=" + recpla_num;
}

function minusLikeNumber() {
	var recpla_num = document.recplacecontentform1.recpla_num.value;
	window.location = "minusPlaceLike?recpla_num=" + recpla_num;
}

</script>


<style>

@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features {
    width: 100%;
    background-color: #FBFBFB;
    padding: 0px 20px;
}
}

@media only screen and (max-width: 1010px){
.x-dashboard .page-container .page-content .page-content-wrap .x-hnavigation .x-features .x-features-nav-open {
    display: block;
}
}

@media (min-width: 1100px){
.col-md-56 {
    width: 60%;
    height: 950px;
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
	overflow: scroll;
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

</style>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="/moyeo/main/home">Home</a></li>
                    <li><a href="/moyeo/two/placeMainLoc">추천장소 메인</a></li>
                    <li class="active">장소정보</li>
                    <li class="active">추천장소 후기</li>
                </ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->
<div class="row">

	<div class="col-md-56" style="margin-top:25px; margin-bottom:25px; margin-left:20%; height:750px;">
		<div class="panel panel-default">
			<div class="panel-heading" style="padding-top: 10px;">
				<div class="panel-title-box">
					<h3>추천장소 후기 상세보기</h3>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div style="width: 870px; margin-left: 80px;">
					<br><br>
					<h3>&nbsp;추천장소 후기 상세보기</h3>
					<br>
				</div>
				<br>
				
				<table class="table table-striped table-hover" style="width:80%; float:left; margin-left:10%;">
                            <colgroup>
                                    <col style="width:10%;">
                                    <col style="width:15%;">
                                    <col style="width:12%;">
                                    <col style="width:45%;">
                                    <col style="width:10%;">
                                    <col style="width:8%;">
                            </colgroup>
                            <tbody>
                                <tr class="topb">
                                    <th scope="col">제목</th>
                                    <td colspan="5">${rpdto.recpla_title}</td>
                                </tr>
                                <tr>
                                    <th scope="col">작성자</th>
                                    <td><span class="lev8">${rpdto.mem_id}</span></td>
                                    <th scope="col">카테고리</th>
                                    <td>▶${rpdto.recpla_category1}&nbsp;&nbsp;&nbsp;&nbsp;▶${rpdto.recpla_category2}</td>
                                    <th scope="col">좋아요</th>
                                    <td class="orang">${likeNumber}</td>                                                           
                                </tr>
                                <tr>    
                                    <td colspan="6" style="height:350px;">
                                        ${rpdto.recpla_content}
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                	<td colspan="6">
                                		<form name="recplacecontentform1">
                                			<input type="hidden" name="recpla_num" value="${rpdto.recpla_num}">
		                                    	<c:if test="${checkMyPlaceLike == 0}">
		                                    		<input type="button" class="btn btn-default" value="추천" onclick="plusLikeNumber()">
		                                    	</c:if>
		                                    	<c:if test="${checkMyPlaceLike == 1}">
		                                    		<input type="button" class="btn btn-default" value="추천 취소" onclick="minusLikeNumber()">
		                                    	</c:if>
	                                   	</form>
	                               </td>
                                </tr>
                                <tr> 
                                	<th scope="col" style="height:20px;">태그</th>   
                                    <th colspan="5" style="height:20px;">${rpdto.recpla_tag}</th>
                                </tr>
                            </tbody>
                        </table>
                <div style="float:right; width:200px; margin-right:10%; margin-top:2%;">
				    <form name="recplacecontentform2">
	                	<input type="hidden" name="recpla_num" value="${rpdto.recpla_num}">
	                	<input type="hidden" name="place_num" value="${rpdto.place_num}">
	                	<input type="hidden" name="mem_id" value="${rpdto.mem_id}">
	                	
						<div style="float:left; margin-left:6%;">
						<c:if test="${sessionScope.authority == '02' || sessionScope.authority == '08'}">
							<input type="button" class="btn btn-info" value="수정" onclick="recPlaceModify()">
							<input type="button" class="btn btn-info" value="삭제" onclick="recPlaceDelete()">
						</c:if>	
							<input type="button" class="btn btn-info" value="목록" onclick="window.location='placeContentForm?place_num=${rpdto.place_num}'">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- END ROW -->

<%@ include file="../../etc/footer2.jsp"%>