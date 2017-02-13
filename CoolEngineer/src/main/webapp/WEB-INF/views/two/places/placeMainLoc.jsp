<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<script type="text/javascript" src="/moyeo/resources/customScript/two.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<%@ include file="../../etc/header2.jsp"%>  

<script type="text/javascript">
function select_loc_category() {

	var lo1 = new Array("강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구",  "중랑구");
	var lo2 = new Array("강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구");
	var lo3 = new Array("계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군");
	var lo4 = new Array("남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군");
	var lo5 = new Array("대덕구", "동구", "서구", "유성구", "중구");
	var lo6 = new Array("광산구", "남구", "동구", "북구", "서구");
	var lo7 = new Array("남구", "동구", "북구", "중구", "울주군");
	var lo8 = new Array("세종특별자치시");
	var lo9 = new Array("고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "여주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "연천군");
	var lo10 = new Array("강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군");
	var lo11 = new Array("제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군");
	var lo12 = new Array("계룡시", "공주시", "논산시", "당진시", "보령시", "서산시", "아산시", "천안시", "금산군", "부여군", "서천군", "예산군", "청양군", "태안군", "홍성군");
	var lo13 = new Array("경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군");
	var lo14 = new Array("거제시", "김해시", "밀양시", "사천시", "양산시", "진주시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군");
	var lo15 = new Array("군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군");
	var lo16 = new Array("광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군");
	var lo17 = new Array("제주시", "서귀포시");

	var lc1 = document.locationselectform.loc_category1;
	var lc2 = document.locationselectform.loc_category2;

	if(lc1.value == "서울특별시") {
		
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo1.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo1[i], lo1[i]); 
		}	
	} else if(lc1.value == "부산광역시") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo2.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo2[i], lo2[i]);
		} 
	
	} else if(lc1.value == "인천광역시") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo3.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo3[i], lo3[i]);
		} 
	
	} else if(lc1.value == "대구광역시") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo4.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo4[i], lo4[i]);
		} 
	
	} else if(lc1.value == "대전광역시") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo5.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo5[i], lo5[i]);
		} 
	
	} else if(lc1.value == "광주광역시") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo6.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo6[i], lo6[i]);
		} 
	
	} else if(lc1.value == "울산광역시") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo7.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo7[i], lo7[i]);
		} 
	
	} else if(lc1.value == "세종특별자치시") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo8.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo8[i], lo8[i]);
		} 
	
	} else if(lc1.value == "경기도") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo9.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo9[i], lo9[i]);
		} 
	
	} else if(lc1.value == "강원도") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo10.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo10[i], lo10[i]);
		} 
	
	} else if(lc1.value == "충청북도") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo11.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo11[i], lo11[i]);
		} 
	
	} else if(lc1.value == "충청남도") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo12.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo12[i], lo12[i]);
		} 
	
	} else if(lc1.value == "경상북도") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo13.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo13[i], lo13[i]);
		} 
	
	} else if(lc1.value == "경상남도") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo14.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo14[i], lo14[i]);
		} 
	
	} else if(lc1.value == "전라북도") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo15.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo15[i], lo15[i]);
		} 
	
	} else if(lc1.value == "전라남도") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo16.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo16[i], lo16[i]);
		} 
	
	} else if(lc1.value == "제주특별자치도") {
		for(var i=lc2.length-1; i>0; i--) {
			lc2.options[i]=null;	
		}
				
		for(var i=0; i<lo17.length; i++) {
			lc2.options[lc2.options.length] = new Option(lo17[i], lo17[i]);
		} 
		
	} else if(lc1.value == "") {
		for(var i=lc1.length-1; i>0; i--) {
			lc2.options[i]=null;
		}	
	}
	
}

</script>

<style>
div .page-content {
	height:1100px;
}

</style> 
         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="/moyeo/main/home">Home</a></li>
                    <li class="active">추천장소 메인 (지역별)</li>
                </ul>
               <!-- END BREADCRUMB -->     

