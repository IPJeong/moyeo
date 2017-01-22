package com.engineers.moyeo.five.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.five.dao.FiveDAO;
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
		
		int size = 1024 * 1024 * 10; // 10MB
		int cnt = 0;
		
		try {
			MultipartRequest multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());
			
			// 입력폼의 값을 받아서 모임후기 DTO에 넣어주는 부분
			String post_title = multi.getParameter("post_title");
			String post_content = multi.getParameter("post_content");
			String post_tag = multi.getParameter("post_tag");
			
			System.out.println("title : " + post_title);
			System.out.println("content : " + post_content);
			System.out.println("tag : " + post_tag);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
			
			// cnt가 1일 경우 상품이 정상적으로 등록됨.
			// 넘어온 이미지를 등록시킴
			/*if(cnt == 1) {
				System.out.println("제품등록 정상 처리됨");
				
				// 넘어온 파일 이름을 받아온다.
				Enumeration fileNames = multi.getFileNames();
				String fileName = null;
				
				int num = dao.getProductNum();
				List<ImageInfoDTO> images = new ArrayList<>();
				// 여러개의 이미지 파일을 읽어들임
				while(fileNames.hasMoreElements()) {
					String str = (String)fileNames.nextElement();
//					String p = "/uploadImage/";
					String p = "/shop_image/";
					fileName = multi.getFilesystemName(str);
					if(fileName != null) {
						ImageInfoDTO iDto = new ImageInfoDTO();
						iDto.setProduct_num(num);
						iDto.setSavePath(p);
						iDto.setFileName(fileName);
						images.add(iDto);
					}
				}
				int c = dao.addPictures(num, images);
				System.out.println("저장된 이미지 수 : " + c);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
			System.err.println("제품 등록 중 오류 발생");
		}
		
		req.setAttribute("cnt", cnt);
		return "/jsp/product_registerPro.jsp";
		
		// 후기내용
		String psot_title = req.getParameter("")
		*/
		
		
		return null;
	}

}
