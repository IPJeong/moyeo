package com.engineers.moyeo.six.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public interface SixService {
	//공지-메인
	public void notice(Model model);

	//공지-상세글정보
	public void noticeContent(Model model);

	//공지-글쓰기
	public void noticeWrite(Model model);

	//공지-글쓰기 처리
	public void noticeWritePro(Model model);

	//공지-글수정
	public void noticeModify(Model model);

	//공지-글수정 처리
	public void noticeModifyPro(Model model);

	//공지-글삭제
	public void noticeDelete(Model model);
	
	
	
	//모임일정-조회
	public void moimScheduleDetail(Model model);
	
	//모임일정-등록창
	public void moimRegister(Model model);
	
	//모임일정-등록처리
	public void moimRegisterPro(Model model);

	//모임일정-상세페이지
	public void moimScheduleContents(Model model);
	
	//모임일정-수정
	public void moimScheduleModify(Model model);
	
	//모임일정-수정처리
	public void moimScheduleModifyPro(Model model);
	
	//모임일정-삭제
	public void moimScheduleDelete(Model model);
	
	//모임일정-참석신청
	public void moimScheduleJoin(Model model);
	
	//모임일정-참석취소
	public void moimScheduleCancel(Model model); 
	
	//모임일정-참석멤버리스트
	public void moimScheduleMember(Model model);
	
	
	
	//고객지원-메인
	public void cusSupMain(Model model);
	
	

	//모임-개설
	public void moimOpenPro(Model model);
	
	//모임카테고리-관심사별
	public void categoryHobby(Model model);
	
	//모임카테고리-지역별
	public void categoryLocation(Model model);
	
	//모임카테고리-규모별
	public void categoryScale(Model model);
	
	
	
	//모임-메인
	public void moimMain(Model model);
	
	//모임-정보수정
	public void moimModify(Model model);
	
	//모임-정보수정처리
	public void moimModifyPro(Model model);
	
	//모임-모임폐쇄
	public void moimDelete(Model model);
	
	//모임-대표사진 등록
	public void moimAddImagePro(Model model);
	
	//모임-소개사진등록
	public void moimAddImageProb(Model model);
	
	//모임채팅참석폼
	public void moimChatForm(Model model);
	
	//모임채팅
	public void moimChat(Model model);
	
	//채팅내용입력
	public void addChat(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException;

	//채팅내용출력
	public void getChat(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException; 
	
	//모임멤버 상세보기
	public void moimMemberDetail(Model model);
	
	//관심모임 등록
	public void favorite(ModelAndView mav, HttpServletRequest req);

	//모임목록 상세보기
	public void categoryDetail(Model model);
	
	//샵-판매자등록처리
	public void sellerRegisterPro(Model model);
	
	//샵-제품 상세보기
	public void productDetail(Model model);
	
	//샵-제품 주문화면
	public void buy(Model model);
	
	//샵-결제처리
	public void order(Model model);
	
	//샵-상품평 입력창, 상품문의 입력창
	public void productReview(Model model);
	
	//샵-상품평 입력결과 처리
	public void productReviewPro(Model model);
	
	//샵-상품문의 입력결과 처리
	public void inquirePro(Model model);
}
