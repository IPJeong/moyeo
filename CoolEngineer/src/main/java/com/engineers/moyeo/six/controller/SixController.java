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
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.notice(model);
		return "six/notice/notice";
	}

	//공지-상세글정보
	@RequestMapping("/notice/noticeContent")
	public String noticeContents(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeContent");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeContent(model);
		return "six/notice/noticeContent";
	}

	//공지-글쓰기
	@RequestMapping("/notice/noticeWrite")
	public String noticeWrite(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeWrite");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeWrite(model);
		return "six/notice/noticeWrite";
	}

	//공지-글쓰기 처리
	@RequestMapping("/notice/noticeWritePro")
	public String noticeWritePro(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeWritePro");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeWritePro(model);
		return "six/notice/noticeWritePro";
	}

	//공지-글수정
	@RequestMapping("/notice/noticeModify")
	public String noticeModify(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeModify");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeModify(model);
		return "six/notice/noticeModify";
	}

	//공지-글수정 처리
	@RequestMapping("/notice/noticeModifyPro")
	public String noticeModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeModify");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeModifyPro(model);
		return "six/notice/noticeModifyPro";
	}

	//공지-글삭제
	@RequestMapping("/notice/noticeDelete")
	public String noticeDelete(HttpServletRequest req, Model model) {
		System.out.println("/customerSupport/noticeDelete");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);

		sixService.noticeDelete(model);
		return "six/notice/noticeDelete";
	}

	//모임일정-리스트
	@RequestMapping("/moimSchedule/moimSchedule")
	public String moimSchedule(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimSchedule");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleDetail(model);
		
		return "six/moimSchedule/moimSchedule";
	}

	//모임일정-등록
	@RequestMapping("/moimSchedule/moimRegister")
	public String moimRegister(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimRegister");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimRegister(model);
		
		return "six/moimSchedule/moimRegister";
	}

	//모임일정-등록시 지도선택
	@RequestMapping("/moimSchedule/moimRegisterMap")
	public String moimRegisterMap(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimRegisterMap");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
	
		return "six/moimSchedule/moimRegisterMap";
	}

	//모임일정-등록처리
	@RequestMapping("/moimSchedule/moimRegisterPro")
	public String moimRegisterPro(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimRegisterPro");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimRegisterPro(model);
		
		return "six/moimSchedule/moimRegisterPro";
	}
	
	//모임일정-상세페이지
	@RequestMapping("/moimSchedule/moimScheduleContents")
	public String moimScheduleContets(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleContents");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleContents(model);
		
		return "six/moimSchedule/moimScheduleContents";
	}

	//모임일정-수정페이지
	@RequestMapping("/moimSchedule/moimScheduleModify")
	public String moimScheduleModify(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleModify");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleModify(model);
		
		return "six/moimSchedule/moimScheduleModify";
	}
	
	//모임일정-수정처리
	@RequestMapping("/moimSchedule/moimScheduleModifyPro")
	public String moimScheduleModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleModifyPro");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleModifyPro(model);
		
		return "six/moimSchedule/moimScheduleModifyPro";
	}
	
	//모임일정-삭제처리
	@RequestMapping("/moimSchedule/moimScheduleDelete")
	public String moimScheduleDelete(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleDelete");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleDelete(model);
		
		return "six/moimSchedule/moimScheduleDelete";
	}

	//모임일정-참석신청
	@RequestMapping("/moimSchedule/moimScheduleJoin")
	public String moimSheduleJoin(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleJoin");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleJoin(model);
		
		return "six/moimSchedule/moimScheduleJoin";
	}
	
	//모임일정-참석취소
	@RequestMapping("/moimSchedule/moimScheduleCancel")
	public String moimScheduleCancel(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleCancel");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleCancel(model);
		
		return "six/moimSchedule/moimScheduleCancel";
	}
	
	//모임일정-참석자명단보기
	@RequestMapping("/moimSchedule/moimScheduleMember")
	public String moimScheduleMember(HttpServletRequest req, Model model) {
		System.out.println("/moimSchedule/moimScheduleMember");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimScheduleMember(model);
		
		return "six/moimSchedule/moimScheduleMember";
	}
	
	
	
	//고객지원 홈
	@RequestMapping("/cusSupMain")
	public String cusSupMain(HttpServletRequest req, Model model) {
		System.out.println("고객지원 홈");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.cusSupMain(model);
		
		return "one/qna/cusSupMain";
	}
	
	
	
	//모임카테고리-관심사별
	@RequestMapping("/category/category_hobby")
	public String categoryHobby(HttpServletRequest req, Model model) {
		System.out.println("/category/category_hobby");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.categoryHobby(model);
		
		return "six/category/category_hobby";
	}
	
	//모임카테고리-지역별
	@RequestMapping("/category/category_location")
	public String categoryLocation(HttpServletRequest req, Model model) {
		System.out.println("/category/category_location");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.categoryLocation(model);
		return "six/category/category_location";
	}
	
	//모임카테고리-규모별
	@RequestMapping("/category/category_scale")
	public String categoryScale(HttpServletRequest req, Model model) {
		System.out.println("/category/category_scale");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.categoryScale(model);
		return "six/category/category_scale";
	}
	
	
	
	//모임개설
	@RequestMapping("/category/moimOpen")
	public String moimOpen(HttpServletRequest req) {
		System.out.println("/category/moimOpen");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		return "six/category/moimOpen";
	}
	
	//모임개설 처리
	@RequestMapping("/category/moimOpenPro")
	public String moimOpenPro(HttpServletRequest req, Model model) {
		System.out.println("/category/moimOpenPro");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimOpenPro(model);
				
		return "six/category/moimOpenPro";
	}
	
	//모임-메인
	@RequestMapping("/moimMain/moimMain")
	public String moimMain(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimMain");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimMain(model);
		
		return "six/moimMain/moimMain";
	}
	
	//모임-모임정보수정
	@RequestMapping("/moimMain/moimModify")
	public String moimModify(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimModify");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimModify(model);
		
		return "six/moimMain/moimModify";
	}
	
	//모임-모임정보수정처리
	@RequestMapping("/moimMain/moimModifyPro")
	public String moimModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimModifyPro");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimModifyPro(model);
		
		return "six/moimMain/moimModifyPro";
	}
	
	//모임-모임폐쇄
	@RequestMapping("/moimMain/moimDelete")
	public String moimDelete(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimDelete");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimDelete(model);
		
		return "six/moimMain/moimDelete";
	}
	
	//모임-대표사진 등록
	@RequestMapping("/moimMain/moimAddImage")
	public String moimAddImage(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimAddImage");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
				
		return "six/moimMain/moimAddImage";
	}
	
	//모임-대표사진 등록처리
	@RequestMapping("/moimMain/moimAddImagePro")
	public String moimAddImagePro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		System.out.println("/moimMain/moimAddImagePro");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		
		sixService.moimAddImagePro(model);
		
		return "six/moimMain/moimAddImagePro";
	}
	
	//모임-소개사진 등록
	@RequestMapping("/moimMain/moimAddImageb")
	public String moimAddImageB(HttpServletRequest req, Model model) {
		System.out.println("/moimMain/moimAddImageb");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
				
		return "six/moimMain/moimAddImageb";
	}
	
	//모임-소개사진 등록처리
	@RequestMapping("/moimMain/moimAddImageProb")
	public String moimAddImageProB(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		System.out.println("/moimMain/moimAddImageProb");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		sixService.moimAddImageProb(model);
		
		return "six/moimMain/moimAddImageProb";
	}
	
	//모임-채팅참석폼
	@RequestMapping("/moimChat/moimChatForm")
	public String moimChatForm(HttpServletRequest req, Model model) {
		System.out.println("/moimChat/moimChatForm");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimChatForm(model);
		
		return "six/moimChat/moimChatForm";
	}
	
	//모임-채팅방
	@RequestMapping("/moimChat/moimChat")
	public String moimChat(HttpServletRequest req, Model model) {
		System.out.println("/moimChat/moimChat");
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimChat(model);
		
		return "six/moimChat/moimChat";
	}
	

	// 채팅방 내용입력
	@RequestMapping("/moimChat/addChat")
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
		if(req.getSession().getAttribute("mem_id")==null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.moimMemberDetail(model);
		
		return "six/moimMain/moimMemberDetail";
	}
	
	//모임-관심모임 등록삭제처리
	@RequestMapping("/moimMain/favorite")
	public ModelAndView favorite(HttpServletRequest req) {
		mav = new ModelAndView("JSON");
		System.out.println("/moimMain/favorite");
		sixService.favorite(mav, req);
		
		return mav;
	}

	//모임카테고리-상세목록
	@RequestMapping("/category/category_detail")
	public String categoryDetail(HttpServletRequest req, Model model) {
		System.out.println("/category/category_detail");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.categoryDetail(model);
		
		return "six/category/category_detail";
	}	

	//모임카테고리-추천모임상세목록
	@RequestMapping("/category/recommend_detail")
	public String recommendDetail(HttpServletRequest req, Model model) {
		System.out.println("/category/recommend_detail");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.categoryDetail(model);
		
		return "six/category/recommend_detail";
	}
	
	//샵-판매자등록 양식
	@RequestMapping("/shop/sellerRegister")
	public String sellerRegister(HttpServletRequest req, Model model) {
		System.out.println("/shop/sellerRegister");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		
		return "six/shop/sellerRegister";
	}
	
	//샵-판매자등록 처리
	@RequestMapping("/shop/sellerRegisterPro")
	public String sellerRegisterPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req,  Model model) {
		
		System.out.println("/shop/sellerRegisterPro");
		if(req.getSession().getAttribute("mem_id")==null&&req.getSession().getAttribute("manager_id")==null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		sixService.sellerRegisterPro(model);
		
		return "six/shop/sellerRegisterPro";
	}
	
	//샵-주소api
	@RequestMapping("/shop/jusoPopup")
	public String jusoPopup(HttpServletRequest req, Model model) {
		System.out.println("/shop/jusoPopup");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		
		return "six/shop/jusoPopup";
	}
	
	//샵-제품 상세보기
	@RequestMapping("/shop/productDetail")
	public String productDetail(HttpServletRequest req, Model model) {
		System.out.println("/shop/productDetail");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.productDetail(model);
		
		return "six/shop/productDetail";
	}

	//샵-구매
	@RequestMapping("/shop/buy")
	public String buy(HttpServletRequest req, Model model) {
		System.out.println("/shop/buy");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.buy(model);
		
		return "six/shop/buy";
	}
	
	//샵-결제&구매처리
	@RequestMapping("/shop/order")
	public String order(HttpServletRequest req, Model model) {
		System.out.println("/shop/order");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.order(model);
		
		return "six/shop/order";
	}

	//샵-구매후기 입력창
	@RequestMapping("/shop/productReview")
	public String productReview(HttpServletRequest req, Model model) {
		System.out.println("/shop/productReview");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.productReview(model);
		
		return "six/shop/productReview";
	}
	
	//샵-구매후기 입력결과 처리
	@RequestMapping("/shop/productReviewPro")
	public String productReviewPro(HttpServletRequest req, Model model) {
		System.out.println("/shop/productReviewPro");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.productReviewPro(model);
		
		return "six/shop/productReviewPro";
	}
	
	//샵-상품문의 입력창
	@RequestMapping("/shop/inquire")
	public String inquire(HttpServletRequest req, Model model) {
		System.out.println("/shop/inquire");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.productReview(model);
		
		return "six/shop/inquire";
	}
	
	//샵-상품문의 입력결과 처리
	@RequestMapping("/shop/inquirePro")
	public String inquirePro(HttpServletRequest req, Model model) {
		System.out.println("/shop/inquirePro");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.inquirePro(model);
		
		return "six/shop/inquirePro";
	}
	
	//샵-주문확인
	@RequestMapping("/shop/buyResult")
	public String buyResult(HttpServletRequest req, Model model) {
		System.out.println("/shop/buyResult");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.buyResult(model);
		
		return "six/shop/buyResult";
	}
	
	//샵-구매후기삭제
	@RequestMapping("/shop/productReviewDelete")
	public String productReviewDelete(HttpServletRequest req, Model model) {
		System.out.println("/shop/productReviewDelete");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.productReviewDelete(model);
		
		return "six/shop/productReviewDelete";
	}
	
	//샵-문의삭제
	@RequestMapping("/shop/productQnaDelete")
	public String productQnaDelete(HttpServletRequest req, Model model) {
		System.out.println("/shop/productQnaDelete");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.productQnaDelete(model);
		
		return "six/shop/productQnaDelete";
	}
	
	//샵-구매후기 수정
	@RequestMapping("/shop/productReviewModify")
	public String productReviewModify(HttpServletRequest req, Model model) {
		System.out.println("/shop/productReviewModify");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.productReviewModify(model);
		
		return "six/shop/productReviewModify";
	}
	
	//샵-구매후기 수정처리
	@RequestMapping("/shop/productReviewModifyPro")
	public String productReviewModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/shop/productReviewModifyPro");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.productReviewModifyPro(model);
		
		return "six/shop/productReviewModifyPro";
	}
	
	//샵-상품문의 수정창
	@RequestMapping("/shop/inquireModify")
	public String inquireModify(HttpServletRequest req, Model model) {
		System.out.println("/shop/inquireModify");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.inquireModify(model);
		
		return "six/shop/inquireModify";
	}
	
	//샵-상품문의 수정처리
	@RequestMapping("/shop/inquireModifyPro")
	public String inquireModifyPro(HttpServletRequest req, Model model) {
		System.out.println("/shop/inquireModifyPro");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.inquireModifyPro(model);
		
		return "six/shop/inquireModifyPro";
	}
	
	//샵-상세주문내역
	@RequestMapping("/shop/orderDetail")
	public String orderDetail(HttpServletRequest req, Model model) {
		System.out.println("/shop/orderDetail");
		if(req.getSession().getAttribute("mem_id") == null && req.getSession().getAttribute("manager_id") == null)return "redirect:/main/memberLoginForm";
		model.addAttribute("req", req);
		sixService.orderDetail(model);
		return "six/shop/orderDetail";
	}

}

