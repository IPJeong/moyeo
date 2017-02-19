package com.engineers.moyeo.six.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.engineers.moyeo.four.dao.FourDAO;
import com.engineers.moyeo.four.dto.GroupNoticeDTO;
import com.engineers.moyeo.four.dto.productInfoDTO;
import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.FileManager;
import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.main.service.MainService;
import com.engineers.moyeo.one.dao.OneDAO;
import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.CheckPresentDTO;
import com.engineers.moyeo.six.dto.HotMoimDTO;
import com.engineers.moyeo.six.dto.InterestCatDTO;
import com.engineers.moyeo.six.dto.InterestGroupDTO;
import com.engineers.moyeo.six.dto.InterestLocationDTO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.MoimScheduleDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;
import com.engineers.moyeo.six.dto.NoticeDTO;
import com.engineers.moyeo.six.dto.OrderListDTO;
import com.engineers.moyeo.six.dto.PaymentListDTO;
import com.engineers.moyeo.six.dto.ProductCommentsDTO;
import com.engineers.moyeo.six.dto.ProductPicDTO;
import com.engineers.moyeo.six.dto.ProductQueDTO;
import com.engineers.moyeo.six.dto.SellerInfoDTO;
import com.engineers.moyeo.six.dto.MsgListDTO;
import com.engineers.moyeo.three.dao.ThreeDAO;
import com.engineers.moyeo.three.dto.EventDTO;
import com.engineers.moyeo.three.dto.ThreeDTO;

@Service
public class SixServiceImpl implements SixService{

	@Autowired
	SixDAO sixDao;
	
	@Autowired
	ThreeDAO threeDao;
	
	@Autowired
	OneDAO oneDao;
	
	@Autowired
	FourDAO fourDao;
	
	@Autowired
	MainService mainService;
	
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
	
	//모일일정-리스트
	public void moimScheduleDetail(Model model) {
	
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

	//--사이드 시작
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		//사이드- 모임명, 모임카테고리 불러오기
		MoimOpenDTO open_dto = sixDao.moimMain(group_num);
		model.addAttribute("open_dto", open_dto);
		
		//사이드 - 대표사진 불러오기
		MainPictureDTO picture_dto = sixDao.moimImagesView(group_num).get(0);
		model.addAttribute("picture_dto", picture_dto);
		
		//사이드 - 모임원리스트 불러오기
		ArrayList<MemberInfoDTO> member_dtos = sixDao.memberList(group_num);
		model.addAttribute("member_dtos", member_dtos);	
	//--사이드 끝
		
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
			ArrayList<String> date_dtos = new ArrayList<String>();
			for(int i=0; i<dtos.size(); i++) {
				String date =String.valueOf(dtos.get(i).getMeeting_date()).split(":17.7")[0];
				date_dtos.add(i, date);
			}
			model.addAttribute("date_dtos", date_dtos);

			ArrayList<String> yo_dtos = new ArrayList<String>();
			ArrayList<String> month_dtos = new ArrayList<String>();
			for(int i=0; i<date_dtos.size(); i++) {
				int zellerMonth=0;
				int zellerYear=0;
				String DOW = null;
			
				String[] dd = date_dtos.get(i).split("-");
				String[] ddd = dd[2].split(" ");
		
				int year = Integer.parseInt(dd[0]);
			    int month = Integer.parseInt(dd[1]);
			    int day = Integer.parseInt(ddd[0]);
			    if(month < 3) { // 월값이 3보다 작으면
			    	zellerMonth = month + 12; // 월 + 12
			    	zellerYear = year - 1; // 연 - 1
			    } else { 
			    	zellerMonth = month;
			           zellerYear = year;
			    }
			    int computation = day + (26 * (zellerMonth + 1)) / 10 + zellerYear + 
			                      zellerYear / 4 + 6 * (zellerYear / 100) +
			                      zellerYear / 400;
			    int dayOfWeek = computation % 7;   
			    
			    switch(dayOfWeek) {
				      case 0:
				          DOW = "토요일";
				          break;
				      case 1:
				          DOW = "일요일";
				          break;
				      case 2:
				          DOW = "월요일";
				          break;
				      case 3:
				          DOW = "화요일";
				          break;
				      case 4:
				          DOW = "수요일";
				          break;
				      case 5:
				          DOW = "목요일";
				          break;
				      case 6:
				          DOW = "금요일";
				          break;
				}  
			    yo_dtos.add(i, DOW); 
			    month_dtos.add(i, dd[1]+"."+ddd[0]);
			}
			model.addAttribute("yo_dtos", yo_dtos);
			model.addAttribute("month_dtos", month_dtos);
		
			//모임-참석인원 체크
			ArrayList<Integer> dtos2 = new ArrayList<Integer>(); 
			for(int i=0; i<dtos.size(); i++) {
				
				int cnt1 = sixDao.moimScheduleCheck(dtos.get(i).getMeeting_num());
				dtos2.add(i, cnt1);
			}
			model.addAttribute("dtos2", dtos2);
			
			String mem_id = (String)req.getSession().getAttribute("mem_id");
			
			//모임-참석여부확인
			if(mem_id != null) {
				ArrayList<Integer> dtos3 = new ArrayList<Integer>(); 
				for(int i=0; i<dtos.size(); i++) {
				
					MoimScheduleDTO meeting_dto = new MoimScheduleDTO();
					
					meeting_dto.setMem_id(mem_id);
					meeting_dto.setMeeting_num(dtos.get(i).getMeeting_num());
						
					int cnt3 = sixDao.moimScheduleJoinCheck(meeting_dto);
					
					dtos3.add(i, cnt3);
				}
				model.addAttribute("dtos3", dtos3);
			}
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

	//--사이드 시작	
		int group_num = Integer.parseInt(req.getParameter("group_num"));
	
		//사이드- 모임명, 모임카테고리 불러오기
		MoimOpenDTO open_dto = sixDao.moimMain(group_num);
		model.addAttribute("open_dto", open_dto);
		
		//사이드 - 대표사진 불러오기
		MainPictureDTO picture_dto = sixDao.moimImagesView(group_num).get(0);
		model.addAttribute("picture_dto", picture_dto);
		
		//사이드 - 모임원리스트 불러오기
		ArrayList<MemberInfoDTO> member_dtos = sixDao.memberList(group_num);
		model.addAttribute("member_dtos", member_dtos);	
	//--사이드 끝		
	}
		
