 package com.engineers.moyeo.main.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public interface MainService {

	
	// 메인페이지에 회원정보 연동
	public void getMemberInfo(Model model);
	
	// 메인페이지에 공지사항 글 연동
	public void main_notice(Model model);
	
	// 메인페이지에 모임후기 사진, 동영상, 모임후기 연동
	public void main_meeting_post(Model model);
	
	// 메인페이지에 모임후기 연동
	public void getMeetingPostList(Model model);
	
	// 메인페이지에 이벤트 리스트 연동
	public void getEventList(Model model);
	
	// 메인페이지 제품리스트 연동
	public void getProducts(Model model);
	
	// 로그인 처리
	public String memberLoginPro(Model model);

	// 단어 형태소 분석을 처리하는 메서드
	public void wordAnalyzer(String title, String content, String tag);
	
	// 단어 형태소 분석 후 DB 저장
	public void wordExtractAndAnalyze(String text);
	
	// 워드클라우드 재검색 요청
	public String wordcloudRefresh(Model model);
	
	// 메인페이지에 인기모임 불러오기
	public void hotMoim(Model model);
	
	// 메인페이지에 추천모임 불러오기
	public void recommendMoim(Model model);
	
	// 메인페이지에 추천장소 불러오기
	public void recPlace(Model model);
	
	// 메인갤러리 모임후기 사진 앨범
	public void getPostPictures(Model model);
	
	// 메인갤러리 모임후기 동영상 앨범
	public void getPostVideos(Model model);
	
	// 모임후기 상세정보 조회
	public void getPostDetails(HttpServletRequest req, ModelAndView mav);
	
	// 회원, 모임장, 판매자 알림 등록
	public void addNotice(Map<String, Object> map);
}
