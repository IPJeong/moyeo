package com.engineers.moyeo.one.controller;

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
 * @author 
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
	
	// Q&A 게시판 홈
	@RequestMapping(value="/qna", method=RequestMethod.GET)
	public String qna(HttpServletRequest req, Model model) {
		System.out.println("Q&A 메인");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";		
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qna(model);
		
		return viewPage;
	}
	
	// Q&A에서 질문 입력하는 폼
	@RequestMapping(value="/qnaWrite", method=RequestMethod.GET)
	public String qnaWrite(HttpServletRequest req, Model model) {
		System.out.println("Q&A 질문폼");
		
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaWrite(model);
		
		return viewPage;
	}
	
	// Q&A 질문 입력 등록요청
	@RequestMapping(value="/qnaWritePro", method=RequestMethod.POST)
	public String qnaWritePro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 질문입력 요청");
		
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaWritePro(model);
		return viewPage;
	}
	
	// Q&A 질문 세부내용 확인
	@RequestMapping(value="/qnaContentForm", method=RequestMethod.GET)
	public String qnaContentForm(HttpServletRequest req, Model model) {
		System.out.println("Q&A 질문 세부내용 확인");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaContentForm(model);
		return viewPage;
	}
	
	// Q&A 질문 수정 폼
	@RequestMapping(value="/qnaModifyForm", method=RequestMethod.GET)
	public String qnaModifyForm(HttpServletRequest req, Model model) {
		System.out.println("Q&A 질문 수정폼");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaModifyForm(model);
		
		return viewPage;
	}
	
	// Q&A 질문 수정요청
	@RequestMapping(value="/qnaModifyPro", method=RequestMethod.POST)
	public String qnaModifyPro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 질문 수정요청");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaModifyPro(model);
		
		return viewPage;
	}
	
	// Q&A 질문 삭제요청
	@RequestMapping(value="/qnaDeletePro", method=RequestMethod.GET)
	public String qnaDeletePro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 질문 삭제요청");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaDeletePro(model);
		
		return viewPage;
	}
	
	// Q&A 관리자가 질문 삭제
	@RequestMapping(value="/qnaAnsDelPro", method=RequestMethod.GET)
	public String qnaAnsDelPro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 관리자가 질문 삭제요청");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaAnsDelPro(model);
		
		return viewPage;
	}
	
	// Q&A 관리자가 질문에 대한 답변하는 폼
	@RequestMapping(value="/qnaAnswerForm", method=RequestMethod.GET)
	public String qnaAnswerForm(HttpServletRequest req, Model model) {
		System.out.println("Q&A 관리자가 질문에 대한 답변하는 폼");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		req.getSession().setAttribute("manager_id", "admin");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaAnswerForm(model);
		
		return viewPage;
	}
	
	// Q&A 관리자가 답변 등록요청
	@RequestMapping(value="/qnaAnswerPro", method=RequestMethod.POST)
	public String qnaAnswerPro(HttpServletRequest req, Model model) {
		System.out.println("Q&A 관리자가 질문에 대한 답변요청");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		req.getSession().setAttribute("manager_id", "admin");
		
		model.addAttribute("req", req);
		
		viewPage = oneService.qnaAnswerPro(model);
		
		return viewPage;
	}
	
	// 모임신고 폼
	@RequestMapping(value="/moimReportMain", method=RequestMethod.GET)
	public String moimReport(HttpServletRequest req, Model model) {
		System.out.println("모임신고 폼");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";		
		model.addAttribute("req", req);
		
		viewPage = oneReportService.moimReport(model);
		return viewPage;
	}
	
	// 모임신고 등록요청
	@RequestMapping(value="/moimReportPro", method=RequestMethod.POST)
	public String moimReportPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		System.out.println("모임신고 등록요청");
		
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		
		viewPage = oneReportService.moimReportPro(model);
		
		return viewPage;
	}
	
	// 모임신고 관리자확인
	@RequestMapping(value="/moimReportHandleMain", method=RequestMethod.GET)
	public String moimReportHandleMain(HttpServletRequest req, Model model) {
		System.out.println("관리자가 모임신고 리스트 확인");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";

		model.addAttribute("req", req);
		
		viewPage = oneReportService.moimReportHandleMain(model);
		return viewPage;
	}
	
	// 모임신고 세부사항 관리자 확인
	@RequestMapping(value="/reportContentForm", method=RequestMethod.GET)
	public String reportContentForm(HttpServletRequest req, Model model) {
		System.out.println("관리자가 모임신고 세부사항 확인 ");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
	
		model.addAttribute("req", req);
	
		viewPage = oneReportService.reportContentForm(model);
		return viewPage;
	}
	
	// 모임신고 관리자 답변
	@RequestMapping(value="/reportAnswerPro")
	public String reportAnswerPro(HttpServletRequest req, Model model) {
		System.out.println("관리자가 모임신고에 대한 답변요청");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";

		model.addAttribute("req", req);
		
		viewPage = oneReportService.reportAnswerPro(model);
		
		return viewPage;
	}
	
