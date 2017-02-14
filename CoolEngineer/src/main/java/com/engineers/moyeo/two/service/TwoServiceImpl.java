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

import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.four.dto.GreetingBoardDTO;
import com.engineers.moyeo.four.dto.GroupNoticeDTO;
import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.FileManager;
import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.main.service.MainService;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;
import com.engineers.moyeo.two.dao.TwoDAO;
import com.engineers.moyeo.two.dto.Join_requestDTO;
import com.engineers.moyeo.two.dto.Member_infoDTO;
import com.engineers.moyeo.two.dto.Moim_infoDTO;
import com.engineers.moyeo.two.dto.Place_infoDTO;
import com.engineers.moyeo.two.dto.Place_likeDTO;
import com.engineers.moyeo.two.dto.Rec_placeDTO;
import com.engineers.moyeo.two.dto.StatisticsDTO;
import com.engineers.moyeo.two.dto.SuggestionDTO;

@Service
public class TwoServiceImpl implements TwoService{

	@Autowired
	MainService mainService;
	
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
		int num = 0;		
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

		num = cnt - (currentPage - 1) * pageSize;
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start", start);
		daoMap.put("end", end);
		daoMap.put("sug_status", sug_status);
		
		if(cnt > 0) {
			ArrayList<SuggestionDTO> dtos = twoDao.getSuggestionList(daoMap);
			model.addAttribute("dtos", dtos);
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
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		SuggestionDTO dto = new SuggestionDTO();
		
		dto.setSug_num(sug_num);
		dto.setManager_id(manager_id);
		dto.setSol_content(sol_content);
		
		int cnt = twoDao.checkSuggestion(dto);
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		
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
			
			ArrayList<Place_infoDTO> ppdtos = twoDao.getPlacePictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}
		
