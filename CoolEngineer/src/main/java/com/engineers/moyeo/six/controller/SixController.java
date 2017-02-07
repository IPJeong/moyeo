package com.engineers.moyeo.six.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.model.FileForm;


/**
 * 
 * @author 하대성
 *
 */
@RequestMapping("/six")
@Controller
public class SixController {
//멋진 정일품
	@Autowired
	com.engineers.moyeo.six.service.SixService sixService;
	private ModelAndView mav;
	
	//공지-메인
	@RequestMapping("/notice/notice")
	public String notice(HttpServletRequest req, Model model) {
		System.out.println("/customer-support/notice");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.notice(model);
		return "six/notice/notice";
	}

	//공지-상세글정보
	@RequestMapping("/notice/noticeContent")
	public String noticeContents(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeContent");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeContent(model);
		return "six/notice/noticeContent";
	}

	//공지-글쓰기
	@RequestMapping("/notice/noticeWrite")
	public String noticeWrite(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeWrite");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeWrite(model);
		return "six/notice/noticeWrite";
	}

	//공지-글쓰기 처리
	@RequestMapping("/notice/noticeWritePro")
	public String noticeWritePro(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeWritePro");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeWritePro(model);
		return "six/notice/noticeWritePro";
	}

	//공지-글수정
	@RequestMapping("/notice/noticeModify")
	public String noticeModify(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeModify");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeModify(model);
		return "six/notice/noticeModify";
	}

