<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../../etc/moim_header.jsp"%>

<style>
.btn-primary {
	background-color: rgb(239, 238, 238);;
	border-color: #4e7aa2;
	color: #3c44ab;
}
</style>

<script type="text/javascript">
	function select_loc_category() {

		var lo1 = new Array("강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구",
				"금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구",
				"성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구",
				"중랑구");
		var lo2 = new Array("강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구",
				"사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구");
		var lo3 = new Array("계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구",
				"강화군", "옹진군");
		var lo4 = new Array("남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군");
		var lo5 = new Array("대덕구", "동구", "서구", "유성구", "중구");
		var lo6 = new Array("광산구", "남구", "동구", "북구", "서구");
		var lo7 = new Array("남구", "동구", "북구", "중구", "울주군");
		var lo8 = new Array("세종특별자치시");
		var lo9 = new Array("고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시",
				"남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시",
				"안양시", "양주시", "여주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시",
				"평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "연천군");
		var lo10 = new Array("강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시",
				"고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군",
				"화천군", "횡성군");
		var lo11 = new Array("제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군",
				"옥천군", "음성군", "증평군", "진천군");
		var lo12 = new Array("계룡시", "공주시", "논산시", "당진시", "보령시", "서산시", "아산시",
				"천안시", "금산군", "부여군", "서천군", "예산군", "청양군", "태안군", "홍성군");
		var lo13 = new Array("경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시",
				"영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군",
				"예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군");
		var lo14 = new Array("거제시", "김해시", "밀양시", "사천시", "양산시", "진주시", "창원시",
				"통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군",
				"함양군", "합천군");
		var lo15 = new Array("군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군",
				"무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군");
		var lo16 = new Array("광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군",
				"곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군",
				"장성군", "장흥군", "진도군", "함평군", "해남군", "화순군");
		var lo17 = new Array("제주시", "서귀포시");

		var lc1 = document.locationselectform.loc_category1;
		var lc2 = document.locationselectform.loc_category2;

		if (lc1.value == "서울특별시") {

			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo1.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo1[i], lo1[i]);
			}
		} else if (lc1.value == "부산광역시") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo2.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo2[i], lo2[i]);
			}

		} else if (lc1.value == "인천광역시") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo3.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo3[i], lo3[i]);
			}

		} else if (lc1.value == "대구광역시") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo4.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo4[i], lo4[i]);
			}

		} else if (lc1.value == "대전광역시") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo5.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo5[i], lo5[i]);
			}

		} else if (lc1.value == "광주광역시") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo6.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo6[i], lo6[i]);
			}

		} else if (lc1.value == "울산광역시") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo7.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo7[i], lo7[i]);
			}

		} else if (lc1.value == "세종특별자치시") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo8.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo8[i], lo8[i]);
			}

		} else if (lc1.value == "경기도") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo9.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo9[i], lo9[i]);
			}

		} else if (lc1.value == "강원도") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo10.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo10[i], lo10[i]);
			}

		} else if (lc1.value == "충청북도") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo11.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo11[i], lo11[i]);
			}

		} else if (lc1.value == "충청남도") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo12.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo12[i], lo12[i]);
			}

		} else if (lc1.value == "경상북도") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo13.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo13[i], lo13[i]);
			}

		} else if (lc1.value == "경상남도") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo14.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo14[i], lo14[i]);
			}

		} else if (lc1.value == "전라북도") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo15.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo15[i], lo15[i]);
			}

		} else if (lc1.value == "전라남도") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo16.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo16[i], lo16[i]);
			}

		} else if (lc1.value == "제주특별자치도") {
			for (var i = lc2.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}

			for (var i = 0; i < lo17.length; i++) {
				lc2.options[lc2.options.length] = new Option(lo17[i], lo17[i]);
			}

		} else if (lc1.value == "") {
			for (var i = lc1.length - 1; i > 0; i--) {
				lc2.options[i] = null;
			}
		}
		return;
	}
</script>

