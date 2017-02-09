 package com.engineers.moyeo.main.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MainService {

	//메인페이지에 공지사항 글 연동
	public void main_notice(Model model);
	
	// 로그인 처리
	public String memberLoginPro(Model model);

	// 단어 형태소 분석을 처리하는 메서드
	public void wordAnalyzer(String title, String content, String tag);
	
	// 단어 형태소 분석 후 DB 저장
	public void wordExtractAndAnalyze(String text);
	
	// 워드클라우드 재검색 요청
	public String wordcloudRefresh(Model model);
	
	//메인페이지에 인기모임 불러오기
	public void hotMoim(Model model);
}
