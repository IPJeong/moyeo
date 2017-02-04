var updateError = "수정에 실패하였습니다. \n 잠시후 다시 시도하세요";
var insertError ="입력에 실패했습니다. \n잠시후 다시 시도하세요!"
var meminputError = "회원가입에 실패했습니다. \n잠시후 다시 시도하세요!"
	
function errorAlert(msg) {
	alert(msg);
	window.history.back();
}

//아이디중복 확인
function duplication() {
	
	var memid = document.registMember.memid.value;
	
	jQuery.ajax({
		type:"POST",
		url:"/moyeo/three/duplication",
		async : true,
		dataType : "json",
		data:{
			memid : memid			
		},
		success : function(data) {
			var cnt = data.cnt;
			var memid = data.memid
			var resultConfirm;
			
			if(cnt == 1) {
				resultConfirm = '<span class="glyphicon glyphicon-remove" style="color:#D32F2F;padding-left:10px;"></span><font color="#D32F2F">&nbsp;&nbsp;중복</font>';
				$('#regiMember').attr("disabled", "disabled");
			} else if(cnt == 0) {
				resultConfirm = '<span class="fa fa-check" style="color:#689F38;padding-left:10px;">&nbsp;&nbsp;가능</span>';
				$('#regiMember').removeAttr("disabled");
			} 
			$('#duplication').html(resultConfirm);
		},
		error : function(xhr) {
			alert("중복확인을 실패하였습니다.");
			alert("error html = " + xhr.statusText);
		}
	})
			
}
//비밀번호 체크
function passChk() {
	var passwd = document.registMember.password.value;
	var rePasswd = document.registMember.re_password.value;
	var resultPwChk;
	
	if(rePasswd != passwd) {
		resultPwChk = '<font color="#D32F2F">비밀번호와 일치 하지 않습니다.</font>';
		$('#regiMember').attr("disabled", "disabled");
	} else if (rePasswd == passwd) {
		resultPwChk = '<span class="fa fa-check" style="color:#689F38;">&nbsp;&nbsp;일치</span>';
		$('#regiMember').removeAttr("disabled");
	}
	$('#passChk').html(resultPwChk);
}

//지역선택
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

	var lc1 = document.registMember.loc_category1;
	var lc2 = document.registMember.loc_category2;

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

//관심 지역
function select_loc_category2() {

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

	var lc1 = document.memInterest.loc_category1;
	var lc2 = document.memInterest.loc_category2;

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

//관심 카테고리
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
	
	var rc1 = document.memInterest.recpla_category1;
	var rc2 = document.memInterest.recpla_category2;

	if(rc1.value == "아웃도어_여행") {
		
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct1.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct1[i], ct1[i]); 
		}	
	} else if(rc1.value == "운동_스포츠") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct2.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct2[i], ct2[i]);
		} 
	
	} else if(rc1.value == "인문학_책_글") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct3.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct3[i], ct3[i]);
		} 
	
	} else if(rc1.value == "외국_언어") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct4.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct4[i], ct4[i]);
		} 
	
	} else if(rc1.value == "문화_공연") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct5.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct5[i], ct5[i]);
		} 
	
	} else if(rc1.value == "음악_악기") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct6.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct6[i], ct6[i]);
		} 
	
	} else if(rc1.value == "공예_만들기") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct7.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct7[i], ct7[i]);
		} 
	
	} else if(rc1.value == "댄스_무용") {
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
	
	} else if(rc1.value == "사교_인맥") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct10.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct10[i], ct10[i]);
		} 
	
	} else if(rc1.value == "차_오토바이") {
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
	
	} else if(rc1.value == "게임_오락") {
		for(var i=rc2.length-1; i>0; i--) {
			rc2.options[i]=null;	
		}
				
		for(var i=0; i<ct14.length; i++) {
			rc2.options[rc2.options.length] = new Option(ct14[i], ct14[i]);
		} 
	
	} else if(rc1.value == "요리_제조") {
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
	
	} else if(rc1.value == "가족_결혼") {
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

// date picker
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

