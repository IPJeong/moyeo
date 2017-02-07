package com.engineers.moyeo.five.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.engineers.moyeo.five.dto.MeetingPostViewDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.five.dto.PostReplyDTO;
import com.engineers.moyeo.five.dto.PostVideoDTO;
import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.FileManager;
import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.main.service.MainService;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;


@Service
public class FiveServiceImpl implements FiveService{

   @Autowired
   FiveDAO fiveDao;
   @Autowired
   SixDAO sixDao;
   @Autowired
   MainService mainService;

   // 모임후기 리스트 출력 프로세스
   @Override
   public String postList(Model model) throws NumberFormatException, NullPointerException{

      HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
      // 모임번호를 받아옴
      int group_num = (Integer)req.getSession().getAttribute("group_num");

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

      int pageSize = 10;      //   한 페이지당 출력한 글 개수
      int pageBlock = 5;      //   출력할 페이지 개수

      int cnt = 0;         // 글 개수
      int start = 0;         // 현재 페이지 시작번호 : rownum
      int end   = 0;         // 현재 페이지지 끝번호 : rownum
      int number = 0;         // 출력할 글 번호
      String pageNum = null;   // 페이지 번호
      int currentPage = 0;   // 현재 페이지

      int pageCount = 0;      // 페이지 개수
      int startPage = 0;      // 시작 페이지
      int endPage = 0;      // 마지막 페이지

      // 글개수 구하기
      cnt = fiveDao.getPostCnt(group_num);

      // 페이지번호를 받아옴
      pageNum = req.getParameter("pageNum");

      if(pageNum == null) {
         pageNum = "1";      // 첫페이지를 1페이지로 설정
      }

      currentPage = Integer.parseInt(pageNum);
      pageCount = ( cnt / pageSize ) + (cnt % pageSize > 0 ? 1 : 0);

      start = (currentPage -1) * pageSize + 1;   // (5-1) * 10 +1;
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

      startPage = (currentPage / pageBlock) * pageBlock + 1;   // (5 / 3) * 3 + 1 = 4
      if(currentPage % pageBlock == 0) startPage -= pageBlock;   //(5 % 3)

      endPage = startPage + pageBlock - 1;   // 4 + 3 - 1 = 6;
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

      return "five/post/postList";
   }

