package com.engineers.moyeo.four.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.four.service.FourService;

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
	
	//공지사항 게시판 목록	
	@RequestMapping("/moim_notice_board")
	public String moim_gongji_list(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_board 시작");
		model.addAttribute("req", req);
		String viewPage = fourService.execute(model);
		return viewPage;
	}
	
	//공지사항 게시판 글쓰기 폼	
	@RequestMapping("/moim_notice_write_form")
	public String moim_notice_write_form(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_write_form 실행");
		
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage = fourService.writeExecute(model);
		return viewPage;
	}
	
	//공지사항 게시판 글쓰기 처리 
	@RequestMapping("/moim_notice_writepro")
	public String moim_notice_writepro(HttpServletRequest req, Model model){
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		System.out.println("moim_notice_writepro 글쓰기 처리 실행");
		String viewPage = fourService.writeproExecute(model);
		return viewPage;
		
	}
	
	//공지사항 게시판 글내용 보는 곳
	@RequestMapping("moim_notice_contentform")
	public String moim_notice_contentform(HttpServletRequest req, Model model) {
		
		System.out.println("moim_notice_contentform 내용 보기 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.moimContentExecute(model);
		return viewPage;
	}
	
	//공지사항 글삭제
	@RequestMapping("moim_notice_delete")
	public String moim_notice_deleteForm(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_delete 삭제 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.moimDeleteExecute(model);
		return viewPage;
	}
	//공지사항 글삭제 처리
	@RequestMapping("moim_notice_deletePro")
	public String moim_notice_deletePro(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_delete 삭제 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.moimDeleteproExecute(model);
		return viewPage;
	}
	
	//공지사항 글수정
	@RequestMapping("moim_notice_modifyForm")
	public String moim_notice_modifyForm(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_modifyForm 수정 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.moimModifyFormExecute(model);
		return viewPage;
	}
	
	
	//공지사항 게시판 글 수정 보기
	@RequestMapping("moim_notice_modifyView")
	public String moim_notice_modifyView(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_modifyView 수정 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.moimModifyViewExecute(model);
		return viewPage;
	}
	
	//공지사항 게시판 글 수정 처리
	@RequestMapping("moim_notice_modifypro")
	public String moim_notice_modifypro(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_modifypro 수정 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.moimModifyProExecute(model);
		return viewPage;
	}
	
	
	// 가입인사 게시판 목록
	@RequestMapping("/moim_greeting_board")	
	public String moim_greeting_list(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		if((Integer)req.getSession().getAttribute("group_per") == 4){
			return "four/greeting_board/redirect";
		}
		model.addAttribute("req", req);
		String viewPage=fourService.greetinglistExecute(model);
		return viewPage;
	
	}
	//가입인사 글쓰기 폼
	@RequestMapping("/moim_greeting_write_form")
	public String moim_greeting_write_form(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.greetintwriteExecute(model);
		return viewPage;
	}
	
	//가입인사 글쓰기 처리 메소드
	@RequestMapping("/moim_greeting_writepro")
	public String moim_greeting_writePro(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.greetintwriteProExecute(model);
		return viewPage;
	}
	//가입인사 게시판 글 내용 보기
	@RequestMapping("moim_greeting_contentform")
	public String moim_greeting_contentform(HttpServletRequest req, Model model) {
		System.out.println("moim_greeting_contentform 내용 보기 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.greetingContentExecute(model);
		return viewPage;
	}
	
	//가입인사 게시판 글 삭제 폼
	@RequestMapping("moim_greeting_delete")
	public String moim_greeting_deleteForm(HttpServletRequest req, Model model) {
		System.out.println("moim_greeting_delete 삭제 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.greetingDeleteExecute(model);
		return viewPage;
	}
	
	
	//가입인사 게시판 글 삭제 처리
	@RequestMapping("moim_greeting_deletePro")
	public String moim_greeting_deletePro(HttpServletRequest req, Model model) {
		System.out.println("moim_greeting_delete 삭제 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		
		String viewPage=fourService.greetingDeleteProExecute(model);
		return viewPage;
	}
	
	//가입인사 게시판 글 수정 보기
	@RequestMapping("moim_greeting_modifyView")
	public String moim_greeting_modifyView(HttpServletRequest req, Model model) {
		System.out.println("moim_notice_modifyView 수정 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.greetingModifyViewExecute(model);
		return viewPage;
	}
	
	//가입인사 게시판 글 수정 처리
	@RequestMapping("moim_greeting_modifypro")
	public String moim_greeting_modifypro(HttpServletRequest req, Model model) {
		System.out.println("moim_greeting_modifypro 수정 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.greetingModifyProExecute(model);
		return viewPage;
	}
	
	//가입인사 게시판 글 댓글 입력
	@RequestMapping("greeting_reple")
	public String greeting_reple(HttpServletRequest req, Model model) {
		System.out.println("greeting_reple 댓글입력 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.greeting_repleExecute(model);
		return viewPage;
	}
	
	//가입인사 게시판 글 댓글 삭제
	@RequestMapping("repledelete")
	public String repledelete(HttpServletRequest req, Model model) {
		System.out.println("repledelete 댓글삭제 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.repledeleteExecute(model);
		return viewPage;
	}
	
	//가입인사 테이블에서 좋아요 +1하는 메소드
	@RequestMapping("likeyo")
	public String likeyo(HttpServletRequest req, Model model) {
		System.out.println("likeyo  실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.likeyoPlusExecute(model);
		return viewPage;
	}
	
	//좋아요 테이블에서 좋아요+1하는 메소드
	@RequestMapping("likeInsert")
	public String likeInsert(HttpServletRequest req, Model model) {
		System.out.println("likeInsert 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.likeInsertExecute(model);
		return viewPage;
	}
	//cnt를 통해 좋아요 +1를 처리하는 메소드
	@RequestMapping("moim_greeting_likepro")
	public String moim_greeting_likepro(HttpServletRequest req, Model model) {
		System.out.println("likeInsert 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.likeInsertExecute(model);
		return viewPage;
	}
	// 샵 메인
	@RequestMapping("moyeoShop")
	public String moyeoShop(HttpServletRequest req, Model model) {
		System.out.println("moyeoShop 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.moyeoShopExecute(model);
		return viewPage;
	}
	//제품 등록 화면
	@RequestMapping("productInsertForm")
	public String productInsert(HttpServletRequest req, Model model) {
		System.out.println("productInsert 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.productInsertFormExecute(model);
		return viewPage;
	}
	//제품 등록 처리
	@RequestMapping("productInsertpro")
	public String productInsertpro(HttpServletRequest req, Model model) {
		System.out.println("productInsertpro 실행");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		String viewPage=fourService.productInsertproExecute(model);
		return viewPage;
	}
	
	
	
}
