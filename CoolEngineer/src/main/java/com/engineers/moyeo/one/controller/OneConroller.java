package com.engineers.moyeo.one.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.one.service.OneReportService;
import com.engineers.moyeo.one.service.OneService;

/**
 * 
 * @author 양우진
 *
 */

@RequestMapping("/one")

@Controller
public class OneConroller {

	String viewPage = null;
	
	@Autowired
	OneService oneService;
	
	@Autowired
	OneReportService oneReportService;
	
	// 고객지원 홈
	@RequestMapping("/cusSupMain")
	public String cusSupMain() {
		System.out.println("고객지원 홈");
		viewPage = "one/qna/cusSupMain";
		return viewPage;
	}
	
	// Q&A 홈
	@RequestMapping("/qna")
	public String qna(HttpServletRequest req, Model model) {
		System.out.println("Q&A 홈");
		
		req.getSession().setAttribute("authority", "manager");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qna(model);
		
		return viewPage;
	}
	
	// Q&A 질문 입력
	@RequestMapping("/qnaWrite")
	public String qnaWrite(HttpServletRequest req, Model model) {
		req.getSession().setAttribute("mem_id", "guest");
		System.out.println("Q&A 질문 입력");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaWrite(model);
		
		return viewPage;
	}
	
	// Q&A 질문 입력 확인
	@RequestMapping("/qnaWritePro")
	public String qnaWritePro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 질문 입력 확인");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaWritePro(model);
		return viewPage;
	}
	
	// Q&A 게시판 상세보기
	@RequestMapping("/qnaContentForm")
	public String qnaContentForm(HttpServletRequest req, Model model) {
		System.out.println("Q&A 게시글 내용 확인");
		req.getSession().setAttribute("mem_id", "guest");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaContentForm(model);
		return viewPage;
	}
	
	// Q&A 질문내용 수정
	@RequestMapping("/qnaModifyForm")
	public String qnaModifyForm(HttpServletRequest req, Model model) {
		System.out.println("Q&A 게시글 내용 수정");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaModifyForm(model);
		
		return viewPage;
	}
	
	// Q&A 질문내용 수정
	@RequestMapping("/qnaModifyPro")
	public String qnaModifyPro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 게시글 내용 수정 확정");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaModifyPro(model);
		
		return viewPage;
	}
	
	// Q&A 질문내용 삭제
	@RequestMapping("/qnaDeletePro")
	public String qnaDeletePro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 게시글 내용 삭제");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaDeletePro(model);
		
		return viewPage;
	}
	
	@RequestMapping("/qnaAnsDelPro")
	public String qnaAnsDelPro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 게시글 답변내용 삭제");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaAnsDelPro(model);
		
		return viewPage;
	}
	
	// Q&A 게시글 답변폼
	@RequestMapping("/qnaAnswerForm")
	public String qnaAnswerForm(HttpServletRequest req, Model model) {
		System.out.println("Q&A 게시글 답변 등록폼(관리자)");
		
		req.getSession().setAttribute("manager_id", "admin");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaAnswerForm(model);
		
		return viewPage;
	}
	
	// Q&A 게시글 답변 확정 페이지
	@RequestMapping("/qnaAnswerPro")
	public String qnaAnswerPro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 게시글 답변 확정(관리자)");
		
		req.getSession().setAttribute("manager_id", "admin");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaAnswerPro(model);
		
		return viewPage;
	}
	
	// 모임신고 페이지
	@RequestMapping("/moimMain")
	public String moimMain(HttpServletRequest req, Model model) {
		System.out.println("모임메인 페이지");
		
		model.addAttribute("req", req);
		
		viewPage = oneReportService.moimMain(model);
		return viewPage;
	}
	
	// 모임신고 페이지
	@RequestMapping("/moimReportMain")
	public String moimReport(HttpServletRequest req, Model model) {
		System.out.println("모임신고 페이지");
		
		req.getSession().setAttribute("group_num", "1");
		req.getSession().setAttribute("mem_id", "member2");
		
		model.addAttribute("req", req);
		
		viewPage = oneReportService.moimReport(model);
		return viewPage;
	}
	
	// 모임신고 작성 후 확인
	@RequestMapping("/moimReportPro")
	public String moimReportPro(HttpServletRequest req, Model model) {
		System.out.println("모임신고 작성 후 alert");
		
		model.addAttribute("req", req);
		
		viewPage = oneReportService.moimReportPro(model);
		return viewPage;
	}

}
