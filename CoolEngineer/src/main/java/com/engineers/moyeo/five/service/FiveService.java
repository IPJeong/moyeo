package com.engineers.moyeo.five.service;

import org.springframework.ui.Model;

public interface FiveService {

	// 모임후기 리스트 출력 프로세스
	public String postList(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 등록 프로세스
	public String postPro(Model model) throws NumberFormatException, NullPointerException;
	
}
