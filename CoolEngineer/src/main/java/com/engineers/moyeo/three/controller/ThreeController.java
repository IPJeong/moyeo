package com.engineers.moyeo.three.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.three.service.ThreeService;


/**
 * @기능 FAQ와 이벤트관련기능을 수행하는 컨트롤러
 * @author 홍현호
 * @최초작성일 2017.01.20
 * @최종수정일 2017.02.08
 *
 */
@RequestMapping("/three")
@Controller
public class ThreeController {

	@Autowired
	ThreeService threeService;
	private ModelAndView mav;
	private String viewPage;
	
	@RequestMapping("/faq") //FAQ진입
	public String faq(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		viewPage = threeService.faq(model);
		System.out.println("faq()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCategory") //카테고리 생성폼으로 이동
	public String faqCategory(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		/*String viewPage = threeService.faq(model);*/
		System.out.println("faq()");
		
		return "three/faq/faqCategory";
	}
	
	@RequestMapping("/faqInsertForm") // FAQ 입력 폼
	public String faqInsertForm(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		viewPage = threeService.faqInsertForm(model);
		System.out.println("faqInsertForm()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCtgInput") //카테고리 생성 처리
	public String faqCtgInput(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.faqCtgInput(model);
		System.out.println("faqCtgInput()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqInsert") //FAQ입력 처리
	public String faqInsert(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.faqInsert(model);
		System.out.println("faqInsert()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCtgModify") //카테고리 수정
	public String faqCtgModify(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		viewPage = threeService.faqCtgModify(model);
		System.out.println("faqCtgModify()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCtgModifyPro") //카테고리 수정 처리
	public String faqCtgModifyPro(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.faqCtgModifyPro(model);
		System.out.println("faqInput()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqModifyForm") //FAQ 수정 폼
	public String faqModifyForm(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.faqModifyForm(model);
		System.out.println("faqModifyForm()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqModify") //FAQ 수정 처리
	public String faqModify(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.faqModify(model);
		System.out.println("faqModify()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqCtgDelete") //카테고리 삭제
	public String faqCtgDelete(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.faqCtgDelete(model);
		System.out.println("faqCtgDelete()");
		
		return viewPage;
	}
	
	@RequestMapping("/faqDelete") //FAQ 삭제
	public String faqDelete(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.faqDelete(model);
		System.out.println("faqDelete()");
		
		return viewPage;
	}
	
	@RequestMapping("/ing_event") //이벤트 페이지
	public String ing_event(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.ing_event(model);
		System.out.println("ing_event()");
		
		return viewPage;
	}
	
	@RequestMapping("/eventInsert") //이벤트 입력
	public String eventInsert(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		viewPage = threeService.eventInsert(model);
		System.out.println("eventInsert()");
		
		return viewPage;
	}
	
	@RequestMapping("/eventParticipate") //이벤트 참여
	public String eventParticipate(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.eventParticipate(model);
		System.out.println("eventParticipate()");
		
		return viewPage;
	}
		
	@RequestMapping("/eventParticipants") //이벤트 참가자 명단
	public String eventParticipants(HttpServletRequest req, Model model) {		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.eventParticipants(model);
		System.out.println("eventParticipants()");
		
		return viewPage;
	}

	@RequestMapping("/winEvent") //이벤트 당첨자 선정
	public String winEvent(HttpServletRequest req, Model model) {		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.winEvent(model);
		System.out.println("chgPw()");
		
		return viewPage;
	}
	
	@RequestMapping("/registration") //회원가입
	public String registration(HttpServletRequest req, Model model) {		
		/*String viewPage = threeService.faq(model);*/
		System.out.println("registration()");
		
		return "three/member/registration";
	}
	
	@RequestMapping(value="/duplication") //아이디 중복 체크
	public ModelAndView duplication(HttpServletRequest req) {
		
		mav = new ModelAndView("JSON");		
		System.out.println("아이디중복여부 요청");
		try {
			threeService.duplication(mav, req);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
	
	@RequestMapping("/registMember") //회원가입
	public String registMember(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req, Model model) {		
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		viewPage = threeService.registMember(model);
		System.out.println("registMember()");
		
		return viewPage;
	}
	
	@RequestMapping("/memInterest") //관심사 선택
	public String memInterest(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		viewPage = threeService.memInterest(model);
		System.out.println("memInterest()");
		
		return viewPage;
	}	
	
	@RequestMapping("/memInterestInput") //관심사 선택
	public String memInterestInput(HttpServletRequest req, Model model) {
		
		model.addAttribute("req", req);
		viewPage = threeService.memInterestInput(model);
		System.out.println("memInterestInput()");
		
		return viewPage;
	}	
	
	@RequestMapping("/myPage") //마이페이지
	public String myPage(HttpServletRequest req, Model model) {		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.myPage(model);
		System.out.println("myPage()");
		
		return viewPage;
	}
	
	@RequestMapping("/changeProImg") //프로필 사진 변경
	public String changeProImg(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		viewPage = threeService.changeProImg(model);
		System.out.println("changeProImg()");
		
		return viewPage;
	}
	
	@RequestMapping(value="/curPwChk") //비밀번호 변경시 현 비밀번호 체크
	public ModelAndView curPwChk(HttpServletRequest req) {
		
		mav = new ModelAndView("JSON");		
		System.out.println("현 비밀번호 체크 요청");
		try {
			threeService.curPwChk(mav, req);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
	
	@RequestMapping("/changePw") //비밀번호 변경
	public String changePw(HttpServletRequest req, Model model) {		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.changePw(model);
		System.out.println("changePw()");
		
		return viewPage;
	}
	
	@RequestMapping("/changeMyInfo") //내 정보 변경
	public String changeMyInfo(HttpServletRequest req, Model model) {		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.changeMyInfo(model);
		System.out.println("changeMyInfo()");
		
		return viewPage;
	}
	
	@RequestMapping(value="/deleteMem") //회원탈퇴 비밀번호 체크
	public ModelAndView deleteMem(HttpServletRequest req) {
		
		mav = new ModelAndView("JSON");		
		System.out.println("비밀번호 체크 요청");
		try {
			threeService.deleteMem(mav, req);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
	
	@RequestMapping("/delMem") //회원탈퇴
	public String delMem(HttpServletRequest req, Model model) {		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.delMem(model);
		System.out.println("delMem()");
		
		return viewPage;
	}	
	
	@RequestMapping("/forgetpassword") //비밀번호 찾기 폼
	public String forgetpassword(HttpServletRequest req, Model model) {		
		/*String viewPage = threeService.faq(model);*/
		System.out.println("findPw()");
		
		return "three/member/forgetpassword";
	}
	
	@RequestMapping("/findPw") //비밀번호 찾기
	public String findPw(HttpServletRequest req, Model model) {		
		
		model.addAttribute("req", req);
		viewPage = threeService.findPw(model);
		System.out.println("findPw()");
		
		return viewPage;
	}	
	
	@RequestMapping("/tempPw") //비밀번호 변경 폼
	public String tempPw(HttpServletRequest req, Model model) {		
		/*String viewPage = threeService.faq(model);*/
		System.out.println("tempPw()");
		
		return "three/member/tempPw";
	}
	
	@RequestMapping("/chgPw") //비밀번호 찾기
	public String chgPw(HttpServletRequest req, Model model) {		
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		viewPage = threeService.chgPw(model);
		System.out.println("chgPw()");
		
		return viewPage;
	}		
	
}
