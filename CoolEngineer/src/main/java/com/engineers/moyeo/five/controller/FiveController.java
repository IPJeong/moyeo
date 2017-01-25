package com.engineers.moyeo.five.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.five.service.FiveService;
import com.engineers.moyeo.main.model.FileForm;

/**
 * 
 * @author 정일품
 */
@RequestMapping("/five")
@Controller
public class FiveController {
	
	@Autowired
	FiveService fiveService;
	
	String viewPage;
	
	// 모임후기작성 페이지
	@RequestMapping("/postForm")
	public String postForm() {
		viewPage = "five/postForm";
		return viewPage;
	}
	

	// 모임후기작성 프로세스
	@RequestMapping("/postPro")
	public String postPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		
		req.getSession().setAttribute("memId", "guest");
		// 모델에 req객체를 삽입
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		// 모임후기등록 프로세스
		viewPage = fiveService.postPro(model);
		
		return viewPage;
	}
	
	// 모임후기 게시판
	@RequestMapping("/postList")
	public String postList(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		try {
			viewPage = fiveService.postList(model);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println("넘버포멧 예외발생");
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println("널포인트 예외발생");
		}
		
		return "five/postList";
	}
	

}
