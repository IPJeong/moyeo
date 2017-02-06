package com.engineers.moyeo.two.service;

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

import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.FileManager;
import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.CheckPresentDTO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.two.dao.TwoDAO;
import com.engineers.moyeo.two.dto.Greeting_boardDTO;
import com.engineers.moyeo.two.dto.Group_noticeDTO;
import com.engineers.moyeo.two.dto.Join_requestDTO;
import com.engineers.moyeo.two.dto.Meeting_postDTO;
import com.engineers.moyeo.two.dto.Member_infoDTO;
import com.engineers.moyeo.two.dto.Moim_infoDTO;
import com.engineers.moyeo.two.dto.My_groupDTO;
import com.engineers.moyeo.two.dto.Place_infoDTO;
import com.engineers.moyeo.two.dto.Place_picDTO;
import com.engineers.moyeo.two.dto.Rec_placeDTO;
import com.engineers.moyeo.two.dto.SuggestionDTO;

@Service
public class TwoServiceImpl implements TwoService{

	@Autowired
	TwoDAO twoDao;
	
	@Autowired
	SixDAO sixDao;

	@Override
	public String suggestionInputPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String sug_title = req.getParameter("sug_title"); //건의제목
		String sug_content = req.getParameter("sug_content"); //건의내용
		String re_email = req.getParameter("re_email"); //회신이메일
		String mem_id = (String) req.getSession().getAttribute("mem_id");

		SuggestionDTO dto = new SuggestionDTO();
		
		dto.setSug_title(sug_title);
		dto.setSug_content(sug_content);
		dto.setRe_email(re_email);
		dto.setMem_id(mem_id);
		
		int cnt = twoDao.writeSuggestion(dto); //회원이 건의사항 작성
				
		model.addAttribute("cnt", cnt);
		
