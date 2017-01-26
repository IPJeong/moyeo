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
	
	//
	@RequestMapping("/suggestionInputForm")
	public String suggestionInputForm(HttpServletRequest req, Model model) {
		req.getSession().setAttribute("mem_id", "guest");
		
		viewPage = "two/suggestion/suggestionInputForm";
		return viewPage;
	}
	
	//
	@RequestMapping("/suggestionInputPro")
	public String suggestionInputPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.suggestionInputPro(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/suggestionList")
	public String suggestionList(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.suggestionList(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/suggestionContentForm")
	public String suggestionContentForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.suggestionContentForm(model);
		return viewPage;
	}

	//
	@RequestMapping("/suggestionCheckPro")
	public String suggestionCheckPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.suggestionCheckPro(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/placeMainRecpla")
	public String placeMainRecpla(HttpServletRequest req, Model model) {
		viewPage = "two/places/placeMainRecpla";
		return viewPage;
	}
	
	//
	@RequestMapping("/placeMainLoc")
	public String placeMainLoc(HttpServletRequest req, Model model) {
		viewPage = "two/places/placeMainLoc";
		return viewPage;
	}
	
	//
	@RequestMapping("/placeList")
	public String placeList(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeList(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/placeContentForm")
	public String placeContentForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeContentForm(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/placeInputForm")
	public String placeInputForm(HttpServletRequest req, Model model) {
		viewPage = "two/places/placeInputForm";
		return viewPage;
	}
	
	//
	@RequestMapping("/placeInputPro")
	public String placeInputPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		viewPage = twoService.placeInputPro(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/placeDeletePro")
	public String placeDeletePro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeDeletePro(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/placeModifyForm")
	public String placeModifyForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.placeModifyForm(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/placeModifyPro")
	public String placeModifyPro(@ModelAttribute("uploadForm") FileForm fileForm, HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		model.addAttribute("fileForm", fileForm);
		viewPage = twoService.placeModifyPro(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/recPlaceContentForm")
	public String recPlaceContentForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceContentForm(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/recPlaceWriteForm")
	public String recPlaceWriteForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceWriteForm(model);
		return viewPage;
	}

	//
	@RequestMapping("/recPlaceWritePro")
	public String recPlaceWritePro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceWritePro(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/recPlaceDeletePro")
	public String recPlaceDeletePro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceDeletePro(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/recPlaceModifyForm")
	public String recPlaceModifyForm(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceModifyForm(model);
		return viewPage;
	}
	
	//
	@RequestMapping("/recPlaceModifyPro")
	public String recPlaceModifyPro(HttpServletRequest req, Model model) {
		model.addAttribute("req", req);
		viewPage = twoService.recPlaceModifyPro(model);
		return viewPage;
	}
}
