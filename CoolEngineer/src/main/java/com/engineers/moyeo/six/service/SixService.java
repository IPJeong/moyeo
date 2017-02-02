package com.engineers.moyeo.six.service;

import org.springframework.ui.Model;

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
	
	
	
	
	
	//모인일정-메인
	public void moimSchedule(Model model);
	
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
	
	//모임-메인 공지사항
	public void getNoticeBoardList(Model model);
	
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
	
	//모임채팅
	public void moimChat(Model model);
}
