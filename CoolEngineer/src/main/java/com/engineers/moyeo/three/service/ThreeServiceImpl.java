package com.engineers.moyeo.three.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.three.dao.ThreeDAO;
import com.engineers.moyeo.three.dto.ThreeDTO;

@Service("faq")
public class ThreeServiceImpl implements ThreeService{

	
	@Autowired
	ThreeDAO dao;

	@Override
	public String faq(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		int cnt2 = 0;
		
		cnt = dao.getCount();
		cnt2 = dao.getCount2();
		
		if(cnt > 0) {
			ArrayList<ThreeDTO> dtos = dao.getCategory();
			model.addAttribute("dtos", dtos);			
		}
		
		if(cnt2 > 0) {
			ArrayList<ThreeDTO> dtos2 = dao.getQuestions();
			model.addAttribute("dtos2", dtos2);
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("cnt2", cnt);		
		
		return "three/faq";
	}
	
	
	
}
