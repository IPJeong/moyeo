package com.engineers.moyeo.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/error")
@Controller
public class ErrorPageHandler {

	
	// 400에러 페이지
	@RequestMapping(value="/error400")
	public String error400() {
		System.out.println("400에러 발생");
		return "error/error400";
	}
	
	// 404에러 페이지
	@RequestMapping(value="/error404")
	public String error404() {
		System.out.println("404에러 발생");
		return "error/error404";
	}
	
	// 405에러 페이지
	@RequestMapping(value="/error405")
	public String error405() {
		System.out.println("405에러 발생");
		return "error/error405";
	}
	
	// 500에러 페이지
	@RequestMapping(value="/error500")
	public String error500() {
		System.out.println("500에러 발생");
		return "error/error500";
	}
	
	// 502에러 페이지
	@RequestMapping(value="/error502")
	public String error502() {
		System.out.println("502에러 발생");
		return "error/error502";
	}
}

