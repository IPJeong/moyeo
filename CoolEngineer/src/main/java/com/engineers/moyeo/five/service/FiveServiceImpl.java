package com.engineers.moyeo.five.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.engineers.moyeo.five.dao.FiveDAO;
import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.FileManager;
import com.engineers.moyeo.main.model.FileForm;

@Service
public class FiveServiceImpl implements FiveService{
	
	@Autowired
	FiveDAO fiveDao;

	
	// 모임후기 등록 프로세스
	@Override
	public String postPro(Model model) throws NullPointerException{
		
		Map<String, Object> map = model.asMap();
		FileForm fileForm = (FileForm)map.get("fileForm");
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// JSP로부터 데이터 받아오는 부분
		String title = req.getParameter("post_title");
		String content= req.getParameter("post_content");
		String memId = (String)req.getSession().getAttribute("memId");
		int groupNum = 1;
		
		// DTO생성하여 데이터 삽입
		MeetingPostDTO dto = new MeetingPostDTO();
		dto.setPost_title(title);
		dto.setPost_content(content);
		dto.setPost_date(new Timestamp(System.currentTimeMillis()));
		dto.setGroup_num(groupNum);
		dto.setLike_num(0);
		dto.setMem_id(memId);
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();
		
		List<String> picList = new ArrayList<>();
		List<String> videoList = new ArrayList<>();
		
		for (MultipartFile multipartFile : files) {
			
			String fileName = multipartFile.getOriginalFilename();
			
			if(fileName.trim().length()>4){
				
				// 모임후기 이미지 저장경로
				String imgPath = Code.postImgPath;
				// 모임후기 동영상 저장경로
				String videoPath = Code.postVideoPath;
				
				int type = FileManager.checkFileType(fileName);
				String filename = null;
				if(type == 1) {
					filename = FileManager.saveFile(multipartFile, imgPath, fileName);
					
				} else if(type == 2) {
					filename = FileManager.saveFile(multipartFile, videoPath, fileName);
					
				}
				// 업로드 파일의 확장자
				
				

			}
		}
		
		return null;
	}



}
