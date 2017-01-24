package com.engineers.moyeo.five.service;

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

import com.engineers.moyeo.five.dao.FiveDAO;
import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.five.dto.PostVideoDTO;
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
		
		// 모임후기의 등록 결과를 반환하는 숫자값
		int cnt = 0;
		
		// model에 담아온 객체를 꺼내기 위해 map으로 전환
		Map<String, Object> map = model.asMap();
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
		// request객체를 꺼냄
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// JSP로부터 데이터 받아오는 부분
		String title = req.getParameter("post_title");
		String content= req.getParameter("post_content");
		String memId = (String)req.getSession().getAttribute("memId");
		int groupNum = 1;
		
		Timestamp post_date = new Timestamp(System.currentTimeMillis());
		// DTO생성하여 데이터 삽입
		MeetingPostDTO dto = new MeetingPostDTO();
		dto.setPost_title(title);
		dto.setPost_content(content);
		dto.setPost_date(post_date);
		dto.setGroup_num(groupNum);
		dto.setLike_num(0);
		dto.setMem_id(memId);
		cnt = fiveDao.insertPost(dto);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("group_num", groupNum);
		dataMap.put("reg_date", post_date);
		
		int post_num = fiveDao.getPostNum(dataMap);
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();
		
		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			// 업로드된 파일 이름을 받아옴
			String fileName = multipartFile.getOriginalFilename();
			
			if(fileName.trim().length()>4){
				
				// 모임후기 이미지 저장경로
				String imgPath = Code.postImgPath;
				// 모임후기 동영상 저장경로
				String videoPath = Code.postVideoPath;
				// 파일의 타입을 확인하여 가져옴
				int type = FileManager.checkFileType(fileName);
				String filename = null;
				
				if(type == 1) {
					// 파일을 저장 후 저장된 파일명을 반환
					filename = FileManager.saveFile(multipartFile, imgPath, fileName);
					PostPictureDTO picDto = new PostPictureDTO();
					picDto.setPic_path(imgPath);
					picDto.setPic_name(filename);
					picDto.setGroup_num(groupNum);
					picDto.setMem_id(memId);
					picDto.setPost_num(post_num);
					fiveDao.insertPostPic(picDto);
					
				} else if(type == 2) {
					filename = FileManager.saveFile(multipartFile, videoPath, fileName);
					PostVideoDTO videoDto = new PostVideoDTO();
					videoDto.setVideo_path(videoPath);
					videoDto.setVideo_name(filename);
					videoDto.setMem_id(memId);
					videoDto.setGroup_num(groupNum);
					videoDto.setPost_num(post_num);
					fiveDao.insertPostVideo(videoDto);
				}
				
			}
		}
		
		model.addAttribute("cnt", cnt);
		
		return "five/postPro";
	}



}
