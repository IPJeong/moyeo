package com.engineers.moyeo.one.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.one.dao.OneDAO;
import com.engineers.moyeo.one.dto.ManagerDTO;
import com.engineers.moyeo.one.dto.MemberInformDTO;

@Service
public class OneManagerServiceImpl implements OneManagerService {

	@Autowired
	OneDAO oneDao;
	
	// 관리자화면 메인
	@Override
	public String managerMain(Model model) {
		
		return "one/manager/managerMain";
	}

	// 회원리스트 불러오기
	
	@Override
	public String guestList(Model model) {
		
		int pageSize = 8;
		int pageBlock = 3;
		
		int cnt = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		String pageNum = null;
		int currentPage = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		cnt = oneDao.getManagerCount();
		
		System.out.println("cnt: " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		
		if(cnt > 0) {
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			ArrayList<MemberInformDTO> dtos = oneDao.gerMemberArticles(daoMap);
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("cnt: " + cnt);
		
		if(cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "one/manager/guestList";
	}

	// 회원리스트 상세정보 불러오기
	@Override
	public String guestInform(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String mem_id = req.getParameter("mem_id");
		
		MemberInformDTO dto = oneDao.getMemberInformArticle(mem_id);
		
		model.addAttribute("dto", dto);
		
		return "one/manager/guestInform";
	}

	// 회원리스트 삭제하기
	@Override
	public String guestDelete(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String mem_id = req.getParameter("mem_id");
		
		int deleteCnt = oneDao.deleteInfo(mem_id);
		req.setAttribute("deleteCnt", deleteCnt);
		req.setAttribute("pageNum", pageNum);
		
		System.out.println("mem_id: " + mem_id);
		
		req.setAttribute("mem_id", mem_id);
		
		return "one/manager/guestDelete";
	}

	// 관리자 임명하기
	@Override
	public String adminAppoint(Model model) {
		
		return "one/manager/adminAppoint";
	}
	
	// 관리자 임명요청
	@Override
	public String adminAppointPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String manager_id = req.getParameter("manager_id");
		String passwd = req.getParameter("passwd");
		String name = req.getParameter("name");
		
		ManagerDTO dto = new ManagerDTO();
		
		dto.setManager_id(manager_id);
		dto.setPasswd(passwd);
		dto.setName(name);
		dto.setAuthority(Code.authority_2);
		
		System.out.println(manager_id);
		System.out.println(passwd);
		System.out.println(name);
		System.out.println(Code.authority_2);
		
		int cnt = oneDao.insertManager(dto);
		
		model.addAttribute("cnt", cnt);
		
		return "one/manager/adminAppointPro";
	}

	// 관리자 삭제
	@Override
	public String adminDelete(Model model) {
		
		int pageSize = 8;
		int pageBlock = 3;
		
		int cnt = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		String pageNum = null;
		int currentPage = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		cnt = oneDao.getManagerCount();
		
		System.out.println("cnt: " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		
		if(cnt > 0) {
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			ArrayList<ManagerDTO> dtos = oneDao.getManagerArticles(daoMap);
			model.addAttribute("dtos", dtos);
			
			ArrayList<ManagerDTO> mdtos = oneDao.getManagerArticles2(daoMap);
			model.addAttribute("mdtos", mdtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("cnt: " + cnt);
		
		if(cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		return "one/manager/adminDelete";
	}

	// 관리자가 모든 모임 조회
	@Override
	public String moimCheck(Model model) {
		
		int pageSize = 8;
		int pageBlock = 3;
		
		int cnt = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		String pageNum = null;
		int currentPage = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		cnt = oneDao.getManagerCount();
		
		System.out.println("cnt: " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		
		if(cnt > 0) {
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			ArrayList<MemberInformDTO> dtos = oneDao.gerMemberArticles(daoMap);
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("cnt: " + cnt);
		
		if(cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "one/manager/guestList";
	}

}