		return "two/suggestion/suggestionInputPro";
	}

	@Override
	public String suggestionList(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String sug_status = null;
		if(req.getParameter("sug_status") != null) {
			if(!req.getParameter("sug_status").equals("N")) {
				sug_status = "Y";
			} else {
				sug_status = "N";
			}
		} else {
			sug_status = "N";
		}
		
		int pageSize = 5; 	
		int pageBlock = 3; 	
		
		int cnt = 0;			
		int start = 0;	//rownum
		int end = 0;	//rownum
		int sug_num = 0;		
		String pageNum = null; 	
		int currentPage = 0;
		
		int pageCount = 0;	
		int startPage = 0;	
		int endPage = 0;	

		cnt = twoDao.getSuggetionCount(sug_status);
	
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;

		sug_num = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start", start);
		daoMap.put("end", end);
		daoMap.put("sug_status", sug_status);
		
		if(cnt > 0) {
			ArrayList<SuggestionDTO> dtos = twoDao.getSuggestionList(daoMap);
			model.addAttribute("dtos", dtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("sug_num", sug_num); 
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "two/suggestion/suggestionList";
	}

	@Override
	public String suggestionContentForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int sug_num = Integer.parseInt(req.getParameter("sug_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		SuggestionDTO dto = new SuggestionDTO();
		
		dto = twoDao.readSuggestion(sug_num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		
		return "two/suggestion/suggestionContentForm";
	}

	@Override
	public String suggestionCheckPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int sug_num = Integer.parseInt(req.getParameter("sug_num"));
		String manager_id = (String) req.getSession().getAttribute("manager_id"); 
		String sol_content = req.getParameter("sol_content");
		
		SuggestionDTO dto = new SuggestionDTO();
		
		dto.setSug_num(sug_num);
		dto.setManager_id(manager_id);
		dto.setSol_content(sol_content);
		
		int cnt = twoDao.checkSuggestion(dto);
		
		model.addAttribute("cnt", cnt);
		
		return "two/suggestion/suggestionCheckPro";
	}
	
	@Override
	public String placeMainLoc(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 5; 	
		int pageBlock = 3; 	
					
		int start = 0;			//rownum
		int end = 0;			//rownum
		int place_num = 0;		
		String pageNum = null; 	
		int currentPage = 0;
		
		int pageCount = 0;	
		int startPage = 0;	
		int endPage = 0;	
		
		int cnt = 0;
		int lcnt = 0;
		
		cnt = twoDao.getPlaceCount();
		lcnt = twoDao.getPlaceLikeCount();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;

		place_num = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start", start);
		daoMap.put("end", end);
		
		if(cnt > 0) {
			ArrayList<Place_infoDTO> pidtos = twoDao.getPlaceList(daoMap);
			model.addAttribute("pidtos", pidtos);
			
			ArrayList<Place_picDTO> ppdtos = twoDao.getPlacePictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}
		
		if(lcnt > 0) {
			ArrayList<Place_infoDTO> lpidtos = twoDao.getPlaceLikeList();
			model.addAttribute("lpidtos", lpidtos);
			
			ArrayList<Place_picDTO> lppdtos = twoDao.getPlaceLikePictureList();
			model.addAttribute("lppdtos", lppdtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("lcnt", lcnt);
		model.addAttribute("place_num", place_num); 
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "two/places/placeMainLoc";
	}
	
	@Override
	public String placeMainLocSearch(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 5; 	
		int pageBlock = 3; 	
				
		int start = 0;			//rownum
		int end = 0;			//rownum
		int place_num = 0;		
		String pageNum = null; 	
		int currentPage = 0;
		
		int pageCount = 0;	
		int startPage = 0;	
		int endPage = 0;	
		
		int cnt = 0;
		int lcnt = 0;
		
		String place_address1 = req.getParameter("loc_category1");
		String place_address2 = req.getParameter("loc_category2");
		String place_address = place_address1 + " " + place_address2;
		String place_name = req.getParameter("place_name");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("place_address", place_address);
		daoMap.put("place_name", place_name);

		cnt = twoDao.getPlaceMainLocCount(daoMap);
		lcnt = twoDao.getPlaceLikeCount();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;

		place_num = cnt - (currentPage - 1) * pageSize;
		
		daoMap.put("start", start);
		daoMap.put("end", end);
		
		if(cnt > 0) {
			ArrayList<Place_infoDTO> pidtos = twoDao.getPlaceLocList(daoMap);
			model.addAttribute("pidtos", pidtos);
			
			ArrayList<Place_picDTO> ppdtos = twoDao.getPlaceLocPictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}
		
		if(lcnt > 0) {
			ArrayList<Place_infoDTO> lpidtos = twoDao.getPlaceLikeList();
			model.addAttribute("lpidtos", lpidtos);
			
			ArrayList<Place_picDTO> lppdtos = twoDao.getPlaceLikePictureList();
			model.addAttribute("lppdtos", lppdtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("lcnt", lcnt);
		model.addAttribute("place_num", place_num); 
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "two/places/placeMainLoc";
	}
	
	@Override
	public String placeMainRecpla(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 5; 	
		int pageBlock = 3; 	
					
		int start = 0;			//rownum
		int end = 0;			//rownum
		int place_num = 0;		
		String pageNum = null; 	
		int currentPage = 0;
		
		int pageCount = 0;	
		int startPage = 0;	
		int endPage = 0;	
		
		int cnt = 0;
		int lcnt = 0;
		
		cnt = twoDao.getPlaceCount();
		lcnt = twoDao.getPlaceLikeCount();
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;

		place_num = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start", start);
		daoMap.put("end", end);
		
		if(cnt > 0) {
			ArrayList<Place_infoDTO> pidtos = twoDao.getPlaceList(daoMap);
			model.addAttribute("pidtos", pidtos);
			
			ArrayList<Place_picDTO> ppdtos = twoDao.getPlacePictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}
		
		if(lcnt > 0) {
			ArrayList<Place_infoDTO> lpidtos = twoDao.getPlaceLikeList();
			model.addAttribute("lpidtos", lpidtos);
			
			ArrayList<Place_picDTO> lppdtos = twoDao.getPlaceLikePictureList();
			model.addAttribute("lppdtos", lppdtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("lcnt", lcnt);
		model.addAttribute("place_num", place_num); 
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "two/places/placeMainRecpla";
	}
	
	@Override
	public String placeMainRecplaSearch(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 5; 	
		int pageBlock = 3; 	
				
		int start = 0;			//rownum
		int end = 0;			//rownum
		int place_num = 0;		
		String pageNum = null; 	
		int currentPage = 0;
		
		int pageCount = 0;	
		int startPage = 0;	
		int endPage = 0;	
		
		int cnt = 0;
		int lcnt = 0;
		
		String recpla_category1 = req.getParameter("recpla_category1");
		String recpla_category2 = req.getParameter("recpla_category2");
		String place_name = req.getParameter("place_name");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("recpla_category1", recpla_category1);
		daoMap.put("recpla_category2", recpla_category2);
		daoMap.put("place_name", place_name);
		
		cnt = twoDao.getPlaceMainRecplaCount(daoMap);
		lcnt = twoDao.getPlaceLikeCount();

		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;

		place_num = cnt - (currentPage - 1) * pageSize;
		
		daoMap.put("start", start);
		daoMap.put("end", end);
		
		if(cnt > 0) {
			ArrayList<Place_infoDTO> pidtos = twoDao.getPlaceRecplaList(daoMap);
			model.addAttribute("pidtos", pidtos);
			
			ArrayList<Place_picDTO> ppdtos = twoDao.getPlaceRecplaPictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}
		
		if(lcnt > 0) {
			ArrayList<Place_infoDTO> lpidtos = twoDao.getPlaceLikeList();
			model.addAttribute("lpidtos", lpidtos);
			
			ArrayList<Place_picDTO> lppdtos = twoDao.getPlaceLikePictureList();
			model.addAttribute("lppdtos", lppdtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("lcnt", lcnt);
		model.addAttribute("place_num", place_num); 
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "two/places/placeMainRecpla";
	}

	@Override
	public String placeList(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 5; 	
		int pageBlock = 3; 	
		
		int cnt = 0;			
		int start = 0;		
		int end = 0;			
		int place_num = 0;		
		String pageNum = null; 	
		int currentPage = 0;	
		
		int pageCount = 0;		
		int startPage = 0;	
		int endPage = 0;	
	
		cnt = twoDao.getPlaceCount();
	
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; 
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;
		
		place_num = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start", start);
		daoMap.put("end", end);
		
		if(cnt > 0) {
			ArrayList<Place_infoDTO> pidtos = twoDao.getPlaceList(daoMap);
			model.addAttribute("pidtos", pidtos);
			
			ArrayList<Place_picDTO> ppdtos = twoDao.getPlacePictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("place_num", place_num); //�۹�ȣ
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}

		return "two/places/placeList";
	}

	@Override
	public String placeContentForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int place_num = Integer.parseInt(req.getParameter("place_num"));

		Place_infoDTO pidto = new Place_infoDTO();
		Place_picDTO ppdto = new Place_picDTO();
		
		pidto = twoDao.readPlace(place_num);
		ppdto = twoDao.readPlacePicture(place_num);
		
		model.addAttribute("pidto", pidto);
		model.addAttribute("ppdto", ppdto);

		int pageSize = 5; 	
		int pageBlock = 3; 	
		
		int cnt = 0;			
		int start = 0;			//rownum
		int end = 0;			//rownum
		int recpla_num = 0;		
		String recPlacePageNum = null; 	
		int currentPage = 0;
		
		int pageCount = 0;	
		int startPage = 0;	
		int endPage = 0;
		
		cnt = twoDao.getRecPlaceCount(place_num);
		recPlacePageNum = req.getParameter("recPlacePageNum");
		
		if(recPlacePageNum == null) {
			recPlacePageNum = "1";
		}
		
		currentPage = Integer.parseInt(recPlacePageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;

		recpla_num = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start", start);
		daoMap.put("end", end);
		daoMap.put("place_num", place_num);
		
		if(cnt > 0) {
			ArrayList<Rec_placeDTO> rpdtos = twoDao.getRecPlaceList(daoMap);
			model.addAttribute("rpdtos", rpdtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; // (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("recpla_num", recpla_num); 
		model.addAttribute("recPlacePageNum", recPlacePageNum);
		model.addAttribute("place_num", place_num); 

		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "two/places/placeContentForm";
	}

	@Override
	public String placeInputPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
		
		String place_name = req.getParameter("place_name");
		String place_address1 = req.getParameter("loc_category1");
		String place_address2 = req.getParameter("loc_category2");
		String place_address3 = req.getParameter("place_address");
		String place_detail = req.getParameter("place_detail");
		String place_link = req.getParameter("place_link");
		String place_address = place_address1 + " " + place_address2 + " " + place_address3;

		Place_infoDTO pidto = new Place_infoDTO();
			
		pidto.setPlace_name(place_name);
		pidto.setPlace_address(place_address);
		pidto.setPlace_detail(place_detail);
		pidto.setPlace_link(place_link);
			
		int cnt = twoDao.inputPlace(pidto);

		int place_num = twoDao.getPlaceNum();
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();
		
		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			// 업로드된 파일 이름을 받아옴
			String uploadFileName = multipartFile.getOriginalFilename();
			
			if(uploadFileName.trim().length()>4){
				
				String rootPath = Code.rootPath;
				// 장소사진의 저장경로
				String imgPath = Code.placeImgPath;

				// 파일의 타입을 확인하여 가져옴
				int type = FileManager.checkFileType(uploadFileName);

				String fileName = null;
			
				if(type == 1) {
					// 파일을 저장 후 저장된 파일명을 반환
					fileName = FileManager.saveFile(multipartFile, rootPath + imgPath, uploadFileName);
					Place_picDTO ppdto = new Place_picDTO();
					ppdto.setPlace_pic_path(Code.placeImgPathS);
					ppdto.setPlace_pic_name(fileName);
					ppdto.setPlace_num(place_num);
					twoDao.inputPictures(ppdto);
				}	
			}				
			
		}	
		
		model.addAttribute("cnt", cnt);
		
		return "two/places/placeInputPro";
	}

	@Override
	public String placeDeletePro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int place_num = Integer.parseInt(req.getParameter("place_num"));

		twoDao.deletePlacePicture(place_num);
		int cnt = twoDao.deletePlace(place_num);
		
		model.addAttribute("cnt", cnt);
		
		return "two/places/placeDeletePro";
	}
	
	@Override
	public String placeModifyForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int place_num = Integer.parseInt(req.getParameter("place_num"));
		
		Place_infoDTO pidto = new Place_infoDTO();
		
		pidto = twoDao.readPlace(place_num);
		
		model.addAttribute("place_num", place_num);
		model.addAttribute("pidto", pidto);
		
		return "two/places/placeModifyForm";
	}

	@Override
	public String placeModifyPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
	
		int place_num = Integer.parseInt(req.getParameter("place_num"));
		String place_name = req.getParameter("place_name");
		String place_address1 = req.getParameter("loc_category1");
		String place_address2 = req.getParameter("loc_category2");
		String place_address3 = req.getParameter("place_address");
		String place_address = place_address1 + " " + place_address2 + " " + place_address3;
		String place_detail = req.getParameter("place_detail");
		String place_link = req.getParameter("place_link");
		
		Place_infoDTO pidto = new Place_infoDTO();
		pidto.setPlace_num(place_num);
		pidto.setPlace_name(place_name);
		pidto.setPlace_address(place_address);
		pidto.setPlace_detail(place_detail);
		pidto.setPlace_link(place_link);
			
		int cnt = twoDao.modifyPlace(pidto);
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();
				
		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			// 업로드된 파일 이름을 받아옴
			String uploadFileName = multipartFile.getOriginalFilename();
						
			if(uploadFileName.trim().length()>4){
							
				// 장소사진의 저장경로
				String rootPath = Code.rootPath;
				String imgPath = Code.placeImgPath;

				// 파일의 타입을 확인하여 가져옴
				int type = FileManager.checkFileType(uploadFileName);

				String fileName = null;
			
				if(type == 1) {
					// 파일을 저장 후 저장된 파일명을 반환
					fileName = FileManager.saveFile(multipartFile, rootPath + imgPath, uploadFileName);
					Place_picDTO ppdto = new Place_picDTO();
					ppdto.setPlace_pic_path(imgPath);
					ppdto.setPlace_pic_name(fileName);
					ppdto.setPlace_num(place_num);
					twoDao.modifyPictures(ppdto);
				}
			}			
			
		}	
			
		model.addAttribute("place_num", place_num);
		model.addAttribute("cnt", cnt);
		
		return "two/places/placeModifyPro";
	}

	@Override
	public String recPlaceContentForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		
		Place_infoDTO pidto = new Place_infoDTO();
		Place_picDTO ppdto = new Place_picDTO();
		Rec_placeDTO rpdto = new Rec_placeDTO();

		pidto = twoDao.readPlace(recpla_num);
		ppdto = twoDao.readPlacePicture(recpla_num);
		rpdto = twoDao.readRecPlace(recpla_num);
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("recpla_num", recpla_num);
		
		int likeNumber = twoDao.readPlaceLike(daoMap);
		
		model.addAttribute("pidto", pidto);
		model.addAttribute("ppdto", ppdto);
		model.addAttribute("rpdto", rpdto);
		model.addAttribute("likeNumber", likeNumber);
		
		int checkMyPlaceLike = 0;
		if(req.getSession().getAttribute("mem_id") != null) {
			String mem_id = (String) req.getSession().getAttribute("mem_id");
			
			Map<String, Object> daoMap2 = new HashMap<String, Object>();
			daoMap2.put("recpla_num", recpla_num);
			daoMap2.put("mem_id", mem_id);
			
			checkMyPlaceLike = twoDao.checkMyPlaceLike(daoMap2);
		} 
		
		model.addAttribute("checkMyPlaceLike", checkMyPlaceLike);
		
		return "two/places/recPlaceContentForm";
	}

	@Override
	public String recPlaceWriteForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int place_num = Integer.parseInt(req.getParameter("place_num"));
		
		
		if(req.getSession().getAttribute("mem_id") != null) {
			String mem_id = (String) req.getSession().getAttribute("mem_id");

			model.addAttribute("mem_id", mem_id);
			model.addAttribute("place_num", place_num);
			
			return "two/places/recPlaceWriteForm";
		} else {
			model.addAttribute("place_num", place_num);
		
			return "two/places/recPlaceLoginAlert";
		}
	}

	@Override
	public String recPlaceWritePro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String recpla_title = req.getParameter("recpla_title");
		String recpla_content = req.getParameter("recpla_content");
		String recpla_category1 = req.getParameter("recpla_category1");
		String recpla_category2 = req.getParameter("recpla_category2");
		String recpla_tag = req.getParameter("recpla_tag");
		String mem_id = (String) req.getSession().getAttribute("mem_id");
		int place_num = Integer.parseInt(req.getParameter("place_num"));
		
		Rec_placeDTO dto = new Rec_placeDTO();
		
		dto.setRecpla_title(recpla_title);
		dto.setRecpla_content(recpla_content);
		dto.setRecpla_category1(recpla_category1);
		dto.setRecpla_category2(recpla_category2);
		dto.setRecpla_tag(recpla_tag);
		dto.setMem_id(mem_id);
		dto.setPlace_num(place_num);
		
		int cnt = twoDao.writeRecPlace(dto);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("place_num", place_num);
		
		return "two/places/recPlaceWritePro";
	}

	@Override
	public String recPlaceDeletePro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		int place_num = Integer.parseInt(req.getParameter("place_num"));
	
		if(req.getSession().getAttribute("mem_id") != null) {
			String mem_id = (String) req.getSession().getAttribute("mem_id");
	
			Map<String, Object> daoMap = new HashMap<String, Object>();
			daoMap.put("recpla_num", recpla_num);
			daoMap.put("mem_id", mem_id);

			int cnt = twoDao.deleteRecPlace(daoMap);
				
			model.addAttribute("cnt", cnt);
			model.addAttribute("place_num", place_num);
				
			return "two/places/recPlaceDeletePro";
			
		} else {
			return "two/places/recPlaceLoginAlert";
		}

	}
	
	@Override
	public String recPlaceModifyForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		String mem_id = req.getParameter("mem_id");
		String mem_id_2 = (String) req.getSession().getAttribute("mem_id");
		
		if(mem_id.equals(mem_id_2)) {
			Rec_placeDTO rpdto = new Rec_placeDTO();
			rpdto = twoDao.readRecPlace(recpla_num);
			
			model.addAttribute("recpla_num", recpla_num);
			model.addAttribute("rpdto", rpdto);
			
			return "two/places/recPlaceModifyForm";
		
		} else {
			model.addAttribute("recpla_num", recpla_num);
			
			return "two/places/recPlaceModifyFail";
		}
	}

	@Override
	public String recPlaceModifyPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		String recpla_title = req.getParameter("recpla_title");
		String recpla_content = req.getParameter("recpla_content");
		String recpla_category1 = req.getParameter("recpla_category1");
		String recpla_category2 = req.getParameter("recpla_category2");
		String recpla_tag = req.getParameter("recpla_tag");
		String mem_id = (String) req.getSession().getAttribute("mem_id");

		Rec_placeDTO dto = new Rec_placeDTO();
		
		dto.setRecpla_num(recpla_num);
		dto.setRecpla_title(recpla_title);
		dto.setRecpla_content(recpla_content);
		dto.setRecpla_category1(recpla_category1);
		dto.setRecpla_category2(recpla_category2);
		dto.setRecpla_tag(recpla_tag);
		dto.setMem_id(mem_id);
		
		int cnt = twoDao.modifyRecPlace(dto);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("recpla_num", recpla_num);
		
		return "two/places/recPlaceModifyPro";
	}

	@Override
	public String plusPlaceLike(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		int cnt = 0;
		
		int checkMyPlaceLike = 0;
		if(req.getSession().getAttribute("mem_id") != null) {
			String mem_id = (String) req.getSession().getAttribute("mem_id");
			
			Map<String, Object> daoMap = new HashMap<String, Object>();
			daoMap.put("recpla_num", recpla_num);
			daoMap.put("mem_id", mem_id);
			
			checkMyPlaceLike = twoDao.checkMyPlaceLike(daoMap);
			
			if(checkMyPlaceLike != 0) {
				cnt = -1;
			} else {
				cnt = twoDao.plusPlaceLike(daoMap);
			}
		} 
		
		model.addAttribute("recpla_num", recpla_num);
		model.addAttribute("cnt", cnt);
		
		return "two/places/recPlaceLikePro";
	}

	@Override
	public String minusPlaceLike(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
	    String mem_id = (String) req.getSession().getAttribute("mem_id");
		int cnt = 0;
	    
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("recpla_num", recpla_num);
		daoMap.put("mem_id", mem_id);
		
		int plalike_num = twoDao.checkPlalikeNum(daoMap);
		
		System.out.println("plalike_num : "+plalike_num);
		
		cnt = twoDao.minusPlaceLike(plalike_num);

		model.addAttribute("recpla_num", recpla_num);
		model.addAttribute("cnt", cnt);
		
		return "two/places/recPlaceLikePro";
		
	}
	
	@Override
	public String moimJoinForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int cnt = 0;
		int group_num = (int) req.getSession().getAttribute("group_num");
		String mem_id = (String) req.getSession().getAttribute("mem_id");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("group_num", group_num);
		daoMap.put("mem_id", mem_id);
		
		cnt = twoDao.identifyMoimMember(daoMap);

		Moim_infoDTO dto = twoDao.readMoimInfo(group_num);
		
		model.addAttribute("group_num", group_num);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("dto", dto);
		model.addAttribute("cnt", cnt);
		
		return "two/moim_join/moimJoinForm";
	}

	@Override
	public String moimJoinPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		String mem_id = req.getParameter("mem_id");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("group_num", group_num);
		daoMap.put("mem_id", mem_id);
		
		int join_check = twoDao.moimJoinCheck(daoMap);
		
		if (join_check > 0) {
			cnt = -1;
		} else {
			cnt = twoDao.moimJoin(daoMap);
		}
		
		model.addAttribute("group_num", group_num);
		model.addAttribute("cnt", cnt);
		
		return "two/moim_join/moimJoinPro";
	}

	@Override
	public String moimWithdraw(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		int group_num = (int) req.getSession().getAttribute("group_num");
		String mem_id = (String) req.getSession().getAttribute("mem_id");

		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("group_num", group_num);
		daoMap.put("mem_id", mem_id);
		

		My_groupDTO dto = new My_groupDTO();
		
		dto = twoDao.getMoimMemberInfo2(daoMap);
		
		String group_per = dto.getGroup_per();
		
		if(group_per.equals("1")) {
			cnt = -1;
		} else {
			cnt = twoDao.moimWithdraw(daoMap);
		}
		
		model.addAttribute("group_num", group_num);
		model.addAttribute("cnt", cnt);
		
		return "two/moim_join/moimWithdraw";
	}	

	@Override
	public String moimJoinManaging(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 10; 	
		int pageBlock = 3; 	
		
		int cnt = 0;			
		int start = 0;		
		int end = 0;			
		int num = 0;		
		String pageNum = null; 	
		int currentPage = 0;	
		int pageCount = 0;		
		int startPage = 0;	
		int endPage = 0;
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		
		//--사이드 시작
		String mem_id = (String)req.getSession().getAttribute("mem_id");
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
			
			//모임-소개사진 불러오기
			List<MainPictureDTO> dtosB = new ArrayList<MainPictureDTO>();
			
			
			//-----변경
			//dtosB = sixDao.moimImageViewB(group_num);
			dtosB = sixDao.moimImagesView(group_num);
			String main_pic_nameB = dtosB.get(1).getMain_pic_name();
			String main_pic_path = dtosB.get(1).getMain_pic_path();
			
			//-----변경
			
			
			String[] main_pic_pathb = main_pic_path.split("-");
			String main_pic_pathB =main_pic_pathb[0];
		
			model.addAttribute("main_pic_name", main_pic_nameB);
			model.addAttribute("main_pic_path", main_pic_pathB);

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
				if(check_cnt != 0) {
					//출석체크 중복여부 확인
					int present_cnt = sixDao.checkPresentCount(present_dto);
					//중복이 안된 경우만 출석 인정(1일 1회)
					if(present_cnt == 0){
						sixDao.checkPresent(present_dto);
			
						//회원권한 설정
						Map<String, Object> perMap = model.asMap();
						perMap.put("mem_id", mem_id);
						perMap.put("group_num", group_num);
						int group_per = sixDao.groupPer(perMap);
						req.getSession().setAttribute("group_per", group_per);
					}
				} else {
					req.getSession().setAttribute("group_per", 4);
				}
			}
		
			
		cnt = twoDao.getMoimJoinCount(group_num);
	
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; 
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;
		
		num = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start", start);
		daoMap.put("end", end);
		daoMap.put("group_num", group_num);
		
		if(cnt > 0) {
			ArrayList<Join_requestDTO> dtos = twoDao.getMoimJoinList(daoMap);
			ArrayList<Member_infoDTO> mifdtos = twoDao.getMoimJoinMemberInfoList(daoMap);
			model.addAttribute("dtos", dtos);
			model.addAttribute("mifdtos", mifdtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; 
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("num", num); 
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		model.addAttribute("group_num", group_num);
			
		return "two/moim_managing/moimJoinManaging";
	}
	

	@Override
	public String moimJoinOK(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String[] request_nums = req.getParameterValues("request_num");
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		for(String request_num_str : request_nums) {
			int request_num = Integer.parseInt(request_num_str);
			
			Map<String, Object> daoMap = new HashMap<String, Object>();
			daoMap.put("request_num", request_num);
			daoMap.put("status", "승인");
			
			twoDao.moimJoinOK(daoMap);
			
			Join_requestDTO dto = new Join_requestDTO();
			dto = twoDao.getMoimJoinInfo(request_num);
			
			String group_per = "3";
			String mem_id = dto.getMem_id();
			
			Map<String, Object> daoMap2 = new HashMap<String, Object>();
			daoMap2.put("group_per", group_per);
			daoMap2.put("group_num", group_num);
			daoMap2.put("mem_id", mem_id);
			
			twoDao.moimJoinPro(daoMap2);
		}
		
		model.addAttribute("group_num", group_num);
		
		return "two/moim_managing/moimJoinOK";
	}

	@Override
	public String moimJoinNO(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		String[] request_nums = req.getParameterValues("request_num");
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		for(String request_num_str : request_nums) {
			int request_num = Integer.parseInt(request_num_str);
			
			Map<String, Object> daoMap = new HashMap<String, Object>();
			daoMap.put("request_num", request_num);
			daoMap.put("status", "거절");
			
			twoDao.moimJoinNO(daoMap);
		}
		
		model.addAttribute("group_num", group_num);
		
		return "two/moim_managing/moimJoinNO";
	}

	@Override
	public String moimMemberManaging(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 10; 	
		int pageBlock = 3; 	
		
		int cnt = 0;			
		int start = 0;		
		int end = 0;			
		int num = 0;		
		String pageNum = null; 	
		int currentPage = 0;	
		int pageCount = 0;		
		int startPage = 0;	
		int endPage = 0;
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		
		//--사이드 시작
			//사이드- 모임명, 모임카테고리 불러오기
			String mem_id = (String)req.getSession().getAttribute("mem_id");
			MoimOpenDTO open_dto = sixDao.moimMain(group_num);
			model.addAttribute("open_dto", open_dto);
			
			//사이드 - 대표사진 불러오기
			MainPictureDTO picture_dto = sixDao.moimImagesView(group_num).get(0);
			model.addAttribute("picture_dto", picture_dto);
			
			//사이드 - 모임원리스트 불러오기
			ArrayList<MemberInfoDTO> member_dtos = sixDao.memberList(group_num);
			model.addAttribute("member_dtos", member_dtos);	
		//--사이드 끝
			
			//모임-소개사진 불러오기
			List<MainPictureDTO> dtosB = new ArrayList<MainPictureDTO>();
			
			
			//-----변경
			//dtosB = sixDao.moimImageViewB(group_num);
			dtosB = sixDao.moimImagesView(group_num);
			String main_pic_nameB = dtosB.get(1).getMain_pic_name();
			String main_pic_path = dtosB.get(1).getMain_pic_path();
			
			//-----변경
			
			
			String[] main_pic_pathb = main_pic_path.split("-");
			String main_pic_pathB =main_pic_pathb[0];
		
			model.addAttribute("main_pic_name", main_pic_nameB);
			model.addAttribute("main_pic_path", main_pic_pathB);

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
				if(check_cnt != 0) {
					//출석체크 중복여부 확인
					int present_cnt = sixDao.checkPresentCount(present_dto);
					//중복이 안된 경우만 출석 인정(1일 1회)
					if(present_cnt == 0){
						sixDao.checkPresent(present_dto);
			
						//회원권한 설정
						Map<String, Object> perMap = model.asMap();
						perMap.put("mem_id", mem_id);
						perMap.put("group_num", group_num);
						int group_per = sixDao.groupPer(perMap);
						req.getSession().setAttribute("group_per", group_per);
					}
				} else {
					req.getSession().setAttribute("group_per", 4);
				}
			}
		

		cnt = twoDao.getMoimMemberCount(group_num);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; 
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;
		
		num = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start", start);
		daoMap.put("end", end);
		daoMap.put("group_num", group_num);
		
		if(cnt > 0) {
			ArrayList<My_groupDTO> dtos = twoDao.getMoimMemberList(daoMap);
			ArrayList<Member_infoDTO> mifdtos = twoDao.getMoimMemberInfoList(daoMap);
			model.addAttribute("dtos", dtos);
			model.addAttribute("mifdtos", mifdtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; 
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("num", num); 
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		model.addAttribute("group_num", group_num);
			
		return "two/moim_managing/moimMemberManaging";
	}

	@Override
	public String moimMemberRankForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int my_group_num = Integer.parseInt(req.getParameter("my_group_num")); 	
		int group_num = Integer.parseInt(req.getParameter("group_num")); 

		My_groupDTO dto = new My_groupDTO();

		dto = twoDao.getMoimMemberInfo(my_group_num);
		
		model.addAttribute("my_group_num", my_group_num);
		model.addAttribute("group_num", group_num);
		model.addAttribute("dto", dto);
		
		return "two/moim_managing/moimMemberRankForm";
	}

	@Override
	public String moimMemberRankPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		
		int my_group_num = Integer.parseInt(req.getParameter("my_group_num")); 	
		int group_num = Integer.parseInt(req.getParameter("group_num")); 
		String group_per = req.getParameter("group_per");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("my_group_num", my_group_num);
		daoMap.put("group_per", group_per);
		
		String group_per_chk = twoDao.checkMoimMemberRank(my_group_num);
		
		if(group_per_chk.equals("1")) {
			cnt = -1;
		} else {
			cnt = twoDao.changeMoimMemberRank(daoMap);
		}
		
		model.addAttribute("group_num", group_num);
		model.addAttribute("cnt", cnt);
		
		return "two/moim_managing/moimMemberRankPro";
	}

	@Override
	public String moimMemberBanish(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		
		int my_group_num = Integer.parseInt(req.getParameter("my_group_num")); 	
		int group_num = Integer.parseInt(req.getParameter("group_num")); 
		
		My_groupDTO dto = new My_groupDTO();
		dto = twoDao.getMoimMemberInfo(my_group_num);
		
		String group_per = dto.getGroup_per();
		
		if(group_per.equals("1")) {
			
			return "two/moim_managing/moimMemberBanishFail";
		} else {
			cnt = twoDao.banishMoimMember(my_group_num);
			
			model.addAttribute("group_num", group_num);
			model.addAttribute("cnt", cnt);
			
			return "two/moim_managing/moimMemberBanish";
		}
		
	}

	@Override
	public String moimBoardManaging(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 10; 	
		int pageBlock = 3; 	
		
		int cnt = 0;			
		int start = 0;		
		int end = 0;			
		int num = 0;		
		String pageNum = null; 	
		int currentPage = 0;	
		int pageCount = 0;		
		int startPage = 0;	
		int endPage = 0;
		
	/*	int group_num = (int) req.getSession().getAttribute("group_num");*/
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		
		//--사이드 시작
			//사이드- 모임명, 모임카테고리 불러오기
			String mem_id = (String)req.getSession().getAttribute("mem_id");
			MoimOpenDTO open_dto = sixDao.moimMain(group_num);
			model.addAttribute("open_dto", open_dto);
			
			//사이드 - 대표사진 불러오기
			MainPictureDTO picture_dto = sixDao.moimImagesView(group_num).get(0);
			model.addAttribute("picture_dto", picture_dto);
			
			//사이드 - 모임원리스트 불러오기
			ArrayList<MemberInfoDTO> member_dtos = sixDao.memberList(group_num);
			model.addAttribute("member_dtos", member_dtos);	
		//--사이드 끝
			
			//모임-소개사진 불러오기
			List<MainPictureDTO> dtosB = new ArrayList<MainPictureDTO>();
			
			
			//-----변경
			//dtosB = sixDao.moimImageViewB(group_num);
			dtosB = sixDao.moimImagesView(group_num);
			String main_pic_nameB = dtosB.get(1).getMain_pic_name();
			String main_pic_path = dtosB.get(1).getMain_pic_path();
			
			//-----변경
			
			
			String[] main_pic_pathb = main_pic_path.split("-");
			String main_pic_pathB =main_pic_pathb[0];
		
			model.addAttribute("main_pic_name", main_pic_nameB);
			model.addAttribute("main_pic_path", main_pic_pathB);

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
				if(check_cnt != 0) {
					//출석체크 중복여부 확인
					int present_cnt = sixDao.checkPresentCount(present_dto);
					//중복이 안된 경우만 출석 인정(1일 1회)
					if(present_cnt == 0){
						sixDao.checkPresent(present_dto);
			
						//회원권한 설정
						Map<String, Object> perMap = model.asMap();
						perMap.put("mem_id", mem_id);
						perMap.put("group_num", group_num);
						int group_per = sixDao.groupPer(perMap);
						req.getSession().setAttribute("group_per", group_per);
					}
				} else {
					req.getSession().setAttribute("group_per", 4);
				}
			}

			
		String board_category = req.getParameter("board_category");
		
		if(board_category != null) {
			if(req.getParameter("board_category").equals("모임공지")) {
				System.out.println("group_num : "+group_num);
				cnt = twoDao.getNoticeBoardCount(group_num);
				System.out.println("1번");
				System.out.println("cnt : "+cnt);
			} else if (board_category.equals("가입인사")) {
				System.out.println("group_num : "+group_num);
				cnt = twoDao.getGreetingBoardCount(group_num);
				System.out.println("2번");
				System.out.println("cnt : "+cnt);
			} else if(board_category.equals("모임후기")) {
				System.out.println("group_num : "+group_num);
				cnt = twoDao.getPostBoardCount(group_num);
				System.out.println("3번");
				System.out.println("cnt : "+cnt);
			} else {
				System.out.println("group_num : "+group_num);
				cnt = twoDao.getNoticeBoardCount(group_num);
				System.out.println("4번");
				System.out.println("cnt : "+cnt);
			}
		} else {
			System.out.println("group_num : "+group_num);
			cnt = twoDao.getNoticeBoardCount(group_num);
			System.out.println("5번");
			System.out.println("cnt : "+cnt);
		}
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1"; 
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;
		
		num = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start", start);
		daoMap.put("end", end);
		daoMap.put("group_num", group_num);
		
		System.out.println("cnt : "+cnt);
		if(cnt == 0) {
			if(board_category == null) {
				model.addAttribute("board_category", "모임공지");
			} else {
				model.addAttribute("board_category", board_category);
			}	
		}
		
		if(cnt > 0) {
			if(board_category != null) {
				if(board_category.equals("모임공지")) {
					ArrayList<Group_noticeDTO> dtos = twoDao.getNoticeBoardArticles(daoMap);
					model.addAttribute("dtos", dtos);
					System.out.println("dtos : "+ dtos);
					model.addAttribute("board_category", "모임공지");
				} else if (board_category.equals("가입인사")) {
					ArrayList<Greeting_boardDTO> dtos = twoDao.getGreetingBoardArticles(daoMap);
					model.addAttribute("dtos", dtos);
					System.out.println("dtos : "+ dtos);
					model.addAttribute("board_category", "가입인사");
				} else if(board_category.equals("모임후기")) {
					ArrayList<Meeting_postDTO> dtos = twoDao.getPostBoardArticles(daoMap);
					model.addAttribute("dtos", dtos);
					System.out.println("dtos : "+ dtos);
					model.addAttribute("board_category", "모임후기");
				} else {
					ArrayList<Group_noticeDTO> dtos = twoDao.getNoticeBoardArticles(daoMap);
					model.addAttribute("dtos", dtos);
					System.out.println("dtos : "+ dtos);
					model.addAttribute("board_category", "모임공지");
				}
			} else {
				ArrayList<Group_noticeDTO> dtos = twoDao.getNoticeBoardArticles(daoMap);
				model.addAttribute("dtos", dtos);
				System.out.println("dtos : "+ dtos);
				model.addAttribute("board_category", "모임공지");
			}	
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; 
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("num", num); 
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		model.addAttribute("group_num", group_num);
		
		return "two/moim_managing/moimBoardManaging";
	}

	@Override
	public String deleteNoticeBoardArticle(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		String board_category = req.getParameter("board_category");
		String[] group_noti_nums = req.getParameterValues("group_noti_num");
		
		System.out.println("board_category : "+ board_category);
		
		for(String group_noti_num_str : group_noti_nums) {
			int group_noti_num = Integer.parseInt(group_noti_num_str);
			
			Map<String, Object> daoMap = new HashMap<String, Object>();
			daoMap.put("group_noti_num", group_noti_num);
			daoMap.put("group_num", group_num);
			
			cnt = twoDao.deleteNoticeBoardArticle(daoMap);
		}
		
		
		model.addAttribute("group_num", group_num);
		model.addAttribute("cnt", cnt);
		
		return "two/moim_managing/moimBoardDeleteArticle";
	}

	@Override
	public String deleteGreetingBoardArticle(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		int group_num = Integer.parseInt(req.getParameter("group_num")); 
		String board_category = req.getParameter("board_category");
		String[] greeting_nums = req.getParameterValues("greeting_num");
		
		System.out.println("board_category : "+ board_category);
		
		for(String greeting_num_str : greeting_nums) {
			int greeting_num = Integer.parseInt(greeting_num_str);
			
			Map<String, Object> daoMap = new HashMap<String, Object>();
			daoMap.put("greeting_num", greeting_num);
			daoMap.put("group_num", group_num);
			
			cnt = twoDao.deleteGreetingBoardArticle(daoMap);
		}
		
		model.addAttribute("group_num", group_num);
		model.addAttribute("cnt", cnt);
		return "two/moim_managing/moimBoardDeleteArticle";
	}

	@Override
	public String deletePostBoardArticle(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		int group_num = Integer.parseInt(req.getParameter("group_num")); 
		String board_category = req.getParameter("board_category");
		String[] post_nums = req.getParameterValues("post_num");
		
		System.out.println("board_category : "+ board_category);
		
		for(String post_num_str : post_nums) {
			int post_num = Integer.parseInt(post_num_str);
			
			Map<String, Object> daoMap = new HashMap<String, Object>();
			daoMap.put("post_num", post_num);
			daoMap.put("group_num", group_num);
			
			cnt = twoDao.deletePostBoardArticle(daoMap);
		}
		
		model.addAttribute("group_num", group_num);
		model.addAttribute("cnt", cnt);
		return "two/moim_managing/moimBoardDeleteArticle";
	}
}
