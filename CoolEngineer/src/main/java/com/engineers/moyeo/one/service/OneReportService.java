package com.engineers.moyeo.one.service;

import org.springframework.ui.Model;

public interface OneReportService {
	
	
	// 모임신고 폼
	public String moimReport(Model model);
	
	// 모임신고 성공요청
	public String moimReportPro(Model model);
	
	// 모임신고 확인(관리자)
	public String moimReportHandleMain(Model model);
	
	// 모임신고 세부내용확인(관리자)
	public String reportContentForm(Model model);
	
	// 모임신고 답변(관리자)
	public String reportAnswerPro(Model model);

}