<br>

<div class="col-md-13-2">
	<div class="panel panel-default" style="margin-top:10px; width:60%; float:left;">
		<div class="panel-heading">
			<div class="panel-title-box">
				<h3>지역 선택</h3>										
			</div>
		</div>
		<form name="locationselectform" action="placeMainLocSearch">
			<div class="panel-body padding-0" style="margin-top:10px; margin-bottom:0.75%; margin-left:0.5%;">
				<select name="loc_category1" class="form-control-1 select" style="width:49%;" onchange="select_loc_category()" required> 
					<option value="">선택하세요</option>
	                <option value="서울특별시">서울특별시</option>
	                <option value="부산광역시">부산광역시</option>
	                <option value="인천광역시">인천광역시</option>
	                <option value="대구광역시">대구광역시</option>
	                <option value="대전광역시">대전광역시</option>
	                <option value="광주광역시">광주광역시</option>
	                <option value="울산광역시">울산광역시</option>
	                <option value="세종특별자치시">세종특별자치시</option>
	                <option value="경기도">경기도</option>
	                <option value="강원도">강원도</option>
	                <option value="충청북도">충청북도</option>
	                <option value="충청남도">충청남도</option>
	                <option value="경상북도">경상북도</option>
	                <option value="경상남도">경상남도</option>
	                <option value="전라북도">전라북도</option>
	                <option value="전라남도">전라남도</option>
	                <option value="제주특별자치도">제주특별자치도</option>
	            </select>
	            <select name="loc_category2" class="form-control-1 select" style="width:49%; margin-left:0.35%;">
	            	<option value="">선택하세요</option>
	            </select>
			</div>
			<div class="col-md-6-2" style="margin-top:0.5%;">
	            	
	        </div>
			<div class="col-md-6-2" style="margin-top:0.5%;">	
				<div class="input-group push-down-10">
			        <span class="input-group-addon"><span class="fa fa-search"></span></span>
			        <input type="text" class="form-control" name="place_name" placeholder="검색할 장소를 입력하세요..."/>
			        <div class="input-group-btn">
			            <input type="submit" class="btn btn-primary" value="검색">
			        </div>
			    </div>    
		    </div>  	  
		</form>	
		 
	</div>
</div>

<div class="col-md-13-3">
	<div class="panel panel-default" style="float:right; margin-top:10px; width:38%; height:900px;">
		<div class="panel-heading">
			<div class="panel-title-box">
				<h3>지금 뜨는 장소</h3>										
			</div>
		</div>
		
		<div class="panel panel-default">
			<c:if test="${lcnt > 0}">
				<div class="inner">
		            <div class="info" style="float:left; margin-top:20px; margin-left:5%; width:40%; height:300px;">
				        <c:forEach var="lpodtos" items="${lpodtos}">
					        <ul style="list-style:none; margin-top:20px;">
					        	<a href="placeContentForm?place_num=${lpodtos.place_num}">
					        		<img src="${lpodtos.place_pic_path}/${lpodtos.place_pic_name}" alt="장소 사진" style="width:90%; height:145px;">
					        	</a>
					        </ul>	
				        </c:forEach>
				   </div>
				   <div class="info" style="float:right; margin-top:20px; margin-right:5%; width:50%; height:300px;">  
				        <br>
				        <c:forEach var="lpodtos" items="${lpodtos}">
				        	<div style="width:80%; height:145px; margin-top:20px;"> 
					       		<ul style="list-style:none; margin-top:20px;">
							        <li>
							        	<strong>이름</strong> &nbsp; ${lpodtos.place_name}
							        </li> 
						         <br>
							        <li>
							            <strong>주소</strong> &nbsp; ${lpodtos.place_address}
							        </li> 
							      <br>
							        <li>
							        	<strong>추천수</strong> &nbsp; <span style="color:red;">${lpodtos.place_like_count}
							        </li>   
								</ul>
							</div>
					    </c:forEach>
		            </div>         	 	
			       </div>
				</c:if>	
			</div>	
				
	</div>
