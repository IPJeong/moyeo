package com.engineers.moyeo.one.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
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
import com.engineers.moyeo.one.dao.OneDAO;
import com.engineers.moyeo.one.dto.MoimReportDTO;
import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class OneReportServiceImpl implements OneReportService{

	@Autowired
	OneDAO oneDao;
	
	// 모임신고 폼
	@Override
	public String moimReport(Model model) {
		
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// 모임번호를 가져온다.
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		// 모임번호를 이용하여 해당 모임정보를 가져온다.
		MoimReportDTO dto = oneDao.getMoimArticle(group_num);
		
		model.addAttribute("group_num", group_num);
		model.addAttribute("dto", dto);
		
		System.out.println("group_num: " + group_num);
		
		return "one/report/moimReportMain";
	}

	// 모임신고 성공요청
	@Override
	public String moimReportPro(Model model) {
		
		int cnt = 0;
		
		Map<String, Object> map = model.asMap();
		FileForm fileForm = (FileForm)map.get("fileForm");
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		MoimReportDTO dto = new MoimReportDTO();
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();
		
		
		for(MultipartFile multipartFile : files) {
			String fileName = multipartFile.getOriginalFilename();
			
			if(fileName.trim().length()>4) {
				String rootPath = Code.rootPath;
				String imgPath = Code.reportImgPath;
				
				int type = FileManager.checkFileType(fileName);
				String filename = null;
				
				if(type == 1) {
					filename = FileManager.saveFile(multipartFile, rootPath + imgPath, fileName);
					String report_title = req.getParameter("report_title");
					String report_content = req.getParameter("report_content");
					String group_name = req.getParameter("group_name");
				
					System.out.println(req.getParameter("group_name"));
					dto.setReport_title(report_title);
					dto.setReport_content(report_content);
					dto.setGroup_num(Integer.parseInt(req.getParameter("group_num")));
					System.out.println("group_num: " + req.getParameter("group_num"));
					dto.setReport_date(new Timestamp(System.currentTimeMillis()));
					dto.setMem_id((String)req.getSession().getAttribute("mem_id"));
					dto.setGroup_name(group_name);
					dto.setPic_path(Code.reportImgPathS);
					dto.setPic_name(filename);
				
					System.out.println(dto.toString());
					
					cnt = oneDao.MoimReportInsert(dto);
				}
			}
		}
		
		System.out.println("cnt: " + cnt);
		
		model.addAttribute("cnt", cnt);
		
		return "one/report/moimReportPro";
	}

	// 모임신고 확인(관리자)
	@Override
	public String moimReportHandleMain(Model model) {

		int pageSize = 10;
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
		
		// 신고된 모든 건수를 cnt에 가져온다.
		cnt = oneDao.getReportCount();
		
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
			
			// 신고된 정보를 ArrayaList에 불러온다.
			ArrayList<MoimReportDTO> dtos = oneDao.getReportArticles(daoMap);
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
		
		return "one/report/moimReportHandleMain";
	}

	// 모임신고 세부내용확인(관리자)
	@Override
	public String reportContentForm(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// 신고당한 해당 모임번호
		int report_num = Integer.parseInt(req.getParameter("report_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		// 처리한 매니저 아이디
		String manager_id = req.getParameter("manager_id");
		
		// 신고번호를 통하여 신고내용을 불러온다.
		MoimReportDTO dto = oneDao.getMoimContentArticle(report_num);	
		
		model.addAttribute("report_num", report_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		model.addAttribute("dto", dto);
		model.addAttribute("manager_id", manager_id);
		System.out.println(dto);
		System.out.println("manager_id: " + manager_id);
		
		
		return "one/report/reportContentForm";

	}

	// 모임신고 답변(관리자)
	@Override
	public String reportAnswerPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int report_num = Integer.parseInt(req.getParameter("report_num"));
		int pageNum= Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		String manager_id = (String)req.getSession().getAttribute("manager_id");
		
		MoimReportDTO dto = new MoimReportDTO();
		
		dto.setReport_num(report_num);
		dto.setSol_content(req.getParameter("sol_content"));
		dto.setManager_id(manager_id);
		dto.setSol_date(new Timestamp(System.currentTimeMillis()));
		
		int cnt = oneDao.updateReport(dto);
		System.out.println("cnt: " + cnt);
		
		model.addAttribute("report_num", report_num);
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
		return "one/report/reportAnswerPro";
	}
}