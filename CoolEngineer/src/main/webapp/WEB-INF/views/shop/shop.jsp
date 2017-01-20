<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/header.jsp"%>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li class="active">샵</li>
                </ul>
               <!-- END BREADCRUMB -->   


<div class="row">
	<div class="col-md-12">
	    <div class="panel panel-default">
	
	        <div class="panel-heading">
	            <h3 class="panel-title">SHOP</h3>
	        </div>
	
	        <div class="panel-body panel-body-table">
	
	            <div class="table-responsive">
	                <table class="table table-bordered table-striped table-actions">
	                    <thead>
	                        <tr>
	                            <th width="50">등록번호</th>
	                            <th width="200">이미지</th>
	                            <th>제목</th>
	                            <th width="100">상태</th>
	                            <th width="100">가격</th>
	                            <th width="100">등록일</th>
	                            
	                        </tr>
	                    </thead>
	                    <tbody>                                            
	                        <tr id="trow_1">
	                            <td class="text-center">1</td>
	                            <td>
	                            	<img src="../../../resources/resource/assets/images/users/1.png"
										width="180px">
	                            </td>
	                            <td><strong><a href="../shop/shopInfo.jsp">완전 공짜!! 운수 대통 특가!</a></strong></td>
	                            <td><span class="label label-success">New</span></td>
	                            <td>$430.20</td>
	                            <td>24/09/2015</td>	                            
	                        </tr>
	                        <tr id="trow_2">
	                            <td class="text-center">2</td>
	                            <td>
	                            	<img src="../../../resources/resource/assets/images/users/2.png"
										width="180px">
	                            </td>
	                            <td><strong>덱 헤슘 CBL-108 PRO 기계식 키보드 특가!</strong></td>
	                            <td><span class="label label-info">판매중</span></td>
	                            <td>$1,351.00</td>
	                            <td>23/09/2015</td>
	                            
	                        </tr>
	                        <tr id="trow_3">
	                            <td class="text-center">3</td>
	                            <td>
	                            	<img src="../../../resources/resource/assets/images/users/3.png"
										width="180px">
	                            </td>
	                            <td><strong>DXRACER FA114 특가!</strong></td>
	                            <td><span class="label label-warning">품절</span></td>	                            
	                            <td>$2,621.00</td>
	                            <td>22/09/2015</td>	                            
	                        </tr>
	                        <tr id="trow_4">
	                            <td class="text-center">4</td>
	                            <td>
	                            	<img src="../../../resources/resource/assets/images/users/4.png"
										width="180px">
	                            </td>
	                            <td><strong>모두 모여라! 앱코 케이스 특가!</strong></td>
	                            <td><span class="label label-warning">품절</span></td>
	                            <td>$2,621.00</td>
	                            <td>22/09/2015</td>	                            
	                        </tr>
	                        <tr id="trow_5">
	                            <td class="text-center">5</td>
	                            <td>
	                            	<img src="../../../resources/resource/assets/images/users/5.png"
										width="180px">
	                            </td>
	                            <td><strong><a href="../shop/shopInfo.jsp">마이크로닉스 정유년 맞이 2017원 특가 2탄!</a></strong></td>
	                            <td><span class="label label-warning">품절</span></td>
	                            <td>$2,621.00</td>
	                            <td>22/09/2015</td>	                            
	                        </tr>
	                        </tbody>
	                    </table>
	                </div>                                
	
	            </div>
        </div>                                                

    </div>
</div>
<%@ include file="../etc/footer.jsp"%>