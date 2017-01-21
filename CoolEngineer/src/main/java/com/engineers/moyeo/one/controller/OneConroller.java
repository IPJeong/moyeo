package com.engineers.moyeo.one.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	// 고객지원 홈
	@RequestMapping("/cusSupMain")
	public String cusSupMain() {
		System.out.println("고객지원 홈");
		viewPage = "one/cusSupMain";
		return viewPage;
	}
	
	// Q&A 홈
	@RequestMapping("/qna")
	public String qna() {
		System.out.println("Q&A 홈");
		viewPage = "one/qna";
		return viewPage;
	}
	
	// Q&A 질문 입력
	@RequestMapping("/qnaWrite")
	public String qnaWrite() {
		System.out.println("Q&A 질문 입력");
		viewPage = "one/qnaWrite";
		return viewPage;
	}
	
	// Q&A 질문 입력 확인
	@RequestMapping("/qnaWritePro")
	public String qnaWritePro() {
		System.out.println("Q&A 질문 입력 확인");
		viewPage = "";
		return viewPage;
	}
	
	// 모임신고 페이지
	@RequestMapping("/moimReport")
	public String moimReport() {
		System.out.println("모임신고 페이지");
		viewPage = "one/moimReport";
		return viewPage;
	}
	
	// 모임신고 작성 후 확인
	@RequestMapping("/moimReportPro")
	public String moimReportPro() {
		System.out.println("모임신고 작성 후 alert");
		viewPage = "one/moimReportPro";
		return viewPage;
	}
	
	@RequestMapping("moimMain")
	public String moimMain() {
		viewPage = "one/moimMain";
		return viewPage;
	}
}
