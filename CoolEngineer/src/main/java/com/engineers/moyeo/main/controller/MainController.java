package com.engineers.moyeo.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		model.addAttribute("req", req);
		System.out.println("메인페이지 로드");
		return "main/main";
	}
	
	@RequestMapping("/category/category_hobby")
	public String categoryHobby() {
		System.out.println("카테고리 하비");
		return "common/category/category_hobby";
	}
	
	//
	@RequestMapping("/memberLoginForm") 
	public String memberLoginForm(HttpServletRequest req, Model model) {
		System.out.println("로그인 페이지");
		viewPage = "main/memberLoginForm";
		return viewPage;
	}
	
	//
	@RequestMapping("/memberLoginPro")
	public String loginPro(HttpServletRequest req, Model model) {
		System.out.println("로그인 프로세스 호출");
		model.addAttribute("req", req);
		viewPage = mainService.memberLoginPro(model);
		return viewPage;
	}
}
