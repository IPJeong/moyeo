package com.engineers.moyeo.four.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.four.service.FourService;
import com.engineers.moyeo.four.service.FourServiceImpl;

/**
 * 
 * @author 이상준
 *
 */ 
@RequestMapping("/four")
@Controller
public class FourController {
	
	//게시판 리스트
	@Autowired
	FourService fourService;
	
		
	@RequestMapping("/moim_notice_board")
	public String moim_gongji_list(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_board 시작");
		model.addAttribute("req", req);
		String viewPage = fourService.execute(model);
		return viewPage;
	}
	
	@RequestMapping("/moim_notice_write_form")
	public String moim_notice_write_form(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_write_form 실행");
		model.addAttribute("req", req);
		String viewPage = fourService.writeExecute(model);
		return viewPage;
	}
	
	@RequestMapping("/moim_notice_writepro")
	public String moim_notice_writepro(HttpServletRequest req, Model model){
		model.addAttribute("req", req);
		System.out.println("moim_notice_writepro 글쓰기 처리 실행");
		String viewPage = fourService.writeproExecute(model);
		return viewPage;
		
	}
	
	@RequestMapping("moim_notice_contentform")
	public String moim_notice_contentform(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_contentform 내용 보기 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.moimContentExecute(model);
		return viewPage;
	}
	
	//공지사항 삭제
	@RequestMapping("moim_notice_delete")
	public String moim_notice_deleteForm(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_delete 삭제 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.moimDeleteExecute(model);
		return viewPage;
	}
	//공지사항 삭제 처리
	@RequestMapping("moim_notice_deletePro")
	public String moim_notice_deletePro(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_delete 삭제 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.moimDeleteproExecute(model);
		return viewPage;
	}
	
	//공지사항 수정
	@RequestMapping("moim_notice_modifyForm")
	public String moim_notice_modifyForm(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_modifyForm 수정 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.moimModifyFormExecute(model);
		return viewPage;
	}
	
	
	
	@RequestMapping("moim_notice_modifyView")
	public String moim_notice_modifyView(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_modifyView 수정 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.moimModifyViewExecute(model);
		return viewPage;
	}
	
	
	@RequestMapping("moim_notice_modifypro")
	public String moim_notice_modifypro(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_modifypro 수정 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.moimModifyProExecute(model);
		return viewPage;
	}
	
	
	// 가입인사 게시판
	@RequestMapping("/moim_greeting_board")	
	public String moim_greeting_list(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage=fourService.greetinglistExecute(model);
		return viewPage;
	
	}
	//가입인사 글쓰는 메소드
	@RequestMapping("/moim_greeting_write_form")
	public String moim_greeting_write_form(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage=fourService.greetintwriteExecute(model);
		return viewPage;
	}
	
	//가입인사 글쓰기 처리 메소드
	@RequestMapping("/moim_greeting_writepro")
	public String moim_greeting_writePro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		String viewPage=fourService.greetintwriteProExecute(model);
		return viewPage;
	}
	
	@RequestMapping("moim_greeting_contentform")
	public String moim_greeting_contentform(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_contentform 내용 보기 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.greetingContentExecute(model);
		return viewPage;
	}
	
	@RequestMapping("moim_greeting_delete")
	public String moim_greeting_deleteForm(HttpServletRequest req, Model model) {
		System.out.println("moim_greeting_delete 삭제 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.greetingDeleteExecute(model);
		return viewPage;
	}
	
	@RequestMapping("moim_greeting_deletePro")
	public String moim_greeting_deletePro(HttpServletRequest req, Model model) {
		System.out.println("moim_greeting_delete 삭제 실행");
		model.addAttribute("req", req);
		
		String viewPage=fourService.greetingDeleteProExecute(model);
		return viewPage;
	}
	
	@RequestMapping("moim_greeting_modifyView")
	public String moim_greeting_modifyView(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_modifyView 수정 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.greetingModifyViewExecute(model);
		return viewPage;
	}
	
	@RequestMapping("moim_greeting_modifypro")
	public String moim_greeting_modifypro(HttpServletRequest req, Model model) {
		System.out.println("moim_greeting_modifypro 수정 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.greetingModifyProExecute(model);
		return viewPage;
	}
	
	@RequestMapping("greeting_reple")
	public String greeting_reple(HttpServletRequest req, Model model) {
		System.out.println("greeting_reple 댓글입력 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.greeting_repleExecute(model);
		return viewPage;
	}
	
	@RequestMapping("repledelete")
	public String repledelete(HttpServletRequest req, Model model) {
		System.out.println("repledelete 댓글삭제 실행");
		model.addAttribute("req", req);
		String viewPage=fourService.repledeleteExecute(model);
		return viewPage;
	}
		
}
