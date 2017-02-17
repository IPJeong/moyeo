package com.engineers.moyeo.three.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.EmailSender;
import com.engineers.moyeo.main.common.FileManager;
import com.engineers.moyeo.main.common.TextMessage;
import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.main.service.MainService;
import com.engineers.moyeo.six.dto.InterestCatDTO;
import com.engineers.moyeo.six.dto.InterestLocationDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.three.dao.ThreeDAO;
import com.engineers.moyeo.three.dto.EventDTO;
import com.engineers.moyeo.three.dto.JoinRequestDTO;
import com.engineers.moyeo.three.dto.MemberDTO;
import com.engineers.moyeo.three.dto.ThreeDTO;

@Service("faq")
public class ThreeServiceImpl implements ThreeService{

	
	@Autowired
	ThreeDAO dao;
	@Autowired
	MainService noti;
	
	//FAQ페이지
	@Override
	public String faq(Model model) {				
		
		int cnt = 0;
		int cnt2 = 0;
		
		cnt = dao.getCount(); //등록된 FAQ카테고리 개수
		cnt2 = dao.getCount2(); //등록된 FAQ개수
		
		if(cnt > 0) {
			ArrayList<ThreeDTO> dtos = dao.getCategory(); //등록된 FAQ카테고리 리스트 불러오기
			model.addAttribute("dtos", dtos);			
		}	
		
		if(cnt2 > 0) {
			ArrayList<ThreeDTO> dtos2 = dao.getQuestions(); //등록된 FAQ리스트 불러오기
			model.addAttribute("dtos2", dtos2);
		}				
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("cnt2", cnt2);		
		
		return "/three/faq/faq";
	}
	
	//FAQ입력
	@Override
	public String faqInsertForm(Model model) {
		
		int cnt = 0;		
		
		cnt = dao.getCount(); //등록된 FAQ카테고리 개수
		
		if(cnt > 0) {
			ArrayList<ThreeDTO> dtos = dao.getCategory(); //등록된 FAQ카테고리 리스트 가져오기
			model.addAttribute("dtos", dtos);			
		}					
		
		model.addAttribute("cnt", cnt);		
		
		return "/three/faq/faqInsertForm";
	}
	
	//FAQ카테고리 입력
	@Override
	public String faqCtgInput(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ThreeDTO dto = new ThreeDTO();
		
		String ctgName = req.getParameter("ctgName");		
		
		dto.setCtgName(ctgName);
		int cnt = 0;
		int cnt2 = dao.ctgCheck(dto); //FAQ카테고리 중복 확인
		
		if(cnt2 == 0) {
			cnt = dao.insert(dto); //FAQ카테고리 입력	
		} else {
			cnt = -1;
		}
		
		model.addAttribute("cnt", cnt);
		
		return "/three/faq/faqCtgInput";
	}
	
	//FAQ 입력
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
		
		int cnt = dao.insertFaq(dto); //FAQ 입력
		
		model.addAttribute("cnt", cnt);		
				
