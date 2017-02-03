package com.engineers.moyeo.one.service;

import org.springframework.ui.Model;

public interface OneService {
	
	// qna 메인화면
	public String qna(Model model);
	
	// qna 질문 폼
	public String qnaWrite(Model model);
	
	// qna 질문 확정요청
	public String qnaWritePro(Model model);
	
	// qna 질문 세부사항
	public String qnaContentForm(Model model);
	
	// qna 질문 수정폼
	public String qnaModifyForm(Model model);
	
	// qna 질문수정 확정요청
	public String qnaModifyPro(Model model);
	
	// qna 질문삭제 확정요청
	public String qnaDeletePro(Model model);
	
	// qna 관리자 답변삭제 확정요청
	public String qnaAnsDelPro(Model model);

	// qna 관리자 답변폼
	public String qnaAnswerForm(Model model);
	
	// qna 관리자 답변확정 폼
	public String qnaAnswerPro(Model model);
}
