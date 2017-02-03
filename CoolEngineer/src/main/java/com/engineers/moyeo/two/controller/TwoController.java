package com.engineers.moyeo.two.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.two.service.TwoService;


/**
 * 
 * @author 신승우
 *
 */
@RequestMapping("/two")
@Controller
public class TwoController {
	
	@Autowired
	TwoService twoService;
	
	String viewPage;
	
	//건의사항 입력 페이지(회원)
	@RequestMapping("/suggestionInputForm")
	public String suggestionInputForm(HttpServletRequest req, Model model) {
		if(req.getSession().getAttribute("mem_id")==null) return "redirect:/main/memberLoginForm";
		
		viewPage = "two/suggestion/suggestionInputForm";
		return viewPage;
	}
	
	//건의사항 입력 처리(회원)
	@RequestMapping("/suggestionInputPro")
	public String suggestionInputPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.suggestionInputPro(model);
		return viewPage;
	}
	
	//건의사항 리스트(관리자)
	@RequestMapping("/suggestionList")
	public String suggestionList(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.suggestionList(model);
		return viewPage;
	}
	
	//건의사항 상세보기(관리자)
	@RequestMapping("/suggestionContentForm")
	public String suggestionContentForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.suggestionContentForm(model);
		return viewPage;
	}

	//건의사항 확인 처리(관리자)
	@RequestMapping("/suggestionCheckPro")
	public String suggestionCheckPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.suggestionCheckPro(model);
		return viewPage;
	}
	
	//장소정보&추천장소 메인페이지1
	@RequestMapping("/placeMainLoc")
	public String placeMainLoc(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeMainLoc(model);
		return viewPage;
	}
	
	//지역별 장소정보 검색
	@RequestMapping("/placeMainLocSearch")
	public String placeMainLocSearch(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeMainLocSearch(model);
		return viewPage;
	}
	
	//장소정보&추천장소 메인페이지2
	@RequestMapping("/placeMainRecpla")
	public String placeMainRecpla(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeMainRecpla(model);
		return viewPage;
	}
	
	//관심사별 장소정보 검색
	@RequestMapping("/placeMainRecplaSearch")
	public String placeMainRecplaSearch(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeMainRecplaSearch(model);
		return viewPage;
	}
	
	//전체 장소정보 리스트
	@RequestMapping("/placeList")
	public String placeList(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeList(model);
		return viewPage;
	}
	
	//장소정보 상세보기&추천장소 게시판
	@RequestMapping("/placeContentForm")
	public String placeContentForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeContentForm(model);
		return viewPage;
	}
	
	//장소정보 입력 페이지
	@RequestMapping("/placeInputForm")
	public String placeInputForm(HttpServletRequest req, Model model) {
		viewPage = "two/places/placeInputForm";
		return viewPage;
	}
	
	//장소정보 입력 처리
	@RequestMapping("/placeInputPro")
	public String placeInputPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		viewPage = twoService.placeInputPro(model);
		return viewPage;
	}
	
	//장소정보 삭제 처리
	@RequestMapping("/placeDeletePro")
	public String placeDeletePro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeDeletePro(model);
		return viewPage;
	}
	
	//장소정보 수정 페이지
	@RequestMapping("/placeModifyForm")
	public String placeModifyForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeModifyForm(model);
		return viewPage;
	}
	
	//장소정보 수정 처리
	@RequestMapping("/placeModifyPro")
	public String placeModifyPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		viewPage = twoService.placeModifyPro(model);
		return viewPage;
	}
	
	//추천장소 게시글 상세보기
	@RequestMapping("/recPlaceContentForm")
	public String recPlaceContentForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceContentForm(model);
		return viewPage;
	}
	
	//추천장소 게시글 작성 페이지
	@RequestMapping("/recPlaceWriteForm")
	public String recPlaceWriteForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceWriteForm(model);
		return viewPage;
	}

	//추천장소 게시글 작성 처리
	@RequestMapping("/recPlaceWritePro")
	public String recPlaceWritePro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceWritePro(model);
		return viewPage;
	}
	
	//추천장소 게시글 삭제 처리
	@RequestMapping("/recPlaceDeletePro")
	public String recPlaceDeletePro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceDeletePro(model);
		return viewPage;
	}
	
	//추천장소 게시글 수정 페이지
	@RequestMapping("/recPlaceModifyForm")
	public String recPlaceModifyForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceModifyForm(model);
		return viewPage;
	}
	
	//추천장소 게시글 수정 처리
	@RequestMapping("/recPlaceModifyPro")
	public String recPlaceModifyPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceModifyPro(model);
		return viewPage;
	}
	
	//추천장소 게시글에 추천을 누름
	@RequestMapping("/plusPlaceLike")
	public String plusPlaceLike(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.plusPlaceLike(model);
		return viewPage;
	}
	
	//추천장소 게시글에서 추천을 취소함
	@RequestMapping("/minusPlaceLike")
	public String minusPlaceLike(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.minusPlaceLike(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimInfoManaging")
	public String moimInfoManaging(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimInfoManaging(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimInfoManagingPro")
	public String moimInfoManagingPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimInfoManagingPro(model);
		return viewPage;
	}

	//
	@RequestMapping("/moimJoinForm")
	public String moimJoinForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimJoinForm(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimJoinPro")
	public String moimJoinPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimJoinPro(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimWithdraw")
	public String moimWithdraw(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimWithdraw(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimJoinManaging")
	public String moimJoinManaging(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimJoinManaging(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimJoinOK")
	public String moimJoinOK(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimJoinOK(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimJoinNO")
	public String moimJoinNO(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimJoinNO(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimMemberManaging")
	public String moimMemberManaging(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimMemberManaging(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimMemberRankForm")
	public String moimMemberRankForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimMemberRankForm(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimMemberRankPro")
	public String moimMemberRankPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimMemberRankPro(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimMemberBanish")
	public String moimMemberBanish(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimMemberBanish(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/moimBoardManaging")
	public String moimBoardManaging(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.moimBoardManaging(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/deleteNoticeBoardArticle")
	public String deleteNoticeBoardArticle(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.deleteNoticeBoardArticle(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/deleteGreetingBoardArticle")
	public String deleteGreetingBoardArticle(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.deleteGreetingBoardArticle(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/deletePostBoardArticle")
	public String deletePostBoardArticle(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.deletePostBoardArticle(model);
		return viewPage;
	}
	
}
