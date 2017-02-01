<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<script type="text/javascript" src="/moyeo/resources/customScript/two.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<%@ include file="../../etc/header.jsp"%>  

<script type="text/javascript">
function select_recpla_category() {
	var ct1 = new Array("등산", "산책/트래킹", "캠핑/백패킹", "국내여행", "해외여행", "낚시", "패러글라이딩");
	var ct2 = new Array("자전거", "배드민턴", "볼링", "테니스/스쿼시", "스키/보드", "골프", "클라이밍", "다이어트", "헬스/크로스핏", "요가/필라테스", "탁구", "당구/포켓볼", "러닝/마라톤", "수영/스쿠버다이빙", "서핑/웨이크보드/요트", "축구/풋살", "농구", "야구", "배구", "승마", "펜싱", "복싱", "태권도/유도", "검도", "무술/주짓수", "스케이트", "크루즈보드", "족구");
	var ct3 = new Array("책/독서", "인문학", "심리학", "철학", "역사", "시사/경제", "작문/글쓰기");
	var ct4 = new Array("영어", "일본어", "중국어", "프랑스어", "스페인어", "러시아어");
	var ct5 = new Array("뮤지컬/오페라", "공연/연극", "영화", "전시회", "연기/공연제작", "고궁/문화재탐방", "파티/페스티벌");
	var ct6 = new Array("노래/보컬", "기타/베이스", "우쿨렐레", "드럼", "피아노", "바이올린", "플룻", "오카리나", "밴드/합주", "작사/작곡", "인디음악", "랩/힙합/DJ", "클래식", "재즈", "락/메탈", "일렉트로닉", "국악/사물놀이", "찬양/CCM");
	var ct7 = new Array("미술/그림", "캘리그라피", "플라워아트", "캔들/디퓨저/석고", "천연비누/화장품", "소품공예", "가죽공예", "가구/목공예", "설탕/앙금공예", "도자/점토공예", "자수/뜨개질", "키덜트/프라모델", "메이크업/네일");
	var ct8 = new Array("라틴댄스", "사교댄스", "방송/힙합", "스트릿댄스", "발레", "재즈댄스", "한국무용", "밸리댄스", "현대무용", "스윙댄스");
	var ct9 = new Array("양로원", "보육원", "환경봉사", "사회봉사", "교육/재능나눔", "유기동물보호");
	var ct10 = new Array("지역", "나이", "성별", "싱글/연애", "기혼/유부", "돌싱", "와인/커피/차", "맛집/미식회");
	var ct11 = new Array("현대", "기아", "르노", "GM", "쌍용", "일본차", "미국차", "유럽차", "바이크");
	var ct12 = new Array("DSLR", "필름카메라", "영상제작", "디지털카메라");
	var ct13 = new Array("삼성라이언즈", "기아타이거즈", "롯데자이언츠", "두산베어스", "LG트윈즈", "SK와이번즈", "넥센히어로즈", "한화이글스", "NC다이노스", "KT위즈");
	var ct14 = new Array("다트", "보드게임", "두뇌심리게임", "온라인게임", "콘솔게임", "단체놀이", "타로카드", "마술", "바둑");
	var ct15 = new Array("한식", "양식", "중식", "일식", "베이킹/제과", "핸드드립", "소믈리에/와인", "주류제조/칵테일");
	var ct16 = new Array("강아지", "고양이", "물고기", "파충류", "설치류/중치류");
	var ct17 = new Array("결혼/웨딩", "육아/맘", "아빠/대디");
	var ct18 = new Array("스피치/발성", "시험/자격증", "취업스터디", "금융보험", "기타(etc)");
	
	var rc1 = document.recplaselectform.recpla_category1;
	var rc2 = document.recplaselectform.recpla_category2;

	if(rc1.value == "아웃도어/여행") {
		
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct1.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct1[i], ct1[i]); 
		}	
	} else if(rc1.value == "운동/스포츠") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct2.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct2[i], ct2[i]);
		} 
	
	} else if(rc1.value == "인문학/책/글") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct3.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct3[i], ct3[i]);
		} 
	
	} else if(rc1.value == "외국/언어") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct4.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct4[i], ct4[i]);
		} 
	
	} else if(rc1.value == "문화/공연") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct5.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct5[i], ct5[i]);
		} 
	
	} else if(rc1.value == "음악/악기") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct6.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct6[i], ct6[i]);
		} 
	
	} else if(rc1.value == "공예/만들기") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct7.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct7[i], ct7[i]);
		} 
	
	} else if(rc1.value == "댄스/무용") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct8.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct8[i], ct8[i]);
		} 
	
	} else if(rc1.value == "봉사활동") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct9.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct9[i], ct9[i]);
		} 
	
	} else if(rc1.value == "사교/인맥") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct10.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct10[i], ct10[i]);
		} 
	
	} else if(rc1.value == "차/오토바이") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct11.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct11[i], ct11[i]);
		} 
	
	} else if(rc1.value == "사진") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct12.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct12[i], ct12[i]);
		} 
	
	} else if(rc1.value == "야구관람") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct13.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct13[i], ct13[i]);
		} 
	
	} else if(rc1.value == "게임/오락") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct14.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct14[i], ct14[i]);
		} 
	
	} else if(rc1.value == "요리/제조") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct15.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct15[i], ct15[i]);
		} 
	
	} else if(rc1.value == "반려동물") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct16.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct16[i], ct16[i]);
		} 
	
	} else if(rc1.value == "가족/결혼") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct17.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct17[i], ct17[i]);
		} 
	
	} else if(rc1.value == "자유주제") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct18.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct18[i], ct18[i]);
		} 
	
	} else if(rc1.value == "") {
		for(var i=rc1.length-1; i>0; i--) {
			rc2.options[i]=null;
		}	
	}
	
}