	//모임일정-등록처리
	public void moimRegisterPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		MoimScheduleDTO dto = new MoimScheduleDTO();
		
		dto.setGroup_num((Integer)(req.getSession().getAttribute("group_num")));
		dto.setMeeting_title(req.getParameter("meeting_title"));
		Timestamp meeting_date = Timestamp.valueOf(req.getParameter("meeting_date") + " " + req.getParameter("meeting_time") + ":17.7");
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
		String date = String.valueOf(dto.getMeeting_date()).split(":17.7")[0];
		model.addAttribute("date", date);
	}
	
	//모임일정-수정페이지
	@Override
	public void moimScheduleModify(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

	//--사이드 시작
		int group_num = Integer.parseInt(req.getParameter("group_num"));

		//사이드- 모임명, 모임카테고리 불러오기
		MoimOpenDTO open_dto = sixDao.moimMain(group_num);
		model.addAttribute("open_dto", open_dto);
		
		//사이드 - 대표사진 불러오기
		MainPictureDTO picture_dto = sixDao.moimImagesView(group_num).get(0);
		model.addAttribute("picture_dto", picture_dto);
		
		//사이드 - 모임원리스트 불러오기
		ArrayList<MemberInfoDTO> member_dtos = sixDao.memberList(group_num);
		model.addAttribute("member_dtos", member_dtos);	
	//--사이드 끝
	
		int meeting_num = Integer.parseInt(req.getParameter("meeting_num"));
		MoimScheduleDTO meeting_dto = sixDao.moimScheduleContents(meeting_num);
	
		String timeStamp = String.valueOf(meeting_dto.getMeeting_date());
		String[] result = timeStamp.split(" ");
		String date = result[0];
		String[] result1 = result[1].split(":17.7");
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
		String meeting_date = req.getParameter("meeting_date") + " " + req.getParameter("meeting_time") + ":17.7";
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
		
		//이벤트 불러오기
		int cnt4 = threeDao.getEventCount();
		if(cnt4 > 0) {
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", 1);
			daoMap.put("end", 5);
			ArrayList<EventDTO> dtos4 = threeDao.getEventList(daoMap);
			model.addAttribute("dtos4", dtos4);
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
			dto.setReg_date(new Timestamp(System.currentTimeMillis()));
			
			
			int cnt = sixDao.moimOpenPro(dto);
			model.addAttribute("cnt", cnt);
			
			//모임장등록
			MyGroupDTO group_dto = new MyGroupDTO();
			group_dto.setGroup_num(moimNum);
			group_dto.setMem_id((String)(req.getSession().getAttribute("mem_id")));
			sixDao.moimLeaderRegister(group_dto);
			
			// 모임기본사진 등록(사이드바)
			MainPictureDTO mainPicDto = new MainPictureDTO();
			mainPicDto.setGroup_num(moimNum);
			mainPicDto.setMain_pic_path(Code.groupDefSideImgPath);
			mainPicDto.setMain_pic_name(Code.groupDefSideImgName);
			
			//기본 사진 저장(사이드)
			sixDao.moimSidePhoto(mainPicDto);
			
			mainPicDto.setMain_pic_path(Code.groupDefIntroImgPath);
			mainPicDto.setMain_pic_name(Code.groupDefIntroImgName);
			
			//기본 사진 설정(메인)
			sixDao.moimMainPhoto(mainPicDto);
			
			//모임채팅방 개설
			sixDao.moimChatRegister(moimNum);
			
			mainService.wordAnalyzer(dto.getGroup_name(), dto.getGroup_intro(), null);
		}
	}

	//모임카테고리-관심사별
	@Override
	public void categoryHobby(Model model) {
		
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
	
		//인기모임
		ArrayList<HotMoimDTO> hotDtos = sixDao.hotMoim();
		model.addAttribute("hotDtos", hotDtos);
	
		//추천모임
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		//회원의 관심 카테고리 정보 조회
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		if(mem_id != null){
			InterestCatDTO cateDto = sixDao.inteCate(mem_id);
			if(cateDto != null){
				String group_inte1 = cateDto.getInter_first();	
				String group_inte2 = cateDto.getInter_second();
				//회원의 관심 지역 정보 조회
				InterestLocationDTO locaDto = sixDao.inteLoca(mem_id);
				String group_location = locaDto.getLoc_city() + "-" + locaDto.getLoc_gu();
				model.addAttribute("group_inte1", group_inte1);
				model.addAttribute("group_inte2", group_inte2);
				model.addAttribute("group_location", group_location);
				
				//추천모임
				Map<String, Object> daoMap = model.asMap();
				daoMap.put("group_inte1", group_inte1);
				daoMap.put("group_inte2", group_inte2);
				daoMap.put("group_location", group_location);
				
				int cnt = sixDao.recommendMoimChk(daoMap);
				if (cnt != 0){
					ArrayList<MoimOpenDTO> recommendDtos = sixDao.recommendMoim(daoMap);
					model.addAttribute("recommendDtos", recommendDtos);
				}
			}
		}
	}

	//모임카테고리-지역별
	@Override
	public void categoryLocation(Model model) {
		
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
		
		//인기모임
		ArrayList<HotMoimDTO> hotDtos = sixDao.hotMoim();
		model.addAttribute("hotDtos", hotDtos);

		//추천모임
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		//회원의 관심 카테고리 정보 조회
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		if(mem_id != null){
			InterestCatDTO cateDto = sixDao.inteCate(mem_id);
			if(cateDto != null){
				String group_inte1 = cateDto.getInter_first();	
				String group_inte2 = cateDto.getInter_second();
				//회원의 관심 지역 정보 조회
				InterestLocationDTO locaDto = sixDao.inteLoca(mem_id);
				String group_location = locaDto.getLoc_city() + "-" + locaDto.getLoc_gu();
				model.addAttribute("group_inte1", group_inte1);
				model.addAttribute("group_inte2", group_inte2);
				model.addAttribute("group_location", group_location);
				
				//추천모임
				Map<String, Object> daoMap = model.asMap();
				daoMap.put("group_inte1", group_inte1);
				daoMap.put("group_inte2", group_inte2);
				daoMap.put("group_location", group_location);
				
				int cnt = sixDao.recommendMoimChk(daoMap);
				if (cnt != 0){
					ArrayList<MoimOpenDTO> recommendDtos = sixDao.recommendMoim(daoMap);
					model.addAttribute("recommendDtos", recommendDtos);
				}
			}
		}	
	}

	//모임카테고리-규모별
	@Override
	public void categoryScale(Model model) {

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

		//인기모임
		ArrayList<HotMoimDTO> hotDtos = sixDao.hotMoim();
		model.addAttribute("hotDtos", hotDtos);

		//추천모임
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		//회원의 관심 카테고리 정보 조회
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		if(mem_id != null){
			InterestCatDTO cateDto = sixDao.inteCate(mem_id);
			if(cateDto != null){
				String group_inte1 = cateDto.getInter_first();	
				String group_inte2 = cateDto.getInter_second();
				//회원의 관심 지역 정보 조회
				InterestLocationDTO locaDto = sixDao.inteLoca(mem_id);
				String group_location = locaDto.getLoc_city() + "-" + locaDto.getLoc_gu();
				model.addAttribute("group_inte1", group_inte1);
				model.addAttribute("group_inte2", group_inte2);
				model.addAttribute("group_location", group_location);
				
				//추천모임
				Map<String, Object> daoMap = model.asMap();
				daoMap.put("group_inte1", group_inte1);
				daoMap.put("group_inte2", group_inte2);
				daoMap.put("group_location", group_location);
				
				int cnt = sixDao.recommendMoimChk(daoMap);
				if (cnt != 0){
					ArrayList<MoimOpenDTO> recommendDtos = sixDao.recommendMoim(daoMap);
					model.addAttribute("recommendDtos", recommendDtos);
				}
			}
		}	
	}

	//모임-메인
	@Override
	public void moimMain(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		req.getSession().setAttribute("group_num", Integer.parseInt(req.getParameter("group_num")));
		int group_num = (Integer)(req.getSession().getAttribute("group_num"));
		String mem_id = (String)req.getSession().getAttribute("mem_id");
	
	//--사이드 시작
		//사이드- 모임명, 모임카테고리 불러오기
		MoimOpenDTO open_dto = sixDao.moimMain(group_num);
		model.addAttribute("open_dto", open_dto);
		System.out.println(group_num);
		//사이드 - 대표사진 불러오기
		MainPictureDTO picture_dto = sixDao.moimImagesView(group_num).get(0);
		System.out.println(picture_dto.getMain_pic_name());
		System.out.println(picture_dto.getMain_pic_path());
		model.addAttribute("picture_dto", picture_dto);
		
		//사이드 - 모임원리스트 불러오기
		ArrayList<MemberInfoDTO> member_dtos = sixDao.memberList(group_num);
		model.addAttribute("member_dtos", member_dtos);	
	//--사이드 끝
		
		//모임-소개사진 불러오기
		List<MainPictureDTO> dtosB = new ArrayList<MainPictureDTO>();
		dtosB = sixDao.moimImageViewB(group_num);
		String main_pic_nameB = dtosB.get(0).getMain_pic_name();
		String main_pic_path = dtosB.get(0).getMain_pic_path();
		
		String[] main_pic_pathb = main_pic_path.split("-");
		String main_pic_pathB =main_pic_pathb[0];
	
		model.addAttribute("main_pic_name", main_pic_nameB);
		model.addAttribute("main_pic_path", main_pic_pathB);

	//공지사항글 불러오기
		
		int pageSize = 5;//한 페이지당 출력할 글 개수
		int pageBlock = 1; //출력할 페이지 개수
		
		int cnt = 0; 		//글 개수
		int start = 0; 		//현재 페이지 시작번호 : rownum
		int end = 0;		//현재 페이지 끝번호 : rownum
		int number = 0;		//출력할 글 번호
		String pageNum = null; //페이지 번호
		int currentPage = 0; //현재 페이지
		
		int pageCount = 0; //페이지 개수
		int startPage = 0; //시작 페이지
		int endPage = 0; //마지막 페이지
		
		//1. db메소드 실행
		//글 개수 구하기
		cnt = fourDao.getCount(group_num);
		
		//2. 		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) { //페이지 번호가 없으면, 1로 주겠다
			pageNum = "1"; // 첫 페이지를 1로 주겠다.
		}
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt/pageSize) + (cnt % pageSize > 0 ? 1 : 0);
										//0보다 크면 1로 주고, 아니면 0을 준다.
										//반올림해서 값 맞추기 위함
		start = (currentPage - 1) * pageSize + 1; //(5 - 1) * 10 + 1;
		end = start + pageSize -1; // 41번 + 10 - 1 = 50; 
		
		if(end > cnt) end = cnt;
		
		
		// 글번호
		number = cnt- (currentPage - 1) * pageSize;
		if(cnt > 0) {
			
			Map<String, Integer> notiMap = new HashMap<String, Integer>();
			notiMap.put("start", start);
			notiMap.put("end", end);
			notiMap.put("group_num", group_num);
			
			ArrayList<GroupNoticeDTO> dtos = fourDao.getArticles(notiMap);
			model.addAttribute("dtos", dtos);
	
		}
		startPage =(currentPage / pageBlock) * pageBlock + 1; //(5/3)*3+1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock; //(5 % 3)
		
		endPage = startPage + pageBlock - 1; //4 + 3 -1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		
		//모임-출석체크
		String present_date_A = String.valueOf((new Timestamp(System.currentTimeMillis())));
		String present_date_B[] = present_date_A.split(" ");
		Timestamp present_date = Timestamp.valueOf(present_date_B[0] + " 00:00:00");
		
		CheckPresentDTO present_dto = new CheckPresentDTO();
		present_dto.setPresent_date(present_date);
		
		if(mem_id==null && req.getSession().getAttribute("manager_id")!=null) {
			mem_id = (String)req.getSession().getAttribute("manager_id");
		}
		
		present_dto.setMem_id(mem_id);
		present_dto.setGroup_num(group_num);
		
		//로그인| req.getSession()) {
		//모임가입여부 확인
		int check_cnt = sixDao.memberCheck(present_dto);
		
		//모임가입된 경우에만 실행
		if(check_cnt != 0) {
				
			//회원권한 설정
			Map<String, Object> perMap = model.asMap();
			perMap.put("mem_id", mem_id);
			perMap.put("group_num", group_num);
			int group_per = sixDao.groupPer(perMap);
			req.getSession().setAttribute("group_per", group_per);
			
			//출석체크 중복여부 확인
			int present_cnt = sixDao.checkPresentCount(present_dto);
			//중복이 안된 경우만 출석 인정(1일 1회)
			
			if(present_cnt == 0){
				sixDao.checkPresent(present_dto);
			}
		} else {
			req.getSession().setAttribute("group_per", 4);
		}
		
		InterestGroupDTO dto = new InterestGroupDTO();
		dto.setMem_id(mem_id);
		dto.setGroup_num(Integer.parseInt(req.getParameter("group_num")));
		
		int favo_cnt = sixDao.favoriteCheck(dto);
		
		model.addAttribute("favo_cnt", favo_cnt);
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
				
		int cnt = sixDao.moimModifyPro(dto);
		
		model.addAttribute("dto", dto);		
		model.addAttribute("cnt", cnt);
	}

	//모임-모임폐쇄
	@Override
	public void moimDelete(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		List<String> memberList = sixDao.memberName(group_num);
		String group_name = sixDao.groupName(group_num);
		
		Map<String, Object> notiMap = new HashMap<>();
		notiMap.put("type", 9);
		notiMap.put("memberList", memberList);
		notiMap.put("group_name", group_name);
		mainService.addNotice(notiMap);
		
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
					
					int cnt = sixDao.moimAddImageProB(dto);
					model.addAttribute("cnt", cnt);
				}
			}
		}
	}
	
	//모임채팅참석폼
	public void moimChatForm(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		String mem_id = req.getParameter("mem_id");
	//--사이드 시작	
		int group_num = Integer.parseInt(req.getParameter("group_num"));
				
		//사이드- 모임명, 모임카테고리 불러오기
		MoimOpenDTO open_dto = sixDao.moimMain(group_num);
		model.addAttribute("open_dto", open_dto);
		
		//사이드 - 대표사진 불러오기
		MainPictureDTO picture_dto = sixDao.moimImagesView(group_num).get(0);
		model.addAttribute("picture_dto", picture_dto);
		
		//사이드 - 모임원리스트 불러오기
		ArrayList<MemberInfoDTO> member_dtos = sixDao.memberList(group_num);
		model.addAttribute("member_dtos", member_dtos);	
	//--사이드 끝
		
		//모임채팅번호 받기
		int chat_room_num = sixDao.moimChatNum(group_num);
		req.getSession().setAttribute("chat_room_num", chat_room_num);
	
		//모임가입여부 체크
		CheckPresentDTO present_dto = new CheckPresentDTO();
		present_dto.setMem_id(mem_id);
		present_dto.setGroup_num(group_num);
		
		int check_cnt = sixDao.memberCheck(present_dto);
		model.addAttribute("check_cnt", check_cnt);
		
	}
	
	//모임채팅실행창
	public void moimChat(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

	//--사이드 시작	
		int group_num = Integer.parseInt(req.getParameter("group_num"));
				
		//사이드- 모임명, 모임카테고리 불러오기
		MoimOpenDTO open_dto = sixDao.moimMain(group_num);
		model.addAttribute("open_dto", open_dto);
		
		//사이드 - 대표사진 불러오기
		MainPictureDTO picture_dto = sixDao.moimImagesView(group_num).get(0);
		model.addAttribute("picture_dto", picture_dto);
		
		//사이드 - 모임원리스트 불러오기
		ArrayList<MemberInfoDTO> member_dtos = sixDao.memberList(group_num);
		model.addAttribute("member_dtos", member_dtos);	
	//--사이드 끝
		
		
		int chat_room_num = Integer.parseInt(req.getParameter("chat_room_num"));
		
		//기존 채팅 내용 유무 확인
		int cnt = sixDao.msgCheck(chat_room_num);
		model.addAttribute("cnt", cnt);
		//채팅전체내용 불러오기
		if(cnt != 0) {
			ArrayList<MsgListDTO> dtos = new ArrayList<MsgListDTO>();
			dtos = sixDao.getMsgs(chat_room_num);
			model.addAttribute("dtos", dtos);
		}
	}
	
	//채팅내용입력
	public void addChat(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException {
		
		int chat_room_num = Integer.parseInt(req.getParameter("chat_room_num"));
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		String msg_content = req.getParameter("msg_content");
		Timestamp msg_date = new Timestamp(System.currentTimeMillis());

		MsgListDTO dto = new MsgListDTO();
		dto.setChat_room_num(chat_room_num);
		dto.setMem_id(mem_id);
		dto.setMsg_content(msg_content);
		dto.setMsg_date(msg_date);
	
		int cnt = sixDao.addMsg(dto);
		
		if(cnt == 1) {
			Map<String, Object> map = new HashMap<>();

			map.put("msg_date", msg_date);
			map.put("mem_id", mem_id);
			dto = sixDao.getMsg(map);
			mav.addObject("dto", dto);
		}
		mav.addObject("cnt", cnt);
	}
	
	//채팅내용 출력
	public void getChat(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException {
		int chat_room_num = (Integer)(req.getSession().getAttribute("chat_room_num"));
		Timestamp msg_date = new Timestamp(System.currentTimeMillis());
		Timestamp t2 = new Timestamp(System.currentTimeMillis() - 300);
		
		Map<String, Object> map = new HashMap<>();
		map.put("msg_date", msg_date);
		map.put("chat_room_num", chat_room_num);
		map.put("t2", t2);
		
		ArrayList<MsgListDTO> dtos = new ArrayList<MsgListDTO>();
		
		dtos = sixDao.getChat(map);
		mav.addObject("dtos", dtos);
	}
	
	//모임멤버 상세보기-사이드바용
	public void moimMemberDetail(Model model){
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int group_num = Integer.parseInt(req.getParameter("group_num"));
		String member_id = req.getParameter("mem_id");
		
		MemberInfoDTO dto = sixDao.moimMemberDetail(member_id);
		String birthA = String.valueOf(dto.getBirth());
		String[] birthB = birthA.split(" ");
		String birth = birthB[0];
		
		model.addAttribute("birth", birth);
		model.addAttribute("dto", dto);
		
		Map<String, Object> daoMap = model.asMap();
		daoMap.put("mem_id", member_id);
		daoMap.put("group_num", group_num);
		
		String lastConnectA = String.valueOf(sixDao.lastConnect(daoMap));
		String[] lastConnectB = lastConnectA.split(" ");
		String lastConnect = lastConnectB[0];
		
		model.addAttribute("lastConnect", lastConnect);
	}
	
	//관심모임등록
	public void favorite(ModelAndView mav, HttpServletRequest req) {
			
		InterestGroupDTO dto = new InterestGroupDTO();
		dto.setMem_id((String)(req.getSession().getAttribute("mem_id")));
		dto.setGroup_num((Integer)(req.getSession().getAttribute("group_num")));
		
		int checkCnt = sixDao.favoriteCheck(dto);
		mav.addObject("checkCnt", checkCnt);
		if(checkCnt == 0) {
			sixDao.favoriteInsert(dto);
		} else {
			sixDao.favoriteDelete(dto);
		}
	}

	//모임목록 상세보기
	public void categoryDetail(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		String category = req.getParameter("category");
		String subject = req.getParameter("subject");
	
		model.addAttribute("category", category);
		model.addAttribute("subject", subject);
		
		if(subject.equals("아웃도어/여행")) {
	
			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyA();
			model.addAttribute("dtos", dtos);
		
		} else if(subject.equals("운동/스포츠")) {
		
			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyB();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("인문학/책/글")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyC();
			model.addAttribute("dtos", dtos);
	
		} else if(subject.equals("외국/언어")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyD();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("문화/공연")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyE();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("음악/악기")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyF();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("공예/만들기")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyG();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("댄스/무용")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyH();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("봉사활동")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyI();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("사교/인맥")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyJ();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("차/오토바이")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyK();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("사진")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyL();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("야구관람")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyM();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("게임/오락")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyN();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("요리/제조")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyO();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("반려동물")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyP();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("가족/결혼")) {
		
			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyQ();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("자유주제")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryHobbyR();
			model.addAttribute("dtos", dtos);
		
		} else if(subject.equals("서울특별시")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationA();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("부산광역시")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationB();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("인천광역시")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationC();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("대구광역시")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationD();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("대전광역시")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationE();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("광주광역시")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationF();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("울산광역시")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationG();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("세종특별자치시")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationH();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("경기도")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationI();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("강원도")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationJ();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("충청북도")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationK();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("충청남도")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationL();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("경상북도")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationM();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("경상남도")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationN();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("전라북도")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationO();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("전라남도")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationP();
			model.addAttribute("dtos", dtos);

		} else if(subject.equals("제주특별자치도")) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryLocationQ();
			model.addAttribute("dtos", dtos);
			
		} else if(subject.equals("인기모임")) {
			
			ArrayList<HotMoimDTO> hot_dtos = sixDao.hotMoim();
			ArrayList<MoimOpenDTO> dtos = new ArrayList<MoimOpenDTO>();
			for(int i=0; i<hot_dtos.size(); i++) {
				MoimOpenDTO dto = sixDao.hotMoimPic(Integer.parseInt(hot_dtos.get(i).getGroup_num()));
				dtos.add(dto);
			}
			
			model.addAttribute("dtos", dtos);
		
		} else if(subject.equals("추천모임")) {

			//회원의 관심 카테고리 정보 조회
			String mem_id = (String)req.getSession().getAttribute("mem_id");
			InterestCatDTO cateDto = sixDao.inteCate(mem_id);
			if(cateDto != null){
				String group_inte1 = cateDto.getInter_first();	
				String group_inte2 = cateDto.getInter_second();
				//회원의 관심 지역 정보 조회
				InterestLocationDTO locaDto = sixDao.inteLoca(mem_id);
				String group_location = locaDto.getLoc_city() + "-" + locaDto.getLoc_gu();
				model.addAttribute("group_inte1", group_inte1);
				model.addAttribute("group_inte2", group_inte2);
				model.addAttribute("group_location", group_location);
				
				//추천모임
				Map<String, Object> daoMap = model.asMap();
				daoMap.put("group_inte1", group_inte1);
				daoMap.put("group_inte2", group_inte2);
				daoMap.put("group_location", group_location);
				
				int cnt = sixDao.recommendMoimChk(daoMap);
				if (cnt != 0){
					ArrayList<MoimOpenDTO> dtos = sixDao.recommendMoim(daoMap);
					model.addAttribute("dtos", dtos);
					}
				}
		
		
		} else if(Integer.parseInt(subject.split("명")[0]) == 5) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleA();
			model.addAttribute("dtos", dtos);
			
		} else if(Integer.parseInt(subject.split("명")[0]) == 10) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleB();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 20) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleC();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 30) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleD();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 40) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleE();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 50) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleF();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 100) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleG();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 150) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleH();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 200) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleI();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 250) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleJ();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 300) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleK();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 350) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleL();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 400) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleM();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 450) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleN();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 500) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleO();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 600) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleP();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 700) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleQ();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 800) {
			
			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleR();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 900) {

			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleS();
			model.addAttribute("dtos", dtos);

		} else if(Integer.parseInt(subject.split("명")[0]) == 1000) {
			
			ArrayList<MoimOpenDTO> dtos = sixDao.categoryScaleT();
			model.addAttribute("dtos", dtos);
			
		} 
	}
	
	//판매자등록처리
	public void sellerRegisterPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();
		System.out.println(fileForm);
		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			// 업로드된 파일 이름을 받아옴
			String fileName = multipartFile.getOriginalFilename();
			
			if(fileName.trim().length()>4){
				
				String rootPath = Code.rootPath;
				String imgPath = Code.B_C_PATH;
				
				int type = FileManager.checkFileType(fileName);
				String filename = null;
				
				if(type == 1) {
					// 파일을 저장 후 저장된 파일명을 반환
						
					filename = FileManager.saveFile(multipartFile, rootPath + imgPath, fileName);
					SellerInfoDTO dto = new SellerInfoDTO();
					dto.setSeller_id(req.getParameter("seller_id"));
										
					dto.setAddress((req.getParameter("roadAddrPart1"))+" "+(req.getParameter("addrDetail")));
					dto.setTel(req.getParameter("tel"));
					dto.setComp_name(req.getParameter("comp_name"));
					dto.setBank(req.getParameter("bank"));
					dto.setAccount_number(req.getParameter("account_number"));
					dto.setDepositor(req.getParameter("depositor"));
					dto.setReason(req.getParameter("reason"));
					dto.setReg_date(new Timestamp(System.currentTimeMillis()));
					dto.setBc_name(filename);
					dto.setBc_path(Code.B_C_PATHS);
					dto.setRecognition(Code.seler_waiting);

					int chk_cnt = sixDao.sellerRegisterChk(req.getParameter("seller_id"));
					int cnt = 0;
					if(chk_cnt == 0) {
						cnt = sixDao.sellerRegisterPro(dto);
					}
					model.addAttribute("chk_cnt", chk_cnt);
					model.addAttribute("cnt", cnt);
				}
			}
		}
	}

	//샵-제품 상세보기
	public void productDetail(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		//상품정보
		productInfoDTO dto =sixDao.productDetail(product_num);
		ArrayList<ProductPicDTO> pic_dtos = sixDao.productPic(product_num);
		ProductPicDTO pic_dto = pic_dtos.get(0);
		ProductPicDTO pic_dto1 = pic_dtos.get(1);
		model.addAttribute("dto", dto);
		model.addAttribute("pic_dto", pic_dto);
		model.addAttribute("pic_dto1", pic_dto1);
		
		//관련상품
		Map<String, Object> relMap = new HashMap<>();
		relMap.put("product_num", product_num);
		relMap.put("start", 1);
		relMap.put("end", 8);
		ArrayList<productInfoDTO> rel_dtos_sub = sixDao.relative(relMap);
		ArrayList<productInfoDTO> rel_dtos = new ArrayList<productInfoDTO>();
		
		for(int i=0; i<rel_dtos_sub.size(); i=i+2){
			rel_dtos.add(rel_dtos_sub.get(i));
		}
		
		model.addAttribute("rel_dtos", rel_dtos);
		
		//상품리뷰
		ArrayList<ProductCommentsDTO> dtos = sixDao.reviewList(product_num);
		model.addAttribute("reviewCnt", dtos.size());
		model.addAttribute("dtos", dtos);
		
		//상품문의
		ArrayList<ProductQueDTO> que_dtos = sixDao.queList(product_num); 
		model.addAttribute("que_dtos", que_dtos);
		model.addAttribute("queCnt", que_dtos.size());
		
	
	}
	
	//샵-제품주문화면
	public void buy(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		model.addAttribute("pic_path", req.getParameter("pic_path"));
		model.addAttribute("pic_name", req.getParameter("pic_name"));
		model.addAttribute("product_price", req.getParameter("product_price"));
		model.addAttribute("product_num", req.getParameter("product_num"));
		model.addAttribute("order_limit", req.getParameter("order_limit"));
		model.addAttribute("product_name", req.getParameter("product_name"));
		System.out.println(req.getParameter("product_name"));
	}
	
	//샵-결제 처리
	public void order(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		PaymentListDTO plDto = new PaymentListDTO();
		OrderListDTO olDto = new OrderListDTO();

		String address = "(우:"+ req.getParameter("order_rec_zip1")+")"
				+ req.getParameter("order_rec_addr1") + " " 
				+ req.getParameter("order_rec_addr2");
		String hp = req.getParameter("order_rec_hp1") + "-" +
					req.getParameter("order_rec_hp2") + "-" +
					req.getParameter("order_rec_hp3");
		String tel = req.getParameter("order_rec_tel1") + "-" +
					req.getParameter("order_rec_tel2") + "-" + 
					req.getParameter("order_rec_tel3");
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		int payment_num = sixDao.GetPaymentnum();
		int order_qty = Integer.parseInt(req.getParameter("cnt"));
		String delivery_request;
		if(req.getParameter("order_memo").equals("")){
			delivery_request= "없음";
		} else {
			delivery_request = req.getParameter("order_memo");
		}
		
		//결제처리
		System.out.println(payment_num);
		plDto.setPayment_num(payment_num);
		plDto.setReceiver_name(req.getParameter("order_rec_name"));
		plDto.setAddress(address);
		plDto.setTel1(hp);
		plDto.setTel2(tel);
		plDto.setDelivery_request(delivery_request);
		plDto.setPayment_means(req.getParameter("order_pay_type"));
		plDto.setPayment_amount(Integer.parseInt(req.getParameter("product_price")));
		plDto.setMem_id(mem_id);
		sixDao.Payment(plDto);
		
		//구매처리
		olDto.setOrder_date(new Timestamp(System.currentTimeMillis()));
		olDto.setOrder_qty(order_qty);
		olDto.setOrder_status(Code.BEFORE_PAYMENT);
		olDto.setMem_id(mem_id);
		olDto.setProduct_num(Integer.parseInt(req.getParameter("product_num")));
		olDto.setPayment_num(payment_num);
		sixDao.Order(olDto);
		
		//재고감소
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("product_num", product_num);
		daoMap.put("order_qty", order_qty);
		sixDao.StockMinus(daoMap);
		
		model.addAttribute("good_name", req.getParameter("product_name"));
		model.addAttribute("good_mny", req.getParameter("product_price"));
		model.addAttribute("product_num", product_num);
		model.addAttribute("payment_num", payment_num);
	}

	//샵-상품평 입력창
	public void productReview(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int product_num = Integer.parseInt(req.getParameter("product_num"));
		String product_name = req.getParameter("product_name");
		String pic_path = req.getParameter("pic_path");
		String pic_name = req.getParameter("pic_name");

		model.addAttribute("product_num", product_num);
		model.addAttribute("product_name", product_name);
		model.addAttribute("pic_path", pic_path);
		model.addAttribute("pic_name", pic_name);

	}
	
	//샵-상품평 입력결과 처리
	public void productReviewPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ProductCommentsDTO dto = new ProductCommentsDTO();
		
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		String comments_content = req.getParameter("reply_content");
		String comments_title = req.getParameter("reply_title");	
		int star_points = Integer.parseInt(req.getParameter("reply_score"));
		
		dto.setProduct_num(product_num);
		dto.setComments_content(comments_content);
		dto.setComments_title(comments_title);
		dto.setStar_points(star_points);
		dto.setComments_date(new Timestamp(System.currentTimeMillis()));
		dto.setMem_id(mem_id);
		
		int cnt = sixDao.productReviewPro(dto);
		model.addAttribute("cnt", cnt);
		model.addAttribute("product_num", product_num);
	}
	
	
	
	//샵-상품문의 입력결과 처리
	public void inquirePro(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		ProductQueDTO dto = new ProductQueDTO();
		
		String visible;
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		String que_content = req.getParameter("qna_content");
		String que_title = req.getParameter("qna_title");	
		String que_type = req.getParameter("qna_category");
		Timestamp que_date = new Timestamp(System.currentTimeMillis());
		
		if(req.getParameter("qna_secret") == null) {
			visible = "yes";
		} else {
			visible = req.getParameter("qna_secret");
		};
		
		dto.setMem_id(mem_id);
		dto.setProduct_num(product_num);
		dto.setQue_content(que_content);
		dto.setQue_date(que_date);
		dto.setQue_title(que_title);
		dto.setQue_type(que_type);
		dto.setVisible(visible);
		
		int cnt = sixDao.inquirePro(dto);
		model.addAttribute("cnt", cnt);

		model.addAttribute("product_num", product_num);
		
	}
	
	//샵-상품리뷰 삭제
	public void productReviewDelete(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int comments_num = Integer.parseInt(req.getParameter("comments_num"));
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		sixDao.productReviewDelete(comments_num);
		model.addAttribute("product_num", product_num);
	}

	//샵-상품문의 삭제
	public void productQnaDelete(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int que_num = Integer.parseInt(req.getParameter("que_num"));
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		sixDao.productQnaDelete(que_num);
		model.addAttribute("product_num", product_num);
	}
	
	//샵-상품리뷰 수정창
	public void productReviewModify(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int comments_num = Integer.parseInt(req.getParameter("comments_num"));
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		String pic_path = req.getParameter("pic_path");
		String pic_name = req.getParameter("pic_name");

		model.addAttribute("product_num", product_num);
		model.addAttribute("pic_path", pic_path);
		model.addAttribute("pic_name", pic_name);
		
		ProductCommentsDTO dto = sixDao.productReviewModify(comments_num);
		model.addAttribute("dto", dto);
	}
	
	//샵-상품리뷰 수정처리
	public void productReviewModifyPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		ProductCommentsDTO dto = new ProductCommentsDTO();
		
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		String comments_content = req.getParameter("reply_content");
		String comments_title = req.getParameter("reply_title");	
		int star_points = Integer.parseInt(req.getParameter("reply_score"));
		int comments_num = Integer.parseInt(req.getParameter("comments_num"));
		dto.setComments_content(comments_content);
		dto.setComments_title(comments_title);
		dto.setStar_points(star_points);
		dto.setComments_num(comments_num);
		System.out.println(dto.getComments_num());
		sixDao.productReviewModifyPro(dto);
		
		model.addAttribute("product_num", product_num);
	}
	
	//샵-상품문의 수정폼
	public void inquireModify(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int que_num = Integer.parseInt(req.getParameter("que_num"));
		int product_num = Integer.parseInt(req.getParameter("product_num"));
		String pic_path = req.getParameter("pic_path");
		String pic_name = req.getParameter("pic_name");

		model.addAttribute("product_num", product_num);
		model.addAttribute("pic_path", pic_path);
		model.addAttribute("pic_name", pic_name);
		
		ProductQueDTO dto = sixDao.inquireModify(que_num);
		model.addAttribute("dto", dto);
	}
	
	//샵-상품문의 수정처리
	public void inquireModifyPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	
		ProductQueDTO dto = new ProductQueDTO();

		int que_num = Integer.parseInt(req.getParameter("que_num"));
		String visible;
		String que_content = req.getParameter("qna_content");
		String que_title = req.getParameter("qna_title");	
		String que_type = req.getParameter("qna_category");
		
		if(req.getParameter("qna_secret") == null) {
			visible = "yes";
		} else {
			visible = req.getParameter("qna_secret");
		};
		
		dto.setQue_content(que_content);
		dto.setQue_title(que_title);
		dto.setQue_type(que_type);
		dto.setVisible(visible);
		dto.setQue_num(que_num);
		
		sixDao.inquireModifyPro(dto);
	}
	
	//샵-주문확인
	public void buyResult(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		ArrayList<PaymentListDTO> dtos = sixDao.buyResult(Integer.parseInt(req.getParameter("payment_num")));
		PaymentListDTO dto = dtos.get(0);
		model.addAttribute("dto", dto);
	}

	//샵-주문내역 상세보기
	public void orderDetail(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int payment_num = Integer.parseInt(req.getParameter("payment_num"));
		ArrayList<PaymentListDTO> dtos = sixDao.orderDetail(payment_num);
		model.addAttribute("dto", dtos.get(0));
		
	}

}
