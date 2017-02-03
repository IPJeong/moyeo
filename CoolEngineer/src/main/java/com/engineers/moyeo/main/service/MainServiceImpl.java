package com.engineers.moyeo.main.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.engineers.moyeo.main.dao.MainDAO;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.NoticeDTO;

@org.springframework.stereotype.Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDAO mainDao;

	@Autowired
	SixDAO sixDao;

	//메인페이지에 공지사항 글 연동
	@Override
	public void main_notice(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int cnt = sixDao.getCount();
		
		if(cnt > 0) {
			ArrayList<NoticeDTO> dtos = sixDao.getArticles_main();
			req.setAttribute("dtos", dtos);
			req.setAttribute("pageNum", 1);
		}
	}
	
	// 로그인 프로세스
	@Override
	public String memberLoginPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String mem_id = req.getParameter("mem_id");
		String passwd = req.getParameter("passwd");
		String beforeurl = req.getParameter("beforeurl");
		
		Map<String, String> daoMap = new HashMap<String, String>(); 
		daoMap.put("mem_id", mem_id);
		daoMap.put("passwd", passwd);
		
		int cnt = mainDao.pwdCheck(daoMap);
		
		if(cnt == 1) {
			req.getSession().setAttribute("mem_id", mem_id);
			model.addAttribute("cnt", cnt);
			model.addAttribute("beforeurl", beforeurl);
			return "main/memberLoginPro";
		} else {
			model.addAttribute("cnt", cnt);
			return "main/memberLoginPro";	
		}
	}
}