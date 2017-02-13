<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../../etc/header.jsp"%>
<!-- <script type="text/javascript">
	function daetgul() {
		
			alert("댓글을 삭제해주세요.")
			return false;
		
	}
</script> -->
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
    height: 870px;
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
float:left;
margin: 1px 1px 1px;
list-style: none;
left: -3px;
}

</style>

 

<!-- START ROW -->
<div class="row">
	<div class="col-md-50" style="margin-top:10px; margin-left:10%;">
	
		<!-- 모임페이지 사이드바 시작 -->
		
		<!-- 모임페이지 사이드바 종료 -->

		<!-- START PHOTO BLOCK -->
		
		
	
		<div class="col-md-56" style="margin-top:10px; width:400%">
			<div class="panel panel-default">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모여 Shop에 오신 것을 환영합니다. ^^</h3>
					</div>
				</div>
				
				
				<div class="panel-body padding-0" style="font-size: 25px" >
					<div class="chart-holder" id="dashboard-bar-1"
						style="height: 10px;">
				
		<!-- 메인 내용 시작 -->
				<br>
				<div class="content-frame-body content-frame-body-left" style="height: 819px;">
 					<div style="margin:auto;"> 
 					<form action="productInsertPro" method="post">
							<table style="text-align:center;">
							<tr>
								<th colspan="2">제품 등록</th>
							</tr>
						
							<tr>
									<th>
									<input type="button" name="likename" class="btn btn-info" value="제품 이름">
									</th>
									
									<td>
									<input type="text" name="product_name">
									</td>
							</tr>
							
							<tr>
									<th>
									<input type="button" name="likename" class="btn btn-info" value="제품 가격">
									</th>
									
									<td>
									<input type="number" name="product_price">
									</td>
							</tr>
							
							<tr>			
									<th>
									<input type="button" name="likename" class="btn btn-info" value="제품  수량">
									</th>
									
									<td>
									<input type="number" name="product_qty">
									</td>
							</tr>
							
							<tr>
									<th>
									<input type="button" name="likename" class="btn btn-info" value="제품  설명">
									</th>
									
									<td>
									<input type="text" name="product_detail">
									</td>
							
							</tr>
							
							</table>	
							
								<input type="submit" value="제품 등록" class="btn btn-primary">
							</form>
							</div>
 
                </div>
		<!--메인내용 종료  -->
					</div>
				</div>			
			</div>	 
		</div>
	</div>
</div>



<%@ include file="../../etc/footer.jsp"%>