package com.engineers.moyeo.six.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.NoticeDTO;

@Service
public class SixServiceImpl implements SixService{

	@Autowired
	SixDAO sixDao;

	//공지-메인
	@Override
	public void notice(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int pageSize = 10;		//한 페이지당 출력할 글 개수
		int pageBlock = 10;		//출력할 페이지 개수
		int cnt = 0;  			//글 개수
		int start = 0;			//현재 페이지 시작 : rownum
		int end = 0;			//현재 페이지 끝번호 : rownum
		int number = 0; 		//출력할 글 번호
		String pageNum = null;  //페이지 변호
		int currentPage = 0;	//현재 페이지
		int pageCount = 0;		//페이지 개수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지

		cnt = sixDao.getCount();
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";  //첫페이지를 1페이지로 설정
		}

		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1; //(5 - 1) * 10 + 1;
		end = start + pageSize - 1; //41 + 10 - 1 = 50;

		if(end > cnt) end = cnt;
		number = cnt - (currentPage - 1) * pageSize;

		if(cnt > 0) {
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			ArrayList<NoticeDTO> dtos = sixDao.getArticles(daoMap);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;

		endPage = startPage + pageBlock - 1; 
		if(endPage > pageCount) endPage = pageCount;

		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);

		if(cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
	}

	//공지-상세글 정보
	@Override
	public void noticeContent(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int noti_num = Integer.parseInt(req.getParameter("noti_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		NoticeDTO dto = sixDao.getArticle(noti_num);
		sixDao.addReadCnt(noti_num);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);
		model.addAttribute("manager_id", "admin");
	}

	//공지-글쓰기
	@Override 
	public void noticeWrite(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		model.addAttribute("manager_id", "admin");
	}

	//공지-글쓰기 처리
	@Override
	public void noticeWritePro(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		NoticeDTO dto = new NoticeDTO();
		dto.setManager_id(req.getParameter("manager_id"));
		dto.setNoti_title(req.getParameter("noti_title"));
		dto.setNoti_content(req.getParameter("noti_content"));
		dto.setNoti_date(new Timestamp(System.currentTimeMillis()));

		int cnt = sixDao.insert(dto);
		model.addAttribute("cnt", cnt);
	}

	//공지- 글수정
	@Override
	public void noticeModify(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int noti_num = Integer.parseInt(req.getParameter("noti_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		String passwd = req.getParameter("passwd");		

		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("noti_num", noti_num);
		daoMap.put("passwd", passwd);

		NoticeDTO dto = sixDao.getArticle(noti_num);
		model.addAttribute("dto", dto);
		model.addAttribute("noti_num", noti_num);
		model.addAttribute("pageNum", pageNum);
	}

	//공지-글수정 처리
	@Override
	public void noticeModifyPro(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int noti_num = Integer.parseInt(req.getParameter("noti_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		NoticeDTO dto = new NoticeDTO();
		dto.setNoti_num(noti_num);
		dto.setNoti_title(req.getParameter("noti_title"));
		dto.setNoti_content(req.getParameter("noti_content"));

		int cnt = sixDao.update(dto);
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);

	}

	//공지-글삭제
	@Override
	public void noticeDelete(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int noti_num = Integer.parseInt(req.getParameter("noti_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));

		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("noti_num", noti_num);
		sixDao.delete(noti_num);
		model.addAttribute("pageNum", pageNum);
	}
}
