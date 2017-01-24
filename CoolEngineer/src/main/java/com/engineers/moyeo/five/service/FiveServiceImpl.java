package com.engineers.moyeo.five.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.five.dao.FiveDAO;
import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.main.common.Code;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class FiveServiceImpl implements FiveService{
	
	@Autowired
	FiveDAO fiveDao;

	
	// 모임후기 등록 프로세스
	@Override
	public String postPro(Model model) {
		HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
		
		String path = Code.imgPath;
		
		File f = new File(path);
		// 해당 경로가 존재하지 않으면 경로를 지정해준다.
		if(!f.exists()) {
			f.mkdirs();
		}
		
		int size = 1024 * 1024 * 500; // 500MB
		int cnt = 1;
		
		try {
			MultipartRequest multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());
			
			// 입력폼의 값을 받아서 모임후기 DTO에 넣어주는 부분
			// 모임후기 제목
			String post_title = multi.getParameter("post_title");
			// 모임후기 내용
			String post_content = multi.getParameter("post_content");
			// 모임후기 태그
			String post_tag = multi.getParameter("post_tag");
			// 모임번호
//			int group_num = Integer.parseInt(multi.getParameter("group_num"));
			// 모임후기 dto 생성
			MeetingPostDTO dto = new MeetingPostDTO();
			
//			cnt = fiveDao.insertPost(dto);
			
			if(cnt == 1) {
				System.out.println("모임후기 정상 등록됨");
				
				// 넘어온 파일 이름을 받아온다.
				Enumeration fileNames = multi.getFileNames();
				String[] files = multi.getParameterValues("images");
				System.out.println("dd : " + Arrays.deepToString(files));
				String fileName = null;
				
//				int num = dto.getPost_num();
//				List<ImageInfoDTO> images = new ArrayList<>();
//				// 여러개의 이미지 파일을 읽어들임
				while(fileNames.hasMoreElements()) {
					String str = (String)fileNames.nextElement();
					System.out.println("파일명 : " + str);
////					String p = "/uploadImage/";
					String p = "/shop_image/";
					fileName = multi.getFilesystemName(str);
					System.out.println("fileName : " + fileName);
//					if(fileName != null) {
//						ImageInfoDTO iDto = new ImageInfoDTO();
//						iDto.setProduct_num(num);
//						iDto.setSavePath(p);
//						iDto.setFileName(fileName);
//						images.add(iDto);
//					}
				}
//				int c = dao.addPictures(num, images);
//				System.out.println("저장된 이미지 수 : " + c);
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
