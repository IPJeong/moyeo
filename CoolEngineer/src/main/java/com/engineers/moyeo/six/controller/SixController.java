package com.engineers.moyeo.six.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.six.service.SixService;


/**
 * 
 * @author 하대성
 *
 */
@RequestMapping("/six")
@Controller
public class SixController {

	@Autowired
	com.engineers.moyeo.six.service.SixService sixService;

	//공지-메인
	@RequestMapping("/notice/notice")
	public String notice(HttpServletRequest req, Model model) {
		System.out.println("/customer-support/notice");
		model.addAttribute("req", req);

		sixService.notice(model);
		return "six/notice/notice";
	}

	//공지-상세글정보
	@RequestMapping("/notice/noticeContent")
	public String noticeContents(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeContent");
		model.addAttribute("req", req);

		sixService.noticeContent(model);
		return "six/notice/noticeContent";
	}

	//공지-글쓰기
	@RequestMapping("/notice/noticeWrite")
	public String noticeWrite(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeWrite");
		model.addAttribute("req", req);

		sixService.noticeWrite(model);
		return "six/notice/noticeWrite";
	}

	//공지-글쓰기 처리
	@RequestMapping("/notice/noticeWritePro")
	public String noticeWritePro(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeWritePro");
		model.addAttribute("req", req);

		sixService.noticeWritePro(model);
		return "six/notice/noticeWritePro";
	}

	//공지-글수정
	@RequestMapping("/notice/noticeModify")
	public String noticeModify(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeModify");
		model.addAttribute("req", req);

		sixService.noticeModify(model);
		return "six/notice/noticeModify";
	}

	//공지-글수정 처리
	@RequestMapping("/notice/noticeModifyPro")
	public String noticeModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeModify");
		model.addAttribute("req", req);

		sixService.noticeModifyPro(model);
		return "six/notice/noticeModifyPro";
	}

	//공지-글삭제
	@RequestMapping("/notice/noticeDelete")
	public String noticeDelete(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeDelete");
		model.addAttribute("req", req);

		sixService.noticeDelete(model);
		return "six/notice/noticeDelete";
	}
	
	
	
	
	
	//모임-메인
	@RequestMapping("/moimMain/moimMain")
	public String moimMain(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimMain");
		model.addAttribute("req", req);
		
		return "six/moimMain/moimMain";
	}
	
	
	
	
	
	
	//모임일정-메인
	@RequestMapping("/moimSchedule/moimSchedule")
	public String moimSchedule(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimSchedule");
		model.addAttribute("req", req);
		sixService.moimSchedule(model);
		
		return "six/moimSchedule/moimSchedule";
	}
	
	//모임일정-리스트
	@RequestMapping("/moimSchedule/moimScheduleDetail")
	public String moimScheduleDetail(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleDetail");
		model.addAttribute("req", req);
		sixService.moimScheduleDetail(model);
		
		return "six/moimSchedule/moimScheduleDetail";
	}

	//모임일정-등록
	@RequestMapping("/moimSchedule/moimRegister")
	public String moimRegister(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimRegister");
		model.addAttribute("req", req);
		
		return "six/moimSchedule/moimRegister";
	}

	//모임일정-등록시 지도선택
	@RequestMapping("/moimSchedule/moimRegisterMap")
	public String moimRegisterMap(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimRegisterMap");
		model.addAttribute("req", req);
	
		return "six/moimSchedule/moimRegisterMap";
	}

	//모임일정-등록처리
	@RequestMapping("/moimSchedule/moimRegisterPro")
	public String moimRegisterPro(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimRegisterPro");
		model.addAttribute("req", req);
		sixService.moimRegister(model);
		
		return "six/moimSchedule/moimRegisterPro";
	}
	
	//모임일정-상세페이지
	@RequestMapping("/moimSchedule/moimScheduleContents")
	public String moimScheduleContets(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleContents");
		model.addAttribute("req", req);
		sixService.moimScheduleContents(model);
		
		return "six/moimSchedule/moimScheduleContents";
	}

	//모임일정-수정페이지
	@RequestMapping("/moimSchedule/moimScheduleModify")
	public String moimScheduleModify(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleModify");
		model.addAttribute("req", req);
		sixService.moimScheduleModify(model);
		
		return "six/moimSchedule/moimScheduleModify";
	}
	
	//모임일정-수정처리
	@RequestMapping("/moimSchedule/moimScheduleModifyPro")
	public String moimScheduleModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleModifyPro");
		model.addAttribute("req", req);
		sixService.moimScheduleModifyPro(model);
		
		return "six/moimSchedule/moimScheduleModifyPro";
	}
	
	//모임일정-삭제처리
	@RequestMapping("/moimSchedule/moimScheduleDelete")
	public String moimScheduleDelete(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleDelete");
		model.addAttribute("req", req);
		sixService.moimScheduleDelete(model);
		
		return "six/moimSchedule/moimScheduleDelete";
	}
	
}


