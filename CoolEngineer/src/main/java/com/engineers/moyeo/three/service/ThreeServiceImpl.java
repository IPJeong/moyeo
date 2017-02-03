package com.engineers.moyeo.three.service;

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

import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.FileManager;
import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.three.dao.ThreeDAO;
import com.engineers.moyeo.three.dto.EventDTO;
import com.engineers.moyeo.three.dto.MemberDTO;
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
		String adminId = "admin"; /*(String) req.getSession().getAttribute("admin");*/
		
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
		
		int cnt = dao.eventInsert(dto);				
				
		int eventNum = dao.getEventNum(regDate);
		
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
					
					dao.eventImgInsert(dto);
					
				} else if(type == 1 && imgName.equals("files[1]")) {
					
					filename = FileManager.saveFile(multipartFile, rootPath + conImgPath, fileName);
					
					dto.setPicPath2(Code.eventImgsPathS);
					dto.setPicName2(filename);					
					dto.setEventNum(eventNum);
					
					dao.eventImgsInsert(dto);
				}
			}
			
		}
		
		model.addAttribute("cnt", cnt);
		
		return "/three/event/eventInsert";
	}

	@Override
	public String ing_event(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 5;		//	한 페이지당 출력한 글 개수
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
		
		cnt = dao.getEventCount();
		
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
		
		Map<String, Integer> dataMap = new HashMap<>();
		dataMap.put("start", start);
		dataMap.put("end", end);
		
		if(cnt > 0) {
			ArrayList<EventDTO> dtos = dao.getEventList(dataMap);
			ArrayList<EventDTO> dtos2 = dao.getEventPic(dataMap);
			req.setAttribute("dtos", dtos);
			req.setAttribute("dtos2", dtos2);
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
		
		return "/three/event/ing_event";	
	}
	
	//아이디 중복체크
	@Override
	public void duplication(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException {
		//입력받은 아이디
		String memid = req.getParameter("memid");
					
		Map<String, Object> map = new HashMap<>();
		map.put("memid", memid);
		
		int cnt = dao.confirmId(map);		
		
		mav.addObject("cnt", cnt);
		
	}
	
	//회원가입
	@Override
	public String registMember(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
		
		String name = (req.getParameter("firstName")) + " " + (req.getParameter("secondName"));
		String email = req.getParameter("email");
		String memid = req.getParameter("memid");
		String passwd = req.getParameter("password");
		String address = req.getParameter("loc_category1") + " " + req.getParameter("loc_category2");
		String tel1 = req.getParameter("tel");
		String tel = "";
		Timestamp birth = Timestamp.valueOf(req.getParameter("birth") + " 00:00:00.0");		
		Timestamp joinDate = new Timestamp(System.currentTimeMillis());
		String gender = req.getParameter("gender");
		
		if(tel1.length() == 10) {
			tel = tel1.substring(0, 3) + "-" + tel1.substring(3, 6) + "-" + tel1.substring(6);
		} else if (tel1.length() >= 11) {
			tel = tel1.substring(0, 3) + "-" + tel1.substring(3, 7) + "-" + tel1.substring(7);
		} else if (tel1.length() < 10) {
			tel = tel1.substring(0, 4) + "-" + tel1.substring(4);
		}
				
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
		dto.setMem_id(memid);
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
		
		int cnt = dao.memInfoInsert(dto);				
		
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
					
					dao.proImgInsert(dto2);
				} 
			}
			
		}
		
		model.addAttribute("cnt", cnt);		
		
		return "/three/member/registMember";
	}
	
	
	
}
