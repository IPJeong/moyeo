package com.engineers.moyeo.five.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.five.service.FiveService;
import com.engineers.moyeo.main.common.Code;
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
	
	// 모임후기 게시판
	@RequestMapping("/postList")
	public String postList(HttpServletRequest req, Model model) {
		
		System.out.println("모임후기 리스트 페이지 요청");
		
		model.addAttribute("req", req);
		try {
			// 모임후기 리스트 로드 프로세스 실행
			viewPage = fiveService.postList(model);
			
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		
		return "five/postList";
	}
	
	// 모임후기작성 페이지
	@RequestMapping("/postForm")
	public String postForm() {
		
		System.out.println("모임후기 작성 페이지 요청");
		
		viewPage = "five/postForm";
		return viewPage;
	}
		

	// 모임후기작성 프로세스
	@RequestMapping("/postPro")
	public String postPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		
		System.out.println("모임후기 작성 프로세스 요청");
		
		req.getSession().setAttribute("memId", "guest");
		// 모델에 req객체를 삽입
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		// 모임후기등록 프로세스
		viewPage = fiveService.postPro(model);
		
		return viewPage;
	}
	
	// 모임후기 상세보기
	@RequestMapping("/postDetail")
	public String postDetail(HttpServletRequest req, Model model) {
		
		System.out.println("모임후기 상세보기 페이지 요청");
		
		model.addAttribute("req", req);
		try {
			// 모임후기 상세보기 프로세스 실행
			viewPage = fiveService.postDetail(model);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return viewPage;
	}
	
	// 사진 더보기 탭(메인)
	@RequestMapping("/gallery")
	public String galleryMore() {
		System.out.println("갤러리 호출");
		return "gallery/gallery";
	}
	
	@RequestMapping("/modalTest")
	public String modalTest() {
		return "common/modal/modalExample";
	}
	

}
