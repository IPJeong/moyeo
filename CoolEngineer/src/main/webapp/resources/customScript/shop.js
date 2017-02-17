/*승우 제작*/
function select_shop_category() {

	var so1 = new Array("브랜드 여성의류", "브랜드 남성의류", "브랜드 여성신발", "브랜드 남성신발", "브랜드 시계", "브랜드 쥬얼리", "디자이너 여성의류", "디자이너 남성의류", "브랜드 언더웨어", "브랜드 여성가방", "브랜드 남성가방", "디자이너 잡화", "브랜드 잡화/소품", "브랜드 지갑/벨트", "브랜드 여행가방", "수입명품");
	var so2 = new Array("여성의류", "여성신발", "여성가방", "남성의류", "남성신발", "남성가방", "시계", "쥬얼리", "언더웨어/잠옷", "지갑/벨트", "여행가방", "패션잡화", "신생아의류", "아동의류", "유아의류", "유아동신발", "유아동잡화");
	var so3 = new Array("스킨케어", "메이크업", "선케어", "남성화장품", "클렌징/필링", "향수", "헤어케어", "바디케어", "네일케어", "뷰티소품");
	var so4 = new Array("스포츠", "의류", "등산/아웃도어", "스키/보드", "자동차용품", "스포츠잡화", "자전거", "골프", "스포츠신발", "캠핑", "낚시", "자동차기기");
	var so5 = new Array("농산", "수산", "축산", "반찬", "가정식", "가공식품", "음료", "과자/간식", "즉석식품", "건강식품", "다이어트식품");
	var so6 = new Array("기저귀", "출산/돌기념품", "유아목욕", "장난감", "분유", "이유용품", "유아위생용품", "아동의류", "수유용품", "실내용품", "유아동신발", "이유식/영양제", "외출용품", "유아의류", "유아동잡화", "유아가구/침구", "임부복/소품");
	var so7 = new Array("주방용품", "수납정리용품", "욕실용품", "청소용품", "세탁용품", "방향제", "살충제", "화장지", "생리대", "세안", "면도", "생활잡화", "안마용품", "온열용품");
	var so8 = new Array("침실가구", "거실가구", "서재/사무용가구", "유아동가구", "리모델링가구", "수납가구", "주방가구", "커튼/블라인드", "침구", "인테이어소품", "카페트/러그", "조명");
	var so9 = new Array("TV", "노트북", "스마트기기", "냉장고", "카메라", "모니터", "휴대폰", "세탁기", "영상가전", "데스크탑", "태블릿", "주방가전", "음향가전", "프린터/복합기", "게임", "PC부품", "컴퓨터 주변기기");
	var so10 = new Array("문구용품", "사무용품", "화방용품", "도서", "음반", "e쿠폰", "상품권", "여행", "숙박", "항공");
	var so11 = new Array("꽃배달", "꽃/원예", "악기", "취미", "애견용품", "고양이용품", "조류용품", "관상어/수족관", "기타", "동물용품");
	var so12 = new Array("의류/언더웨어", "여성패션잡화", "남성패션잡화", "뷰티/헬스", "스포츠", "레저", "유아동", "HOME&LIFE");
	
	var sc1 = document.getElementById("shop_category1");
	var sc2 = document.getElementById("shop_category2");

	if(sc1.value == "브랜드패션") {
		
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so1.length; i++) {
			sc2.options[sc2.options.length] = new Option(so1[i], so1[i]); 
		}	
	} else if(sc1.value == "의류/잡화") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so2.length; i++) {
			sc2.options[sc2.options.length] = new Option(so2[i], so2[i]);
		} 
	
	} else if(sc1.value == "뷰티") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so3.length; i++) {
			sc2.options[sc2.options.length] = new Option(so3[i], so3[i]);
		} 
	
	} else if(sc1.value == "레저/자동차") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so4.length; i++) {
			sc2.options[sc2.options.length] = new Option(so4[i], so4[i]);
		} 
	
	} else if(sc1.value == "식품") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so5.length; i++) {
			sc2.options[sc2.options.length] = new Option(so5[i], so5[i]);
		} 
	
	} else if(sc1.value == "출산/육아") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so6.length; i++) {
			sc2.options[sc2.options.length] = new Option(so6[i], so6[i]);
		} 
	
	} else if(sc1.value == "생활/건강") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so7.length; i++) {
			sc2.options[sc2.options.length] = new Option(so7[i], so7[i]);
		} 
	
	} else if(sc1.value == "가구/인테리어") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so8.length; i++) {
			sc2.options[sc2.options.length] = new Option(so8[i], so8[i]);
		} 
	
	} else if(sc1.value == "디지털/가전/컴퓨터") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so9.length; i++) {
			sc2.options[sc2.options.length] = new Option(so9[i], so9[i]);
		} 
	
	} else if(sc1.value == "도서/여행/e쿠폰") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so10.length; i++) {
			sc2.options[sc2.options.length] = new Option(so10[i], so10[i]);
		} 
	
	} else if(sc1.value == "취미/반려동물") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so11.length; i++) {
			sc2.options[sc2.options.length] = new Option(so11[i], so11[i]);
		} 
	
	} else if(sc1.value == "해외직구") {
		for(var i=sc2.length-1; i>0; i--) {
			sc2.options[i]=null;	
		}
				
		for(var i=0; i<so12.length; i++) {
			sc2.options[sc2.options.length] = new Option(so12[i], so12[i]);
		} 
	
	} else if(sc1.value == "") {
		for(var i=sc1.length-1; i>0; i--) {
			sc2.options[i]=null;
		}	
	}
	
}

/*셀렉트 박스 부분
<select name="shop_category1" id="shop_category1" class="form-control-1 select" style="width:49%;" onchange="select_shop_category()" required> 
		<option value="">선택하세요</option>
        <option value="브랜드패션">브랜드패션</option>
        <option value="의류/잡화">의류/잡화</option>
        <option value="뷰티">뷰티</option>
        <option value="레저/자동차">레저/자동차</option>
        <option value="식품">식품</option>
        <option value="출산/육아">출산/육아</option>
        <option value="생활/건강">생활/건강</option>
        <option value="가구/인테리어">가구/인테리어</option>
        <option value="디지털/가전/컴퓨터">디지털/가전/컴퓨터</option>
        <option value="도서/여행/e쿠폰">도서/여행/e쿠폰</option>
        <option value="취미/반려동물">취미/반려동물</option>
        <option value="해외직구">해외직구</option>
	</select>
	<select name="shop_category2" id="shop_category2" class="form-control-1 select" style="width:49%; margin-left:0.35%;">
		<option value="">선택하세요</option>
	</select>
*/