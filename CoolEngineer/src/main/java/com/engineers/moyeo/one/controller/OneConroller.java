package com.engineers.moyeo.one.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.one.service.OneManagerService;
import com.engineers.moyeo.one.service.OneReportService;
import com.engineers.moyeo.one.service.OneService;

/**
 * 
 * @author �뼇�슦吏�
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
	
	@Autowired
	OneManagerService oneManagerService;
	
	// 고객지원 홈
	@RequestMapping("/cusSupMain")
	public String cusSupMain() {
		viewPage = "one/qna/cusSupMain";
		return viewPage;
	}
	
	// Q&A 게시판 홈
	@RequestMapping("/qna")
	public String qna(HttpServletRequest req, Model model) {
		System.out.println("Q&A �솃");
		
		req.getSession().setAttribute("authority", "manager");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qna(model);
		
		return viewPage;
	}
	
	// Q&A에서 질문 입력하는 폼
	@RequestMapping("/qnaWrite")
	public String qnaWrite(HttpServletRequest req, Model model) {
		req.getSession().setAttribute("mem_id", "guest");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaWrite(model);
		
		return viewPage;
	}
	
	// Q&A 질문 입력 등록요청
	@RequestMapping("/qnaWritePro")
	public String qnaWritePro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 吏덈Ц �엯�젰 �솗�씤");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaWritePro(model);
		return viewPage;
	}
	
	// Q&A 질문 세부내용
	@RequestMapping("/qnaContentForm")
	public String qnaContentForm(HttpServletRequest req, Model model) {
		req.getSession().setAttribute("mem_id", "guest");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaContentForm(model);
		return viewPage;
	}
	
	// Q&A 질문 수정 폼
	@RequestMapping("/qnaModifyForm")
	public String qnaModifyForm(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaModifyForm(model);
		
		return viewPage;
	}
	
	// Q&A 질문 수정요청
	@RequestMapping("/qnaModifyPro")
	public String qnaModifyPro(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaModifyPro(model);
		
		return viewPage;
	}
	
	// Q&A 질문 삭제요청
	@RequestMapping("/qnaDeletePro")
	public String qnaDeletePro(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaDeletePro(model);
		
		return viewPage;
	}
	
	// Q&A 관리자가 질문 삭제
	@RequestMapping("/qnaAnsDelPro")
	public String qnaAnsDelPro(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaAnsDelPro(model);
		
		return viewPage;
	}
	
	// Q&A 관리자가 질문에 대한 답변하는 폼
	@RequestMapping("/qnaAnswerForm")
	public String qnaAnswerForm(HttpServletRequest req, Model model) {
		
		req.getSession().setAttribute("manager_id", "admin");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaAnswerForm(model);
		
		return viewPage;
	}
	
	// Q&A 관리자가 답변 등록요청
	@RequestMapping("/qnaAnswerPro")
	public String qnaAnswerPro(HttpServletRequest req, Model model) {
		
		req.getSession().setAttribute("manager_id", "admin");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaAnswerPro(model);
		
		return viewPage;
	}
	
	// 모임메인 화면
	@RequestMapping("/moimMain")
	public String moimMain(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		
		viewPage = oneReportService.moimMain(model);
		return viewPage;
	}
	
	// 모임신고 폼
	@RequestMapping("/moimReportMain")
	public String moimReport(HttpServletRequest req, Model model) {
		
		req.getSession().setAttribute("group_num", "1");
		req.getSession().setAttribute("mem_id", "member2");
		
		model.addAttribute("req", req);
		
		viewPage = oneReportService.moimReport(model);
		return viewPage;
	}
	
	// 모임신고 등록요청
	@RequestMapping(value="/moimReportPro", method=RequestMethod.POST)
	public String moimReportPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		System.out.println("모임신고 등록요청");
		
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		
		viewPage = oneReportService.moimReportPro(model);
		
		return viewPage;
	}
	
	// 모임신고 관리자확인
	@RequestMapping("/moimReportHandleMain")
	public String moimReportHandleMain(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		
		viewPage = oneReportService.moimReportHandleMain(model);
		return viewPage;
	}
	
	// 모임신고 세부사항 관리자 확인
	@RequestMapping("/reportContentForm")
	public String reportContentForm(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		req.getSession().setAttribute("manager_id", "admin");
		
		viewPage = oneReportService.reportContentForm(model);
		return viewPage;
	}
	
	// 모임신고 관리자 답변
	@RequestMapping("/reportAnswerPro")
	public String reportAnswerPro(HttpServletRequest req, Model model) {
		
		req.getSession().setAttribute("manager_id", "admin");
		
		model.addAttribute("req", req);
		
		viewPage = oneReportService.reportAnswerPro(model);
		
		return viewPage;
	}
	
////////////////// 관리자 화면 ///////////////////////
	@RequestMapping("/managerMain")
	public String managerMain(HttpServletRequest req, Model model) {
		System.out.println("관리자 메인화면");
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.managerMain(model);
		
		return viewPage;
	}
	
	// 회원리스트 불러오기
	@RequestMapping("/guestList")
	public String guestList(HttpServletRequest req, Model model) {
		System.out.println("회원리스트 불러오는 화면");
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.guestList(model);
		
		return viewPage;
	}
	
	// 회원리스트중 회원상세정보 불러오기
	@RequestMapping("/guestInform")
	public String guestInform(HttpServletRequest req, Model model) {
		System.out.println("회원리스트 상세정보 조회");
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.guestInform(model);
		
		return viewPage;
	}
	
	// 회원리스트중 회원탈퇴 시키기
	@RequestMapping("/guestDelete")
	public String guestDelete(HttpServletRequest req, Model model) {
		System.out.println("회원리스트 강퇴하는 화면");
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.guestDelete(model);
		
		return viewPage;
	}
	
	// 관리자 임명 폼
	@RequestMapping("/adminAppoint")
	public String adminAppoint(HttpServletRequest req, Model model) {
		System.out.println("관리자 임명 폼");
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.adminAppoint(model);
		
		return viewPage;
	}
}
