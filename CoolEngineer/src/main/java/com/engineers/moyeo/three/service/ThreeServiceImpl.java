package com.engineers.moyeo.three.service;

import java.sql.Timestamp;
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
		model.addAttribute("cnt2", cnt2);		
		
		return "/three/faq/faq";
	}

	@Override
	public String faqInsertForm(Model model) {
		
		int cnt = 0;		
		
		cnt = dao.getCount();		
		
		if(cnt > 0) {
			ArrayList<ThreeDTO> dtos = dao.getCategory();
			model.addAttribute("dtos", dtos);			
		}					
		
		model.addAttribute("cnt", cnt);		
		
		return "/three/faq/faqInsertForm";
	}

	@Override
	public String faqCtgInput(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ThreeDTO dto = new ThreeDTO();
		
		String ctgName = req.getParameter("ctgName");		
		
		dto.setCtgName(ctgName);
		int cnt = 0;
		int cnt2 = dao.ctgCheck(dto);
		
		if(cnt2 == 0) {
			cnt = dao.insert(dto);			
		} else {
			cnt = -1;
		}
		
		model.addAttribute("cnt", cnt);
		
		return "/three/faq/faqCtgInput";
	}

	@Override
	public String faqInsert(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ThreeDTO dto = new ThreeDTO();
		
		String ctgName = req.getParameter("ctgName");
		String faqTitle = req.getParameter("faqTitle");
		String faqContent = req.getParameter("faqContent");
		String adminId = "admin"; /*(String) req.getSession().getAttribute("admin");*/
		Timestamp faqDate = new Timestamp(System.currentTimeMillis());
				
		dto.setFaqTitle(faqTitle);
		dto.setFaqContent(faqContent);
		dto.setFaqDate(faqDate);
		dto.setAdminId(adminId);
		dto.setCtgName(ctgName);
		
		int cnt = dao.insertFaq(dto);
		
		model.addAttribute("cnt", cnt);		
				
		return "/three/faq/faqInsert";
	}

	@Override
	public String faqCtgModify(Model model) {
		int cnt = 0;		
		
		cnt = dao.getCount();		
		
		if(cnt > 0) {
			ArrayList<ThreeDTO> dtos = dao.getCategory();
			model.addAttribute("dtos", dtos);			
		}					
		
		model.addAttribute("cnt", cnt);		
		
		return "/three/faq/faqCtgModify";
		
	}

	@Override
	public String faqCtgModifyPro(Model model) {
				
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ThreeDTO dto = new ThreeDTO();
		
		int cnt = 0;
		String ctgName = req.getParameter("ctgName");
		String ctgName2 = req.getParameter("ctgName2");
		
		System.out.println(ctgName + " " + ctgName2);
		dto.setCtgName(ctgName);
		dto.setCtgName2(ctgName2);
		
		cnt = dao.update(dto);		
		
		model.addAttribute("cnt", cnt);	
		
		return "/three/faq/faqCtgModifyPro";
	}

	@Override
	public String faqModifyForm(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int faqNum = Integer.parseInt(req.getParameter("faqNum"));
		int cnt = 0;
		
		ThreeDTO dto = dao.getInfo(faqNum);
		
		model.addAttribute("dto", dto);		
		
		cnt = dao.getCount();		
		
		if(cnt > 0) {
			ArrayList<ThreeDTO> dtos = dao.getCategory();
			model.addAttribute("dtos", dtos);			
		}					
		
		model.addAttribute("cnt", cnt);	
		
		return "/three/faq/faqModifyForm";
	}

	@Override
	public String faqModify(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ThreeDTO dto = new ThreeDTO();
		
		int faqNum = Integer.parseInt(req.getParameter("faqNum"));
		String ctgName = req.getParameter("ctgName");
		String faqTitle = req.getParameter("faqTitle");
		String faqContent = req.getParameter("faqContent");
		
				
		dto.setFaqTitle(faqTitle);
		dto.setFaqContent(faqContent);		
		dto.setCtgName(ctgName);
		dto.setFaqNum(faqNum);
		
		int cnt = dao.updateFaq(dto);
		
		model.addAttribute("cnt", cnt);
		
		return "/three/faq/faqModify";
	}

	@Override
	public String faqCtgDelete(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ThreeDTO dto = new ThreeDTO();
		
		int ctgNum = Integer.parseInt(req.getParameter("ctgNum"));
		String ctgName = req.getParameter("ctgName");
		
		dto.setCtgNum(ctgNum);
		dto.setCtgName(ctgName);
		
		int cnt = dao.delete(dto);
		model.addAttribute("cnt", cnt);
		
		return "/three/faq/faqCtgDelete";
	}

	@Override
	public String faqDelete(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ThreeDTO dto = new ThreeDTO();
		
		int faqNum = Integer.parseInt(req.getParameter("faqNum"));
		
		dto.setFaqNum(faqNum);
		
		int cnt = dao.deleteFaq(dto);
		
		model.addAttribute("cnt", cnt);
		
		return "/three/faq/faqDelete";
	}
	
	
	
}
