package com.engineers.moyeo.one.service;

import org.springframework.ui.Model;

public interface OneReportService {
	
	public String moimMain(Model model);
	public String moimReport(Model model);
	public String moimReportPro(Model model);
	public String moimReportHandleMain(Model model);
	public String reportContentForm(Model model);
	public String reportAnswerPro(Model model);

}
