package com.engineers.moyeo.two.service;

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
import com.engineers.moyeo.two.dao.TwoDAO;
import com.engineers.moyeo.two.dto.Place_infoDTO;
import com.engineers.moyeo.two.dto.Place_picDTO;
import com.engineers.moyeo.two.dto.Rec_placeDTO;
import com.engineers.moyeo.two.dto.SuggestionDTO;

@Service
public class TwoServiceImpl implements TwoService{

	@Autowired
	TwoDAO twoDao;

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
		
		String sug_status = "N";
		if(req.getParameter("sug_status") != null) {
			if(!req.getParameter("sug_status").equals("N")) {
				sug_status = "Y";
			}
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
		
		start = (currentPage - 1) * pageSize + 1; //(5 - 1) * 10 + 1;
		end = start + pageSize -1; // 41 + 10 - 1 = 50; 
		
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
	/*	String manager_id = (String) req.getSession().getAttribute("manager_id"); */
		String sol_content = req.getParameter("sol_content");
		
		SuggestionDTO dto = new SuggestionDTO();
		
		dto.setSug_num(sug_num);
	/*	dto.setManager_id(manager_id);*/
		dto.setSol_content(sol_content);
		
		int cnt = twoDao.checkSuggestion(dto);
		
		model.addAttribute("cnt", cnt);
		
		return "two/suggestion/suggestionCheckPro";
	}

	@Override
	public String placeList(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 5; 	
		int pageBlock = 3; 	
		
		int cnt = 0;			
		int start = 0;			//rownum
		int end = 0;			//rownum
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
		
		start = (currentPage - 1) * pageSize + 1; //(5 - 1) * 10 + 1;
		end = start + pageSize -1; // 41 + 10 - 1 = 50; 
		
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
		model.addAttribute("place_num", place_num); 
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
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		Place_infoDTO pidto = new Place_infoDTO();
		Place_picDTO ppdto = new Place_picDTO();
		
		pidto = twoDao.readPlace(place_num);
		ppdto = twoDao.readPlacePicture(place_num);
		
		model.addAttribute("pageNum", pageNum);
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

		recPlacePageNum = req.getParameter("recPlacePageNum");
		
		if(recPlacePageNum == null) {
			recPlacePageNum = "1";
		}
		
		currentPage = Integer.parseInt(recPlacePageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; //(5 - 1) * 10 + 1;
		end = start + pageSize -1; // 41 + 10 - 1 = 50; 
		
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
					ppdto.setPlace_pic_path(imgPath);
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
		
		model.addAttribute("place_num", place_num);
		
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
			
		model.addAttribute("cnt", cnt);
		
		return "two/places/placeModifyPro";
	}

	@Override
	public String recPlaceContentForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		int recPlacePageNum = Integer.parseInt(req.getParameter("recPlacePageNum"));

		Place_infoDTO pidto = new Place_infoDTO();
		Place_picDTO ppdto = new Place_picDTO();
		Rec_placeDTO rpdto = new Rec_placeDTO();

		pidto = twoDao.readPlace(recpla_num);
		ppdto = twoDao.readPlacePicture(recpla_num);
		rpdto = twoDao.readRecPlace(recpla_num);
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("recpla_num", recpla_num);
		
		int likeNumber = twoDao.readPlaceLike(daoMap);
		
		model.addAttribute("recPlacePageNum", recPlacePageNum);
		model.addAttribute("pidto", pidto);
		model.addAttribute("ppdto", ppdto);
		model.addAttribute("rpdto", rpdto);
		model.addAttribute("likeNumber", likeNumber);
		
		return "two/places/recPlaceContentForm";
	}

	@Override
	public String recPlaceWriteForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		String mem_id = (String) req.getSession().getAttribute("mem_id");
		int place_num = Integer.parseInt(req.getParameter("place_num"));
		
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("place_num", place_num);
		
		return "two/places/recPlaceWriteForm";
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
		
		return "two/places/recPlaceWritePro";
	}

	@Override
	public String recPlaceDeletePro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		int recPlacePageNum = Integer.parseInt(req.getParameter("recPlacePageNum"));
		String mem_id = (String) req.getSession().getAttribute("mem_id");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("recpla_num", recpla_num);
		daoMap.put("mem_id", mem_id);
		
		twoDao.deletePlacePicture(recpla_num);
		int cnt = twoDao.deleteRecPlace(daoMap);
		
		model.addAttribute("recPlacePageNum", recPlacePageNum);
		model.addAttribute("cnt", cnt);
		
		return "two/places/recPlaceDeletePro";
	}
	
	@Override
	public String recPlaceModifyForm(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		
		model.addAttribute("recpla_num", recpla_num);
		
		return "two/places/recPlaceModifyForm";
	}

	@Override
	public String recPlaceModifyPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		String recpla_title = req.getParameter("recpla_title");
		String recpla_content = req.getParameter("recpla_content");
		String recpla_category1 = req.getParameter("recpla_categoryory1");
		String recpla_category2 = req.getParameter("recpla_categoryory2");
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
		
		return "two/places/recPlaceModifyPro";
	}

	@Override
	public String plusPlaceLike(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		String mem_id = (String) req.getSession().getAttribute("mem_id");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("recpla_num", recpla_num);
		daoMap.put("mem_id", mem_id);
		
		cnt = twoDao.plusPlaceLike(daoMap);
		
		model.addAttribute("cnt", cnt);
		
		return "two/places/recPlaceContentForm";
	}

	@Override
	public String minusPlaceLike(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int cnt = 0;
		
		int recpla_num = Integer.parseInt(req.getParameter("recpla_num"));
		String mem_id = (String) req.getSession().getAttribute("mem_id");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("recpla_num", recpla_num);
		daoMap.put("mem_id", mem_id);
		
		cnt = twoDao.minusPlaceLike(daoMap);
		
		model.addAttribute("cnt", cnt);
		
		return "two/places/recPlaceContentForm";
	}

}
