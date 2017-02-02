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
	public final static String profileDefPath = "/moyeo/resources/resource/img/custom/";

	// 회원 프로필사진 이름(남성)
	public final static String profileDefNameM = "manDef.jpg";
	// 회원 프로필사진 이름(여성)
	public final static String profileDefNameW = "womanFef.jpg";
	
	// 장소사진의 저장경로
	public final static String placeImgPath = "placeImg\\";
	
	// 모임의 대표사진 저장경로
	public final static String groupImgPath = "groupImg\\";
	
	
	
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
	
	// 모임페이지 권한번호
	// 모임장 권한번호
	public final static int moimJang = 1;
	// 모임운영진 권한번호
	public final static int moimManager = 2;
	// 모임원 권한번호
	public final static int moimMember = 3;
	// 비모임원 권한번호
	public final static int noMember = 4;
	
	// 모임가입 신청 대기 상태
	public final static String waiting = "대기";
	// 모임가입 신청 승인
	public final static String accepted = "승인";
	// 모임가입 신청 거절
	public final static String refused = "거절";
	
	// 관리자 권한 코드(최고관리자)
	public final static String authority_1 = "MASTER";
	// 관리자 권한 코드(일반관리자)
	public final static String authority_2 = "MANAGER";
	
	// 숫자타입변환 예외 발생 메시지
	public final static String numForExceptionMsg = "========== NumberFormat Exception ==========";
	// 널값 예외 발생 메시지
	public final static String nullPoExceptionMsg = "========== NullPoint Exception ==========";
}
