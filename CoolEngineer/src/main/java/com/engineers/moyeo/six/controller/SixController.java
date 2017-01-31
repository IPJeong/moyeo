package com.engineers.moyeo.six.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.main.model.FileForm;
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
		sixService.moimRegister(model);
		
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
		sixService.moimRegisterPro(model);
		
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

	//모임일정-참석신청
	@RequestMapping("/moimSchedule/moimScheduleJoin")
	public String moimSheduleJoin(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleJoin");
		model.addAttribute("req", req);
		sixService.moimScheduleJoin(model);
		
		return "six/moimSchedule/moimScheduleJoin";
	}
	
	//모임일정-참석취소
	@RequestMapping("/moimSchedule/moimScheduleCancel")
	public String moimSheduleCancel(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleCancel");
		model.addAttribute("req", req);
		sixService.moimScheduleCancel(model);
		
		return "six/moimSchedule/moimScheduleCancel";
	}
	
	//모임일정-참석자명단보기
	@RequestMapping("/moimSchedule/moimScheduleMember")
	public String moimSheduleMember(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleMember");
		model.addAttribute("req", req);
		sixService.moimScheduleMember(model);
		
		return "six/moimSchedule/moimScheduleMember";
	}
	
	
	
	//고객지원 홈
	@RequestMapping("/cusSupMain")
	public String cusSupMain(HttpServletRequest req, Model model) {
		System.out.println("고객지원 홈");
		model.addAttribute("req", req);
		sixService.cusSupMain(model);
		
		return "one/qna/cusSupMain";
	}
	
	
	
	//모임카테고리-관심사별
	@RequestMapping("/category/category_hobby")
	public String categoryHobby(HttpServletRequest req, Model model) {
		System.out.println("/category/category_hobby");
		model.addAttribute("req", req);
		sixService.categoryHobby(model);
		
		return "six/category/category_hobby";
	}
	
	//모임카테고리-지역별
	@RequestMapping("/category/category_location")
	public String categoryLocation(HttpServletRequest req, Model model) {
		System.out.println("/category/category_location");
		model.addAttribute("req", req);
		sixService.categoryLocation(model);
		return "six/category/category_location";
	}
	
	//모임카테고리-연령별
	@RequestMapping("/category/category_scale")
	public String categoryAge(HttpServletRequest req, Model model) {
		System.out.println("/category/category_scale");
		model.addAttribute("req", req);
		sixService.categoryScale(model);
		return "six/category/category_scale";
	}
	
	
	
	//모임개설
	@RequestMapping("/category/moimOpen")
	public String moimOpen() {
		System.out.println("/category/moimOpen");
		
		return "six/category/moimOpen";
	}
	
	//모임개설 처리
	@RequestMapping("/category/moimOpenPro")
	public String moimOpenPro(HttpServletRequest req, Model model) {
		System.out.println("/category/moimOpenPro");
		model.addAttribute("req", req);
		sixService.moimOpenPro(model);
		
		return "six/category/moimOpenPro";
	}
	
	//모임-메인
	@RequestMapping("/moimMain/moimMain")
	public String moimMain(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimMain");
		model.addAttribute("req", req);
		sixService.moimMain(model);
		
		return "six/moimMain/moimMain";
	}
	
	//모임-모임정보수정
	@RequestMapping("/moimMain/moimModify")
	public String moimModify(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimModify");
		model.addAttribute("req", req);
		sixService.moimModify(model);
		
		return "six/moimMain/moimModify";
	}
	
	//모임-모임정보수정처리
	@RequestMapping("/moimMain/moimModifyPro")
	public String moimModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimModifyPro");
		model.addAttribute("req", req);
		sixService.moimModifyPro(model);
		
		return "six/moimMain/moimModifyPro";
	}
	
	//모임-모임폐쇄
	@RequestMapping("/moimMain/moimDelete")
	public String moimDelete(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimDelete");
		model.addAttribute("req", req);
		sixService.moimDelete(model);
		
		return "six/moimMain/moimDelete";
	}
	
	//모임-대표사진 등록
	@RequestMapping("/moimMain/moimAddImage")
	public String moimAddImage(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimAddImage");
		model.addAttribute("req", req);
				
		return "six/moimMain/moimAddImage";
	}
	
	//모임-대표사진 등록처리
	@RequestMapping("/moimMain/moimAddImagePro")
	public String moimAddImagePro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		System.out.println("/moimMain/moimAddImagePro");
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		
		sixService.moimAddImagePro(model);
		
		return "six/moimMain/moimAddImagePro";
	}
	
	//모임-소개사진 등록
	@RequestMapping("/moimMain/moimAddImageb")
	public String moimAddImageb(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimAddImageb");
		model.addAttribute("req", req);
				
		return "six/moimMain/moimAddImageb";
	}
	
	//모임-소개사진 등록처리
	@RequestMapping("/moimMain/moimAddImageProb")
	public String moimAddImageProb(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		System.out.println("/moimMain/moimAddImageProb");
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		
		sixService.moimAddImageProb(model);
		
		return "six/moimMain/moimAddImageProb";
	}
	
}


