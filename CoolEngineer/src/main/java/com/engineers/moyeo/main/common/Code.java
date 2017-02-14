package com.engineers.moyeo.main.common;

public interface Code {

	// 사진저장 메인경로
	public final static String rootPath = "c:\\dev\\moyeo_image\\";
	  
	// 모임후기 사진저장경로
	public final static String postImgPath = "post\\img\\";
	// 모임후기 동영상저장경로
	public final static String postVideoPath = "post\\video\\";

	// 이벤트 메인사진 저장경로
	public final static String eventImgPath = "event\\mainImg\\";
	// 이벤트 사진 저장경로
	public final static String eventImgsPath = "event\\img\\";
	
	// 모임신고사진 저장경로
	public final static String reportImgPath = "reportImg\\";
	
	// 회원의 프로필사진 저장경로
	public final static String profileImgPath = "profileImg\\";
	
	// 회원 프로필사진 기본경로
	public final static String profileDefPath = "/moyeo/resources/resource/img/custom";

	// 회원 프로필사진 이름(남성)
	public final static String profileDefNameM = "manDef.jpg";
	// 회원 프로필사진 이름(여성)
	public final static String profileDefNameW = "womanDef.jpg";
	
	// 장소사진의 저장경로
	public final static String placeImgPath = "placeImg\\";
	
	// 모임의 대표사진 저장경로
	public final static String groupImgPath = "groupImg\\";
	
	// 판매자 사업자등록증 사진 저장경로
	public final static String B_C_PATH = "bcImg\\";
	

	// 모임의 기본사진 위치(모임생성시 기본사진 입력용)
	public final static String groupDefSideImgPath = "/moyeo/resources/resource/assets/images/moimImg";
	
	// 모임의 기본소개사진 위치(모임생성시 기본소개사진 입력용)
	public final static String groupDefIntroImgPath = "/moyeo/resources/resource/assets/images/moimImg-";
	
	// 모임의 기본소개사진 이름(모임생성시 소개사진 입력용)
	public final static String groupDefSideImgName = "side.jpg";
	
	// 모임의 기본소개사진 이름(모임생성시 소개사진 입력용)
	public final static String groupDefIntroImgName = "main.jpg";
	
	
	// 모임후기 사진저장경로
	public final static String postImgPathS = "/postImgPath";
	// 모임후기 동영상저장경로
	public final static String postVideoPathS = "/postVideoPath";

	// 이벤트 메인사진 저장경로
	public final static String eventImgPathS = "/eventImgPath";
	// 이벤트 사진 저장경로
	public final static String eventImgsPathS = "/eventImgsPath";
	
	// 모임신고사진 저장경로
	public final static String reportImgPathS = "/reportImgPath";
	
	// 회원의 프로필사진 저장경로
	public final static String profileImgPathS = "/profileImgPath"; 
	
	// 장소사진의 저장경로
	public final static String placeImgPathS = "/placeImgPath";
	
	// 모임의 대표사진 저장경로
	public final static String groupImgPathS = "/groupImgPath";
	
	// 판매자 사업자등록증 사진 저장경로
	public final static String B_C_PATHS = "/bcImg";
	
	
	// 모임페이지 권한번호
	// 모임장 권한번호
	public final static int moimJang = 1;
	// 모임운영진 권한번호
	public final static int moimManager = 2;
	// 모임원 권한번호
	public final static int moimMember = 3;
	// 비모임원 권한번호
	public final static int moimNoMember = 4;
	
	
	// 알림 확인여부
	// 알림을 확인 한 경우
	public final static String NotiCheckod = "1"; 
	// 알림을 확인 하지 않은 경우
	public final static String NotiNonChecked = "0"; 
	
	// 모임가입 상태
	// 모임가입 신청 대기
	public final static String waiting = "대기";
	// 모임가입 신청 승인
	public final static String accepted = "승인";
	// 모임가입 신청 거절
	public final static String refused = "거절";
	
	
	// 관리자 권한
	// 관리자 권한 코드(최고관리자)
	public final static String authority_1 = "02";
	// 관리자 권한 코드(일반관리자)
	public final static String authority_2 = "08";
	
	
	// 판매자 신청 상태
	// 판매자 신청 대기
	public final static String seler_waiting = "91";
	// 판매자 신청 승인
	public final static String seler_accepted = "06";
	// 판매자 신청 거절
	public final static String seler_refused = "15";
	
	// 예외 발생 메시지
	// 숫자타입변환 예외 발생 메시지
	public final static String numForExceptionMsg = "========== NumberFormat Exception ==========";
	// 널값 예외 발생 메시지
	public final static String nullPoExceptionMsg = "========== NullPoint Exception ==========";
	
}
