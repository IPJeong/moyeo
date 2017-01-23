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
	
	
	
	//모임-모임등록
	public void moim_register(Model model);

}
