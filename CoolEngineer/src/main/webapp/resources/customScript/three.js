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

