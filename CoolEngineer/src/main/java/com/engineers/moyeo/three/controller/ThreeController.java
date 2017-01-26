package com.engineers.moyeo.three.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.three.service.ThreeService;


/**
 * @기능 FAQ와 이벤트관련기능을 수행하는 컨트롤러
 * @author 홍현호
 * @최초작성일 2017.01.20
 * @최종수정일 2017.01.21
 *
 */
@RequestMapping("/three")
@Controller
public class ThreeController {

	@Autowired
	ThreeService threeService;
	
	@RequestMapping("/faq") //FAQ진입
	public String faq(HttpServletRequest req, Model model) {
		String viewPage = threeService.faq(model);
		System.out.println("faq()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCategory") //카테고리 생성폼으로 이동
	public String faqCategory(HttpServletRequest req, Model model) {
		/*String viewPage = threeService.faq(model);*/
		System.out.println("faq()");
		
		return "three/faq/faqCategory";
	}
	
	@RequestMapping("/faqInsertForm") // FAQ 입력 폼
	public String faqInsertForm(HttpServletRequest req, Model model) {
		String viewPage = threeService.faqInsertForm(model);
		System.out.println("faqInsertForm()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCtgInput") //카테고리 생성 처리
	public String faqCtgInput(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage = threeService.faqCtgInput(model);
		System.out.println("faqCtgInput()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqInsert") //FAQ입력 처리
	public String faqInput(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage = threeService.faqInsert(model);
		System.out.println("faqInsert()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCtgModify") //카테고리 수정
	public String faqCtgModify(HttpServletRequest req, Model model) {
		String viewPage = threeService.faqCtgModify(model);
		System.out.println("faqCtgModify()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCtgModifyPro") //카테고리 수정 처리
	public String faqCtgModifyPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage = threeService.faqCtgModifyPro(model);
		System.out.println("faqInput()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqModifyForm") //FAQ 수정 폼
	public String faqModifyForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage = threeService.faqModifyForm(model);
		System.out.println("faqModifyForm()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqModify") //FAQ 수정 처리
	public String faqModify(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage = threeService.faqModify(model);
		System.out.println("faqModify()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCtgDelete") //카테고리 삭제
	public String faqCtgDelete(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage = threeService.faqCtgDelete(model);
		System.out.println("faqCtgDelete()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqDelete") //카테고리 삭제
	public String faqDelete(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage = threeService.faqDelete(model);
		System.out.println("faqDelete()");
		
		return viewPage;
	}
	
	@RequestMapping("/ing_event") 
	public String ing_event(HttpServletRequest req, Model model) {		
		System.out.println("ing_event()");
		
		return "three/event/ing_event";
	}
	
}
