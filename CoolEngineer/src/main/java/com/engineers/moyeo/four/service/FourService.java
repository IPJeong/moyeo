package com.engineers.moyeo.four.service;

import org.springframework.ui.Model;

public interface FourService {
	
	//공지사항 게시판
	public String execute(Model model);
	//공지사항 글쓰는 폼
	public String writeExecute(Model model);
	//공지사항 글쓰기 처리 메소드
	public String writeproExecute(Model model);
	//공지사항 글 내용 보는 메소드
	public String moimContentExecute(Model model);		
	//공지사항 글 삭제하는 메소드
	public String moimDeleteExecute(Model model);
	//공지사항 글 삭제 처리하는 메소드
	public String moimDeleteproExecute(Model model);
	//공지사항 글 쓰는 폼 메소드
	public String moimModifyFormExecute(Model model);
	//공지사항 글 수정할 내용 보여주는 메소드
	public String moimModifyViewExecute(Model model);
	//공지사항 글 수정 처리하는 메소드
	public String moimModifyProExecute(Model model);
	
	
	//가입인사 게시판
	public String greetinglistExecute(Model model);
	//가입인사 글 쓰는 폼
	public String greetintwriteExecute(Model model);
	//가입인사 글쓰기 처리 메소드
	public String greetintwriteProExecute(Model model);
	//가입인사 글내용 보여주는 메소드
	public String greetingContentExecute(Model model);
	//가입인사 글 삭제하는 폼
	public String greetingDeleteExecute(Model model);
	//가입인사 글 삭제 처리하는 메소드
	public String greetingDeleteProExecute(Model model);
	//가입인사 글 수정하는 메소드
	public String greetingModifyViewExecute(Model model);
	//가입인사 글 수정 처리하는 메소드
	public String greetingModifyProExecute(Model model);
	
	//댓글 등록
	public String greeting_repleExecute(Model model);
	//댓글 삭제
	public String repledeleteExecute(Model model);
	

	//좋아요 등록
	public String likeyoPlusExecute(Model model);
	//좋아요 등록 새롭게
	public String likeInsertExecute(Model model);
	//샵 페이지
	public String moyeoShopExecute(Model model);
	//제품 등록
	public String productInsertFormExecute(Model model);
	//제품 등록 처리
	public String productInsertproExecute(Model model);
	
	
}
