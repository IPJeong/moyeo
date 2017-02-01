package com.engineers.moyeo.three.service;

import org.springframework.ui.Model;

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
}
