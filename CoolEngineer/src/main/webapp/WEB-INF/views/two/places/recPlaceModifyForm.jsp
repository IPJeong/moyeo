<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	var ct13 = new Array("삼성라이언즈", "기아타이거즈", "부산자이언트", "두산베어스", "LG트윈즈", "SK와이번즈", "넥센히어로즈", "한화이글스", "NC다이노스", "KT위즈");
	var ct14 = new Array("다트", "보드게임", "두뇌심리게임", "온라인게임", "콘솔게임", "단체놀이", "타로카드", "마술", "바둑");
	var ct15 = new Array("한식", "양식", "중식", "일식", "베이킹/제과", "핸드드립", "소믈리에/와인", "주류제조/칵테일");
	var ct16 = new Array("강아지", "고양이", "물고기", "파충류", "설치류/중치류");
	var ct17 = new Array("결혼/웨딩", "육아/맘", "아빠/대디");
	var ct18 = new Array("스피치/발성", "시험/자격증", "취업스터디", "금융보험", "기타(etc)");
	
	var rc1 = document.recplacemodifyform.recpla_category1;
	var rc2 = document.recplacemodifyform.recpla_category2;

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
	float: left;
	margin: 1px 1px 1px;
	list-style: none;
	left: -3px;
}

</style>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="../main/main.jsp">Home</a></li>
                    <li><a href="../category/category_hobby.jsp">모임</a></li>
                    <li><a href="../moim/moim_main.jsp">영등포 볼링</a></li>
                    <li class="active">모임관리</li>
                </ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->
<div class="row">
		<!-- START LOGIN BLOCK -->

		<!-- START RECOMMENDATION MEET BLOCK -->
	
	<!-- END LOGIN BLOCK -->


	<!-- START SEARCH BLOCK -->

	<!-- END SEARCH BLOCK -->

	<!-- START NOTICE BLOCK -->

	<!-- END NOTICE BLOCK -->

	<!-- START PHOTO BLOCK -->
	<div class="col-md-56" style="margin-top:30px; margin-bottom:30px; margin-left:20%; height:800px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>장소정보 등록 페이지</h3>
				</div>
			</div>

			<br> <br> <br> <br> <br> 
			<div style="width:80%;">
			
				<form action="recPlaceModifyPro" name="recplacemodifyform" class="form-horizontal" style="margin-left:20%;">
					<input type="hidden" name="recpla_num" value="${rpdto.recpla_num}">
					<fieldset>
						<legend>추천장소 후기 등록</legend><br>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">제목</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" name="recpla_title" maxlength="40"
									placeholder="" value="${rpdto.recpla_title}" required>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">내용</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="17" name="recpla_content" maxlength="2000"></textarea>
								<span class="help-block"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">관심사</label>
							<div class="col-lg-10">
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
						            <select name="recpla_category2" class="form-control-1 select" style="width:49%; margin-left:1%;" required>
						            	<option value="">선택하세요</option>
						            </select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">태그</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" name="recpla_tag" maxlength="200"
									placeholder="" value="${rpdto.recpla_tag}">
							</div>
						</div>
						
						<br>
						
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">입력</button>
								<button type="reset" class="btn btn-default">다시 입력</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<!-- END PHOTO BLOCK -->





	<!-- END RECOMMENDATION MEET BLOCK -->


	<!-- START MOVIE BLOCK -->

	<!-- END MOVIE BLOCK -->

	<!-- START REALTIME MEET BLOCK -->

	<!-- END REALTIME MEET BLOCK -->

	<!-- START RECOMMENDATION LOCATION BLOCK -->

	<!-- END RECOMMENDATION LOCATION BLOCK -->

	<!-- START EVENT BLOCK -->

	<!-- END EVENT BLOCK -->

	<!-- START ADVERTISE BLOCK -->

	<!-- END ADVERTISE BLOCK -->

	<!-- START REVIEW BLOCK -->

	<!-- END REVIEW BLOCK -->
</div>
<!-- END ROW -->

<%@ include file="../../etc/footer.jsp"%>