</div>


<div class="col-md-13-3" style="margin-top:-50px; width:50%; height:770px; float:left; margin-left:8.5%;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title-box" style="font-size:14px">
				<strong style="text-align:left;">장소 검색 결과</strong>
				<a href="placeList" style="text-align:right; font-size:12px">+ 장소 전체보기</a>								
			</div>
		</div>
		
		<div class="panel panel-default">
			<c:if test="${cnt == 0}">
				<div style="width:80%; font-size:15px; text-align:left; margin-top:50px; margin-left:20px;">
					<h2>장소 검색결과가 존재하지 않습니다.</h2>
					<br>
					&nbsp;&nbsp;&nbsp;단어의 철자가 정확한지 확인해 보세요.<br>
					&nbsp;&nbsp;&nbsp;한글을 영어로 혹은 영어를 한글로 입력했는지 확인해 보세요.<br>
					&nbsp;&nbsp;&nbsp;검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해 보세요.<br>
					&nbsp;&nbsp;&nbsp;두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.<br>
					&nbsp;&nbsp;&nbsp;검색 옵션을 변경해서 다시 검색해 보세요.<br>
					<br><br>
					&nbsp;&nbsp;&nbsp;찾고자 하는 장소가 존재하지 않는다면 새로운 장소를 등록해보세요.
					&nbsp;→&nbsp;<a href="placeInputForm">장소 등록</a><br>
				</div>
			</c:if>
			
			<c:if test="${cnt > 0}">
				<div class="inner">
		            <div class="info" style="float:left; margin-top:10px; margin-left:7%; width:30%; height:250px;">
				        <c:forEach var="ppdtos" items="${ppdtos}">
					        <ul style="list-style:none; margin-top:20px;">
					        	<li>
					        		<a href="placeContentForm?place_num=${ppdtos.place_num}">
					        			<img src="${ppdtos.place_pic_path}/${ppdtos.place_pic_name}" alt="장소 사진" style="width:80%; height:120px;"> 
					        		</a>
					        	</li>
					        </ul>	
				        </c:forEach>
				   </div>
				   <div class="info" style="float:right; margin-top:10px; margin-right:18%; width:40%; height:250px;">  
				        <br>
				        <c:forEach var="pidtos" items="${pidtos}">
				        	<div style="width:80%; height:120px; margin-top:10px;"> 
					       		<ul style="list-style:none; margin-top:10px;">
							        <li>
							        	<strong>이름</strong> &nbsp; ${pidtos.place_name}
							        </li> 
						         <br>
							        <li>
							            <strong>주소</strong> &nbsp; ${pidtos.place_address}
							        </li>  
								</ul>
							</div>
					    </c:forEach>
		            </div>         	 	
		       </div>
			</c:if>	
		</div>	
	</div>
	
		<div style="float:right; margin-top:-45px; margin-right:50%;">	
			<ul class="pagination pagination-sm pull-right push-down-20 push-up-20" style="align: center;">
	
					<c:if test="${cnt > 0}">
				
							<c:if test="${startPage > pageBlock}">
								<li class=""><a href="placeMainLoc?pageNum=${startPage - pageBlock}"><font
											size="3"> «</font></a></li>
							</c:if>
				
				
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class=""><a href="#"><font size="3">${i}</font></a></li>
								</c:if>
				
								<c:if test="${i != currentPage}">
									<li class=""><a href="placeMainLoc?pageNum=${i}"><font size="3">${i}</font></a></li>
								</c:if>
				
							</c:forEach>
							<c:if test="${pageCount > endPage}">
								<li><a href="placeMainLoc?pageNum=${startPage + pageBlock}"><font
											size="3">»</font></a></li>
						</c:if>
					</c:if>
							
				</ul>
			</div>
</div> 
<%@ include file="../../etc/footer2.jsp"%>