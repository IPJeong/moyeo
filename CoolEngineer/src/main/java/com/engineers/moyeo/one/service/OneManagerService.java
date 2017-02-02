package com.engineers.moyeo.one.service;

import org.springframework.ui.Model;

public interface OneManagerService {

	// 관리자화면 메인
	public String managerMain(Model model);
	
	// 회원리스트 불러오기
	public String guestList(Model model);
	
	// 회원리스트 상세정보 불러오기
	public String guestInform(Model model);
	
	// 회원리스트 삭제하기
	public String guestDelete(Model model);
	
	// 관리자 임명하기
	public String adminAppoint(Model model);
}