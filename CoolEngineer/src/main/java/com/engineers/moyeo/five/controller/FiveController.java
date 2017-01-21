package com.engineers.moyeo.five.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.five.service.FiveService;

/**
 * 
 * @author 정일품
 *  안녕하세요.
 */
@RequestMapping("/five")
@Controller
public class FiveController {
	
	@Autowired
	FiveService fiveService;
	
	String viewPage;
	
	// 모임후기작성 페이지
	@RequestMapping("/postForm")
	public String moin() {
		viewPage = "five/postForm";
		return viewPage;
	}
	
	@RequestMapping("/postPro")	
	public void postPro() {
		fiveService.postPro();
		
	}
	
	
}
