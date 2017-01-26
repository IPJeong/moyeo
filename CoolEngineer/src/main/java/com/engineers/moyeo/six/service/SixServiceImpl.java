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
import com.engineers.moyeo.six.dto.MoimScheduleDTO;
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
	
	
	
	
	
	//모인일정-메인
	public void moimSchedule(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int cnt = sixDao.moimScheduleCount();
		
		model.addAttribute("cnt", cnt);
		
		if(cnt > 0) {
			ArrayList<MoimScheduleDTO> dtos = sixDao.moimSchedule();
			model.addAttribute("dtos", dtos);
			model.addAttribute("pageNum", 1);
		}
	}
	
	//모일일정-리스트
	public void moimScheduleDetail(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int pageSize = 3;		//한 페이지당 출력할 글 개수
		int pageBlock = 5;		//출력할 페이지 개수
		int cnt = 0;  			//글 개수
		int start = 0;			//현재 페이지 시작 : rownum
		int end = 0;			//현재 페이지 끝번호 : rownum
		int number = 0; 		//출력할 글 번호
		String pageNum = null;  //페이지 변호
		int currentPage = 0;	//현재 페이지
		int pageCount = 0;		//페이지 개수
		int startPage = 0;		//시작 페이지
		int endPage = 0;		//마지막 페이지

		cnt = sixDao.moimScheduleCount();
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
			ArrayList<MoimScheduleDTO> dtos = sixDao.moimScheduleDetail(daoMap);
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
	
	//모임일정-등록
	public void moimRegister(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		MoimScheduleDTO dto = new MoimScheduleDTO();
		
		dto.setMeeting_title(req.getParameter("meeting_title"));
		Timestamp meeting_date = Timestamp.valueOf(req.getParameter("meeting_date") + " " + req.getParameter("meeting_time") + ":00.0");
		dto.setMeeting_date(meeting_date);
		dto.setMeeting_loc(req.getParameter("map"));
		dto.setLoc_detail(req.getParameter("loc_detail"));
		dto.setMeeting_cost(Integer.parseInt(req.getParameter("meeting_cost")));
		dto.setMeeting_pernum(Integer.parseInt(req.getParameter("meeting_pernum")));
		dto.setMeeting_detail(req.getParameter("meeting_detail"));
	
		int cnt = sixDao.moimRegister(dto);

		model.addAttribute("cnt", cnt);
		
	}
	
	//모임일정-상세페이지
	@Override
	public void moimScheduleContents(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int meeting_num = Integer.parseInt(req.getParameter("meeting_num"));
		
		MoimScheduleDTO dto = sixDao.moimScheduleContents(meeting_num);
		System.out.println("123sd");
		model.addAttribute("dto", dto);
	}
	
	//모임일정-수정페이지
	@Override
	public void moimScheduleModify(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int meeting_num = Integer.parseInt(req.getParameter("meeting_num"));
		
		MoimScheduleDTO dto = sixDao.moimScheduleContents(meeting_num);

		
		String timeStamp = String.valueOf(dto.getMeeting_date());
		
		String[] result = timeStamp.split(" ");
		String date = result[0];
		
		System.out.println(date);
		String[] result1 = result[1].split(":00.0");
		String time = result1[0];
	
		System.out.println(time);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("dto", dto);
	}
	
	//모임일정-수정처리
	@Override
	public void moimScheduleModifyPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		MoimScheduleDTO dto = new MoimScheduleDTO();
		
		
		dto.setMeeting_num(Integer.parseInt(req.getParameter("meeting_num")));
		dto.setMeeting_title(req.getParameter("meeting_title"));
		dto.setMeeting_loc(req.getParameter("map"));
		dto.setLoc_detail(req.getParameter("loc_detail"));
		dto.setMeeting_cost(Integer.parseInt(req.getParameter("meeting_cost")));
		dto.setMeeting_pernum(Integer.parseInt(req.getParameter("meeting_pernum")));
		dto.setMeeting_detail(req.getParameter("meeting_detail"));
		String meeting_date = req.getParameter("meeting_date") + " " + req.getParameter("meeting_time") + ":00.0";
		dto.setMeeting_date(Timestamp.valueOf(meeting_date));
			
		int cnt = sixDao.moimScheduleModify(dto);
		
		model.addAttribute("cnt", cnt);
		
	}

	//모임일정-삭제
	@Override
	public void moimScheduleDelete(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int meeting_num = Integer.parseInt(req.getParameter("meeting_num"));
		
		int cnt = sixDao.moimScheduleDelete(meeting_num);
	
		model.addAttribute("cnt", cnt);
	}

}