<script type="text/javascript">
	function select_recpla_category() {
		var ct1 = new Array("등산", "산책/트래킹", "캠핑/백패킹", "국내여행", "해외여행", "낚시",
				"패러글라이딩");
		var ct2 = new Array("자전거", "배드민턴", "볼링", "테니스/스쿼시", "스키/보드", "골프",
				"클라이밍", "다이어트", "헬스/크로스핏", "요가/필라테스", "탁구", "당구/포켓볼", "러닝/마라톤",
				"수영/스쿠버다이빙", "서핑/웨이크보드/요트", "축구/풋살", "농구", "야구", "배구", "승마",
				"펜싱", "복싱", "태권도/유도", "검도", "무술/주짓수", "스케이트", "크루즈보드", "족구");
		var ct3 = new Array("책/독서", "인문학", "심리학", "철학", "역사", "시사/경제", "작문/글쓰기");
		var ct4 = new Array("영어", "일본어", "중국어", "프랑스어", "스페인어", "러시아어");
		var ct5 = new Array("뮤지컬/오페라", "공연/연극", "영화", "전시회", "연기/공연제작",
				"고궁/문화재탐방", "파티/페스티벌");
		var ct6 = new Array("노래/보컬", "기타/베이스", "우쿨렐레", "드럼", "피아노", "바이올린",
				"플룻", "오카리나", "밴드/합주", "작사/작곡", "인디음악", "랩/힙합/DJ", "클래식", "재즈",
				"락/메탈", "일렉트로닉", "국악/사물놀이", "찬양/CCM");
		var ct7 = new Array("미술/그림", "캘리그라피", "플라워아트", "캔들/디퓨저/석고", "천연비누/화장품",
				"소품공예", "가죽공예", "가구/목공예", "설탕/앙금공예", "도자/점토공예", "자수/뜨개질",
				"키덜트/프라모델", "메이크업/네일");
		var ct8 = new Array("라틴댄스", "사교댄스", "방송/힙합", "스트릿댄스", "발레", "재즈댄스",
				"한국무용", "밸리댄스", "현대무용", "스윙댄스");
		var ct9 = new Array("양로원", "보육원", "환경봉사", "사회봉사", "교육/재능나눔", "유기동물보호");
		var ct10 = new Array("지역", "나이", "성별", "싱글/연애", "기혼/유부", "돌싱",
				"와인/커피/차", "맛집/미식회");
		var ct11 = new Array("현대", "기아", "르노", "GM", "쌍용", "일본차", "미국차", "유럽차",
				"바이크");
		var ct12 = new Array("DSLR", "필름카메라", "영상제작", "디지털카메라");
		var ct13 = new Array("삼성라이언즈", "기아타이거즈", "부산자이언트", "두산베어스", "LG트윈즈",
				"SK와이번즈", "넥센히어로즈", "한화이글스", "NC다이노스", "KT위즈");
		var ct14 = new Array("다트", "보드게임", "두뇌심리게임", "온라인게임", "콘솔게임", "단체놀이",
				"타로카드", "마술", "바둑");
		var ct15 = new Array("한식", "양식", "중식", "일식", "베이킹/제과", "핸드드립",
				"소믈리에/와인", "주류제조/칵테일");
		var ct16 = new Array("강아지", "고양이", "물고기", "파충류", "설치류/중치류");
		var ct17 = new Array("결혼/웨딩", "육아/맘", "아빠/대디");
		var ct18 = new Array("스피치/발성", "시험/자격증", "취업스터디", "금융보험", "기타(etc)");

		var rc1 = document.locationselectform.recpla_category1;
		var rc2 = document.locationselectform.recpla_category2;

		if (rc1.value == "아웃도어/여행") {

			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct1.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct1[i], ct1[i]);
			}
		} else if (rc1.value == "운동/스포츠") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct2.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct2[i], ct2[i]);
			}

		} else if (rc1.value == "인문학/책/글") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct3.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct3[i], ct3[i]);
			}

		} else if (rc1.value == "외국/언어") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct4.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct4[i], ct4[i]);
			}

		} else if (rc1.value == "문화/공연") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct5.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct5[i], ct5[i]);
			}

		} else if (rc1.value == "음악/악기") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct6.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct6[i], ct6[i]);
			}

		} else if (rc1.value == "공예/만들기") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct7.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct7[i], ct7[i]);
			}

		} else if (rc1.value == "댄스/무용") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct8.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct8[i], ct8[i]);
			}

		} else if (rc1.value == "봉사활동") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct9.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct9[i], ct9[i]);
			}

		} else if (rc1.value == "사교/인맥") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct10.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct10[i], ct10[i]);
			}

		} else if (rc1.value == "차/오토바이") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct11.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct11[i], ct11[i]);
			}

		} else if (rc1.value == "사진") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct12.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct12[i], ct12[i]);
			}

		} else if (rc1.value == "야구관람") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct13.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct13[i], ct13[i]);
			}

		} else if (rc1.value == "게임/오락") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct14.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct14[i], ct14[i]);
			}

		} else if (rc1.value == "요리/제조") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct15.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct15[i], ct15[i]);
			}

		} else if (rc1.value == "반려동물") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct16.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct16[i], ct16[i]);
			}

		} else if (rc1.value == "가족/결혼") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct17.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct17[i], ct17[i]);
			}

		} else if (rc1.value == "자유주제") {
			for (var i = rc2.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}

			for (var i = 0; i < ct18.length; i++) {
				rc2.options[rc2.options.length] = new Option(ct18[i], ct18[i]);
			}

		} else if (rc1.value == "") {
			for (var i = rc1.length - 1; i > 0; i--) {
				rc2.options[i] = null;
			}
		}

	}
</script>

