package com.engineers.moyeo.one.service;

import org.springframework.ui.Model;

public interface OneService {
	
	public String qna(Model model);
	public String qnaWrite(Model model);
	public String qnaWritePro(Model model);
	public String qnaContentForm(Model model);
	public String qnaModifyForm(Model model);
	public String qnaModifyPro(Model model);
	public String qnaDeletePro(Model model);
	public String qnaAnsDelPro(Model model);

	public String qnaAnswerForm(Model model);
	public String qnaAnswerPro(Model model);
}
