package com.engineers.moyeo.five.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 업데이트
	
	
	String viewPage;
	
	// 모임후기작성 페이지
	@RequestMapping("/postForm")
	public String postForm() {
		viewPage = "five/postForm";
		return viewPage;
	}
	

	// 모임후기작성 프로세스
	@RequestMapping("/postPro")
	public String postPro(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		viewPage = fiveService.postPro(model);
		return "five/postForm";
	}

}