	//공지-글수정 처리
	@RequestMapping("/notice/noticeModifyPro")
	public String noticeModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeModify");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeModifyPro(model);
		return "six/notice/noticeModifyPro";
	}

	//공지-글삭제
	@RequestMapping("/notice/noticeDelete")
	public String noticeDelete(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeDelete");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeDelete(model);
		return "six/notice/noticeDelete";
	}

	//모임일정-리스트
	@RequestMapping("/moimSchedule/moimSchedule")
	public String moimSchedule(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimSchedule");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleDetail(model);
		
		return "six/moimSchedule/moimSchedule";
	}

	//모임일정-등록
	@RequestMapping("/moimSchedule/moimRegister")
	public String moimRegister(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimRegister");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimRegister(model);
		
		return "six/moimSchedule/moimRegister";
	}

	//모임일정-등록시 지도선택
	@RequestMapping("/moimSchedule/moimRegisterMap")
	public String moimRegisterMap(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimRegisterMap");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
	
		return "six/moimSchedule/moimRegisterMap";
	}

	//모임일정-등록처리
	@RequestMapping("/moimSchedule/moimRegisterPro")
	public String moimRegisterPro(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimRegisterPro");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimRegisterPro(model);
		
		return "six/moimSchedule/moimRegisterPro";
	}
	
	//모임일정-상세페이지
	@RequestMapping("/moimSchedule/moimScheduleContents")
	public String moimScheduleContets(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleContents");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleContents(model);
		
		return "six/moimSchedule/moimScheduleContents";
	}

	//모임일정-수정페이지
	@RequestMapping("/moimSchedule/moimScheduleModify")
	public String moimScheduleModify(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleModify");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleModify(model);
		
		return "six/moimSchedule/moimScheduleModify";
	}
	
	//모임일정-수정처리
	@RequestMapping("/moimSchedule/moimScheduleModifyPro")
	public String moimScheduleModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleModifyPro");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleModifyPro(model);
		
		return "six/moimSchedule/moimScheduleModifyPro";
	}
	
	//모임일정-삭제처리
	@RequestMapping("/moimSchedule/moimScheduleDelete")
	public String moimScheduleDelete(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleDelete");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleDelete(model);
		
		return "six/moimSchedule/moimScheduleDelete";
	}

	//모임일정-참석신청
	@RequestMapping("/moimSchedule/moimScheduleJoin")
	public String moimSheduleJoin(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleJoin");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleJoin(model);
		
		return "six/moimSchedule/moimScheduleJoin";
	}
	
	//모임일정-참석취소
	@RequestMapping("/moimSchedule/moimScheduleCancel")
	public String moimSheduleCancel(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleCancel");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleCancel(model);
		
		return "six/moimSchedule/moimScheduleCancel";
	}
	
	//모임일정-참석자명단보기
	@RequestMapping("/moimSchedule/moimScheduleMember")
	public String moimSheduleMember(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleMember");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleMember(model);
		
		return "six/moimSchedule/moimScheduleMember";
	}
	
	
	
	//고객지원 홈
	@RequestMapping("/cusSupMain")
	public String cusSupMain(HttpServletRequest req, Model model) {
		System.out.println("고객지원 홈");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.cusSupMain(model);
		
		return "one/qna/cusSupMain";
	}
	
	
	
	//모임카테고리-관심사별
	@RequestMapping("/category/category_hobby")
	public String categoryHobby(HttpServletRequest req, Model model) {
		System.out.println("/category/category_hobby");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.categoryHobby(model);
		
		return "six/category/category_hobby";
	}
	
	//모임카테고리-지역별
	@RequestMapping("/category/category_location")
	public String categoryLocation(HttpServletRequest req, Model model) {
		System.out.println("/category/category_location");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.categoryLocation(model);
		return "six/category/category_location";
	}
	
	//모임카테고리-연령별
	@RequestMapping("/category/category_scale")
	public String categoryAge(HttpServletRequest req, Model model) {
		System.out.println("/category/category_scale");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.categoryScale(model);
		return "six/category/category_scale";
	}
	
	
	
	//모임개설
	@RequestMapping("/category/moimOpen")
	public String moimOpen(HttpServletRequest req) {
		System.out.println("/category/moimOpen");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		return "six/category/moimOpen";
	}
	
	//모임개설 처리
	@RequestMapping("/category/moimOpenPro")
	public String moimOpenPro(HttpServletRequest req, Model model) {
		System.out.println("/category/moimOpenPro");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimOpenPro(model);
		/*sixService.*/
		
		return "six/category/moimOpenPro";
	}
	
	//모임-메인
	@RequestMapping("/moimMain/moimMain")
	public String moimMain(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimMain");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimMain(model);
		
		return "six/moimMain/moimMain";
	}
	
	//모임-모임정보수정
	@RequestMapping("/moimMain/moimModify")
	public String moimModify(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimModify");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimModify(model);
		
		return "six/moimMain/moimModify";
	}
	
	//모임-모임정보수정처리
	@RequestMapping("/moimMain/moimModifyPro")
	public String moimModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimModifyPro");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimModifyPro(model);
		
		return "six/moimMain/moimModifyPro";
	}
	
	//모임-모임폐쇄
	@RequestMapping("/moimMain/moimDelete")
	public String moimDelete(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimDelete");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimDelete(model);
		
		return "six/moimMain/moimDelete";
	}
	
	//모임-대표사진 등록
	@RequestMapping("/moimMain/moimAddImage")
	public String moimAddImage(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimAddImage");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
				
		return "six/moimMain/moimAddImage";
	}
	
	//모임-대표사진 등록처리
	@RequestMapping("/moimMain/moimAddImagePro")
	public String moimAddImagePro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		System.out.println("/moimMain/moimAddImagePro");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		
		sixService.moimAddImagePro(model);
		
		return "six/moimMain/moimAddImagePro";
	}
	
	//모임-소개사진 등록
	@RequestMapping("/moimMain/moimAddImageb")
	public String moimAddImageb(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimAddImageb");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
				
		return "six/moimMain/moimAddImageb";
	}
	
	//모임-소개사진 등록처리
	@RequestMapping("/moimMain/moimAddImageProb")
	public String moimAddImageProb(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		System.out.println("/moimMain/moimAddImageProb");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		sixService.moimAddImageProb(model);
		
		return "six/moimMain/moimAddImageProb";
	}
	
	//모임-채팅참석폼
	@RequestMapping("/moimChat/moimChatForm")
	public String moimChatForm(HttpServletRequest req, Model model) {
		System.out.println("/moimChat/moimChatForm");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimChatForm(model);
		
		return "six/moimChat/moimChatForm";
	}
	
	//모임-채팅방
	@RequestMapping("/moimChat/moimChat")
	public String moimChat(HttpServletRequest req, Model model) {
		System.out.println("/moimChat/moimChat");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimChat(model);
		
		return "six/moimChat/moimChat";
	}
	

	// 채팅방 내용입력
	@RequestMapping(value="/moimChat/addChat", method=RequestMethod.POST)
	public ModelAndView addChat(HttpServletRequest req) {
		mav = new ModelAndView("JSON");
		System.out.println("채팅내용입력");
		try {
			sixService.addChat(mav, req);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
	
	// 채팅방 내용불러오기
	@RequestMapping(value="/moimChat/getChat", method=RequestMethod.POST)
	public ModelAndView getChat(HttpServletRequest req) {
		mav = new ModelAndView("JSON");
		System.out.println("채팅내용출력");
		try {
			sixService.getChat(mav, req);
		} catch(NumberFormatException e) {
			e.printStackTrace();
			System.out.println(Code.numForExceptionMsg);
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println(Code.nullPoExceptionMsg);
		}
		return mav;
	}
	
	
	//모임-모임멤버 상세보기
	@RequestMapping("/moimMain/moimMemberDetail")
	public String moimMemberDetail(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimMemberDetail");
		if(req.getSession().getAttribute("mem_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimMemberDetail(model);
		
		return "six/moimMain/moimMemberDetail";
	}

}