		if(lcnt > 0) {
			ArrayList<Place_likeDTO> lpodtos = twoDao.getPlaceLikeList();
			model.addAttribute("lpodtos", lpodtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; 
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
			
			ArrayList<Place_infoDTO> ppdtos = twoDao.getPlaceLocPictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}
		
		if(lcnt > 0) {
			ArrayList<Place_likeDTO> lpodtos = twoDao.getPlaceLikeList();
			model.addAttribute("lpodtos", lpodtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; 
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
			
			ArrayList<Place_infoDTO> ppdtos = twoDao.getPlacePictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}
		
		if(lcnt > 0) {
			ArrayList<Place_likeDTO> lpodtos = twoDao.getPlaceLikeList();
			model.addAttribute("lpodtos", lpodtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; 
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
			
			ArrayList<Place_infoDTO> ppdtos = twoDao.getPlaceRecplaPictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}
		
		if(lcnt > 0) {
			ArrayList<Place_likeDTO> lpodtos = twoDao.getPlaceLikeList();
			model.addAttribute("lpodtos", lpodtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; 
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
			
			ArrayList<Place_infoDTO> ppdtos = twoDao.getPlacePictureList(daoMap);
			model.addAttribute("ppdtos", ppdtos);
		}

		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; 
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
		Place_infoDTO ppdto = new Place_infoDTO();
		
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

		startPage = (currentPage / pageBlock) * pageBlock + 1; 
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; 
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
					pidto.setPlace_pic_path(Code.placeImgPathS);
					pidto.setPlace_pic_name(fileName);
					pidto.setPlace_num(place_num);
					twoDao.inputPictures(pidto);
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
						
				String rootPath = Code.rootPath;
				// 장소사진의 저장경로
				String imgPath = Code.placeImgPath;

				// 파일의 타입을 확인하여 가져옴
				int type = FileManager.checkFileType(uploadFileName);

				String fileName = null;
					
				if(type == 1) {
					// 파일을 저장 후 저장된 파일명을 반환
					fileName = FileManager.saveFile(multipartFile, rootPath + imgPath, uploadFileName);
					pidto.setPlace_pic_path(Code.placeImgPathS);
					pidto.setPlace_pic_name(fileName);
					pidto.setPlace_num(place_num);					
					twoDao.modifyPictures(pidto);
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
		Place_infoDTO ppdto = new Place_infoDTO();
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
		
		mainService.wordAnalyzer(recpla_title, recpla_content, recpla_tag);
		
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
		
		mainService.wordAnalyzer(recpla_title, recpla_content, recpla_tag);
		
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
		
		return "two/places/recPlaceLikeFail";
		
	}
	
	@Override
	public String moimJoinForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int cnt = 0;
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		String mem_id = (String) req.getSession().getAttribute("mem_id");
		
		//--사이드 시작
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
		int banish_check = twoDao.moimBanishCheck(daoMap);
		
		if (banish_check == 0) {
			if (join_check > 0) {
				cnt = -1;
			} else {
				daoMap.put("status", Code.waiting);
				cnt = twoDao.moimJoin(daoMap);
			}
		} else {
			cnt = -2;
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
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		String mem_id = (String) req.getSession().getAttribute("mem_id");

		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("group_num", group_num);
		daoMap.put("mem_id", mem_id);	

		MyGroupDTO dto = new MyGroupDTO();
		
		dto = twoDao.getMoimMemberInfo2(daoMap);
		
		int group_per = dto.getGroup_per();

		if(group_per == Code.moimJang) {
			cnt = -1;
		} else {
			cnt = twoDao.moimWithdraw(daoMap);
			
			daoMap.put("status", "탈퇴");
			twoDao.moimJoinOut(daoMap);
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
			daoMap.put("status", Code.accepted);
			
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
			daoMap.put("status", Code.refused);
			
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
			MoimOpenDTO open_dto = sixDao.moimMain(group_num);
			model.addAttribute("open_dto", open_dto);
			
			//사이드 - 대표사진 불러오기
			MainPictureDTO picture_dto = sixDao.moimImagesView(group_num).get(0);
			model.addAttribute("picture_dto", picture_dto);
			
			//사이드 - 모임원리스트 불러오기
			ArrayList<MemberInfoDTO> member_dtos = sixDao.memberList(group_num);
			model.addAttribute("member_dtos", member_dtos);	
		//--사이드 끝
		
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
			ArrayList<MyGroupDTO> dtos = twoDao.getMoimMemberList(daoMap);
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

		MyGroupDTO dto = new MyGroupDTO();

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
		
		MyGroupDTO dto = new MyGroupDTO();
		dto = twoDao.getMoimMemberInfo(my_group_num);
		
		int group_per = dto.getGroup_per();
		String mem_id = dto.getMem_id();

		if(group_per == Code.moimJang) {
			cnt = -1;
			model.addAttribute("cnt", cnt);
			return "two/moim_managing/moimMemberBanishFail";
		} else {
			cnt = twoDao.banishMoimMember(my_group_num);
				
			Map<String, Object> daoMap = new HashMap<String, Object>();
			daoMap.put("group_num", group_num);
			daoMap.put("mem_id", mem_id);
			daoMap.put("status", "강제탈퇴");
			twoDao.moimJoinOut(daoMap);
				
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
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
			
		//--사이드 시작
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
					ArrayList<GroupNoticeDTO> dtos = twoDao.getNoticeBoardArticles(daoMap);
					model.addAttribute("dtos", dtos);
					System.out.println("dtos : "+ dtos);
					model.addAttribute("board_category", "모임공지");
				} else if (board_category.equals("가입인사")) {
					ArrayList<GreetingBoardDTO> dtos = twoDao.getGreetingBoardArticles(daoMap);
					model.addAttribute("dtos", dtos);
					System.out.println("dtos : "+ dtos);
					model.addAttribute("board_category", "가입인사");
				} else if(board_category.equals("모임후기")) {
					ArrayList<MeetingPostDTO> dtos = twoDao.getPostBoardArticles(daoMap);
					model.addAttribute("dtos", dtos);
					System.out.println("dtos : "+ dtos);
					model.addAttribute("board_category", "모임후기");
				} else {
					ArrayList<GroupNoticeDTO> dtos = twoDao.getNoticeBoardArticles(daoMap);
					model.addAttribute("dtos", dtos);
					System.out.println("dtos : "+ dtos);
					model.addAttribute("board_category", "모임공지");
				}
			} else {
				ArrayList<GroupNoticeDTO> dtos = twoDao.getNoticeBoardArticles(daoMap);
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

	@Override
	public String mainSearch(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int mscnt = 0;
		int pageSize1 = 5; 	
		int pageBlock1 = 3; 
		int start1 = 0;	//rownum
		int end1 = 0;	//rownum
		int num1 = 0;		
		String pageNum1 = null; 	
		int currentPage1 = 0;
		int pageCount1 = 0;	
		int startPage1 = 0;	
		int endPage1 = 0;

		int mpscnt = 0;
		int pageSize2 = 5; 	
		int pageBlock2 = 3; 
		int start2 = 0;	//rownum
		int end2 = 0;	//rownum
		int num2= 0;		
		String pageNum2 = null; 	
		int currentPage2 = 0;
		int pageCount2 = 0;	
		int startPage2 = 0;	
		int endPage2 = 0;
		
		int picnt = 0;
		int pageSize3 = 5; 	
		int pageBlock3 = 3; 
		int start3 = 0;	//rownum
		int end3 = 0;	//rownum
		int num3= 0;		
		String pageNum3 = null; 	
		int currentPage3 = 0;
		int pageCount3 = 0;	
		int startPage3 = 0;	
		int endPage3 = 0;
		
		String search_keyword = req.getParameter("search_keyword");
		
		String search_radio1 = null;
		String search_radio2 = null;
		String search_radio3 = null;
		
		if(req.getParameter("search_radio1") != null) {
			search_radio1 =  req.getParameter("search_radio1");
		} else {
			search_radio1 = "gl0";
		}
		
		if(req.getParameter("search_radio2") != null) {
			search_radio2 =  req.getParameter("search_radio2");
		} else {
			search_radio2 = "mp0";
		}
		
		if(req.getParameter("search_radio3") != null) {
			search_radio3 =  req.getParameter("search_radio3");
		} else {
			search_radio3 = "pi0";
		}
		
		System.out.println("search_radio3 : "+search_radio3);
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		if(search_radio1.equals("gl1")) {
			daoMap.put("group_name", search_keyword);
			daoMap.put("group_intro", "");
			daoMap.put("type", "1");
			mscnt = twoDao.getMoimSearchCount(daoMap);
		} else if(search_radio1.equals("gl2")) {
			daoMap.put("group_name", "");
			daoMap.put("group_intro", search_keyword);
			daoMap.put("type", "2");
			mscnt = twoDao.getMoimSearchCount(daoMap);
		} else if(search_radio1.equals("gl3")) {
			daoMap.put("group_name", search_keyword);
			daoMap.put("group_intro", search_keyword);
			daoMap.put("type", "3");
			mscnt = twoDao.getMoimSearchCount(daoMap);
		} else if(search_radio1.equals("gl0")) {
			mscnt = 0;
		}
		
		if(search_radio2.equals("mp1")) {
			daoMap.put("post_title", search_keyword);
			daoMap.put("post_content", "");
			daoMap.put("type", "1");
			mpscnt = twoDao.getMoimPostSearchCount(daoMap);
		} else if(search_radio2.equals("mp2")) {
			daoMap.put("post_title", "");
			daoMap.put("post_content", search_keyword);
			daoMap.put("type", "2");
			mpscnt = twoDao.getMoimPostSearchCount(daoMap);
		} else if(search_radio2.equals("mp3")) {
			daoMap.put("post_title", search_keyword);
			daoMap.put("post_content", search_keyword);
			daoMap.put("type", "3");
			mpscnt = twoDao.getMoimPostSearchCount(daoMap);
		} else if(search_radio2.equals("mp4")) {
			daoMap.put("post_tag", search_keyword);
			daoMap.put("type", "4");
			mpscnt = twoDao.getMoimPostSearchCount(daoMap);
		} else if(search_radio2.equals("mp0")) {
			mpscnt = 0;
		}
		
		if(search_radio3.equals("pi1")) {
			daoMap.put("place_name", search_keyword);
			daoMap.put("place_detail", "");
			daoMap.put("type", "1");
			picnt = twoDao.getPlaceSearchCount(daoMap);
		} else if(search_radio3.equals("pi2")) {
			daoMap.put("place_name", "");
			daoMap.put("place_detail", search_keyword);
			daoMap.put("type", "2");
			picnt = twoDao.getPlaceSearchCount(daoMap);
		} else if(search_radio3.equals("pi3")) {
			daoMap.put("place_name", search_keyword);
			daoMap.put("place_detail", search_keyword);
			daoMap.put("type", "3");
			picnt = twoDao.getPlaceSearchCount(daoMap);
		} else if(search_radio3.equals("pi4")) {
			daoMap.put("place_address", search_keyword);
			daoMap.put("type", "4");
			picnt = twoDao.getPlaceSearchCount(daoMap);
		} else if(search_radio3.equals("pi5")) {
				daoMap.put("recpla_tag", search_keyword);
				daoMap.put("type", "5");
				picnt = twoDao.getPlaceSearchCount(daoMap);	
		} else if(search_radio3.equals("pi0")) {
			picnt = 0;
		}
		
		System.out.println("picnt : "+picnt);
		
		pageNum1 = req.getParameter("pageNum1");
		if(pageNum1 == null) {
			pageNum1 = "1";
		}
		
		pageNum2 = req.getParameter("pageNum2");
		if(pageNum2 == null) {
			pageNum2 = "1";
		}
		
		pageNum3 = req.getParameter("pageNum3");
		if(pageNum3 == null) {
			pageNum3 = "1";
		}
		
		currentPage1 = Integer.parseInt(pageNum1);
		if(mscnt > 0) {
			pageCount1 = (mscnt / pageSize1) + (mscnt % pageSize1> 0 ? 1 : 0);
		}
		
		currentPage2 = Integer.parseInt(pageNum2);
		if(mpscnt > 0) {
			pageCount2 = (mpscnt / pageSize2) + (mpscnt % pageSize2 > 0 ? 1 : 0);
		}
		
		currentPage3 = Integer.parseInt(pageNum3);
		if(picnt > 0) {
			pageCount3 = (picnt / pageSize3) + (picnt % pageSize3 > 0 ? 1 : 0);
		}
		
		start1 = (currentPage1 - 1) * pageSize1 + 1; 
		end1 = start1 + pageSize1 -1;
		
		start2 = (currentPage2 - 1) * pageSize2 + 1; 
		end2 = start2 + pageSize2 -1; 
		
		start3 = (currentPage3 - 1) * pageSize3 + 1; 
		end3 = start3 + pageSize3 -1; 
		
		if(mscnt > 0) {
			if(end1 > mscnt) end1 = mscnt;
	
			num1 = mscnt - (currentPage1 - 1) * pageSize1;
		}
		
		if(mpscnt > 0 ) {
			if(end2 > mpscnt) end2 = mpscnt;
			
			num2 = mpscnt - (currentPage2 - 1) * pageSize2;
		}
		
		if(picnt > 0 ) {
			if(end3 > picnt) end3 = picnt;
			
			num3 = picnt - (currentPage3 - 1) * pageSize3;
		}
		
		Map<String, Object> daoMap2 = new HashMap<String, Object>();
		daoMap2.put("start1", start1);
		daoMap2.put("end1", end1);
		if(mscnt > 0) {
			if(search_radio1.equals("gl1")) {
				daoMap2.put("group_name", search_keyword);
				daoMap2.put("group_intro", "");
				daoMap2.put("type", "1");
				ArrayList<Moim_infoDTO> moidtos = twoDao.getMoimSearchList(daoMap2);	
				model.addAttribute("moidtos", moidtos);
				ArrayList<Moim_infoDTO> mopdtos = twoDao.getMoimPictureSearchList(daoMap2);
				model.addAttribute("mopdtos", mopdtos);
			} else if(search_radio1.equals("gl2")) {
				daoMap2.put("group_name", "");
				daoMap2.put("group_intro", search_keyword);
				daoMap2.put("type", "2");
				ArrayList<Moim_infoDTO> moidtos = twoDao.getMoimSearchList(daoMap2);
				model.addAttribute("moidtos", moidtos);
				ArrayList<Moim_infoDTO> mopdtos = twoDao.getMoimPictureSearchList(daoMap2);
				model.addAttribute("mopdtos", mopdtos);
			} else if(search_radio1.equals("gl3")) {
				daoMap2.put("group_name", search_keyword);
				daoMap2.put("group_intro", search_keyword);
				daoMap2.put("type", "3");
				ArrayList<Moim_infoDTO> moidtos = twoDao.getMoimSearchList(daoMap2);	
				model.addAttribute("moidtos", moidtos);
				ArrayList<Moim_infoDTO> mopdtos = twoDao.getMoimPictureSearchList(daoMap2);
				model.addAttribute("mopdtos", mopdtos);
			} 
		}
		
		Map<String, Object> daoMap3 = new HashMap<String, Object>();
		daoMap3.put("start2", start2);
		daoMap3.put("end2", end2);
		if(mpscnt > 0) {
			if(search_radio2.equals("mp1")) {
				daoMap3.put("post_title", search_keyword);
				daoMap3.put("post_content", "");
				daoMap3.put("type", "1");
				ArrayList<MeetingPostDTO> mpdtos = twoDao.getMoimPostSearchList(daoMap3);	
				model.addAttribute("mpdtos", mpdtos);
				ArrayList<PostPictureDTO> ppdtos = twoDao.getMoimPostPictureSearchList(daoMap3);
				model.addAttribute("ppdtos", ppdtos);
			} else if(search_radio2.equals("mp2")) {
				daoMap3.put("post_title", "");
				daoMap3.put("post_content", search_keyword);
				daoMap3.put("type", "2");
				ArrayList<MeetingPostDTO> mpdtos = twoDao.getMoimPostSearchList(daoMap3);		
				model.addAttribute("mpdtos", mpdtos);
				ArrayList<PostPictureDTO> ppdtos = twoDao.getMoimPostPictureSearchList(daoMap3);
				model.addAttribute("ppdtos", ppdtos);
			} else if(search_radio2.equals("mp3")) {
				daoMap3.put("post_title", search_keyword);
				daoMap3.put("post_content", search_keyword);
				daoMap3.put("type", "3");
				ArrayList<MeetingPostDTO> mpdtos = twoDao.getMoimPostSearchList(daoMap3);
				model.addAttribute("mpdtos", mpdtos);
				ArrayList<PostPictureDTO> ppdtos = twoDao.getMoimPostPictureSearchList(daoMap3);
				model.addAttribute("ppdtos", ppdtos);
			} else if(search_radio2.equals("mp4")) {
				daoMap3.put("post_tag", search_keyword);
				daoMap3.put("type", "4");
				ArrayList<MeetingPostDTO> mpdtos = twoDao.getMoimPostSearchList(daoMap3);
				model.addAttribute("mpdtos", mpdtos);
				ArrayList<PostPictureDTO> ppdtos = twoDao.getMoimPostPictureSearchList(daoMap3);
				model.addAttribute("ppdtos", ppdtos);
			}
		}
		
		Map<String, Object> daoMap4 = new HashMap<String, Object>();
		daoMap4.put("start3", start3);
		daoMap4.put("end3", end3);
		System.out.println("start3 : "+start3);
		System.out.println("end3 : "+end3);
		if(picnt > 0) {
			if(search_radio3.equals("pi1")) {
				daoMap4.put("place_name", search_keyword);
				daoMap4.put("place_detail", "");
				daoMap4.put("type", "1");
				ArrayList<Place_infoDTO> plainfodtos = twoDao.getPlaceSearchList(daoMap4);
				model.addAttribute("plainfodtos", plainfodtos);
				ArrayList<Place_infoDTO> plapicdtos = twoDao.getPlacePictureSearchList(daoMap4);
				model.addAttribute("plapicdtos", plapicdtos);
			} else if(search_radio3.equals("pi2")) {
				daoMap4.put("place_name", "");
				daoMap4.put("place_detail", search_keyword);
				daoMap4.put("type", "2");
				ArrayList<Place_infoDTO> plainfodtos = twoDao.getPlaceSearchList(daoMap4);
				model.addAttribute("plainfodtos", plainfodtos);
				ArrayList<Place_infoDTO> plapicdtos = twoDao.getPlacePictureSearchList(daoMap4);
				model.addAttribute("plapicdtos", plapicdtos);
			} else if(search_radio3.equals("pi3")) {
				daoMap4.put("place_name", search_keyword);
				daoMap4.put("place_detail", search_keyword);
				daoMap4.put("type", "3");
				ArrayList<Place_infoDTO> plainfodtos = twoDao.getPlaceSearchList(daoMap4);
				model.addAttribute("plainfodtos", plainfodtos);
				ArrayList<Place_infoDTO> plapicdtos = twoDao.getPlacePictureSearchList(daoMap4);
				model.addAttribute("plapicdtos", plapicdtos);
			} else if(search_radio3.equals("pi4")) {
				daoMap4.put("place_address", search_keyword);
				daoMap4.put("type", "4");
				ArrayList<Place_infoDTO> plainfodtos = twoDao.getPlaceSearchList(daoMap4);
				model.addAttribute("plainfodtos", plainfodtos);
				ArrayList<Place_infoDTO> plapicdtos = twoDao.getPlacePictureSearchList(daoMap4);
				model.addAttribute("plapicdtos", plapicdtos);
			} else if(search_radio3.equals("pi5")) {
				daoMap4.put("recpla_tag", search_keyword);
				daoMap4.put("type", "5");
				ArrayList<Place_infoDTO> plainfodtos = twoDao.getPlaceSearchList(daoMap4);
				model.addAttribute("plainfodtos", plainfodtos);
				ArrayList<Place_infoDTO> plapicdtos = twoDao.getPlacePictureSearchList(daoMap4);
				model.addAttribute("plapicdtos", plapicdtos);
			} 	
		}
		
		startPage1 = (currentPage1 / pageBlock1) * pageBlock1 + 1; 
		if(currentPage1 % pageBlock1 == 0) startPage1 -= pageBlock1;
		
		endPage1 = startPage1 + pageBlock1 - 1; 
		if(endPage1 > pageCount1) endPage1 = pageCount1;
		
		startPage2 = (currentPage2 / pageBlock2) * pageBlock2 + 1; 
		if(currentPage2 % pageBlock2 == 0) startPage2 -= pageBlock2;
		
		endPage2 = startPage2 + pageBlock2 - 1; 
		if(endPage2 > pageCount2) endPage2 = pageCount2;
		
		startPage3 = (currentPage3 / pageBlock3) * pageBlock3 + 1; 
		if(currentPage3 % pageBlock3 == 0) startPage3 -= pageBlock3;
		
		endPage3 = startPage3 + pageBlock3 - 1; 
		if(endPage3 > pageCount3) endPage3 = pageCount3;
		
		model.addAttribute("mscnt", mscnt);
		model.addAttribute("mpscnt", mpscnt);
		model.addAttribute("picnt", picnt);
		model.addAttribute("num1", num1); 
		model.addAttribute("pageNum1", pageNum1);
		model.addAttribute("num2", num2); 
		model.addAttribute("pageNum2", pageNum2);
		model.addAttribute("num3", num3); 
		model.addAttribute("pageNum3", pageNum3);
		
		if (mscnt > 0) {
			model.addAttribute("currentPage1", currentPage1);
			model.addAttribute("startPage1", startPage1);
			model.addAttribute("endPage1", endPage1);
			model.addAttribute("pageCount1", pageCount1);
			model.addAttribute("pageBlock1", pageBlock1);
		}
		
		if (mpscnt > 0) {
			model.addAttribute("currentPage2", currentPage2);
			model.addAttribute("startPage2", startPage2);
			model.addAttribute("endPage2", endPage2);
			model.addAttribute("pageCount2", pageCount2);
			model.addAttribute("pageBlock2", pageBlock2);
		}
		
		if (picnt > 0) {
			model.addAttribute("currentPage3", currentPage3);
			model.addAttribute("startPage3", startPage3);
			model.addAttribute("endPage3", endPage3);
			model.addAttribute("pageCount3", pageCount3);
			model.addAttribute("pageBlock3", pageBlock3);
		}
		
		model.addAttribute("search_keyword", search_keyword);
		model.addAttribute("search_radio1", search_radio1);
		model.addAttribute("search_radio2", search_radio2);
		model.addAttribute("search_radio3", search_radio3);
		
		return "two/main_search/mainSearchResult";
	}

	@Override
	public String moimStatistics(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		//--사이드 시작
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
		
		int man_cnt = 0;
		int woman_cnt = 0;
		 
		StatisticsDTO dto = new StatisticsDTO();
		
		dto = twoDao.chartByGender(group_num);
		
		man_cnt = dto.getMan_cnt();
		woman_cnt = dto.getWoman_cnt();
		
		model.addAttribute("man_cnt", man_cnt);
		model.addAttribute("woman_cnt", woman_cnt); 

		dto = twoDao.chartByAge(group_num);
		
		int teen_cnt = 0;
		int twenty_cnt = 0;
		int thirty_cnt = 0;
		int fourty_cnt = 0;
		int fifty_cnt = 0;
		int sixty_cnt = 0;
		
		teen_cnt = dto.getTeen_cnt();
		twenty_cnt = dto.getTwenty_cnt();
		thirty_cnt = dto.getThirty_cnt();
		fourty_cnt = dto.getFirty_cnt();
		fifty_cnt = dto.getFifty_cnt();
		sixty_cnt = dto.getSixty_cnt();
		
		model.addAttribute("teen_cnt", teen_cnt);
		model.addAttribute("twenty_cnt", twenty_cnt); 
		model.addAttribute("thirty_cnt", thirty_cnt);
		model.addAttribute("fourty_cnt", fourty_cnt);
		model.addAttribute("fifty_cnt", fifty_cnt);
		model.addAttribute("sixty_cnt", sixty_cnt);
		
		model.addAttribute("group_num", group_num); 
		
		return "two/moim_statistics/moimStatistics";
	}

	@Override
	public String moimStatisticsArticle(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int group_num = Integer.parseInt(req.getParameter("group_num"));

		//--사이드 시작
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
		
		StatisticsDTO dto = new StatisticsDTO();
		
		String term = req.getParameter("term");
		
		if(term.equals("month")) {
			
			dto = twoDao.getDate();
			
			Timestamp four_weeks_ago = dto.getFour_weeks_ago();
			Timestamp three_weeks_ago = dto.getThree_weeks_ago();
			Timestamp two_weeks_ago = dto.getTwo_weeks_ago();
			Timestamp a_week_ago = dto.getA_week_ago();
			Timestamp today = dto.getToday();
			
			dto = twoDao.chartByArticleOfMonth(group_num);
			
			int first_week = dto.getFirst_week();
			int second_week = dto.getSecond_week();
			int third_week = dto.getThird_week();
			int fourth_week = dto.getFourth_week();
			
			model.addAttribute("four_weeks_ago", four_weeks_ago);
			model.addAttribute("three_weeks_ago", three_weeks_ago);
			model.addAttribute("two_weeks_ago", two_weeks_ago);
			model.addAttribute("a_week_ago", a_week_ago);
			model.addAttribute("today", today);
			
			model.addAttribute("first_week", first_week);
			model.addAttribute("second_week", second_week);
			model.addAttribute("third_week", third_week);
			model.addAttribute("fourth_week", fourth_week);
			
		} else if(term.equals("year")) {
			
			dto = twoDao.chartByArticleOfYear(group_num);
			
			int month1 = dto.getMonth1();
			int month2 = dto.getMonth2();
			int month3 = dto.getMonth3();
			int month4 = dto.getMonth4();
			int month5 = dto.getMonth5();
			int month6 = dto.getMonth6();
			int month7 = dto.getMonth7();
			int month8 = dto.getMonth8();
			int month9 = dto.getMonth9();
			int month10 = dto.getMonth10();
			int month11 = dto.getMonth11();
			int month12 = dto.getMonth12();

			model.addAttribute("month1", month1);
			model.addAttribute("month2", month2);
			model.addAttribute("month3", month3);
			model.addAttribute("month4", month4);
			model.addAttribute("month5", month5);
			model.addAttribute("month6", month6);
			model.addAttribute("month7", month7);
			model.addAttribute("month8", month8);
			model.addAttribute("month9", month9);
			model.addAttribute("month10", month10);
			model.addAttribute("month11", month11);
			model.addAttribute("month12", month12);
			
		} else if(term.equals("best10")) {
			int cnt = 0;
			
			cnt = twoDao.checkBestTenArticle(group_num);
			
			if (cnt > 0) {
				ArrayList<StatisticsDTO> dtos = twoDao.getBestTenArticle(group_num);
				
				model.addAttribute("dtos", dtos);
			}
			
			model.addAttribute("cnt", cnt);
		}
		
		model.addAttribute("group_num", group_num); 
		model.addAttribute("term", term); 
		
		return "two/moim_statistics/moimStatisticsArticle";
	}

	@Override
	public String moimStatisticsPresent(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		//--사이드 시작
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
		
		StatisticsDTO dto = new StatisticsDTO();
		
		String term = req.getParameter("term");
		
		if(term.equals("month")) {
			
			dto = twoDao.getDate();
			
			Timestamp four_weeks_ago = dto.getFour_weeks_ago();
			Timestamp three_weeks_ago = dto.getThree_weeks_ago();
			Timestamp two_weeks_ago = dto.getTwo_weeks_ago();
			Timestamp a_week_ago = dto.getA_week_ago();
			Timestamp today = dto.getToday();
			
			dto = twoDao.chartByPresentOfMonth(group_num);
			
			int first_week = dto.getFirst_week();
			int second_week = dto.getSecond_week();
			int third_week = dto.getThird_week();
			int fourth_week = dto.getFourth_week();
			
			model.addAttribute("four_weeks_ago", four_weeks_ago);
			model.addAttribute("three_weeks_ago", three_weeks_ago);
			model.addAttribute("two_weeks_ago", two_weeks_ago);
			model.addAttribute("a_week_ago", a_week_ago);
			model.addAttribute("today", today);
			
			model.addAttribute("first_week", first_week);
			model.addAttribute("second_week", second_week);
			model.addAttribute("third_week", third_week);
			model.addAttribute("fourth_week", fourth_week);
			
		} else if(term.equals("year")) {
			
			dto = twoDao.chartByPresentOfYear(group_num);
			
			int month1 = dto.getMonth1();
			int month2 = dto.getMonth2();
			int month3 = dto.getMonth3();
			int month4 = dto.getMonth4();
			int month5 = dto.getMonth5();
			int month6 = dto.getMonth6();
			int month7 = dto.getMonth7();
			int month8 = dto.getMonth8();
			int month9 = dto.getMonth9();
			int month10 = dto.getMonth10();
			int month11 = dto.getMonth11();
			int month12 = dto.getMonth12();

			model.addAttribute("month1", month1);
			model.addAttribute("month2", month2);
			model.addAttribute("month3", month3);
			model.addAttribute("month4", month4);
			model.addAttribute("month5", month5);
			model.addAttribute("month6", month6);
			model.addAttribute("month7", month7);
			model.addAttribute("month8", month8);
			model.addAttribute("month9", month9);
			model.addAttribute("month10", month10);
			model.addAttribute("month11", month11);
			model.addAttribute("month12", month12);
			
		} else if(term.equals("best10")) {
			
			ArrayList<StatisticsDTO> dtos = twoDao.getBestTenPresent(group_num);
				
			model.addAttribute("dtos", dtos);

		}
		
		model.addAttribute("group_num", group_num); 
		model.addAttribute("term", term); 
		
		return "two/moim_statistics/moimStatisticsPresent";
	}

	@Override
	public String moimStatisticsJoin(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		//--사이드 시작
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
		
		StatisticsDTO dto = new StatisticsDTO();
		
		String term = req.getParameter("term");
		
		if(term.equals("month")) {
			
			dto = twoDao.getDate();
			
			Timestamp four_weeks_ago = dto.getFour_weeks_ago();
			Timestamp three_weeks_ago = dto.getThree_weeks_ago();
			Timestamp two_weeks_ago = dto.getTwo_weeks_ago();
			Timestamp a_week_ago = dto.getA_week_ago();
			Timestamp today = dto.getToday();
			
			dto = twoDao.chartByJoinOfMonth(group_num);
			
			int first_week = dto.getFirst_week();
			int second_week = dto.getSecond_week();
			int third_week = dto.getThird_week();
			int fourth_week = dto.getFourth_week();
			
			model.addAttribute("four_weeks_ago", four_weeks_ago);
			model.addAttribute("three_weeks_ago", three_weeks_ago);
			model.addAttribute("two_weeks_ago", two_weeks_ago);
			model.addAttribute("a_week_ago", a_week_ago);
			model.addAttribute("today", today);
			
			model.addAttribute("first_week", first_week);
			model.addAttribute("second_week", second_week);
			model.addAttribute("third_week", third_week);
			model.addAttribute("fourth_week", fourth_week);
			
		} else if(term.equals("year")) {
			
			dto = twoDao.chartByJoinOfYear(group_num);
			
			int month1 = dto.getMonth1();
			int month2 = dto.getMonth2();
			int month3 = dto.getMonth3();
			int month4 = dto.getMonth4();
			int month5 = dto.getMonth5();
			int month6 = dto.getMonth6();
			int month7 = dto.getMonth7();
			int month8 = dto.getMonth8();
			int month9 = dto.getMonth9();
			int month10 = dto.getMonth10();
			int month11 = dto.getMonth11();
			int month12 = dto.getMonth12();

			model.addAttribute("month1", month1);
			model.addAttribute("month2", month2);
			model.addAttribute("month3", month3);
			model.addAttribute("month4", month4);
			model.addAttribute("month5", month5);
			model.addAttribute("month6", month6);
			model.addAttribute("month7", month7);
			model.addAttribute("month8", month8);
			model.addAttribute("month9", month9);
			model.addAttribute("month10", month10);
			model.addAttribute("month11", month11);
			model.addAttribute("month12", month12);
			
		}
		
		model.addAttribute("group_num", group_num); 
		model.addAttribute("term", term); 
		
		return "two/moim_statistics/moimStatisticsJoin";
	}

	@Override
	public String wordCloudSearch(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int mscnt = 0;
		int pageSize1 = 5; 	
		int pageBlock1 = 3; 
		int start1 = 0;	//rownum
		int end1 = 0;	//rownum
		int num1 = 0;		
		String pageNum1 = null; 	
		int currentPage1 = 0;
		int pageCount1 = 0;	
		int startPage1 = 0;	
		int endPage1 = 0;

		int mpscnt = 0;
		int pageSize2 = 5; 	
		int pageBlock2 = 3; 
		int start2 = 0;	//rownum
		int end2 = 0;	//rownum
		int num2= 0;		
		String pageNum2 = null; 	
		int currentPage2 = 0;
		int pageCount2 = 0;	
		int startPage2 = 0;	
		int endPage2 = 0;
		
		int picnt = 0;
		int pageSize3 = 5; 	
		int pageBlock3 = 3; 
		int start3 = 0;	//rownum
		int end3 = 0;	//rownum
		int num3= 0;		
		String pageNum3 = null; 	
		int currentPage3 = 0;
		int pageCount3 = 0;	
		int startPage3 = 0;	
		int endPage3 = 0;
		
		String search_keyword = req.getParameter("search_keyword");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		
		daoMap.put("type", "3");
		
		daoMap.put("group_name", search_keyword);
		daoMap.put("group_intro", search_keyword);
		mscnt = twoDao.getMoimSearchCount(daoMap);
		
		daoMap.put("post_title", search_keyword);
		daoMap.put("post_content", search_keyword);
		mpscnt = twoDao.getMoimPostSearchCount(daoMap);
		
		daoMap.put("place_name", search_keyword);
		daoMap.put("place_detail", search_keyword);
		picnt = twoDao.getPlaceSearchCount(daoMap);
		
		pageNum1 = req.getParameter("pageNum1");
		if(pageNum1 == null) {
			pageNum1 = "1";
		}
		
		pageNum2 = req.getParameter("pageNum2");
		if(pageNum2 == null) {
			pageNum2 = "1";
		}
		
		pageNum3 = req.getParameter("pageNum3");
		if(pageNum3 == null) {
			pageNum3 = "1";
		}
		
		currentPage1 = Integer.parseInt(pageNum1);
		if(mscnt > 0) {
			pageCount1 = (mscnt / pageSize1) + (mscnt % pageSize1> 0 ? 1 : 0);
		}
		
		currentPage2 = Integer.parseInt(pageNum2);
		if(mpscnt > 0) {
			pageCount2 = (mpscnt / pageSize2) + (mpscnt % pageSize2 > 0 ? 1 : 0);
		}
		
		currentPage3 = Integer.parseInt(pageNum3);
		if(picnt > 0) {
			pageCount3 = (picnt / pageSize3) + (picnt % pageSize3 > 0 ? 1 : 0);
		}
		
		start1 = (currentPage1 - 1) * pageSize1 + 1; 
		end1 = start1 + pageSize1 -1;
		
		start2 = (currentPage2 - 1) * pageSize2 + 1; 
		end2 = start2 + pageSize2 -1; 
		
		start3 = (currentPage3 - 1) * pageSize3 + 1; 
		end3 = start3 + pageSize3 -1; 
		
		if(mscnt > 0) {
			if(end1 > mscnt) end1 = mscnt;
	
			num1 = mscnt - (currentPage1 - 1) * pageSize1;
		}
		
		if(mpscnt > 0 ) {
			if(end2 > mpscnt) end2 = mpscnt;
			
			num2 = mpscnt - (currentPage2 - 1) * pageSize2;
		}
		
		if(picnt > 0 ) {
			if(end3 > picnt) end3 = picnt;
			
			num3 = picnt - (currentPage3 - 1) * pageSize3;
		}
		
		Map<String, Object> daoMap2 = new HashMap<String, Object>();
		daoMap2.put("start1", start1);
		daoMap2.put("end1", end1);
		if(mscnt > 0) {
			
			daoMap2.put("group_name", search_keyword);
			daoMap2.put("group_intro", search_keyword);
			daoMap2.put("type", "3");
			ArrayList<Moim_infoDTO> moidtos = twoDao.getMoimSearchList(daoMap2);	
			model.addAttribute("moidtos", moidtos);
			ArrayList<Moim_infoDTO> mopdtos = twoDao.getMoimPictureSearchList(daoMap2);
			model.addAttribute("mopdtos", mopdtos);
			
		}
		
		Map<String, Object> daoMap3 = new HashMap<String, Object>();
		daoMap3.put("start2", start2);
		daoMap3.put("end2", end2);
		if(mpscnt > 0) {

			daoMap3.put("post_title", search_keyword);
			daoMap3.put("post_content", search_keyword);
			daoMap3.put("type", "3");
			ArrayList<MeetingPostDTO> mpdtos = twoDao.getMoimPostSearchList(daoMap3);
			model.addAttribute("mpdtos", mpdtos);
			ArrayList<PostPictureDTO> ppdtos = twoDao.getMoimPostPictureSearchList(daoMap3);
			model.addAttribute("ppdtos", ppdtos);

		}
		
		Map<String, Object> daoMap4 = new HashMap<String, Object>();
		daoMap4.put("start3", start3);
		daoMap4.put("end3", end3);
		if(picnt > 0) {
			
			daoMap4.put("place_name", search_keyword);
			daoMap4.put("place_detail", search_keyword);
			daoMap4.put("type", "3");
			ArrayList<Place_infoDTO> plainfodtos = twoDao.getPlaceSearchList(daoMap4);
			model.addAttribute("plainfodtos", plainfodtos);
			ArrayList<Place_infoDTO> plapicdtos = twoDao.getPlacePictureSearchList(daoMap4);
			model.addAttribute("plapicdtos", plapicdtos);

		}
		
		startPage1 = (currentPage1 / pageBlock1) * pageBlock1 + 1; 
		if(currentPage1 % pageBlock1 == 0) startPage1 -= pageBlock1;
		
		endPage1 = startPage1 + pageBlock1 - 1; 
		if(endPage1 > pageCount1) endPage1 = pageCount1;
		
		startPage2 = (currentPage2 / pageBlock2) * pageBlock2 + 1; 
		if(currentPage2 % pageBlock2 == 0) startPage2 -= pageBlock2;
		
		endPage2 = startPage2 + pageBlock2 - 1; 
		if(endPage2 > pageCount2) endPage2 = pageCount2;
		
		startPage3 = (currentPage3 / pageBlock3) * pageBlock3 + 1; 
		if(currentPage3 % pageBlock3 == 0) startPage3 -= pageBlock3;
		
		endPage3 = startPage3 + pageBlock3 - 1; 
		if(endPage3 > pageCount3) endPage3 = pageCount3;
		
		model.addAttribute("mscnt", mscnt);
		model.addAttribute("mpscnt", mpscnt);
		model.addAttribute("picnt", picnt);
		model.addAttribute("num1", num1); 
		model.addAttribute("pageNum1", pageNum1);
		model.addAttribute("num2", num2); 
		model.addAttribute("pageNum2", pageNum2);
		model.addAttribute("num3", num3); 
		model.addAttribute("pageNum3", pageNum3);
		
		if (mscnt > 0) {
			model.addAttribute("currentPage1", currentPage1);
			model.addAttribute("startPage1", startPage1);
			model.addAttribute("endPage1", endPage1);
			model.addAttribute("pageCount1", pageCount1);
			model.addAttribute("pageBlock1", pageBlock1);
		}
		
		if (mpscnt > 0) {
			model.addAttribute("currentPage2", currentPage2);
			model.addAttribute("startPage2", startPage2);
			model.addAttribute("endPage2", endPage2);
			model.addAttribute("pageCount2", pageCount2);
			model.addAttribute("pageBlock2", pageBlock2);
		}
		
		if (picnt > 0) {
			model.addAttribute("currentPage3", currentPage3);
			model.addAttribute("startPage3", startPage3);
			model.addAttribute("endPage3", endPage3);
			model.addAttribute("pageCount3", pageCount3);
			model.addAttribute("pageBlock3", pageBlock3);
		}
		
		model.addAttribute("search_keyword", search_keyword);
		
		return "two/main_search/mainSearchResult";
	}

	@Override
	public String wordCloudSearchByTag(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int mscnt = 0;
		
		int mpscnt = 0;
		int pageSize2 = 5; 	
		int pageBlock2 = 3; 
		int start2 = 0;	//rownum
		int end2 = 0;	//rownum
		int num2= 0;		
		String pageNum2 = null; 	
		int currentPage2 = 0;
		int pageCount2 = 0;	
		int startPage2 = 0;	
		int endPage2 = 0;
		
		int picnt = 0;
		int pageSize3 = 5; 	
		int pageBlock3 = 3; 
		int start3 = 0;	//rownum
		int end3 = 0;	//rownum
		int num3= 0;		
		String pageNum3 = null; 	
		int currentPage3 = 0;
		int pageCount3 = 0;	
		int startPage3 = 0;	
		int endPage3 = 0;

		String search_keyword_req = req.getParameter("search_keyword");
		String search_keyword = search_keyword_req.replace("#", "");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		
		daoMap.put("type", "4");
		daoMap.put("post_tag", search_keyword);
		mpscnt = twoDao.getMoimPostSearchCount(daoMap);
		
		Map<String, Object> daoMap2 = new HashMap<String, Object>();
		daoMap2.put("type", "5");
		daoMap2.put("recpla_tag", search_keyword);
		picnt = twoDao.getPlaceSearchCount(daoMap2);
		
		pageNum2 = req.getParameter("pageNum2");
		if(pageNum2 == null) {
			pageNum2 = "1";
		}
		
		pageNum3 = req.getParameter("pageNum3");
		if(pageNum3 == null) {
			pageNum3 = "1";
		}
		
		currentPage2 = Integer.parseInt(pageNum2);
		if(mpscnt > 0) {
			pageCount2 = (mpscnt / pageSize2) + (mpscnt % pageSize2 > 0 ? 1 : 0);
		}
		
		currentPage3 = Integer.parseInt(pageNum3);
		if(picnt > 0) {
			pageCount3 = (picnt / pageSize3) + (picnt % pageSize3 > 0 ? 1 : 0);
		}
		
		
		start2 = (currentPage2 - 1) * pageSize2 + 1; 
		end2 = start2 + pageSize2 -1; 
		
		start3 = (currentPage3 - 1) * pageSize3 + 1; 
		end3 = start3 + pageSize3 -1; 
		
		if(mpscnt > 0 ) {
			if(end2 > mpscnt) end2 = mpscnt;
			
			num2 = mpscnt - (currentPage2 - 1) * pageSize2;
		}
		
		if(picnt > 0 ) {
			if(end3 > picnt) end3 = picnt;
			
			num3 = picnt - (currentPage3 - 1) * pageSize3;
		}
		
		Map<String, Object> daoMap3 = new HashMap<String, Object>();
		daoMap3.put("start2", start2);
		daoMap3.put("end2", end2);
		if(mpscnt > 0) {
			daoMap3.put("type", "4");
			daoMap3.put("post_tag", search_keyword);
			ArrayList<MeetingPostDTO> mpdtos = twoDao.getMoimPostSearchList(daoMap3);
			model.addAttribute("mpdtos", mpdtos);
			ArrayList<PostPictureDTO> ppdtos = twoDao.getMoimPostPictureSearchList(daoMap3);
			model.addAttribute("ppdtos", ppdtos);

		}
		
		Map<String, Object> daoMap4 = new HashMap<String, Object>();
		daoMap4.put("start3", start3);
		daoMap4.put("end3", end3);
		if(picnt > 0) {
			daoMap4.put("type", "5");
			daoMap4.put("recpla_tag", search_keyword);
			ArrayList<Place_infoDTO> plainfodtos = twoDao.getPlaceSearchList(daoMap4);
			model.addAttribute("plainfodtos", plainfodtos);
			ArrayList<Place_infoDTO> plapicdtos = twoDao.getPlacePictureSearchList(daoMap4);
			model.addAttribute("plapicdtos", plapicdtos);

		}
		
		startPage2 = (currentPage2 / pageBlock2) * pageBlock2 + 1; 
		if(currentPage2 % pageBlock2 == 0) startPage2 -= pageBlock2;
		
		endPage2 = startPage2 + pageBlock2 - 1; 
		if(endPage2 > pageCount2) endPage2 = pageCount2;
		
		startPage3 = (currentPage3 / pageBlock3) * pageBlock3 + 1; 
		if(currentPage3 % pageBlock3 == 0) startPage3 -= pageBlock3;
		
		endPage3 = startPage3 + pageBlock3 - 1; 
		if(endPage3 > pageCount3) endPage3 = pageCount3;
		
		model.addAttribute("mscnt", mscnt);
		model.addAttribute("mpscnt", mpscnt);
		model.addAttribute("picnt", picnt);
		
		model.addAttribute("num2", num2); 
		model.addAttribute("pageNum2", pageNum2);
		model.addAttribute("num3", num3); 
		model.addAttribute("pageNum3", pageNum3);
		
		if (mpscnt > 0) {
			model.addAttribute("currentPage2", currentPage2);
			model.addAttribute("startPage2", startPage2);
			model.addAttribute("endPage2", endPage2);
			model.addAttribute("pageCount2", pageCount2);
			model.addAttribute("pageBlock2", pageBlock2);
		}
		
		if (picnt > 0) {
			model.addAttribute("currentPage3", currentPage3);
			model.addAttribute("startPage3", startPage3);
			model.addAttribute("endPage3", endPage3);
			model.addAttribute("pageCount3", pageCount3);
			model.addAttribute("pageBlock3", pageBlock3);
		}
		
		model.addAttribute("search_keyword", search_keyword);
		
		return "two/main_search/mainSearchResult";
	}

}
