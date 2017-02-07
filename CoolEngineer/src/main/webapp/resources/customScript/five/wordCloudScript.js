function dateCheck() {
	var strDate = document.wordSearchForm.strDate.value;
	var endDate = document.wordSearchForm.endDate.value;
	if(endDate < strDate){
		alert('종료 날짜는 시작날짜보다 클수 없습니다.');
		document.wordSearchForm.endDate.value = strDate;
	}
}

function validChk() {
	var strDate = document.wordSearchForm.strDate.value;
	alert(strDate);
	var endDate = document.wordSearchForm.endDate.value;
	var count = 0;

	for (i=0; i<document.wordSearchForm.wordOps.length; i++ ) {
		if (document.wordSearchForm.wordOps[i].checked==true) {
			count++;
		}
	} 
	
	if(strDate != '' && endDate == '') {
		alert('마지막 날짜를 선택해 주세요.');
		return false;
	}
	
	if(strDate == '' && endDate == '' && count == 0) {
		alert('검색조건을 선택해주세요.');
		return false;
	}
	
}
