package com.engineers.moyeo.three.service;

import org.springframework.ui.Model;

public interface ThreeService {
	
	public String faq(Model model);
	public String faqInsertForm(Model model);
	public String faqCtgInput(Model model);
	public String faqInsert(Model model);
	public String faqCtgModify(Model model);
	public String faqCtgModifyPro(Model model);
	public String faqModifyForm(Model model);
	public String faqModify(Model model);
	public String faqCtgDelete(Model model);
	public String faqDelete(Model model);
}