   // 모임후기 입력폼 로드
   @Override
   public String postForm(Model model) throws NumberFormatException, NullPointerException {

      HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
      int group_num = (Integer)req.getSession().getAttribute("group_num");
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
      
      return "five/post/postForm";
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

      int group_num = (Integer)req.getSession().getAttribute("group_num");
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

      // JSP로부터 데이터 받아오는 부분
      String title = req.getParameter("post_title");
      String content= req.getParameter("post_content");
      String memId = (String)req.getSession().getAttribute("mem_id");
      String post_tag = req.getParameter("post_tag");
      
      Timestamp post_date = new Timestamp(System.currentTimeMillis());

      // DTO생성하여 데이터 삽입
      MeetingPostDTO dto = new MeetingPostDTO();
      dto.setPost_title(title);
      dto.setPost_content(content);
      dto.setPost_date(post_date);
      dto.setGroup_num(group_num);
      dto.setLike_num(0);
      dto.setMem_id(memId);
      dto.setPost_tag(post_tag);
      dto.setPost_hit(0);
      cnt = fiveDao.insertPost(dto);
      
      Map<String, Object> dataMap = new HashMap<>();
      dataMap.put("group_num", group_num);
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
               picDto.setGroup_num(group_num);
               picDto.setMem_id(memId);
               picDto.setPost_num(post_num);
               fiveDao.insertPostPic(picDto);

            } else if(type == 2) {
               filename = FileManager.saveFile(multipartFile, rootPath + videoPath, fileName);
               PostVideoDTO videoDto = new PostVideoDTO();
               videoDto.setVideo_path(Code.postVideoPathS);
               videoDto.setVideo_name(filename);
               videoDto.setMem_id(memId);
               videoDto.setGroup_num(group_num);
               videoDto.setPost_num(post_num);
               fiveDao.insertPostVideo(videoDto);
            }
         }
      }
      
      mainService.wordAnalyzer(title, content, post_tag);

      model.addAttribute("cnt", cnt);

      return "five/post/postPro";
   }
   
   // 모임후기의 상세정보를 조회 
   @Override
   public String postDetail(Model model) throws NumberFormatException, NullPointerException {

      HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
      // 모임번호
      int group_num = (Integer)req.getSession().getAttribute("group_num");
      // 리스트 페이지 번호
      int pageNum = Integer.parseInt(req.getParameter("pageNum"));
      // 페이지번호를 심어주
      model.addAttribute("pageNum", pageNum);
      
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
      
      // 모임후기번호
      int post_num = Integer.parseInt(req.getParameter("post_num"));
      String mem_id = (String)req.getSession().getAttribute("mem_id");
      // 업로드 사진 수
      int picCnt = 0;
      // 업로드 동영상 수
      int videoCnt = 0;

      // 모임후기 정보를 조회
      MeetingPostViewDTO postDto = fiveDao.getPostDetail(post_num);
      //태그 정렬
      if(postDto.getPost_tag() != null) {
         postDto.setPost_tags(Arrays.asList(postDto.getPost_tag().split(",")));
      }
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

      if(mem_id != null) {
         Map<String, Object> likeMap = new HashMap<>();
         likeMap.put("post_num", post_num);
         likeMap.put("mem_id", mem_id);

         // 모임후기의 좋아요 여부 조회
         int didLike = fiveDao.likeCheck(likeMap);
         // 모임후기 좋아요 여부
         model.addAttribute("didLike", didLike);
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

      // 모임후기의 댓글을 불러옴
      List<PostReplyDTO> replyDtos = fiveDao.getPostReplys(post_num);
      for(PostReplyDTO dto : replyDtos) {
         System.out.println(dto.getPropic_path());
         System.out.println(dto.getPropic_path());
      }
      model.addAttribute("replyDtos", replyDtos);

      // 모임후기 상세정보
      model.addAttribute("dto", postDto);
      // 모임후기 첨부사진 수
      model.addAttribute("picCnt", picCnt);
      // 모임후기 첨부 동영상 수
      model.addAttribute("videoCnt", videoCnt);

      return "five/post/postDetail";

   }


   // 모임후기 수정폼 로드
   @Override
   public String modifyPost(Model model) throws NumberFormatException, NullPointerException {
      
      HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
      
      int group_num = (Integer)req.getSession().getAttribute("group_num");
      // 모임후기번호
      int post_num = Integer.parseInt(req.getParameter("post_num"));
      // 모임후기 정보를 조회
      MeetingPostDTO postDto = fiveDao.getPostDetail(post_num);
      // 모임후기의 사진정보를 조회
      List<PostPictureDTO> picDtos = fiveDao.getPostPics(post_num);
      // 모임후기의 동영상정보를 조회
      List<PostVideoDTO> videoDtos = fiveDao.getPostVideos(post_num);
      
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
      
      // 모임후기 번호 삽입
      model.addAttribute("post_num", post_num);
      // 모임후기 정보 삽입
      model.addAttribute("postDto", postDto);
      // 모임후기 사진을 삽입
      model.addAttribute("picDtos", picDtos);
      // 모임후기 동영상을 삽입
      model.addAttribute("videoDtos", videoDtos);
      // 모임후기 리스트 페이지번호 삽입
      model.addAttribute("pageNum", req.getParameter("pageNum"));
      
      return "five/post/postModifyForm";
   }
   
   // 모임후기 수정 프로세스
   @Override
   public String modifyPostPro(Model model) {

      // 모임후기의 수정 결과를 반환하는 숫자값
      int cnt = 0;
      
      // model에 담아온 객체를 꺼내기 위해 map으로 전환
      Map<String, Object> map = model.asMap();
      // 업로드 파일 객체를 꺼냄
      FileForm fileForm = (FileForm)map.get("fileForm");
      // request객체를 꺼냄
      HttpServletRequest req = (HttpServletRequest)map.get("req");

      int group_num = (Integer)req.getSession().getAttribute("group_num");
      int post_num = Integer.parseInt(req.getParameter("post_num"));
      
      // JSP로부터 데이터 받아오는 부분
      String title = req.getParameter("post_title");
      String content= req.getParameter("post_content");
      String mem_id = (String)req.getSession().getAttribute("mem_id");
      String post_tag = req.getParameter("post_tag");
      String[] pic_deletes = req.getParameterValues("pic_deletes");
      String[] video_deletes = req.getParameterValues("video_deletes");
      
      // 사진삭제 프로세스
      if(pic_deletes != null) {
         for(String pic_num : pic_deletes) {
            if(!pic_num.equals("0")) {
               System.out.println("pic_num : " + pic_num);
               fiveDao.deletePostPic(Integer.parseInt(pic_num));
            }
         }
      }
      
      if(video_deletes != null) {
         // 동영상삭제 프로세스
         for(String video_num : video_deletes) {
            if(!video_num.equals("0")){
               System.out.println("video_num : " + video_num);
               fiveDao.deletePostVideo(Integer.parseInt(video_num));
            }
         }
      }
      
      // DTO생성하여 데이터 수정
      MeetingPostDTO dto = new MeetingPostDTO();
      dto.setPost_num(post_num);
      dto.setPost_title(title);
      dto.setPost_content(content);
      dto.setPost_tag(post_tag);
      cnt = fiveDao.updatePost(dto);

      // 업로드파일 관리
      List<MultipartFile> files = fileForm.getFiles();

      // 업로드 파일 확인 후 추가
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
               picDto.setGroup_num(group_num);
               picDto.setMem_id(mem_id);
               picDto.setPost_num(post_num);
               fiveDao.insertPostPic(picDto);

            } else if(type == 2) {
               filename = FileManager.saveFile(multipartFile, rootPath + videoPath, fileName);
               PostVideoDTO videoDto = new PostVideoDTO();
               videoDto.setVideo_path(Code.postVideoPathS);
               videoDto.setVideo_name(filename);
               videoDto.setMem_id(mem_id);
               videoDto.setGroup_num(group_num);
               videoDto.setPost_num(post_num);
               fiveDao.insertPostVideo(videoDto);
            }
         }
      }
      // 수정결과 삽입
      model.addAttribute("cnt", cnt);
      // 수정한 후기번호 삽입
      model.addAttribute("post_num", post_num);
      // 페이지넘버 삽입
      System.out.println("pageNum : " + req.getParameter("pageNum"));
      model.addAttribute("pageNum", req.getParameter("pageNum"));
      
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

      return "five/post/modifyPostPro";
   }

   // 모임후기 삭제
   @Override
   public String deletePost(Model model) throws NumberFormatException, NullPointerException {
      
      HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
      // 모임후기 번호
      int post_num = Integer.parseInt(req.getParameter("post_num"));
      
      // 모임후기 정보를 삭제
      int cnt = fiveDao.deletePost(post_num);
      // 모임후기 삭제 결과 삽입
      model.addAttribute("cnt", cnt);
      //페이지 번호를 삽입
      model.addAttribute("pageNum", req.getParameter("pageNum"));
      return "five/postDeletePro";
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

   // 모임후기 댓글 등록
   @Override
   public void addPostReply(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException {

      // 모임후기 번호
      int post_num = Integer.parseInt(req.getParameter("post_num"));
      // 댓글 내용
      String reply_content = req.getParameter("reply_content");
      // 작성한 회원의 아이디
      String mem_id = (String)req.getSession().getAttribute("mem_id");
      Timestamp time = new Timestamp(System.currentTimeMillis());

      PostReplyDTO dto = new PostReplyDTO();
      dto.setPost_num(post_num);
      dto.setReply_content(reply_content);
      dto.setMem_id(mem_id);
      dto.setWrite_date(time);

      int cnt = fiveDao.addPostReply(dto);

      if(cnt == 1) {
         Map<String, Object> map = new HashMap<>();
         map.put("post_num", post_num);
         map.put("mem_id", mem_id);
         map.put("write_date", time);
         dto = fiveDao.getPostReply(map);
         mav.addObject("dto", dto);
      }
      mav.addObject("cnt", cnt);
   }

   // 모임후기 댓글 삭제
   @Override
   public void deletePostReply(ModelAndView mav, HttpServletRequest req)    throws NumberFormatException, NullPointerException {

      // 모임후기 댓글의 번호를 받아옴
      int postrep_num = Integer.parseInt(req.getParameter("postrep_num"));
      // 삭제 상태값 반환
      int cnt = fiveDao.deletePostReply(postrep_num);

      mav.addObject("cnt", cnt);
      mav.addObject("postrep_num", postrep_num);
   }

   @Override
   public String getGroupPictures(Model model) throws NumberFormatException, NullPointerException {
      
      HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
      
      // 모임번호를 받아옴
      int group_num = (Integer)req.getSession().getAttribute("group_num");
      
      // 모임의 사진리스트를 불러옴
      List<PostPictureDTO> picDtos = fiveDao.getGroupPics(group_num);
      
      model.addAttribute("picDtos", picDtos);
      
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
      
      return "five/gallery/groupPictures";
   }

   @Override
   public String getGroupVideos(Model model) throws NumberFormatException, NullPointerException {
      
      HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
      
      // 모임번호를 받아옴
      int group_num = (Integer)req.getSession().getAttribute("group_num");
      
      // 모임의 사진리스트를 불러옴
      List<PostVideoDTO> videoDtos = fiveDao.getGroupVideos(group_num);
      
      model.addAttribute("videoDtos", videoDtos);
      
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
      
      return "five/gallery/groupVideos";
   }

}