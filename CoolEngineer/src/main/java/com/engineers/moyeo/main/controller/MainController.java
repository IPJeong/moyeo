package com.engineers.moyeo.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.engineers.moyeo.main.service.MainService;
import com.engineers.moyeo.six.service.SixService;

/**
 * @기능 홈페이지의 메인페이지 관련 기능을 수행하는 컨트롤러
 * @author JIP
 * @최초작성일 2017.01.19
 * @최종수정일 2017.02.13
 */

@RequestMapping("/main")
@Controller
public class MainController {

	@Autowired
	MainService mainService;
	
	@Autowired
	SixService sixService;
	
	String viewPage;
	
	ModelAndView mav;
	
	// 모여의 메인페이지를 로드하는 메서드
	@RequestMapping("/home")
	public String home(HttpServletRequest req, Model model) {
		
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id")==null )return "redirect:/main/memberLoginForm";
		
		model.addAttribute("req", req);
		// 회원정보 가져오기
		mainService.getMemberInfo(model);
		// 공지사항 가져오기
		mainService.main_notice(model);
		// 인기모임 가져오기
		mainService.hotMoim(model);
		// 모임후기 가져오기
		mainService.main_meeting_post(model);
		// 추천모임 가져오기
		mainService.recommendMoim(model);
		// 모임후기 사진, 동영상 가져오기
		mainService.getMeetingPostList(model);
		// 추천장소 가져오기
		mainService.recPlace(model);
		// 이벤트 내역 가져오기
		mainService.getEventList(model);
		// 제품정보 가져오기
		mainService.getProducts(model);
		
		return "main/main";
	}
	
	// 회원로그인 페이지
	@RequestMapping("/memberLoginForm") 
	public String memberLoginForm(HttpServletRequest req, Model model) {
		req.getSession().setAttribute("loginPage", true);
		System.out.println("로그인 페이지");
		viewPage = "main/memberLoginForm";
		return viewPage;
	}
	
	// 회원로그인 프로세스
	@RequestMapping(value="/memberLoginPro")
	public String loginPro(HttpServletRequest req, Model model) {
		System.out.println("로그인 프로세스 호출");
		model.addAttribute("req", req);
		viewPage = mainService.memberLoginPro(model);
		return viewPage;
	}
	
	// 회원로그아웃
	@RequestMapping(value="/memberLogout", method=RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		System.out.println("로그아웃 프로세스 호출");
		req.getSession().invalidate();
		viewPage = "redirect:/main/memberLoginForm";
		return viewPage;
	}
	
	// 회사소개 페이지
	@RequestMapping(value="/introduce/introduce")
	public String introduce(HttpServletRequest req){
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id")==null )return "redirect:/main/memberLoginForm";
		System.out.println("회사소개 페이지 로드");
		viewPage = "introduce/introduce";
		return viewPage;
	}
	
	// 회사연혁 페이지
	@RequestMapping(value="/introduce/introduce2")
	public String introduce2(HttpServletRequest req){
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id")==null )return "redirect:/main/memberLoginForm";
		System.out.println("회사연혁소개 페이지 로드");
		viewPage = "introduce/introduce2";
		return viewPage;
	}
	
	// 회사연혁 페이지
	@RequestMapping(value="/introduce/introduce3")
	public String introduce3(HttpServletRequest req){
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id")==null )return "redirect:/main/memberLoginForm";
		System.out.println("회사 구성원 소개 페이지 로드");
		viewPage = "introduce/introduce3";
		return viewPage;
	}
	
	// 메인화면의 워드클라우드 재검색
	@ResponseBody
	@RequestMapping(value="/refreshWordcloud", produces = "application/json; charset=utf8")
	public String refreshWordcloud(Model model, HttpServletRequest req, HttpServletResponse res) {
		
		System.out.println("워드클라우드 재검색 요청");
		model.addAttribute("req", req);
		viewPage = mainService.wordcloudRefresh(model);
		
		return viewPage;
	}
	
	// 메인 갤러리 더보기(사진)
	@RequestMapping(value="/main_gallery")
	public String main_gallery(Model model, HttpServletRequest req) {
		
		System.out.println("메인갤러리 사진 앨범 보기 요청");
		model.addAttribute("req", req);
		mainService.getPostPictures(model);
		
		return "five/main/main_gallery";
	}
	
	// 메인 갤러리 더보기(동영상)
	@RequestMapping(value="/main_gallery_video")
	public String main_gallery_video(Model model, HttpServletRequest req) {
		
		System.out.println("메인갤러리 동영상 앨범 보기 요청");
		model.addAttribute("req", req);
		mainService.getPostVideos(model);
		
		return "five/main/main_gallery_video";
	}
	
	// 메인사진 클릭시 모임후기 정보 조회
	@RequestMapping(value="/main_postDetail")
	public ModelAndView getPostDetails(HttpServletRequest req) {
				
		System.out.println("모임후기 정보조회");
		mav = new ModelAndView("JSON");
		mainService.getPostDetails(req, mav);
		return mav;
		
	}
	
}
