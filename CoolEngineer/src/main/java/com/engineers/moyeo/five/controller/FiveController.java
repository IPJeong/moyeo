package com.engineers.moyeo.five.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	private ModelAndView mav;
	private String viewPage;
	
	// 모임후기 게시판
	@RequestMapping("/postList")
	public String postList(HttpServletRequest req, Model model) {
		
		System.out.println("모임후기 리스트 페이지 요청");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
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
	public String postForm(Model model, HttpServletRequest req) {
		
		System.out.println("모임후기 작성 페이지 요청");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = fiveService.postForm(model);
		return viewPage;
	}
		

	// 모임후기작성 프로세스
	@RequestMapping("/postPro")
	public String postPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		
		System.out.println("모임후기 작성 프로세스 요청");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		req.getSession().setAttribute("memId", "guest");
		// 모델에 req객체를 삽입
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		// 모임후기등록 프로세스
		viewPage = fiveService.postPro(model);
		
		return viewPage;
	}
	
	// 모임후기 상세보기
	@RequestMapping(value="/postDetail")
	public String postDetail(Model model, HttpServletRequest req) {
		System.out.println("모임후기 상세보기 페이지 요청");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
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
	
	// 모임후기 수정
	@RequestMapping(value="/modifyPost")
	public ModelAndView modifyPost(@RequestParam String post_num, HttpServletRequest req) {
		mav = new ModelAndView("JSON");
		System.out.println("모임후기 수정 요청");
		mav.addObject("post_num", post_num);
		try {
			fiveService.modifyPost(mav);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
	
	// 모임후기 삭제
	@RequestMapping(value="/deletePost")
	public ModelAndView deletePost(@RequestParam String post_num) {
		mav = new ModelAndView("JSON");
		System.out.println("모임후기 삭제 요청");
		mav.addObject("post_num", post_num);
		try {
			fiveService.deletePost(mav);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
	
	// 모임후기 좋아요
	@RequestMapping(value="/likePost", method=RequestMethod.POST)
	public ModelAndView likePost(HttpServletRequest req) {
		mav = new ModelAndView("JSON");
		System.out.println("모임후기 좋아요 요청");
		try {
			fiveService.likePost(mav, req);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
	
	// 모임후기 댓글 등록
	@RequestMapping(value="/addPostReply", method=RequestMethod.POST)
	public ModelAndView addPostReply(HttpServletRequest req) {
		mav = new ModelAndView("JSON");
		System.out.println("모임후기 댓글 등록 요청");
		try {
			fiveService.addPostReply(mav, req);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
	
	// 모임후기 댓글 삭제
	@RequestMapping(value="/deletePostReply", method=RequestMethod.POST)
	public ModelAndView deletePostReply(HttpServletRequest req) {
		mav = new ModelAndView("JSON");
		System.out.println("모임후기 댓글 삭제 요청");
		try {
			fiveService.deletePostReply(mav, req);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
}