////////////////// 관리자 화면 ///////////////////////
	// 관리자 메인 화면
	@RequestMapping(value="/managerMain", method=RequestMethod.GET)
	public String managerMain(HttpServletRequest req, Model model) {
		System.out.println("관리자 메인화면");
		
		if(req.getSession().getAttribute("manager_id")==null)return "redirect:/one/managerLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.managerMain(model);
		
		return viewPage;
	}
	
	// 회원리스트 불러오기
	@RequestMapping(value="/guestList", method=RequestMethod.GET)
	public String guestList(HttpServletRequest req, Model model) {
		System.out.println("회원리스트 불러오는 화면");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.guestList(model);
		
		return viewPage;
	}
	
	// 회원리스트중 회원상세정보 불러오기
	@RequestMapping(value="/guestInform", method=RequestMethod.GET)
	public String guestInform(HttpServletRequest req, Model model) {
		System.out.println("회원리스트 상세정보 조회");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.guestInform(model);
		
		return viewPage;
	}
	
	// 회원리스트중 회원탈퇴 시키기
	@RequestMapping(value="/guestDelete", method=RequestMethod.GET)
	public String guestDelete(HttpServletRequest req, Model model) {
		System.out.println("회원리스트 강퇴하는 화면");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.guestDelete(model);
		
		return viewPage;
	}
	
	// 관리자 임명 폼
	@RequestMapping(value="/adminAppoint", method=RequestMethod.GET)
	public String adminAppoint(HttpServletRequest req, Model model) {
		System.out.println("관리자임명 폼");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.adminAppoint(model);
		
		return viewPage;
	}
	
	// 관리자 임명요청
	@RequestMapping(value="/adminAppointPro", method=RequestMethod.POST)
	public String adminAppointPro(HttpServletRequest req, Model model) {
		System.out.println("관리자임명 요청");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.adminAppointPro(model);
		
		return viewPage;
	}
	
	// 관리자 삭제
	@RequestMapping(value="/adminDelete", method=RequestMethod.GET)
	public String adminDelete(HttpServletRequest req, Model model) {
		System.out.println("관리자삭제 페이지");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.adminDelete(model);
		
		return viewPage;
	}
	
	// 관리자 삭제 요청
	@RequestMapping(value="/adminDeletePro", method=RequestMethod.GET)
	public String adminDeletePro(HttpServletRequest req, Model model) {
		System.out.println("관리자삭제 페이지");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.adminDeletePro(model);
		
		return viewPage;
	}
	
	// 전체모임 조회
	@RequestMapping(value="/moimCheck", method=RequestMethod.GET)
	public String moimCheck(HttpServletRequest req, Model model) {
		
		System.out.println("모임리스트 불러오는 화면");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.moimCheck(model);
		
		return viewPage;
	}
	
	// 관리자 로그인 폼
	@RequestMapping(value="/managerLoginForm", method=RequestMethod.GET)
	public String managerHome(HttpServletRequest req, Model model) {
		System.out.println("관리자 로그인 폼");
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.managerLoginForm(model);
		
		return viewPage;
	}
	
	// 관리자 로그인 요청
	@RequestMapping(value="/managerLoginPro")
	public String managerLoginPro(HttpServletRequest req, Model model) {
		System.out.println("관리자 로그인요청");
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.managerLoginPro(model);
		
		return viewPage;
	}
	
	// 모임리스트중 모임상세정보 불러오기
	@RequestMapping(value="/groupInform", method=RequestMethod.GET)
	public String groupInform(HttpServletRequest req, Model model) {
		System.out.println("모임리스트 상세정보 조회");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.groupInform(model);
		
		return viewPage;
	}
	
	// 해당모임에 가입한 회원 조회
	@RequestMapping(value="/groupMemberInform", method=RequestMethod.GET)
	public String groupMemberInform(HttpServletRequest req, Model model) {
		System.out.println("해당모임에 가입한 회원 조회");
		
		if(req.getSession().getAttribute("manager_id")==null)return "redirect:/main/managerLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.groupMemberInform(model);
		
		return viewPage;
	}
	
	// 해당모임에 가입한 회원 탈퇴
	@RequestMapping(value="/groupDelete", method=RequestMethod.GET)
	public String groupDelete(HttpServletRequest req, Model model) {
		System.out.println("회원리스트 중에 강퇴");
		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		
		viewPage = oneManagerService.groupDelete(model);
		
		return viewPage;
	}
	
	// 전체 회원 리스트중에서 회원 아이디로 한 리스트만 조회
	@RequestMapping(value="/guestListSearch")
	public String guestListSearch(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		viewPage = oneManagerService.guestListSearch(model);
		return viewPage;
	}
	
	// 전체 모임중에서 모임 이름으로 한 리스트만 조회
	@RequestMapping(value="/guestGroupSearch")
	public String guestGroupSearch(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		viewPage = oneManagerService.guestGroupSearch(model);
		return viewPage;
	}
	
}