		return "/three/faq/faqInsert";
	}
	
	//FAQ카테고리 수정 폼
	@Override
	public String faqCtgModify(Model model) {
		
		int cnt = 0;		
		
		cnt = dao.getCount(); //등록된 FAQ카테고리 가져오기 		
		
		if(cnt > 0) {
			ArrayList<ThreeDTO> dtos = dao.getCategory(); //FAQ카테고리 리스트 불러오기
			model.addAttribute("dtos", dtos);			
		}					
		
		model.addAttribute("cnt", cnt);		
		
		return "/three/faq/faqCtgModify";
		
	}
	
	//FAQ카테고리 수정 처리
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
		
		cnt = dao.update(dto);	//FAQ카테고리 수정 처리
		
		model.addAttribute("cnt", cnt);	
		
		return "/three/faq/faqCtgModifyPro";
	}

	@Override
	public String faqModifyForm(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int faqNum = Integer.parseInt(req.getParameter("faqNum"));
		int cnt = 0;
		
		ThreeDTO dto = dao.getInfo(faqNum); //FAQ값 가져오기
		
		model.addAttribute("dto", dto);		
		
		cnt = dao.getCount(); //등록된 FAQ 개수 가져오기	
		
		if(cnt > 0) {
			ArrayList<ThreeDTO> dtos = dao.getCategory(); //FAQ카테고리 리스트 가져오기
			model.addAttribute("dtos", dtos);			
		}					
		
		model.addAttribute("cnt", cnt);	
		
		return "/three/faq/faqModifyForm";
	}
	
	//FAQ수정
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
		
		int cnt = dao.updateFaq(dto); //FAQ수정하기
		
		model.addAttribute("cnt", cnt);
		
		return "/three/faq/faqModify";
	}

	//FAQ카테고리 삭제
	@Override
	public String faqCtgDelete(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ThreeDTO dto = new ThreeDTO();
		
		int ctgNum = Integer.parseInt(req.getParameter("ctgNum"));
		String ctgName = req.getParameter("ctgName");
		
		dto.setCtgNum(ctgNum);
		dto.setCtgName(ctgName);
		
		int cnt = dao.delete(dto); //FAQ 카테고리 삭제
		model.addAttribute("cnt", cnt);
		
		return "/three/faq/faqCtgDelete";
	}
	
	//FAQ삭제
	@Override
	public String faqDelete(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		ThreeDTO dto = new ThreeDTO();
		
		int faqNum = Integer.parseInt(req.getParameter("faqNum"));
		
		dto.setFaqNum(faqNum);
		
		int cnt = dao.deleteFaq(dto); //FAQ삭제하기
		
		model.addAttribute("cnt", cnt);
		
		return "/three/faq/faqDelete";
	}
	
	//이벤트 등록하기
	@Override
	public String eventInsert(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
		
		String eventTitle = req.getParameter("eventTitle");
		String eventCon = (req.getParameter("eventCon")).replace("\r\n","<br>");
		Timestamp regDate = new Timestamp(System.currentTimeMillis());
		Timestamp startDate = Timestamp.valueOf(req.getParameter("startDate") + " 00:00:00.0");
		Timestamp endDate = Timestamp.valueOf(req.getParameter("endDate") + " 00:00:00.0");
		Timestamp notiDate = Timestamp.valueOf(req.getParameter("notiDate") + " 00:00:00.0");
		String ing = "Ing";
		String adminId = (String) req.getSession().getAttribute("manager_id");
		
		String pp="경로";
		String pn="이름";
		
		EventDTO dto = new EventDTO();		
		
		dto.setEventTitle(eventTitle);
		dto.setEventCon(eventCon);
		dto.setRegDate(regDate);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setNotiDate(notiDate);
		dto.setIng(ing);
		dto.setAdminId(adminId);
		dto.setPicPath(pp);
		dto.setPicName(pn);
		
		int cnt = dao.eventInsert(dto);	//이벤트 등록
				
		int eventNum = dao.getEventNum(regDate); //이벤트 번호 가져오기
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();		
		System.out.println(files.size());
		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			//업로드 파일 이름을 받아옴
			String fileName = multipartFile.getOriginalFilename();			
			
			if(fileName.trim().length()>4){
				
				String rootPath = Code.rootPath;
				//이벤트 썸네일 이미지 저장경로
				String thumbImgPath = Code.eventImgPath;
				//이벤트 이미지 저장경로
				String conImgPath = Code.eventImgsPath;
				//이미지 이름 확인하여 분류 하기
				String imgName = multipartFile.getName();
				// 파일의 타입을 확인하여 가져옴
				int type = FileManager.checkFileType(fileName);				
				String filename = null;				
				
				if(type == 1 && imgName.equals("files[0]")) {	
					
					filename = FileManager.saveFile(multipartFile, rootPath + thumbImgPath, fileName);
					
					dto.setPicPath(Code.eventImgPathS);
					dto.setPicName(filename);
					dto.setEventNum(eventNum);	
					
					dao.eventImgInsert(dto); //썸네일 이미지 넣기
					
				} else if(type == 1 && imgName.equals("files[1]")) {
					
					filename = FileManager.saveFile(multipartFile, rootPath + conImgPath, fileName);
					
					dto.setPicPath2(Code.eventImgsPathS);
					dto.setPicName2(filename);					
					dto.setEventNum(eventNum);
					
					dao.eventImgsInsert(dto); //이벤트 이미지 넣기
				}
			}
			
		}
		
		model.addAttribute("cnt", cnt);
		
		return "/three/event/eventInsert";
	}
	
	//이벤트 페이지
	@Override
	public String ing_event(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//이벤트 리스트
		int pageSize = 3;		//	한 페이지당 출력한 글 개수
		int pageBlock = 5;		//	출력할 페이지 개수
		
		int cnt = 0;			// 글 개수
		int start = 0;			// 현재 페이지 시작번호 : rownum
		int end	= 0;			// 현재 페이지지 끝번호 : rownum
		int number = 0;			// 출력할 글 번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 개수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		//당첨자 리스트
		int pageSize2 = 5;		//	한 페이지당 출력한 글 개수
		int pageBlock2 = 5;		//	출력할 페이지 개수
		
		int cnt2 = 0;			// 글 개수
		int start2 = 0;			// 현재 페이지 시작번호 : rownum
		int end2	= 0;			// 현재 페이지지 끝번호 : rownum
		int number2 = 0;			// 출력할 글 번호
		String pageNum2 = null;	// 페이지 번호
		int currentPage2 = 0;	// 현재 페이지
		
		int pageCount2 = 0;		// 페이지 개수
		int startPage2 = 0;		// 시작 페이지
		int endPage2 = 0;		// 마지막 페이지
		
		cnt = dao.getEventCount(); //등록된 이벤트 개수 가져오기	
		cnt2 = dao.getWinCount(); //당첨 리스트 개수
		
		pageNum = req.getParameter("pageNum");
		pageNum2 = req.getParameter("pageNum2");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		if(pageNum2 == null) {
			pageNum2 = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		currentPage2 = Integer.parseInt(pageNum2);
		pageCount2 = (cnt2 / pageSize2) + (cnt2 % pageSize2 > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; // (5 - 1) * 10 + 1;
		end = start + pageSize - 1; //41 + 10 - 1 = 50;
		
		start2 = (currentPage2 - 1) * pageSize2 + 1; // (5 - 1) * 10 + 1;
		end2 = start2 + pageSize2 - 1; //41 + 10 - 1 = 50;
		
		if(end > cnt) end = cnt;
		
		if(end2 > cnt2) end2 = cnt2;
				
		number = cnt - (currentPage - 1) * pageSize;
		
		number2 = cnt2 - (currentPage2 - 1) * pageSize2;
		
		Map<String, Integer> dataMap = new HashMap<>();
		dataMap.put("start", start);
		dataMap.put("end", end);
		
		if(cnt > 0) {
			ArrayList<EventDTO> dtos = dao.getEventList(dataMap); //이벤트 리스트 불러오기
			ArrayList<EventDTO> dtos2 = dao.getEventPic(dataMap); //이벤트 이미지 불러오기
			req.setAttribute("dtos", dtos);
			req.setAttribute("dtos2", dtos2);
		}
		
		Map<String, Integer> dataMap2 = new HashMap<>();
		dataMap2.put("start", start2);
		dataMap2.put("end", end2);
		
		if(cnt2 > 0) {
			ArrayList<EventDTO> dtos3 = dao.getWinList(dataMap2); //이벤트 리스트 불러오기
			ArrayList<EventDTO> dtos4 = dao.getDoneEventList(dataMap2);//이벤트 이미지 불러오기	
			ArrayList<EventDTO> dtos5 = dao.getEventPic(dataMap2);
			req.setAttribute("dtos3", dtos3);
			req.setAttribute("dtos4", dtos4);
			req.setAttribute("dtos5", dtos5);
			
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		startPage2 = (currentPage2 / pageBlock2) * pageBlock2 + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage2 % pageBlock2 == 0) startPage2 -= pageBlock2;
		
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		endPage2 = startPage2 + pageBlock2 - 1;
		if(endPage2 > pageCount2) endPage2 = pageCount2;
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("number", number); 
		req.setAttribute("pageNum", pageNum);
		
		req.setAttribute("cnt2", cnt2);
		req.setAttribute("number2", number2); 
		req.setAttribute("pageNum2", pageNum2);
		
		if(cnt > 0) {
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("pageBlock", pageBlock);
		}
		
		if(cnt2 > 0) {
			req.setAttribute("currentPage2", currentPage2);
			req.setAttribute("startPage2", startPage2);
			req.setAttribute("endPage2", endPage2);
			req.setAttribute("pageCount2", pageCount2);
			req.setAttribute("pageBlock2", pageBlock2);
		}
		
		return "/three/event/ing_event";	
	}
	
	//이벤트 페이지2
		@Override
		public String ing_event2(Model model) {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest req = (HttpServletRequest)map.get("req");
			
			//이벤트 리스트
			int pageSize = 3;		//	한 페이지당 출력한 글 개수
			int pageBlock = 5;		//	출력할 페이지 개수
			
			int cnt = 0;			// 글 개수
			int start = 0;			// 현재 페이지 시작번호 : rownum
			int end	= 0;			// 현재 페이지지 끝번호 : rownum
			int number = 0;			// 출력할 글 번호
			String pageNum = null;	// 페이지 번호
			int currentPage = 0;	// 현재 페이지
			
			int pageCount = 0;		// 페이지 개수
			int startPage = 0;		// 시작 페이지
			int endPage = 0;		// 마지막 페이지
			
			//당첨자 리스트
			int pageSize2 = 5;		//	한 페이지당 출력한 글 개수
			int pageBlock2 = 5;		//	출력할 페이지 개수
			
			int cnt2 = 0;			// 글 개수
			int start2 = 0;			// 현재 페이지 시작번호 : rownum
			int end2	= 0;			// 현재 페이지지 끝번호 : rownum
			int number2 = 0;			// 출력할 글 번호
			String pageNum2 = null;	// 페이지 번호
			int currentPage2 = 0;	// 현재 페이지
			
			int pageCount2 = 0;		// 페이지 개수
			int startPage2 = 0;		// 시작 페이지
			int endPage2 = 0;		// 마지막 페이지
			
			cnt = dao.getEventCount(); //등록된 이벤트 개수 가져오기	
			cnt2 = dao.getWinCount(); //당첨 리스트 개수
			
			pageNum = req.getParameter("pageNum");
			pageNum2 = req.getParameter("pageNum2");
			
			if(pageNum == null) {
				pageNum = "1";
			}
			
			if(pageNum2 == null) {
				pageNum2 = "1";
			}
			
			currentPage = Integer.parseInt(pageNum);
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
			
			currentPage2 = Integer.parseInt(pageNum2);
			pageCount2 = (cnt2 / pageSize2) + (cnt2 % pageSize2 > 0 ? 1 : 0);
			
			start = (currentPage - 1) * pageSize + 1; // (5 - 1) * 10 + 1;
			end = start + pageSize - 1; //41 + 10 - 1 = 50;
			
			start2 = (currentPage2 - 1) * pageSize2 + 1; // (5 - 1) * 10 + 1;
			end2 = start2 + pageSize2 - 1; //41 + 10 - 1 = 50;
			
			if(end > cnt) end = cnt;
			
			if(end2 > cnt2) end2 = cnt2;
					
			number = cnt - (currentPage - 1) * pageSize;
			
			number2 = cnt2 - (currentPage2 - 1) * pageSize2;
			
			Map<String, Integer> dataMap = new HashMap<>();
			dataMap.put("start", start);
			dataMap.put("end", end);
			
			if(cnt > 0) {
				ArrayList<EventDTO> dtos = dao.getEventList(dataMap); //이벤트 리스트 불러오기
				ArrayList<EventDTO> dtos2 = dao.getEventPic(dataMap); //이벤트 이미지 불러오기
				req.setAttribute("dtos", dtos);
				req.setAttribute("dtos2", dtos2);
			}
			
			Map<String, Integer> dataMap2 = new HashMap<>();
			dataMap2.put("start", start2);
			dataMap2.put("end", end2);
			
			if(cnt2 > 0) {
				ArrayList<EventDTO> dtos3 = dao.getWinList(dataMap2); //이벤트 리스트 불러오기
				ArrayList<EventDTO> dtos4 = dao.getDoneEventList(dataMap2);//이벤트 이미지 불러오기	
				ArrayList<EventDTO> dtos5 = dao.getEventPic(dataMap2);
				req.setAttribute("dtos3", dtos3);
				req.setAttribute("dtos4", dtos4);
				req.setAttribute("dtos5", dtos5);
				
			}
			
			startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
			if(currentPage % pageBlock == 0) startPage -= pageBlock;
			
			startPage2 = (currentPage2 / pageBlock2) * pageBlock2 + 1; // (5 / 3) * 3 + 1 = 4
			if(currentPage2 % pageBlock2 == 0) startPage2 -= pageBlock2;
			
			endPage = startPage + pageBlock - 1;
			if(endPage > pageCount) endPage = pageCount;
			
			endPage2 = startPage2 + pageBlock2 - 1;
			if(endPage2 > pageCount2) endPage2 = pageCount2;
			
			req.setAttribute("cnt", cnt);
			req.setAttribute("number", number); 
			req.setAttribute("pageNum", pageNum);
			
			req.setAttribute("cnt2", cnt2);
			req.setAttribute("number2", number2); 
			req.setAttribute("pageNum2", pageNum2);
			
			if(cnt > 0) {
				req.setAttribute("currentPage", currentPage);
				req.setAttribute("startPage", startPage);
				req.setAttribute("endPage", endPage);
				req.setAttribute("pageCount", pageCount);
				req.setAttribute("pageBlock", pageBlock);
			}
			
			if(cnt2 > 0) {
				req.setAttribute("currentPage2", currentPage2);
				req.setAttribute("startPage2", startPage2);
				req.setAttribute("endPage2", endPage2);
				req.setAttribute("pageCount2", pageCount2);
				req.setAttribute("pageBlock2", pageBlock2);
			}
			
			return "/three/event/ing_event2";	
		}
	
	//아이디 중복체크
	@Override
	public void duplication(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException {
		//입력받은 아이디
		String memid = req.getParameter("memid");
					
		Map<String, Object> map = new HashMap<>();
		map.put("memid", memid);
		
		int cnt = dao.confirmId(map); //중복체크	
		
		mav.addObject("cnt", cnt);
		
	}
	
	//회원가입
	@Override
	public String registMember(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String memid = req.getParameter("memid");
		String passwd = req.getParameter("password");
		String address = req.getParameter("loc_category1") + " " + req.getParameter("loc_category2");
		String tel = req.getParameter("tel");		
		Timestamp birth = Timestamp.valueOf(req.getParameter("birth") + " 00:00:00.0");		
		Timestamp joinDate = new Timestamp(System.currentTimeMillis());
		String gender = req.getParameter("gender");		
				
		String rootPath = Code.rootPath;
		//프로필 사진 저장 경로
		String proImgPath = Code.profileImgPath;				
		//프로필 사진 불러올때 경로
		String proImgPathS = Code.profileImgPathS;
		//기본 프로필 사진 경로
		String proDefPath = Code.profileDefPath;
		//기본 프로필 사진 이름(남성)
		String proDefNameM = Code.profileDefNameM;
		//기본 프로필 사진 이름(여성)
		String proDefNameW = Code.profileDefNameW;
		
		MemberDTO dto = new MemberDTO();
		dto.setMem_id(memid.toLowerCase());
		dto.setPasswd(passwd);
		dto.setName(name);
		dto.setAddress(address);
		dto.setTel(tel);
		dto.setBirth(birth);
		dto.setEmail(email);			
		dto.setProPicPath(proDefPath);
		
		if(gender.equals("man")) {
			dto.setProPicName(proDefNameM);
		} else if (gender.equals("woman")) {
			dto.setProPicName(proDefNameW);
		}
		
		dto.setJoinDate(joinDate);
		dto.setGender(gender);
		
		int cnt = dao.memInfoInsert(dto); //회원정보 입력		
		
		List<MultipartFile> files = fileForm.getFiles();
		String filename = null;
		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			//업로드 파일 이름을 받아옴			
			String fileName = multipartFile.getOriginalFilename();			
						
			if(fileName.trim().length()>4) {				//사진저장 메인경로
											
				int type = FileManager.checkFileType(fileName);					
				
				if(type == 1) {						
					filename = FileManager.saveFile(multipartFile, rootPath + proImgPath, fileName);
					MemberDTO dto2 = new MemberDTO();
					dto2.setProPicPath(proImgPathS);
					dto2.setProPicName(filename);
					dto2.setMem_id(memid);
					
					dao.proImgInsert(dto2); //프로필 사진 입력
				} 
			}
			
		}
		
		EmailSender.sendEmail(email, TextMessage.congJoinMsgTitle(memid),TextMessage.congJoinMsgContent(memid),req.getSession().getServletContext().getRealPath("/resources/resource/assets/images/gallery/"));
		
		model.addAttribute("cnt", cnt);		
		model.addAttribute("memid", memid);
		return "/three/member/registMember";
	}
	
	//관심지역, 관심사 입력 페이지
	@Override
	public String memInterest(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String mem_id = (String) req.getSession().getAttribute("mem_id");
		
		if(mem_id == null) {
			mem_id = req.getParameter("memid");
		}
		
		model.addAttribute("memid", mem_id);

		return "/three/member/memInterest";
	}
	
	//관심지역, 관심사 입력 페이지 처리
	@Override
	public String memInterestInput(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String memid = req.getParameter("memid");
		String place1 = req.getParameter("loc_category1");
		String place2 = req.getParameter("loc_category2");
		String category1 = req.getParameter("recpla_category1").replace("_", "/");
		String category2 = req.getParameter("recpla_category2");
		
		Map<String, Object>	iMap = new HashMap<>();
		iMap.put("memid", memid);
		iMap.put("place1", place1);
		iMap.put("place2", place2);
		
		int cnt = dao.placeInsert(iMap); //관심지역 넣기
		
		Map<String, Object>	iMap2 = new HashMap<>();
		iMap2.put("memid", memid);
		iMap2.put("category1", category1);
		iMap2.put("category2", category2);
		
		int cnt2 = dao.cateInsert(iMap2); //관심사 넣기
		
		int cnt3 = 0;
		
		if(cnt == 1 && cnt2 == 1) {
			cnt3 = 1;
		}
		
		model.addAttribute("cnt", cnt3);		
		
		return "/three/member/memInterestInput";
	}	
	
	//이벤트 참여
	@Override
	public String eventParticipate(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String memid = req.getParameter("memid");
		int evenum = Integer.parseInt(req.getParameter("evenum"));
		int cnt = 0;
		
		Map<String, Object> datamap = new HashMap<>();
		datamap.put("memid", memid);
		datamap.put("evenum", evenum);
		
		int chk = dao.eveChk(datamap); //이벤트 참여 여부
		
		if(chk == 0) {
			cnt = dao.eveParticipate(datamap); //이벤트 참여
		} else if(chk == 1){
			cnt = -1;
		}
		
		model.addAttribute("cnt", cnt);		
		
		return "/three/event/eventParticipate";
	}
	
	//이벤트 참가자 명단
		@Override
		public String eventParticipants(Model model) {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest req = (HttpServletRequest)map.get("req");
			
			int event_num = Integer.parseInt(req.getParameter("event_num"));					 
			int start = 1;
			
			int cnt = dao.eventParticipantsCount(event_num); //이벤트 참가자 명수
			
			if(cnt != 0) {
				ArrayList<EventDTO> dtos = dao.getEvePartList(event_num);//이벤트 참가자 명단
				model.addAttribute("dtos", dtos);
				
			}
			
			
			model.addAttribute("event_num", event_num);
			model.addAttribute("cnt", cnt);
			model.addAttribute("start", start);
			
			return "/three/event/eventParticipants";
		}
	
	//마이 페이지
	@Override
	public String myPage(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String memid = (String) req.getSession().getAttribute("mem_id");
		String manageid = (String) req.getSession().getAttribute("manager_id");
		String mem_id = "";
				
		int cnt = 0;			// 글 개수		
		
		if(memid == null) {
			mem_id = manageid;
		} else if(manageid == null) {
			mem_id = memid;
		}
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("mem_id", mem_id);
		
		MemberDTO dto = dao.getMyInfo(map2); //내 정보 가져오기
		
		model.addAttribute("dto", dto);
		
		
		cnt = dao.getGroupCnt(mem_id); //가입한 모임 개수 가져오기
		int intCnt = dao.getInterCount(mem_id); //관심사 개수
		
		if(intCnt > 0) {
			InterestCatDTO catDto = dao.getCatDTO(mem_id); //관심사 가져오기
			
			String interCat1 = catDto.getInter_first();
			String interCat2 = catDto.getInter_second();
			
			InterestLocationDTO locaDto = dao.getLocaDTO(mem_id); //관심지역 가져오기
			String interLoca1 = locaDto.getLoc_city();
			String interLoca2 = locaDto.getLoc_gu();
			
			model.addAttribute("interCat1", interCat1);
			model.addAttribute("interCat2", interCat2);
			model.addAttribute("interLoca1", interLoca1);
			model.addAttribute("interLoca2", interLoca2);
		}
		
		model.addAttribute("intCnt", intCnt);
		
		int notiCnt =dao.getNoneChkNoti(mem_id);//확인 안한 알림
		model.addAttribute("notiCnt",notiCnt);
				
				
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("start", 1);
		dataMap.put("end", 1000);
		dataMap.put("mem_id", mem_id);
		
		if(cnt > 0) {
			ArrayList<MoimOpenDTO> dtos = dao.getGroupList(dataMap); //가입한 모임 리스트 불러오기			
			req.setAttribute("dtos", dtos);
			
		}
		
		int interCnt = dao.getInterGroupCnt(mem_id); // 관심 모임 개수 가져오기
		
		if(interCnt > 0) {
			List<MoimOpenDTO> interDtos = dao.getInterGroup(mem_id); //관심 모임 리스트 불러오기			
			req.setAttribute("interDtos", interDtos);
			System.out.println(interDtos.size());
			
		}
		
		int applHistoryCnt = dao.getApplHistoryCnt(mem_id); // 가입 신청 이력 개수 가져오기
		
		if(applHistoryCnt > 0) {
			List<JoinRequestDTO> applyDtos = dao.getApplHistory(mem_id); //가입 신청 이력 리스트 불러오기		
			req.setAttribute("applyDtos", applyDtos);
			System.out.println(applyDtos.size());
			
		}
				
		req.setAttribute("cnt", cnt);
		req.setAttribute("interCnt", interCnt);
		req.setAttribute("applHistoryCnt", applHistoryCnt);
		
		model.addAttribute("location", req.getParameter("location"));
		
		return "/three/member/myPage";
	}
	
	//프로필 사진 변경
	@Override
	public String changeProImg(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		FileForm fileForm = (FileForm)map.get("fileForm");
		
		String memid = (String) req.getSession().getAttribute("mem_id");
		String manageid = (String) req.getSession().getAttribute("manager_id");
		String mem_id = "";
		
		if(memid == null) {
			mem_id = manageid;
		} else if(manageid == null) {
			mem_id = memid;
		}
		
		String gender = req.getParameter("noImg");
		
		int cnt = 0;
		
		String rootPath = Code.rootPath;
		//프로필 사진 저장 경로
		String proImgPath = Code.profileImgPath;				
		//프로필 사진 불러올때 경로
		String proImgPathS = Code.profileImgPathS;
		//기본 프로필 사진 경로
		String proDefPath = Code.profileDefPath;
		//기본 프로필 사진 이름(남성)
		String proDefNameM = Code.profileDefNameM;
		//기본 프로필 사진 이름(여성)
		String proDefNameW = Code.profileDefNameW;
		
		if(gender != null) {
			
			MemberDTO dto = new MemberDTO();
			dto.setMem_id(mem_id);			
			dto.setProPicPath(proDefPath);		
			if(gender.equals("man")) {
				dto.setProPicName(proDefNameM);
			} else if (gender.equals("woman")) {
				dto.setProPicName(proDefNameW);
			}
			
			dao.proImgInsert(dto);
			
			cnt = 1;
			
		} else {
			cnt = -1;
			List<MultipartFile> files = fileForm.getFiles();
			String filename = null;
			// 업로드 파일 확인
			for (MultipartFile multipartFile : files) {
				//업로드 파일 이름을 받아옴			
				String fileName = multipartFile.getOriginalFilename();			
							
				if(fileName.trim().length()>4) {				//사진저장 메인경로
												
					int type = FileManager.checkFileType(fileName);					
					
					if(type == 1) {						
						filename = FileManager.saveFile(multipartFile, rootPath + proImgPath, fileName);
						MemberDTO dto2 = new MemberDTO();
						dto2.setProPicPath(proImgPathS);
						dto2.setProPicName(filename);
						dto2.setMem_id(mem_id);
						
						dao.proImgInsert(dto2); //프로필 사진 입력
						
						cnt = 2;
					} 
				}
				
			}
		
		}
		model.addAttribute("cnt", cnt);
		
		return "/three/member/changeProImg";
	}
	
	//현 비밀번호 체크
	@Override
	public void curPwChk(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException {
		//입력받은 아이디
		String memid = (String) req.getSession().getAttribute("mem_id");
		String manageid = (String) req.getSession().getAttribute("manager_id");
		String mem_id = "";
		
		if(memid == null) {
			mem_id = manageid;
		} else if(manageid == null) {
			mem_id = memid;
		}
		
		String passwd = req.getParameter("passwd");
					
		Map<String, Object> map = new HashMap<>();
		map.put("passwd", passwd);
		map.put("mem_id", mem_id);
		
		int cnt = dao.confirmPw(map); //현 비밀번호 체크
		
		mav.addObject("cnt", cnt);
		
	}
	
	//비밀번호 변경
	@Override
	public String changePw(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String memid = (String) req.getSession().getAttribute("mem_id");
		String manageid = (String) req.getSession().getAttribute("manager_id");
		String mem_id = "";
		
		if(memid == null) {
			mem_id = manageid;
		} else if(manageid == null) {
			mem_id = memid;
		}
		
		String passwd = req.getParameter("password");
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("passwd", passwd);
		map2.put("mem_id", mem_id);
		
		int cnt = dao.changePw(map2); //비밀번호 변경
		
		model.addAttribute("cnt", cnt);
		
		return "/three/member/changePw";
	}
	
	//내 정보 변경
	@Override
	public String changeMyInfo(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String memid = (String) req.getSession().getAttribute("mem_id");
		String manageid = (String) req.getSession().getAttribute("manager_id");
		String mem_id = "";
		
		if(memid == null) {
			mem_id = manageid;
		} else if(manageid == null) {
			mem_id = memid;
		}
		
		String name = req.getParameter("name");		
		String address = req.getParameter("address");		
		if (address == null) {
			address = req.getParameter("loc_category1") + " " + req.getParameter("loc_category2");
		} 
		
		String email = req.getParameter("email");
		String tel = req.getParameter("tel");
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("mem_id", mem_id);
		map2.put("name", name);
		map2.put("address", address);
		map2.put("email", email);
		map2.put("tel", tel);
		
		int cnt = dao.changeMyInfo(map2);//내 정보 수정
		
		model.addAttribute("cnt", cnt);		
		
		return "/three/member/changeMyInfo";
	}
	
	//회원탈퇴 비밀번호체크
	@Override
	public void deleteMem(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException {
		
		//입력받은 아이디
		String memid = (String) req.getSession().getAttribute("mem_id");
		String manageid = (String) req.getSession().getAttribute("manager_id");
		String mem_id = "";
		
		if(memid == null) {
			mem_id = manageid;
		} else if(manageid == null) {
			mem_id = memid;
		}
		
		String passwd = req.getParameter("passwd");
					
		Map<String, Object> map = new HashMap<>();
		map.put("passwd", passwd);
		map.put("mem_id", mem_id);
		
		int cnt = dao.confirmPw(map); //현 비밀번호 체크
		
		mav.addObject("cnt", cnt);		
		
	}
	
	//회원탈퇴
	@Override
	public String delMem(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String memid = (String) req.getSession().getAttribute("mem_id");
		String manageid = (String) req.getSession().getAttribute("manager_id");
		String mem_id = "";
		
		if(memid == null) {
			mem_id = manageid;
		} else if(manageid == null) {
			mem_id = memid;
		}
		System.out.println(mem_id);
		int cnt = dao.deleteMem(mem_id); //회원탈퇴
		
		req.getSession().setAttribute("mem_id", null);
		req.getSession().setAttribute("manager_id", null);
		
		model.addAttribute("cnt", cnt);
		
		return "/three/member/delMem";
	}
	
	//비밀번호 찾기
	@Override
	public String findPw(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String memid = req.getParameter("mem_id");
		String tempPw = UUID.randomUUID().toString().replaceAll("-", ""); 
		tempPw = tempPw.substring(0, 15);
		
		Map<String, Object> mapId = new HashMap<>();
		mapId.put("memid", memid);
		
		int cnt = dao.confirmId(mapId);
		
		if(cnt != 0) {
						
			Map<String, Object> chnPw = new HashMap<>();
			chnPw.put("memid", memid);
			chnPw.put("passwd", tempPw);
			
			String email = dao.getEmail(memid); //이메일 정보 가져오기
			
			int cnt2 = dao.tempIdChk(memid);//임시번호 아이디체크
			
			if(cnt2 == 0) {
				cnt = dao.tempInsert(chnPw); //임시번호 입력
			} else if(cnt2 == 1) {
				cnt = dao.tempUpdate(chnPw); //임시번호 수정
			}
			
			EmailSender.sendEmail(email, TextMessage.pwSearchEmailMsg(memid),
					TextMessage.pwSearchEmailMsgContent(memid, tempPw),
					req.getSession().getServletContext().getRealPath("/resources/resource/assets/images/gallery/"));
		} else {
			cnt = -1;
		}
		
		model.addAttribute("cnt", cnt);
		
		return "/three/member/findPw";
	}
	
	//비밀번호 변경 & 임시번호 삭제
	@Override
	public String chgPw(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String mem_id = (String) req.getSession().getAttribute("mem_id");
		String passwd = req.getParameter("password");
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("mem_id", mem_id);
		map2.put("passwd", passwd);
		
		int cnt = dao.changePw(map2);
		
		if(cnt == 1) {
			dao.tempDelete(mem_id);			
		} else {
			cnt = 0;
		}
		
		model.addAttribute("cnt", cnt);
		
		return "/three/member/chgPw";
	}
	
	//당첨자 선정
	@Override
	public String winEvent(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int event_num = Integer.parseInt(req.getParameter("event_Num"));
		System.out.println(event_num);
		String[] mem_id = req.getParameterValues("mem_id");		
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		int cnt = 0;

		if (mem_id != null) {
				
			EventDTO dto = dao.getEveInfo(event_num); //이벤트 제목, 내용 가져오기
			
			String title = dto.getEventTitle(); //이벤트 제목
			String cont = dto.getEventCon(); //이벤트 내용
			
			Map<String, Object> map2 = new HashMap<>();
			map2.put("title", title);
			map2.put("cont", cont);
			map2.put("reg_date", reg_date);
			map2.put("event_num", event_num);
			
			cnt = dao.winInsert(map2); //당첨리스트 입력
			
			if(cnt == 1) {
				int win_num = dao.getWinNum(event_num); //당첨번호 가져오기
				Map<String, Object> map3 = new HashMap<>();
				
				for(int i=0; i < mem_id.length; i++) {					
					map3.put("win_num", win_num);
					map3.put("mem_id", mem_id[i]);	
					
					dao.winnerInsert(map3); //당첨자 입력
				}
				
				ArrayList<EventDTO> mem_ids = dao.getEvePartList(event_num);				
					
				Map<String, Object> map4 = new HashMap<>();
				map4.put("type", 1);					
				map4.put("mem_ids", mem_ids);
				map4.put("event_title", title);
				
				noti.addNotice(map4);					
				
				
				dao.eventParticipantsDelete(event_num); //참여자 리스트에서 삭제
							
				dao.eventDone(event_num); //이벤트 진행상황 바꾸기
				
				
				
			}
		} else {
			cnt = -1;			
		}
		
		model.addAttribute("cnt", cnt);
		
		return "/three/event/winEvent";
	}
	
	//당첨자 확인창
	@Override
	public String chkWin(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int winning_num = Integer.parseInt(req.getParameter("winning_num"));					 
		int start = 1;
		
		int cnt = dao.getWinnerCount(winning_num); //이벤트 당첨자 명수
		
		if(cnt != 0) {
			ArrayList<EventDTO> dtos = dao.getWinnerList(winning_num);//이벤트 당첨자 명단
			model.addAttribute("dtos", dtos);
			
		}		
		
		model.addAttribute("winning_num", winning_num);
		model.addAttribute("cnt", cnt);
		model.addAttribute("start", start);
		
		return "/three/event/chkWin";
	}
	
	//알림메세지 창
	@Override
	public String notiList(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String mem_id = (String) req.getSession().getAttribute("mem_id");		
		
		int pageSize = 5;		//	한 페이지당 출력한 글 개수
		int pageBlock = 3;		//	출력할 페이지 개수
		
		int cnt = 0;			// 글 개수
		int start = 0;			// 현재 페이지 시작번호 : rownum
		int end	= 0;			// 현재 페이지지 끝번호 : rownum
		int number = 0;			// 출력할 글 번호
		String pageNum = null;	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		
		int pageCount = 0;		// 페이지 개수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		
		Map<String, Object> map2 = new HashMap<>();
		map2.put("mem_id", mem_id);	
				
		cnt = dao.getNotiCount(mem_id); //알림메세지 개수
		
		dao.chkNoti(mem_id);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; // (5 - 1) * 10 + 1;
		end = start + pageSize - 1; //41 + 10 - 1 = 50;
		
		if(end > cnt) end = cnt;
				
		number = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("start", start);
		dataMap.put("end", end);
		dataMap.put("mem_id", mem_id);
		
		if(cnt > 0) {
			ArrayList<MemberDTO> dtos = dao.getNotiList(dataMap);//가입한 모임 리스트 불러오기			
			req.setAttribute("dtos", dtos);
			
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		req.setAttribute("cnt", cnt);
		req.setAttribute("number", number); 
		req.setAttribute("pageNum", pageNum);		
		
		if(cnt > 0) {
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("pageBlock", pageBlock);
		}
		return "/three/member/notiList";
	}
		
	
	//관심사 수정 처리
	@Override
	public String memInterestModifyPro2(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String mem_id = req.getParameter("mem_id");		
		String category1 = req.getParameter("recpla_category1").replace("_", "/");
		String category2 = req.getParameter("recpla_category2");
			
		
		Map<String, Object>	iMap2 = new HashMap<>();
		iMap2.put("mem_id", mem_id);
		iMap2.put("category1", category1);
		iMap2.put("category2", category2);
		
		int cnt = dao.cateModify(iMap2); //관심사 수정
		
		model.addAttribute("cnt", cnt);		
		
		return "/three/member/memInterestModifyPro";
	}	
	
	
	//관심지역 수정 처리
	@Override
	public String memInterestModifyPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String mem_id = req.getParameter("mem_id");
		String place1 = req.getParameter("loc_category1");
		String place2 = req.getParameter("loc_category2");		
		
		Map<String, Object>	iMap = new HashMap<>();
		iMap.put("mem_id", mem_id);
		iMap.put("place1", place1);
		iMap.put("place2", place2);
		
		int cnt = dao.placeModify(iMap); //관심지역 수정	
				
		model.addAttribute("cnt", cnt);		
		
		return "/three/member/memInterestModifyPro2";
	}	
	
	
	
	
}
