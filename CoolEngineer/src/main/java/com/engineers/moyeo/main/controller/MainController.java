package com.engineers.moyeo.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @기능 홈페이지의 메인페이지 관련 기능을 수행하는 컨트롤러
 * @author JIP
 * @최초작성일 2017.01.19
 * @최종수정일 2017.01.19
 */

@RequestMapping("/main")
@Controller
public class MainController {

	@Autowired
	com.engineers.moyeo.main.service.MainService mainService;
	
	// 모여의 메인페이지를 로드하는 메서드
	@RequestMapping("/home")
	public String home(){
		mainService.main();
		System.out.println("입력 완료");
		
		return "main/main";
	}
}