<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
	<li><a href="../main/main.jsp">Home</a></li>
	<li><a href="../category/category_hobby.jsp">모임</a></li>
	<li class="active">${dto.group_name}</li>
</ul>
<!-- END BREADCRUMB -->

<br>
<form name="locationselectform" action="moimInfoManagingPro">
	<div style="width: 80%; float: left;">
		
		<div class="col-md-13-2">
			<div class="panel panel-default"
				style="margin-top: 20px; width: 100%; float: left;">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>지역 선택</h3>
					</div>
				</div>
					<input type="hidden" name="group_num" value="${dto.group_num}">
				<div class="panel-body padding-0"
					style="margin-top: 0.5%; margin-bottom: 0.75%; margin-left: 0.5%;">
					<select name="loc_category1" class="form-control-1 select" 
						style="width: 49%;" onchange="select_loc_category()" required>
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
					<select name="loc_category2" class="form-control-1 select"
						style="width: 49%; margin-left: 0.35%;" required>
						<option value="">선택하세요</option>
					</select>
					
					
				</div>

			</div>
			<div class="panel panel-default"
				style="margin-top: 20px; width: 100%; float: left;">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>관심사 선택</h3>
					</div>
				</div>

				<div class="panel-body padding-0"
					style="margin-top: 0.5%; margin-bottom: 0.75%; margin-left: 0.5%;">
					<select name="recpla_category1" class="form-control-1 select" 
						style="width: 49%;" onchange="select_recpla_category()" required>
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
						<option value="사진">사진</option>
						<option value="야구관람">야구관람</option>
						<option value="게임/오락">게임/오락</option>
						<option value="요리/제조">요리/제조</option>
						<option value="반려동물">반려동물</option>
						<option value="가족/결혼">가족/결혼</option>
						<option value="자유주제">자유주제</option>
					</select> 
					<select name="recpla_category2" class="form-control-1 select"
						style="width: 49%; margin-left: 0.35%;" required>
						<option value="">선택하세요</option>
					</select>
				</div>

			</div>

			<div class="panel panel-default"
				style="margin-top: 20px; width: 100%; float: left;">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임 이름을 작성해주세요</h3>
					</div>
				</div>
				<div class="panel-body padding-0"
					style="height: 100%; margin-top: 0.5%; margin-bottom: 0.75%; margin-left: 0.5%;">
					<input type="text" value="${dto.group_num}" name="moim_title" style="width: 98%; height: 30px" required>
				</div>
			</div>
			<div class="panel panel-default"
				style="margin-top: 20px; width: 100%; height: 120px; float: left;">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>어떤 모임인지 설명해주세요</h3>
					</div>
				</div>
				<div class="panel-body padding-0"
					style="height: 100%; margin-top: 0.5%; margin-bottom: 0.75%; margin-left: 0.5%;">
					<textarea class="input" rows="10" cols="40" name="content"
						style="width: 98%; height: 80%;" required>${dto.group_intro}</textarea>
				</div>

			</div>

			<div class="panel panel-default"
				style="margin-top: 20px; width: 100%; float: left;">
				<div class="panel-heading">
					<div class="panel-title-box">
						<h3>모임 정원을 선택해주세요</h3>
					</div>
				</div>
				<div class="panel-body padding-0"
					style="height: 100%; margin-top: 0.5%; margin-bottom: 0.75%; margin-left: 0.5%;">
					<select name="max_person" class="form-control-1 select"
						style="width: 49%;" required>
						<option value="">선택하세요</option>
						<option value="5">5명 이하</option>
						<option value="10">10명 이하</option>
						<option value="20">20명 이하</option>
						<option value="30">30명 이하</option>
						<option value="40">40명 이하</option>
						<option value="50">50명 이하</option>
						<option value="100">100명 이하</option>
						<option value="150">150명 이하</option>
						<option value="200">200명 이하</option>
						<option value="250">250명 이하</option>
						<option value="300">300명 이하</option>
						<option value="350">350명 이하</option>
						<option value="400">400명 이하</option>
						<option value="450">450명 이하</option>
						<option value="500">500명 이하</option>
						<option value="600">600명 이하</option>
						<option value="700">700명 이하</option>
						<option value="800">800명 이하</option>
						<option value="900">900명 이하</option>
						<option value="1000">1000명 이상</option>
					</select>
					<script>document.locationselectform.max_person.value = '${dto.group_mem_cnt}'</script>
				</div>
			</div>

		</div>

	</div>
	<div style="width: 15%; float: left;">
		<div class="col-md-6" style="width: 100%; margin: 40px 0 20px -50px;">
			<input type="submit" class="btn btn-primary btn-block" value="수정완료">
		</div>
		<div class="col-md-6" style="width: 100%; margin: 0px 0 20px -50px;" onclick="window.history.back();">
			<input type="button" class="btn btn-primary btn-block" value="취소">
		</div>
	</div>
</form>






	<%@ include file="../../etc/footer.jsp"%>