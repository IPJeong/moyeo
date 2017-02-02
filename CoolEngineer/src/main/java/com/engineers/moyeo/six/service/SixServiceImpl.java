package com.engineers.moyeo.six.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.five.dto.PostVideoDTO;
import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.FileManager;
import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.one.dao.OneDAO;
import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.CheckPresentDTO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.MoimScheduleDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;
import com.engineers.moyeo.six.dto.NoticeDTO;
import com.engineers.moyeo.three.dao.ThreeDAO;
import com.engineers.moyeo.three.dto.ThreeDTO;
import com.engineers.moyeo.two.dto.Place_picDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class SixServiceImpl implements SixService{

	@Autowired
	SixDAO sixDao;
	
	@Autowired
	ThreeDAO threeDao;
	
	@Autowired
	OneDAO oneDao;

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
		model.addAttribute("manager_id", req.getSession().getAttribute("mem_id"));
	}

	//공지-글쓰기
	@Override 
	public void noticeWrite(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		model.addAttribute("manager_id", req.getSession().getAttribute("mem_id"));
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
	
	
	
	//모임일정-메인
	public void moimSchedule(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int group_num = Integer.parseInt(req.getParameter("group_num"));	
		//사이드 불러오기
		MoimOpenDTO info_dto = sixDao.moimMain(group_num);
		model.addAttribute("group_name", info_dto.getGroup_name());
		model.addAttribute("group_inte1", info_dto.getGroup_inte1());
		model.addAttribute("group_inte2", info_dto.getGroup_inte2());
		
		model.addAttribute("group_intro", info_dto.getGroup_intro());
	
		//대표사진 개수 구하기
		int cntA = sixDao.moimImageCount(group_num);
		
		//모임 대표사진이 있는 경우만 대표사진 불러오기
		if(cntA > 0) {
			ArrayList<MainPictureDTO> dtos = new ArrayList<MainPictureDTO>();
			dtos = sixDao.moimImageView(group_num);
			
			String main_pic_nameA = dtos.get(0).getMain_pic_name();
			String main_pic_pathA = dtos.get(0).getMain_pic_path();
			
			model.addAttribute("main_pic_nameA", main_pic_nameA);
			model.addAttribute("main_pic_pathA", main_pic_pathA);
		}
		
		//소개사진 개수 구하기
		int cntB = sixDao.moimImageCountB(group_num);
		
		//모임-소개사진이 있는 경우만 소개사진 불러오기
		if(cntB > 0) {
			ArrayList<MainPictureDTO> dtosB = new ArrayList<MainPictureDTO>();
			dtosB = sixDao.moimImageViewB(group_num);
		
			String main_pic_nameB = dtosB.get(0).getMain_pic_name();
			String main_pic_path = dtosB.get(0).getMain_pic_path();
		
			String[] main_pic_pathb = main_pic_path.split("-");
			String main_pic_pathB =main_pic_pathb[0];
		
			model.addAttribute("main_pic_nameB", main_pic_nameB);
			model.addAttribute("main_pic_pathB", main_pic_pathB);
		}
			
		int cnt = sixDao.moimScheduleCount(group_num);
		model.addAttribute("cnt", cnt);
		
		if(cnt > 0) {
			ArrayList<MoimScheduleDTO> dtos = sixDao.moimSchedule(group_num);
			model.addAttribute("dtos", dtos);
			model.addAttribute("pageNum", 1);
		
			//모임-참석인원 체크
			ArrayList<Integer> dtos2 = new ArrayList<Integer>(); 
			for(int i=0; i<dtos.size(); i++) {
				
				int cnt1 = sixDao.moimScheduleCheck(dtos.get(i).getMeeting_num());
				dtos2.add(i, cnt1);
			}
			model.addAttribute("dtos2", dtos2.get(0));
		
		}
	}
	
	//모일일정-리스트
	public void moimScheduleDetail(Model model) {
		
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));	
		
		//사이드 불러오기
		MoimOpenDTO info_dto = sixDao.moimMain(group_num);
		model.addAttribute("group_name", info_dto.getGroup_name());
		model.addAttribute("group_inte1", info_dto.getGroup_inte1());
		model.addAttribute("group_inte2", info_dto.getGroup_inte2());
		
		model.addAttribute("group_intro", info_dto.getGroup_intro());
	
		//대표사진 개수 구하기
		int cntA = sixDao.moimImageCount(group_num);
		
		//모임 대표사진이 있는 경우만 대표사진 불러오기
		if(cntA > 0) {
			ArrayList<MainPictureDTO> dtos = new ArrayList<MainPictureDTO>();
			dtos = sixDao.moimImageView(group_num);
			
			String main_pic_nameA = dtos.get(0).getMain_pic_name();
			String main_pic_pathA = dtos.get(0).getMain_pic_path();
			
			model.addAttribute("main_pic_nameA", main_pic_nameA);
			model.addAttribute("main_pic_pathA", main_pic_pathA);
		}
		
		//리스트 불러오기
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

		cnt = sixDao.moimScheduleCount(group_num);
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
			daoMap.put("group_num", group_num);
			ArrayList<MoimScheduleDTO> dtos = sixDao.moimScheduleDetail(daoMap);
			model.addAttribute("dtos", dtos);
		
		//모임-참석인원 체크
			ArrayList<Integer> dtos2 = new ArrayList<Integer>(); 
			for(int i=0; i<dtos.size(); i++) {
				
				int cnt1 = sixDao.moimScheduleCheck(dtos.get(i).getMeeting_num());
				dtos2.add(i, cnt1);
			}
			model.addAttribute("dtos2", dtos2);
			
			//모임-참석여부확인
			ArrayList<Integer> dtos3 = new ArrayList<Integer>(); 
			for(int i=0; i<dtos.size(); i++) {
			
				MoimScheduleDTO meeting_dto = new MoimScheduleDTO();
				
				meeting_dto.setMem_id((String)req.getSession().getAttribute("mem_id"));
				meeting_dto.setMeeting_num(dtos.get(i).getMeeting_num());
				
				int cnt3 = sixDao.moimScheduleJoinCheck(meeting_dto);
				
				dtos3.add(i, cnt3);
				
			}
			System.out.println(dtos3);
			model.addAttribute("dtos3", dtos3);
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
		
		MoimOpenDTO dto = sixDao.moimMain(group_num);
		model.addAttribute("group_name", dto.getGroup_name());
		model.addAttribute("group_inte1", dto.getGroup_inte1());
		model.addAttribute("group_inte2", dto.getGroup_inte2());
	}
	

		
	//모임일정-등록
	public void moimRegister(Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		MoimOpenDTO dto = sixDao.moimMain(group_num);
		model.addAttribute("group_name", dto.getGroup_name());
		model.addAttribute("group_inte1", dto.getGroup_inte1());
		model.addAttribute("group_inte2", dto.getGroup_inte2());
	
		
	}
		
	//모임일정-등록처리
	public void moimRegisterPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		MoimScheduleDTO dto = new MoimScheduleDTO();
		
		dto.setGroup_num((Integer)(req.getSession().getAttribute("group_num")));
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
		model.addAttribute("dto", dto);
	}
	
	//모임일정-수정페이지
	@Override
	public void moimScheduleModify(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		MoimOpenDTO dto = sixDao.moimMain(group_num);
		model.addAttribute("group_name", dto.getGroup_name());
		model.addAttribute("group_inte1", dto.getGroup_inte1());
		model.addAttribute("group_inte2", dto.getGroup_inte2());
		
		int meeting_num = Integer.parseInt(req.getParameter("meeting_num"));
		MoimScheduleDTO meeting_dto = sixDao.moimScheduleContents(meeting_num);
	
		String timeStamp = String.valueOf(meeting_dto.getMeeting_date());
		
		String[] result = timeStamp.split(" ");
		String date = result[0];
		
		String[] result1 = result[1].split(":00.0");
		String time = result1[0];
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("meeting_dto", meeting_dto);
		
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

	//모임일정-참석신청
	@Override
	public void moimScheduleJoin(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		MoimScheduleDTO dto = new MoimScheduleDTO();
		
		dto.setMem_id((String)req.getSession().getAttribute("mem_id"));
		dto.setMeeting_num(Integer.parseInt(req.getParameter("meeting_num")));
			
		
		int cnt = sixDao.moimScheduleJoinCheck(dto);
		
		model.addAttribute("cnt", cnt);
		
		if(cnt == 1) {
			return;
		} else {
			int cnt2 = sixDao.moimScheduleJoin(dto);
			model.addAttribute("cnt2", cnt2);
		}
	}
	
	//모임일정-참석취소
	@Override
	public void moimScheduleCancel(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		MoimScheduleDTO dto = new MoimScheduleDTO();
		
		dto.setMem_id((String)req.getSession().getAttribute("mem_id"));
		dto.setMeeting_num(Integer.parseInt(req.getParameter("meeting_num")));
	
		int cnt2 = sixDao.moimScheduleCancel(dto);
		
		model.addAttribute("cnt2", cnt2);
	}
	
	//모임일정-참석멤버 리스트
	@Override
	public void moimScheduleMember(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int num = Integer.parseInt(req.getParameter("meeting_num"));
		
		ArrayList<MoimScheduleDTO> dtos = sixDao.moimScheduleMember(num);
		model.addAttribute("dtos", dtos);
	}

	

	//고객지원-메인
	public void cusSupMain(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		//공지사항 불러오기
		int cnt = sixDao.getCount();
		
		if(cnt > 0) {
			ArrayList<NoticeDTO> dtos = sixDao.getArticles_main();
			model.addAttribute("dtos", dtos);
			model.addAttribute("pageNum", 1);
		}
		
		//faq 불러오기
		int cnt2 = threeDao.getCount2();
		
		if(cnt2 > 0) {
			ArrayList<ThreeDTO> dtos2 = threeDao.getQuestions();
			model.addAttribute("dtos2", dtos2);
		}		
		
		//QnA불러오기
		int cnt3 = oneDao.getCount();
		
		if(cnt3 > 0) {
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", 1);
			daoMap.put("end", 5);
			ArrayList<QnaBoardDTO> dtos3 = oneDao.getArticles(daoMap);
			model.addAttribute("dtos3", dtos3);
			model.addAttribute("pageNum", 1);
		}
	}

	
	
	//모임-개설
	@Override
	public void moimOpenPro(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		if(req.getSession().getAttribute("mem_id") != null) {
			//모임등록번호 받기
			int moimNum = sixDao.moimOpenNum();
			
			//모임등록처리
			MoimOpenDTO dto = new MoimOpenDTO();
			dto.setGroup_num(moimNum);
			dto.setGroup_name(req.getParameter("moim_title"));
			dto.setGroup_mem_cnt(Integer.parseInt(req.getParameter("max_person")));
			dto.setGroup_inte1(req.getParameter("recpla_category1"));
			dto.setGroup_inte2(req.getParameter("recpla_category2"));
			
			String location = req.getParameter("loc_category1")+ "-" + req.getParameter("loc_category2");
			dto.setGroup_location(location);
			dto.setGroup_intro(req.getParameter("content"));
			
			int cnt = sixDao.moimOpenPro(dto);
			model.addAttribute("cnt", cnt);
			
			//모임장등록
			MyGroupDTO group_dto = new MyGroupDTO();
			group_dto.setGroup_num(moimNum);
			group_dto.setMem_id((String)(req.getSession().getAttribute("mem_id")));
			sixDao.moimLeaderRegister(group_dto);
		}
	}

	//모임카테고리-관심사별
	@Override
	public void categoryHobby(Model model) {
		
		Map<String, Object> map = model.asMap();

		ArrayList<MoimOpenDTO> dtos1 = sixDao.categoryHobbyA();
		model.addAttribute("dtos1", dtos1);

		ArrayList<MoimOpenDTO> dtos2 = sixDao.categoryHobbyB();
		model.addAttribute("dtos2", dtos2);

		ArrayList<MoimOpenDTO> dtos3 = sixDao.categoryHobbyC();
		model.addAttribute("dtos3", dtos3);

		ArrayList<MoimOpenDTO> dtos4 = sixDao.categoryHobbyD();
		model.addAttribute("dtos4", dtos4);

		ArrayList<MoimOpenDTO> dtos5 = sixDao.categoryHobbyE();
		model.addAttribute("dtos5", dtos5);

		ArrayList<MoimOpenDTO> dtos6 = sixDao.categoryHobbyF();
		model.addAttribute("dtos6", dtos6);

		ArrayList<MoimOpenDTO> dtos7 = sixDao.categoryHobbyG();
		model.addAttribute("dtos7", dtos7);

		ArrayList<MoimOpenDTO> dtos8 = sixDao.categoryHobbyH();
		model.addAttribute("dtos8", dtos8);

		ArrayList<MoimOpenDTO> dtos9 = sixDao.categoryHobbyI();
		model.addAttribute("dtos9", dtos9);

		ArrayList<MoimOpenDTO> dtos10 = sixDao.categoryHobbyJ();
		model.addAttribute("dtos10", dtos10);

		ArrayList<MoimOpenDTO> dtos11 = sixDao.categoryHobbyK();
		model.addAttribute("dtos11", dtos11);

		ArrayList<MoimOpenDTO> dtos12 = sixDao.categoryHobbyL();
		model.addAttribute("dtos12", dtos12);

		ArrayList<MoimOpenDTO> dtos13 = sixDao.categoryHobbyM();
		model.addAttribute("dtos13", dtos13);

		ArrayList<MoimOpenDTO> dtos14 = sixDao.categoryHobbyN();
		model.addAttribute("dtos14", dtos14);

		ArrayList<MoimOpenDTO> dtos15 = sixDao.categoryHobbyO();
		model.addAttribute("dtos15", dtos15);

		ArrayList<MoimOpenDTO> dtos16 = sixDao.categoryHobbyP();
		model.addAttribute("dtos16", dtos16);

		ArrayList<MoimOpenDTO> dtos17 = sixDao.categoryHobbyQ();
		model.addAttribute("dtos17", dtos17);

		ArrayList<MoimOpenDTO> dtos18 = sixDao.categoryHobbyR();
		model.addAttribute("dtos18", dtos18);
	
	}

	//모임카테고리-지역별
	@Override
	public void categoryLocation(Model model) {
		
		Map<String, Object> map = model.asMap();

		ArrayList<MoimOpenDTO> dtos1 = sixDao.categoryLocationA();
		model.addAttribute("dtos1", dtos1);

		ArrayList<MoimOpenDTO> dtos2 = sixDao.categoryLocationB();
		model.addAttribute("dtos2", dtos2);

		ArrayList<MoimOpenDTO> dtos3 = sixDao.categoryLocationC();
		model.addAttribute("dtos3", dtos3);

		ArrayList<MoimOpenDTO> dtos4 = sixDao.categoryLocationD();
		model.addAttribute("dtos4", dtos4);

		ArrayList<MoimOpenDTO> dtos5 = sixDao.categoryLocationE();
		model.addAttribute("dtos5", dtos5);

		ArrayList<MoimOpenDTO> dtos6 = sixDao.categoryLocationF();
		model.addAttribute("dtos6", dtos6);

		ArrayList<MoimOpenDTO> dtos7 = sixDao.categoryLocationG();
		model.addAttribute("dtos7", dtos7);

		ArrayList<MoimOpenDTO> dtos8 = sixDao.categoryLocationH();
		model.addAttribute("dtos8", dtos8);

		ArrayList<MoimOpenDTO> dtos9 = sixDao.categoryLocationI();
		model.addAttribute("dtos9", dtos9);

		ArrayList<MoimOpenDTO> dtos10 = sixDao.categoryLocationJ();
		model.addAttribute("dtos10", dtos10);

		ArrayList<MoimOpenDTO> dtos11 = sixDao.categoryLocationK();
		model.addAttribute("dtos11", dtos11);

		ArrayList<MoimOpenDTO> dtos12 = sixDao.categoryLocationL();
		model.addAttribute("dtos12", dtos12);

		ArrayList<MoimOpenDTO> dtos13 = sixDao.categoryLocationM();
		model.addAttribute("dtos13", dtos13);

		ArrayList<MoimOpenDTO> dtos14 = sixDao.categoryLocationN();
		model.addAttribute("dtos14", dtos14);

		ArrayList<MoimOpenDTO> dtos15 = sixDao.categoryLocationO();
		model.addAttribute("dtos15", dtos15);

		ArrayList<MoimOpenDTO> dtos16 = sixDao.categoryLocationP();
		model.addAttribute("dtos16", dtos16);

		ArrayList<MoimOpenDTO> dtos17 = sixDao.categoryLocationQ();
		model.addAttribute("dtos17", dtos17);
	}

	//모임카테고리-규모별
	@Override
	public void categoryScale(Model model) {

		Map<String, Object> map = model.asMap();

		ArrayList<MoimOpenDTO> dtos1 = sixDao.categoryScaleA();
		model.addAttribute("dtos1", dtos1);

		ArrayList<MoimOpenDTO> dtos2 = sixDao.categoryScaleB();
		model.addAttribute("dtos2", dtos2);

		ArrayList<MoimOpenDTO> dtos3 = sixDao.categoryScaleC();
		model.addAttribute("dtos3", dtos3);

		ArrayList<MoimOpenDTO> dtos4 = sixDao.categoryScaleD();
		model.addAttribute("dtos4", dtos4);

		ArrayList<MoimOpenDTO> dtos5 = sixDao.categoryScaleE();
		model.addAttribute("dtos5", dtos5);

		ArrayList<MoimOpenDTO> dtos6 = sixDao.categoryScaleF();
		model.addAttribute("dtos6", dtos6);

		ArrayList<MoimOpenDTO> dtos7 = sixDao.categoryScaleG();
		model.addAttribute("dtos7", dtos7);

		ArrayList<MoimOpenDTO> dtos8 = sixDao.categoryScaleH();
		model.addAttribute("dtos8", dtos8);

		ArrayList<MoimOpenDTO> dtos9 = sixDao.categoryScaleI();
		model.addAttribute("dtos9", dtos9);

		ArrayList<MoimOpenDTO> dtos10 = sixDao.categoryScaleJ();
		model.addAttribute("dtos10", dtos10);

		ArrayList<MoimOpenDTO> dtos11 = sixDao.categoryScaleK();
		model.addAttribute("dtos11", dtos11);

		ArrayList<MoimOpenDTO> dtos12 = sixDao.categoryScaleL();
		model.addAttribute("dtos12", dtos12);

		ArrayList<MoimOpenDTO> dtos13 = sixDao.categoryScaleM();
		model.addAttribute("dtos13", dtos13);

		ArrayList<MoimOpenDTO> dtos14 = sixDao.categoryScaleN();
		model.addAttribute("dtos14", dtos14);

		ArrayList<MoimOpenDTO> dtos15 = sixDao.categoryScaleO();
		model.addAttribute("dtos15", dtos15);

		ArrayList<MoimOpenDTO> dtos16 = sixDao.categoryScaleP();
		model.addAttribute("dtos16", dtos16);

		ArrayList<MoimOpenDTO> dtos17 = sixDao.categoryScaleQ();
		model.addAttribute("dtos17", dtos17);
		
		ArrayList<MoimOpenDTO> dtos18 = sixDao.categoryScaleR();
		model.addAttribute("dtos18", dtos18);

		ArrayList<MoimOpenDTO> dtos19 = sixDao.categoryScaleS();
		model.addAttribute("dtos19", dtos19);
		
		ArrayList<MoimOpenDTO> dtos20 = sixDao.categoryScaleT();
		model.addAttribute("dtos20", dtos20);
	}

	
	
	//모임-메인
	@Override
	public void moimMain(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		req.getSession().setAttribute("group_num", group_num);
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		
		
		//-- 사이드바 적용 영역
		
		//사이드에 모임명, 모임카테고리 불러오기
		MoimOpenDTO open_dto = sixDao.moimMain(group_num);
		model.addAttribute("group_name", open_dto.getGroup_name());
		model.addAttribute("group_inte1", open_dto.getGroup_inte1());
		model.addAttribute("group_inte2", open_dto.getGroup_inte2());
		
		model.addAttribute("group_intro", open_dto.getGroup_intro());
	
		//사이드에 들어갈 대표사진 개수 구하기
		int cntA = sixDao.moimImageCount(group_num);
		
		//모임 대표사진이 있는 경우만 대표사진 불러오기
		if(cntA > 0) {
			ArrayList<MainPictureDTO> dtos = new ArrayList<MainPictureDTO>();
			dtos = sixDao.moimImageView(group_num);
			
			String main_pic_nameA = dtos.get(0).getMain_pic_name();
			String main_pic_pathA = dtos.get(0).getMain_pic_path();
			
			model.addAttribute("main_pic_nameA", main_pic_nameA);
			model.addAttribute("main_pic_pathA", main_pic_pathA);
		}
		
		//사이드에 들어갈 모임장정보 불러오기
		MemberInfoDTO leader_dto = new MemberInfoDTO();
		
		leader_dto = sixDao.moimLeaderLoad(group_num);
			
		model.addAttribute("leader_id", leader_dto.getMem_id());
		model.addAttribute("leader_name", leader_dto.getName());
		model.addAttribute("leader_pic_name", leader_dto.getPropic_name());
		model.addAttribute("leader_pic_path", leader_dto.getPropic_path());
	
		//사이드용 운영진들 아이디 불러오기
		ArrayList<String> subLeaderA_dtos = sixDao.moimSubLeaderLoadA(group_num);
		
		//사이드용 운영진들 정보 불러오기
		ArrayList<MemberInfoDTO> subLeaderB_dtos = new ArrayList<MemberInfoDTO>();
		for(int i=0; i<subLeaderA_dtos.size(); i++) {
			String subLeader_id = subLeaderA_dtos.get(i);
			MemberInfoDTO subLeaderC_dto = sixDao.moimSubLeaderLoadB(subLeader_id);
			subLeaderB_dtos.add(i, subLeaderC_dto);
		}
		model.addAttribute("subLeader_dtos", subLeaderB_dtos);
		
		//사이드용 일반 멤버들 아이디 불러오기
		ArrayList<String> memberA_dtos = sixDao.moimSubLeaderLoadA(group_num);
		
		//사이드용 일반 멤버들 정보불러오기
		ArrayList<MemberInfoDTO> memberB_dtos = new ArrayList<MemberInfoDTO>();
		for(int i=0; i<memberA_dtos.size(); i++) {
			String member_id = memberA_dtos.get(i);
			MemberInfoDTO memberC_dto = sixDao.moimMemberLoadB(member_id);
			memberB_dtos.add(i, memberC_dto);
		}
		model.addAttribute("member_dtos", memberB_dtos);
		
		//-- 사이드바 적용 영역
		
		//소개사진 개수 구하기
		int cntB = sixDao.moimImageCountB(group_num);
		
		//모임-소개사진이 있는 경우만 소개사진 불러오기
		if(cntB > 0) {
			ArrayList<MainPictureDTO> dtosB = new ArrayList<MainPictureDTO>();
			dtosB = sixDao.moimImageViewB(group_num);
		
			String main_pic_nameB = dtosB.get(0).getMain_pic_name();
			String main_pic_path = dtosB.get(0).getMain_pic_path();
		
			String[] main_pic_pathb = main_pic_path.split("-");
			String main_pic_pathB =main_pic_pathb[0];
		
			model.addAttribute("main_pic_nameB", main_pic_nameB);
			model.addAttribute("main_pic_pathB", main_pic_pathB);
		}
		
		//모임-출석체크
		String present_date_A = String.valueOf((new Timestamp(System.currentTimeMillis())));
		String present_date_B[] = present_date_A.split(" ");
		Timestamp present_date = Timestamp.valueOf(present_date_B[0] + " 00:00:00");

		CheckPresentDTO present_dto = new CheckPresentDTO();
		present_dto.setPresent_date(present_date);
		present_dto.setMem_id((String)(req.getSession().getAttribute("mem_id")));
		present_dto.setGroup_num(group_num);
		
		//로그인 한경우에만 실행
		if(mem_id != null) {
			
			//모임가입여부 확인
			int check_cnt = sixDao.memberCheck(present_dto);
			
			//모임가입된 경우에만 실행
			if(check_cnt == 1) {
				//출석체크 중복여부 확인
				int present_cnt = sixDao.checkPresentCount(present_dto);
				
				//중복이 안된 경우만 출석 인정(1일 1회)
				if(present_cnt == 0){
					sixDao.checkPresent(present_dto);
				}
			}
		}
	}

	//모임-모임정보수정(기존내용 읽어오기)
	@Override
	public void moimModify(Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		MoimOpenDTO dto = sixDao.moimMain(group_num);
		model.addAttribute("dto", dto);
		String[] recpla_category = dto.getGroup_location().split("-");
	
		String recpla_category1 = recpla_category[0];
		String recpla_category2 = recpla_category[1];
		
		model.addAttribute("recpla_category1", recpla_category1);
		model.addAttribute("recpla_category2", recpla_category2);
		
	}

	//모임-정보수정처리
	@Override
	public void moimModifyPro(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		MoimOpenDTO dto = new MoimOpenDTO();
		
		dto.setGroup_num(Integer.parseInt(req.getParameter("group_num")));
		dto.setGroup_name(req.getParameter("moim_title"));
		dto.setGroup_mem_cnt(Integer.parseInt(req.getParameter("max_person")));
		dto.setGroup_inte1(req.getParameter("recpla_category1"));
		dto.setGroup_inte2(req.getParameter("recpla_category2"));
		
		String location = req.getParameter("loc_category1")+ "-" + req.getParameter("loc_category2");
		dto.setGroup_location(location);
		dto.setGroup_intro(req.getParameter("content"));
				
		int cnt = sixDao.moimOpenPro(dto);
		
		model.addAttribute("dto", dto);		
		model.addAttribute("cnt", cnt);
	}

	//모임-모임폐쇄
	@Override
	public void moimDelete(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		int cnt = sixDao.moimDelete(group_num);
		
		//세션삭제
		req.getSession().setAttribute("group_num", null);
		
		model.addAttribute("cnt", cnt);
	}
	
	//모임-대표사진 등록
	@Override
	public void moimAddImagePro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();

		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			// 업로드된 파일 이름을 받아옴
			String fileName = multipartFile.getOriginalFilename();
			
			if(fileName.trim().length()>4){
				
				String rootPath = Code.rootPath;
				String imgPath = Code.groupImgPath;
				
				int type = FileManager.checkFileType(fileName);
				String filename = null;
				
				if(type == 1) {
					// 파일을 저장 후 저장된 파일명을 반환
					filename = FileManager.saveFile(multipartFile, rootPath + imgPath, fileName);
					MainPictureDTO dto = new MainPictureDTO();
					dto.setGroup_num((Integer)(req.getSession().getAttribute("group_num")));
					dto.setMain_pic_name(filename);
					dto.setMain_pic_path(Code.groupImgPathS);
					
					int cnt = sixDao.moimAddImagePro(dto);
					model.addAttribute("cnt", cnt);
				}
			}
		}
	}
	
	//모임-소개사진 등록
	@Override
	public void moimAddImageProb(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();

		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			// 업로드된 파일 이름을 받아옴
			String fileName = multipartFile.getOriginalFilename();
			
			if(fileName.trim().length()>4){
				
				String rootPath = Code.rootPath;
				String imgPath = Code.groupImgPath;
				
				int type = FileManager.checkFileType(fileName);
				String filename = null;
				
				if(type == 1) {
					// 파일을 저장 후 저장된 파일명을 반환
					filename = FileManager.saveFile(multipartFile, rootPath + imgPath, fileName);
					MainPictureDTO dto = new MainPictureDTO();
					dto.setGroup_num((Integer)(req.getSession().getAttribute("group_num")));
					dto.setMain_pic_name(filename);
					dto.setMain_pic_path(Code.groupImgPathS + "-");
					
					int cnt = sixDao.moimAddImagePro(dto);
					model.addAttribute("cnt", cnt);
				}
			}
		}
	}
}
