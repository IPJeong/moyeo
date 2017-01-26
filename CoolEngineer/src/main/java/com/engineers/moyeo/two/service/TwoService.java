package com.engineers.moyeo.two.service;

import org.springframework.ui.Model;

public interface TwoService {
	public String suggestionInputPro(Model model);
	public String suggestionList(Model model); 
	public String suggestionContentForm(Model model);
	public String suggestionCheckPro(Model model);
	
	public String placeList(Model model);
	public String placeContentForm(Model model);
	public String placeInputPro(Model model);
	public String placeDeletePro(Model model);
	public String placeModifyForm(Model model);
	public String placeModifyPro(Model model);
	
	public String recPlaceContentForm(Model model);
	public String recPlaceWriteForm(Model model);
	public String recPlaceWritePro(Model model);
	public String recPlaceDeletePro(Model model);
	public String recPlaceModifyForm(Model model);
	public String recPlaceModifyPro(Model model);
	public String plusPlaceLike(Model model);
	public String minusPlaceLike(Model model);
}
