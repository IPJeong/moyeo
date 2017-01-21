package com.engineers.moyeo.four.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@Autowired
	FourService fourService;
	
	@RequestMapping("/moim_notice_board")
	public String moim_gongji_list() {
		System.out.println("moim_notice_board 시작");
		return "moim/moim_notice_board";
	}
	
	@RequestMapping("/moim_notice_write_form")
	public String moim_notice_write_form() {
		System.out.println("moim_notice_write_form 시작");
		return "moim/moim_notice_write_form";
	}
	
	@RequestMapping("/home")
	public String home(){
		System.out.println("입력 완료");
		
		return "main/main";
	}
}
