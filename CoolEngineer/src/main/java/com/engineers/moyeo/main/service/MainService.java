 package com.engineers.moyeo.main.service;

import org.springframework.ui.Model;

public interface MainService {

	// 메인페이지가 로딩될 때 각종 정보를 읽어오는 메서드
	public void main();
	
	//메인페이지에 공지사항 글 연동
	public void main_notice(Model model);
	
	// 로그인 처리
	public String memberLoginPro(Model model);
	
}
