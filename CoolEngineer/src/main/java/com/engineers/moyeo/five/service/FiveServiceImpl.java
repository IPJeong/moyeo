package com.engineers.moyeo.five.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

	
	// 모임후기 리스트 출력 프로세스
	@Override
	public String postList(Model model) throws NumberFormatException, NullPointerException{
		
		HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
		// 모임번호를 받아옴
		//int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		int group_num = 1;
		
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
		
		// 글개수 구하기
		cnt = fiveDao.getPostCnt(group_num);
		
		// 페이지번호를 받아옴
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";		// 첫페이지를 1페이지로 설정
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = ( cnt / pageSize ) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage -1) * pageSize + 1;	// (5-1) * 10 +1;
		end = start + pageSize -1; // 41 + 10 -1 = 50;
		
		if(end > cnt) end = cnt;
		
		// 글번호
		number = cnt - (currentPage -1) * pageSize;
		
		Map<String, Integer> map = new HashMap<>();
		map.put("group_num", group_num);
		map.put("start", start);
		map.put("end", end);
		
		// 모임후기 리스트를 가져옴
		List<MeetingPostDTO> dtos = fiveDao.getPostList(map);
		
		req.setAttribute("dtos", dtos);
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;	// (5 / 3) * 3 + 1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock;	//(5 % 3)
		
		endPage = startPage + pageBlock - 1;	// 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if(cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "five/postList";
	}
	
	
	// 모임후기 등록 프로세스
	@Override
	public String postPro(Model model) {
		
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
		String post_tag = req.getParameter("post_tag");
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
		dto.setPost_tag(post_tag);
		dto.setPost_hit(0);
		cnt = fiveDao.insertPost(dto);
		
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("group_num", groupNum);
		dataMap.put("post_date", post_date);
		
		int post_num = fiveDao.getPostNum(dataMap);
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();
		
		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			// 업로드된 파일 이름을 받아옴
			String fileName = multipartFile.getOriginalFilename();
			
			if(fileName.trim().length()>4){
				
				String rootPath = Code.rootPath;
				// 모임후기 이미지 저장경로
				String imgPath = Code.postImgPath;
				// 모임후기 동영상 저장경로
				String videoPath = Code.postVideoPath;
				// 파일의 타입을 확인하여 가져옴
				int type = FileManager.checkFileType(fileName);
				String filename = null;
				
				if(type == 1) {
					// 파일을 저장 후 저장된 파일명을 반환
					filename = FileManager.saveFile(multipartFile, rootPath + imgPath, fileName);
					PostPictureDTO picDto = new PostPictureDTO();
					picDto.setPic_path(Code.postImgPathS);
					picDto.setPic_name(filename);
					picDto.setGroup_num(groupNum);
					picDto.setMem_id(memId);
					picDto.setPost_num(post_num);
					fiveDao.insertPostPic(picDto);
					
				} else if(type == 2) {
					filename = FileManager.saveFile(multipartFile, rootPath + videoPath, fileName);
					PostVideoDTO videoDto = new PostVideoDTO();
					videoDto.setVideo_path(Code.postVideoPathS);
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


	@Override
	public String postDetail(Model model) throws NumberFormatException, NullPointerException {
		
		HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
		// 모임후기번호
		int post_num = Integer.parseInt(req.getParameter("post_num"));
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		// 업로드 사진 수
		int picCnt = 0;
		// 업로드 동영상 수
		int videoCnt = 0;
		
		// 모임후기 정보를 조회
		MeetingPostDTO postDto = fiveDao.getPostDetail(post_num);
		// 모임후기의 사진정보를 조회
		List<PostPictureDTO> picDtos = fiveDao.getPostPics(post_num);
		// 모임후기의 동영상정보를 조회
		List<PostVideoDTO> videoDtos = fiveDao.getPostVideos(post_num);
		if(picDtos != null) {
			picCnt = picDtos.size();
			if(picCnt > 0) {
				model.addAttribute("picDtos", picDtos);
			}
		}
		
		if(videoDtos != null) {
			videoCnt =  videoDtos.size();
			if(videoCnt > 0) {
				model.addAttribute("videoDtos", videoDtos);
			}
		}
		if(!postDto.getMem_id().equals(mem_id)) {
			int cnt = fiveDao.updatePostHit(post_num);
			if(cnt == 1) {
				postDto = fiveDao.getPostDetail(post_num);
			}
		}
		// 모임후기 상세정보
		model.addAttribute("dto", postDto);
		// 모임후기 첨부사진 수
		model.addAttribute("picCnt", picCnt);
		// 모임후기 첨부 동영상 수
		model.addAttribute("videoCnt", videoCnt);
		
		return "five/postDetail";
				
	}

	// 모임후기 상세정보
	@Override
	public void getPostDetail(ModelAndView mav) throws NumberFormatException, NullPointerException {
		// 모임후기번호
		int post_num = Integer.parseInt((String)mav.getModel().get("post_num"));
		// 업로드 사진 수
		int picCnt = 0;
		// 업로드 동영상 수
		int videoCnt = 0;
		
		// 모임후기 정보를 조회
		MeetingPostDTO postDto = fiveDao.getPostDetail(post_num);
		// 모임후기의 사진정보를 조회
		List<PostPictureDTO> picDtos = fiveDao.getPostPics(post_num);
		// 모임후기의 동영상정보를 조회
		List<PostVideoDTO> videoDtos = fiveDao.getPostVideos(post_num);
		
		if(picDtos != null) {
			picCnt = picDtos.size();
			if(picCnt > 0) {
				mav.addObject("picDtos", picDtos);
			}
		}
		
		if(videoDtos != null) {
			videoCnt =  videoDtos.size();
			if(videoCnt > 0) {
				mav.addObject("videoDtos", videoDtos);
			}
		}
		// 모임후기 상세정보
		mav.addObject("dto", postDto);
		// 모임후기 첨부사진 수
		mav.addObject("picCnt", picCnt);
		// 모임후기 첨부 동영상 수
		mav.addObject("videoCnt", videoCnt);
	}

	// 모임후기 수정
	@Override
	public void modifyPost(ModelAndView mav) throws NumberFormatException, NullPointerException {
		// 모임후기번호
		int post_num = Integer.parseInt((String)mav.getModel().get("post_num"));
		// 모임후기 정보를 조회
		MeetingPostDTO postDto = fiveDao.getPostDetail(post_num);
		// 모임후기 정보 삽입
		mav.addObject("postDto", postDto);
	}

	// 모임후기 삭제
	@Override
	public void deletePost(ModelAndView mav) throws NumberFormatException, NullPointerException {
		// 모임후기 번호
		int post_num = Integer.parseInt((String)mav.getModel().get("post_num"));
		// 모임후기 정보를 삭제
		int cnt = fiveDao.deletePost(post_num);
		// 모임후기 삭제 결과 삽입
		mav.addObject("cnt", cnt);
	}

	// 모임후기 좋아요
	@Override
	public void likePost(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException {
		// 모임후기 번호
		int post_num = Integer.parseInt(req.getParameter("post_num"));
		// 타입
		int type = Integer.parseInt(req.getParameter("type"));
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("post_num", post_num);
		
		int cnt = 0;
		
		if(type == 1) {
			if(fiveDao.likePost(map) == 1)cnt = fiveDao.updateLikeNum(post_num);
		} else if(type == 2){
			if(fiveDao.unLikePost(map) == 1)cnt = fiveDao.downDateLikeNum(post_num);
		}
		int likeNum = fiveDao.getLikeNum(post_num);
		mav.addObject("cnt", cnt);
		mav.addObject("type", type);
		mav.addObject("likeNum", likeNum);
		mav.addObject("post_num", post_num);
	}
	 
}
