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
	
	//모임일정-등록
	public void moimRegister(Model model);

	//모임일정-상세페이지
	public void moimScheduleContents(Model model);
	
	//모임일정-수정
	public void moimScheduleModify(Model model);
	
	//모임일정-수정처리
	public void moimScheduleModifyPro(Model model);
	
	//모임일정-삭제
	public void moimScheduleDelete(Model model);
}
