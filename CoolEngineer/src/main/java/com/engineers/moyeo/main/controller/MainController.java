package com.engineers.moyeo.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @기능 홈페이지의 메인페이지 관련 기능을 수행하는 컨트롤러
 * @author JIP
 * @최초작성일 2017.01.19
 * @최종수정일 2017.01.19
 */

@RequestMapping("/main")
@Controller
public class MainController {

	@Autowired
	com.engineers.moyeo.main.service.MainService mainService;
	String viewPage;
	
	// 모여의 메인페이지를 로드하는 메서드
	@RequestMapping("/home")
	public String home(HttpServletRequest req, Model model) {
		
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		mainService.main_notice(model);
				
		return "main/main";
	}
	
	// 회원로그인 페이지
	@RequestMapping("/memberLoginForm") 
	public String memberLoginForm(HttpServletRequest req, Model model) {
		req.getSession().setAttribute("loginPage", true);
		System.out.println("로그인 페이지");
		viewPage = "main/memberLoginForm";
		return viewPage;
	}
	
	// 회원로그인 프로세스
	@RequestMapping(value="/memberLoginPro")
	public String loginPro(HttpServletRequest req, Model model) {
		System.out.println("로그인 프로세스 호출");
		model.addAttribute("req", req);
		viewPage = mainService.memberLoginPro(model);
		return viewPage;
	}
	
	// 회원로그아웃
	@RequestMapping(value="/memberLogout", method=RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		System.out.println("로그아웃 프로세스 호출");
		req.getSession().invalidate();
		viewPage = "redirect:/main/memberLoginForm";
		return viewPage;
	}
	
	// 회사소개 페이지
	@RequestMapping(value="/introduce/introduce")
	public String introduce(HttpServletRequest req){
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		System.out.println("회사소개 페이지 로드");
		viewPage = "introduce/introduce";
		return viewPage;
	}
	
	// 회사연혁 페이지
	@RequestMapping(value="/introduce/introduce2")
	public String introduce2(HttpServletRequest req){
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		System.out.println("회사연혁소개 페이지 로드");
		viewPage = "introduce/introduce2";
		return viewPage;
	}
	
	// 회사연혁 페이지
	@RequestMapping(value="/introduce/introduce3")
	public String introduce3(HttpServletRequest req){
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		System.out.println("회사 구성원 소개 페이지 로드");
		viewPage = "introduce/introduce3";
		return viewPage;
	}
	
}
