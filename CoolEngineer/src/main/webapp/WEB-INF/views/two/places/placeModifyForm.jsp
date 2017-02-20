<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<script type="text/javascript" src="/moyeo/resources/customScript/two.js"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
      
<!-- START SCRIPTS -->
<!--         START PLUGINS -->
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap.min.js"></script>                
        
        <script type='text/javascript' src='/moyeo/resources/resource/js/plugins/icheck/icheck.min.js'></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/jquery-mousewheel-master/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
		
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-datepicker.js"></script>                
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/bootstrap/bootstrap-file-input.js"></script>
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/settings.js"></script>
        
        <script type="text/javascript" src="/moyeo/resources/resource/js/plugins.js"></script>        
        <script type="text/javascript" src="/moyeo/resources/resource/js/actions.js"></script>        
        <!-- END TEMPLATE -->
        
        <script type="text/javascript" src="/moyeo/resources/customScript/five.js"></script>
    <!-- END SCRIPTS -->   
    
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

	var lc1 = document.getElementById("loc_category1");
	var lc2 = document.getElementById("loc_category2");

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

<%@ include file="../../etc/header2.jsp"%>

         <!-- START BREADCRUMB -->
                <ul class="breadcrumb push-down-0">
                    <li><a href="/moyeo/main/home">Home</a></li>
                    <li><a href="/moyeo/two/placeMainLoc">추천장소 메인</a></li>
                    <li class="active">장소정보</li>
                </ul>
               <!-- END BREADCRUMB -->  

<!-- START ROW -->
<div class="row">

	<div class="col-md-56" style="margin-top:30px; margin-bottom:30px; margin-left:20%;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="panel-title-box">
					<h3>장소정보 수정 페이지</h3>
				</div>
			</div>

			<br> <br> <br> <br> <br> 
			<div style="width:80%;">
			
				<form:form action="placeModifyPro" name="placemodifyform" class="form-horizontal" style="margin-left:20%;" modelAttribute="uploadForm" enctype="multipart/form-data">
					<input type="hidden" name=place_num value="${pidto.place_num}">
					<fieldset>
						<legend>장소정보 수정</legend><br>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">장소명</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" name="place_name" maxlength="20"
									value="${pidto.place_name}" required>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">지역 선택</label>
							<div class="col-lg-10">
								<select name="loc_category1" id="loc_category1" class="form-control-1 select" style="width:49%;" onchange="select_loc_category()" required> 
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
					            <select name="loc_category2" id="loc_category2" class="form-control-1 select" style="width:49%; margin-left:2%;" required>
					            	<option value="">선택하세요</option>
					            </select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">상세 주소</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" name="place_address" maxlength="40">
							</div>
						</div>
					
						<div class="form-group">
							<label class="col-lg-2 control-label">장소설명</label>
							<div class="col-lg-10">
								<textarea class="form-control" rows="17" name="place_detail" maxlength="1000" 
									value="${pidto.place_detail}"></textarea>
								<span class="help-block"></span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-lg-2 control-label">링크</label>
							<div class="col-lg-10">
								<input type="url" class="form-control" name="place_link" maxlength="30"
									value="${pidto.place_link}">
							</div>
						</div>
						
						
						<div class="form-group">
	                           <label class="col-lg-2 control-label">첨부파일</label>  
	                           <div class="col-md-6 col-xs-12">
	                           	   <span class="help-block">사진을 선택하세요.</span>
	                           	   <div id="fileview">
	                               		<input class="btn btn-warning btn-rounded" id="file0" type="file" name="files[0]" style="float:left;" onchange="chkType('file0')"/>
	                           	   </div>
	                           </div>
	                       </div>
	                       
						<br>
						
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">입력</button>
								<button type="reset" class="btn btn-default">다시 입력</button>
								<input type="button" class="btn btn-info" value="목록" onclick="window.location='placeList'">
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>

</div>
<!-- END ROW -->

<%@ include file="../../etc/footer2.jsp"%>