</script>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li class="active">추천장소</li>
                </ul>
               <!-- END BREADCRUMB -->     

<br>

<div class="col-md-13-2">
	<div class="panel panel-default" style="margin-top:10px; width:60%; float:left;">
		<div class="panel-heading">
			<div class="panel-title-box">
				<h3>관심사 선택</h3>										
			</div>
		</div>
		<form name="recplaselectform" action="placeMainRecplaSearch">
			<div class="panel-body padding-0" style="margin-top:10px; margin-bottom:0.75%; margin-left:0.5%;">
				<select name="recpla_category1" class="form-control-1 select" style="width:49%;" onchange="select_recpla_category()" required> 
					<option value="">선택하세요</option>
	                <option value="아웃도어/여행">아웃도어/여행</option>
	                <option value="운동/스포츠">운동/스포츠</option>
	                <option value="인문학/책/글">인문학/책/글</option>
	                <option value="외국/언어">외국/언어</option>
	                <option value="문화/공연">문화/공연</option>
	                <option value="음악/악기">음악/악기</option>
	                <option value="공예/만들기">공예/만들기</option>
	                <option value="댄스/무용">댄스/무용</option>
	                <option value="봉사활동">봉사활동</option>
	                <option value="사교/인맥">사교/인맥</option>
	                <option value="차/오토바이">차/오토바이</option>
	                <option value="야구관람">야구관람</option>
	                <option value="게임/오락">게임/오락</option>
	                <option value="요리/제조">요리/제조</option>
	                <option value="반려동물">반려동물</option>
	                <option value="가족/결혼">가족/결혼</option>
	                <option value="자유주제">자유주제</option>
	            </select>
	            <select name="recpla_category2" class="form-control-1 select" style="width:49%; margin-left:0.35%;" required>
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
	<div class="panel panel-default" style="float:right; margin-top:20px; width:38%; height:900px;">
		<div class="panel-heading">
			<div class="panel-title-box">
				<h3>지금 뜨는 장소</h3>										
			</div>
		</div>
		
		<div class="panel panel-default">
			<c:if test="${lcnt > 0}">
				<div class="inner">
		            <div class="info" style="float:left; margin-top:20px; margin-left:5%; width:40%; height:300px;">
				        <c:forEach var="lppdtos" items="${lppdtos}">
					        <ul style="list-style:none; margin-top:20px;">
					        	<li>
					        		<a href="placeContentForm?place_num=${lppdtos.place_num}">
					        			<img src="${lppdtos.place_pic_path}/${lppdtos.place_pic_name}" alt="장소 사진" style="width:90%; height:145px;">
					        		</a>
					        	</li>
					        </ul>	
				        </c:forEach>
				   </div>
				   <div class="info" style="float:right; margin-top:20px; margin-right:5%; width:50%; height:300px;">  
				        <br>
				        <c:forEach var="lpidtos" items="${lpidtos}">
				        	<div style="width:80%; height:145px; margin-top:20px;"> 
					       		<ul style="list-style:none; margin-top:20px;">
							        <li>
							        	<strong>이름</strong> &nbsp; ${lpidtos.place_name}
							        </li> 
						         <br>
							        <li>
							            <strong>주소</strong> &nbsp; ${lpidtos.place_address}
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


<div class="col-md-13-3" style="margin-top:-40px; width:50%; height:770px; float:left; margin-left:8.5%;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title-box" style="font-size:14px">
				<strong style="text-align:left;">장소 검색 결과</strong>
				<a href="placeList" style="text-align:right; font-size:12px">+ 더 보기</a>								
			</div>
		</div>
		
		<div class="panel panel-default">
			<c:if test="${cnt > 0}">
				<div class="inner">
		            <div class="info" style="float:left; margin-top:10px; margin-left:13%; width:35%; height:250px;">
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
				   <div class="info" style="float:right; margin-top:20px; margin-right:20%; width:27%; height:250px;">  
				        <br>
				        <c:forEach var="pidtos" items="${pidtos}">
				        	<div style="width:80%; height:120px; margin-top:20px;"> 
					       		<ul style="list-style:none; margin-top:20px;">
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
								<li class=""><a href="placeMainRecpla?pageNum=${startPage - pageBlock}"><font
											size="3"> «</font></a></li>
							</c:if>
				
				
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${i == currentPage}">
									<li class=""><a href="#"><font size="3">${i}</font></a></li>
								</c:if>
				
								<c:if test="${i != currentPage}">
									<li class=""><a href="placeMainRecpla?pageNum=${i}"><font size="3">${i}</font></a></li>
								</c:if>
				
							</c:forEach>
							<c:if test="${pageCount > endPage}">
								<li><a href="placeMainRecpla?pageNum=${startPage + pageBlock}"><font
											size="3">»</font></a></li>
						</c:if>
					</c:if>
							
				</ul>
			</div>
</div> 
	
