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
	
	// 관리자 임명요청
	public String adminAppointPro(Model model);
	
	// 관리자 삭제
	public String adminDelete(Model model);
	
	// 관리자 삭제 요청
	public String adminDeletePro(Model model);
	
	// 관리자가 모든 모임 조회
	public String moimCheck(Model model);
	
	// 관리자 로그인 폼
	public String managerLoginForm(Model model);
	
	// 관리자 로그인 요청
	public String managerLoginPro(Model model);
	
	// 관리자 권한에서 모임상세보기
	public String groupInform(Model model);
	
	// 관리자 권한에서 모임에 있는 멤버리스트 보기
	public String groupMemberInform(Model model);
	
	// 관리자 권한에서 그룹 폐쇄시키기
	public String groupDelete(Model model);
	
	// 관리자 권한에서 아이디 검색하기
	public String guestListSearch(Model model);
	
	// 관리자 권한에서 모임 검색하기
	public String guestGroupSearch(Model model);
}
