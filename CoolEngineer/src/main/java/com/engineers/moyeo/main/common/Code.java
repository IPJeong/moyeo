package com.engineers.moyeo.main.common;

public interface Code {

	// 사진저장 메인경로
	public final static String rootPath = "c:\\dev\\moyeo_image\\";
	
	// 모임후기 사진저장경로
	public final static String postImgPath = rootPath + "post\\img\\";
	// 모임후기 동영상저장경로
	public final static String postVideoPath = rootPath + "post\\video\\";

	// 이벤트 메인사진 저장경로
	public final static String eventImgPath = rootPath + "event\\mainImg\\";
	// 이벤트 사진 저장경로
	public final static String eventImgsPath = rootPath + "event\\img\\";
	
	// 모임신고사진 저장경로
	public final static String reportImgPaht = rootPath + "reportImg\\";
	
	// 회원의 프로필사진 저장경로
	public final static String profileImgPath = rootPath + "profileImg\\"; 
	
	// 장소사진의 저장경로
	public final static String placeImgPath = rootPath + "placeImg\\";
	
}
