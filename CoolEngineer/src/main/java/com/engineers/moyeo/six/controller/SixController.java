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
	@RequestMapping("/customer-support/notice")
	public String notice(HttpServletRequest req, Model model) {
		System.out.println("/customer-support/notice");
		model.addAttribute("req", req);

		sixService.notice(model);
		return "customer-support/notice";
	}

	//공지-상세글정보
	@RequestMapping("/customer-support/notice_content")
	public String notice_contents(HttpServletRequest req, Model model) {
		System.out.println("/customer-support/notice_content");
		model.addAttribute("req", req);

		sixService.noticeContent(model);
		return "customer-support/notice_content";
	}

	//공지-글쓰기
	@RequestMapping("/customer-support/notice_write")
	public String notice_write(HttpServletRequest req, Model model) {
		System.out.println("/customer-support/notice_write");
		model.addAttribute("req", req);

		sixService.noticeWrite(model);
		return "customer-support/notice_write";
	}

	//공지-글쓰기 처리
	@RequestMapping("/customer-support/notice_writePro")
	public String notice_writePro(HttpServletRequest req, Model model) {
		System.out.println("/customer-support/notice_writePro");
		model.addAttribute("req", req);

		sixService.noticeWritePro(model);
		return "customer-support/notice_writePro";
	}

	//공지-글수정
	@RequestMapping("/customer-support/notice_modify")
	public String notice_modify(HttpServletRequest req, Model model) {
		System.out.println("/customer-support/notice_modify");
		model.addAttribute("req", req);

		sixService.noticeModify(model);
		return "customer-support/notice_modify";
	}

	//공지-글수정 처리
	@RequestMapping("/customer-support/notice_modifyPro")
	public String notice_modifyPro(HttpServletRequest req, Model model) {
		System.out.println("/customer-support/notice_modify");
		model.addAttribute("req", req);

		sixService.noticeModifyPro(model);
		return "customer-support/notice_modifyPro";
	}

	//공지-글삭제
	@RequestMapping("/customer-support/notice_delete")
	public String notice_delete(HttpServletRequest req, Model model) {
		System.out.println("/customer-support/notice_delete");
		model.addAttribute("req", req);

		sixService.noticeDelete(model);
		return "customer-support/notice_delete";
	}
	
	@RequestMapping("/moim/moim_register")
	public String moim_register(HttpServletRequest req, Model model) {
		System.out.println("/moim/moim_register");
		model.addAttribute("req", req);
		
		return "moim/moim_register";
	}
	
	@RequestMapping("/moim/schedule/calendar")
	public String moim_calendar(HttpServletRequest req, Model model) {
		System.out.println("/moim/schedule/calendar");
		model.addAttribute("req", req);
		
		return "moim/schedule/calendar";
	}
}


