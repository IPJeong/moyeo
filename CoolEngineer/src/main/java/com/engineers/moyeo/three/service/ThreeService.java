package com.engineers.moyeo.three.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public interface ThreeService {
	
	public String faq(Model model); //FAQ 진입
	public String faqInsertForm(Model model); //FAQ 입력폼
	public String faqCtgInput(Model model); //카테고리 생성 처리
	public String faqInsert(Model model); //FAQ입력 처리
	public String faqCtgModify(Model model);//카테고리 수정
	public String faqCtgModifyPro(Model model); //카테고리 수정 처리
	public String faqModifyForm(Model model); //FAQ 수정 폼
	public String faqModify(Model model); //FAQ 수정 처리
	public String faqCtgDelete(Model model); //카테고리 삭제
	public String faqDelete(Model model); //FAQ 삭제
	
	public String ing_event(Model model); //이벤트 진입
	public String eventInsert(Model model); //이벤트 입력
	public String eventParticipate(Model model); //이벤트 참여
	public String eventParticipants(Model model); //이벤트 참가자 명단
	public String winEvent(Model model); //이벤트 당첨자 선정
	public String chkWin(Model model);//당첨자 리스트
	
	//아이디중복 여부확인
	public void duplication(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException;
	public String registMember(Model model); //회원가입
	public String memInterest(Model model);//관심사 선택
	public String memInterestInput(Model model); //관심사 입력처리
	public String myPage(Model model); //마이페이지
	public String changeProImg(Model model); //프로필 사진 변경
	//현 비밀번호 체크
	public void curPwChk(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException;
	public String changePw(Model model); //비밀번호 변경
	public String changeMyInfo(Model model); //내 정보 변경
	//회원탈퇴시 비밀번호 체크
	public void deleteMem(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException;
	public String delMem(Model model); //회원탈퇴
	public String findPw(Model model); //비밀번호 찾기
	public String chgPw(Model model); //임시비밀번호 변경
}
