package com.engineers.moyeo.main.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.engineers.moyeo.main.dao.MainDAO;
import com.engineers.moyeo.main.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.NoticeDTO;

@org.springframework.stereotype.Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDAO mainDao;

	@Autowired
	SixDAO sixDao;

	// 메인페이지가 로딩될 때 각종 정보를 읽어오는 메서드
	@Override
	public void main() {

		MemberInfoDTO dto = new MemberInfoDTO();
		dto.setMem_id("id");
		dto.setPasswd("123");
		dto.setName("양우진");
		dto.setAddress("서울시");
		dto.setTel("010-0000-0000");
		dto.setBirth(new Timestamp(System.currentTimeMillis()));
		dto.setEmail("woo@naver.com");

	}

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
	
	@Override
	public String memberLoginPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String mem_id = req.getParameter("mem_id");
		String passwd = req.getParameter("passwd");

		Map<String, String> daoMap = new HashMap<String, String>(); 
		daoMap.put("mem_id", mem_id);
		daoMap.put("passwd", passwd);
		
		int cnt = mainDao.pwdCheck(daoMap);
		
		if(cnt == 1) {
			req.getSession().setAttribute("mem_id", mem_id);
			model.addAttribute("cnt", cnt);
			return "main/memberLoginPro";
		} else {
			model.addAttribute("cnt", cnt);
			return "main/memberLoginPro";	
		}
	}
}