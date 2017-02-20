package com.engineers.moyeo.main.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.engineers.moyeo.five.dao.FiveDAO;
import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.MeetingPostViewDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.five.dto.PostVideoDTO;
import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.TextMessage;
import com.engineers.moyeo.main.dao.MainDAO;
import com.engineers.moyeo.main.dto.GroupLeaderNotiDTO;
import com.engineers.moyeo.main.dto.MainPicDTO;
import com.engineers.moyeo.main.dto.MainVideoDTO;
import com.engineers.moyeo.main.dto.MemberNotiDTO;
import com.engineers.moyeo.main.dto.SellerNotiDTO;
import com.engineers.moyeo.main.dto.WordDTO;
import com.engineers.moyeo.main.twitterKoreanParser.KoreanParser;
import com.engineers.moyeo.one.dao.OneDAO;
import com.engineers.moyeo.one.dto.ProductInfoDTO;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.HotMoimDTO;
import com.engineers.moyeo.six.dto.InterestCatDTO;
import com.engineers.moyeo.six.dto.InterestLocationDTO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.NoticeDTO;
import com.engineers.moyeo.three.dao.ThreeDAO;
import com.engineers.moyeo.three.dto.EventDTO;
import com.engineers.moyeo.two.dao.TwoDAO;
import com.engineers.moyeo.two.dto.Place_likeDTO;

@org.springframework.stereotype.Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDAO mainDao;

	@Autowired
	SixDAO sixDao;

	@Autowired
	TwoDAO twoDao;
	
	@Autowired
	FiveDAO fiveDao;
	
	@Autowired
	ThreeDAO threeDao;

	@Autowired
	OneDAO oneDao;
	
	// 워드클라우드 리스트
	private static List<WordDTO> wordDtos;


	// 메인페이지에 회원정보 연동
	@Override
	public void getMemberInfo(Model model) {
		
		String mem_id = (String)((HttpServletRequest)model.asMap().get("req")).getSession().getAttribute("mem_id");
		if(mem_id != null) {
			MemberInfoDTO memInfo = oneDao.getMemberInformArticle(mem_id);
			model.addAttribute("memInfo", memInfo);
			int notiCnt =threeDao.getNoneChkNoti(mem_id);//확인 안한 알림
			model.addAttribute("notiCnt",notiCnt);
			
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("start", 1);
			dataMap.put("end", 1000);
			dataMap.put("mem_id", mem_id);
			
			List<MoimOpenDTO> moimList = threeDao.getGroupList(dataMap);
			model.addAttribute("moimList", moimList);
		}
	}

	//메인페이지에 공지사항 글 연동
	@Override
	public void main_notice(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		int cnt = sixDao.getCount();

		if(wordDtos == null) {
			setWordList();
			System.out.println("WordCloud word set");
		}

		System.out.println("Private Wordcloud word set");

		req.setAttribute("wordDtos", wordDtos);

		if(cnt > 0) {
			ArrayList<NoticeDTO> dtos = sixDao.getArticles_main();
			req.setAttribute("dtos", dtos);
			req.setAttribute("pageNum", 1);
		}
	}

	// 메인페이지에 모임후기 사진 및 동영상 연동
	@Override
	public void main_meeting_post(Model model) {

		Map<String, Integer> map = new HashMap<>();
		map.put("start", 1);
		map.put("end", 30);

		List<MainPicDTO> picDtos = mainDao.getMainPictures(map);

		map.put("end", 6);
		List<MainVideoDTO> videoDtos = mainDao.getMainVideos(map);

		System.out.println("picDtoSize : " + picDtos.size() + ", videoDtoSize : " + videoDtos.size());
		// 모임후기의 사진 리스트를 불러옴
		model.addAttribute("picDtos", picDtos);
		// 모임후기의 동영상 리스트를 불러옴
		model.addAttribute("videoDtos", videoDtos);

	}

	// 메인페이지에 모임후기 연동
	@Override
	public void getMeetingPostList(Model model) {

		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		String date = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH))+"-"+cal.get(Calendar.DATE);

		List<MeetingPostDTO> postDtos = mainDao.getMeetingPost(date);
		System.out.println("미팅후기 수 : " + postDtos.size());
		model.addAttribute("postDtos", postDtos);

	}
	
	// 메인페이지에 이벤트 글 연동
	@Override
	public void getEventList(Model model) {
		//이벤트 불러오기
		int cnt4 = threeDao.getEventCount();
		if(cnt4 > 0) {
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", 1);
			daoMap.put("end", 5);
			ArrayList<EventDTO> dtos4 = threeDao.getEventList(daoMap);
			model.addAttribute("dtos4", dtos4);
			model.addAttribute("pageNum", 1);
		}
	}
	
	// 메인페이지 제품리스트 연동
	@Override
	public void getProducts(Model model) {
		
		Map<String, Integer> daoMap = new HashMap<String, Integer>();
		daoMap.put("start", 1);
		daoMap.put("end", 8);
		
		ArrayList<ProductInfoDTO> dtos = oneDao.getProductArticles(daoMap);
		
		model.addAttribute("productDtos", dtos);
		
	}

	// 로그인 프로세스
	@Override
	public String memberLoginPro(Model model) {
		Map<String, Object> map = model.asMap();

		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String mem_id = req.getParameter("mem_id");
		String passwd = req.getParameter("passwd");
		//		String beforeurl = req.getParameter("beforeurl");

		Map<String, String> daoMap = new HashMap<String, String>(); 
		daoMap.put("mem_id", mem_id);
		daoMap.put("passwd", passwd);

		int cnt = mainDao.pwdCheck(daoMap);

		if(cnt == 1) {
			req.getSession().setAttribute("mem_id", null);
			req.getSession().setAttribute("manager_id", null);
			req.getSession().setAttribute("authority", null);
			req.getSession().setAttribute("group_per", null);

			req.getSession().setAttribute("mem_id", mem_id);
			model.addAttribute("cnt", cnt);
			//			model.addAttribute("beforeurl", beforeurl);
			return "main/memberLoginPro";
		} else {
			int cnt2 = mainDao.tempPwdCheck(daoMap);
			if (cnt2 == 1) {
				req.getSession().setAttribute("mem_id", null);
				req.getSession().setAttribute("manager_id", null);
				req.getSession().setAttribute("authority", null);
				req.getSession().setAttribute("group_per", null);

				req.getSession().setAttribute("mem_id", mem_id);
				cnt = 2;				
			}
			model.addAttribute("cnt", cnt);
			return "main/memberLoginPro";	
		}
	}

	// 단어 형태소 분석을 처리하는 메서드
	@Override
	public void wordAnalyzer(String title, String content, String tag) {
		StringBuilder sb = new StringBuilder(title);
		if(content != null) {
			if(!content.equals("")){
				sb.append(" " + content);
			}
		}
		if(tag != null) {
			String[] tags = tag.split(",");
			for(String ta : tags) {
				ta = " #"+ta.replaceAll(" ", "");
				sb.append(ta);
			}
			System.out.println("sb : " + sb.toString());
		}
		wordExtractAndAnalyze(sb.toString());
	}

	// 형태소 분석된 결과를 데이터베이스에 저장하는 프로세스
	@Override
	public void wordExtractAndAnalyze(String text) {
		System.out.println("WordCloud analyze");
		new Runnable() {
			public void run() {

				List<WordDTO> wordMap = KoreanParser.getWordsMap(text);
				if(wordMap.isEmpty())return;
				Timestamp time = new Timestamp(System.currentTimeMillis());
				for(WordDTO dto : wordMap) {

					// 기존에 있는 단어일 경우 카운트 업데이트
					if(mainDao.checkWordCloud(dto.getWord()) == 1) {
						dto.setUpdate_date(time);
						mainDao.updateWordCloud(dto);
						// 기존에 없는 단어일 경우 단어와 카운트 추가	
					} else {
						dto.setUpdate_date(time);
						dto.setReg_date(time);
						mainDao.addWordCloud(dto);
					}
				}
				// 워드 클라우드 모델을 refresh 해줌
				setWordList();
				System.out.println("WordCloud 분석 종료");
			}
		}.run();
	}

	// 워드클라우드 단어를 가져옴
	public synchronized void setWordList() {
		System.out.println("Word Cloud word set request");
		wordDtos = mainDao.getWordCloudModel();
	}

	@Override
	public String wordcloudRefresh(Model model) {

		HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");

		String strDate = req.getParameter("strDate");
		String endDate = req.getParameter("endDate");
		String[] wordOps = req.getParameter("wordOps").split(",");
		String printMsg = "";
		String cow = req.getParameter("countOfWords");
		if(cow == null)cow = "30";
		int countOfWords = Integer.parseInt(req.getParameter("countOfWords"));
		Map<String, Object> map = new HashMap<>();

		printMsg = "strDate : " + strDate + ", endDate : " + endDate +", 요청단어수 : " + countOfWords;

		int type = 0;

		if(wordOps != null) {
			List<String> list = Arrays.asList(wordOps);
			if(list.contains("Noun") && list.contains("Verb") && list.contains("Hashtag")){
				type = 6;
				printMsg += ", | 명사, 동사, 해시태그 검색요청";
			} else if(list.contains("Noun") && list.contains("Verb")) {
				type = 4;
				printMsg += ", | 명사, 동사 검색요청";
			} else if(list.contains("Noun") && list.contains("Hashtag")) {
				type = 7;
				printMsg += ", | 명사, 해시태그 검색요청";
			} else if(list.contains("Hashtag") && list.contains("Verb")) {
				type = 5;
				printMsg += ", | 해시태그, 동사 검색요청";
			} else if(list.contains("Noun")) {
				type = 1;
				printMsg += ", | 명사 검색요청";
			} else if(list.contains("Verb")) {
				type = 2;
				printMsg += ", | 동사 검색요청";
			} else if(list.contains("Hashtag")) {
				type = 3;
				printMsg += ", | 해시태그 검색요청";
			}
		} else {
			type = 6;
			printMsg += ", | 명사, 동사, 해시태그 전체검색 요청";
		}

		map.put("type", type);
		map.put("countOfWords", countOfWords);

		List<WordDTO> wordList = null;

		if(strDate != null && endDate != null){
			if(!strDate.equals("")) {
				strDate = strDate + " 00:00:01.000000";
				endDate = endDate + " 23:59:59.000000";
				Timestamp stp = Timestamp.valueOf(strDate);
				Timestamp etp = Timestamp.valueOf(endDate);
				map.put("strDate", stp);
				map.put("endDate", etp);
				wordList = mainDao.searchWordcloud2(map);
			} else {
				wordList = mainDao.searchWordcloud(map);
			}
		} else {
			wordList = mainDao.searchWordcloud(map);
		}

		System.out.println(printMsg);

		String resultMsg = "<ul>";
		System.out.println(wordList);
		for(WordDTO dto : wordList) {
			if(dto.getPart_of_speech().equals("Hashtag")){
				resultMsg += "<li><a href='/moyeo/two/wordCloudSearchByTag?search_keyword=" + dto.getWord().replaceAll("#", "") + "' >" + dto.getWord() + "</a></li>";
			} else {
				resultMsg += "<li><a href='/moyeo/two/wordCloudSearch?search_keyword=" + dto.getWord() + "' >" + dto.getWord() + "</a></li>";
			}
		}
		if(wordList.isEmpty())resultMsg += "<li><a href='#' target='_blank'>단어가 없습니다.</a></li>";
		resultMsg += "</ul>";

		System.out.println(resultMsg);

		//		model.addAttribute("wordList", wordList);
		//		model.addAttribute("listSize", wordList.size());

		return resultMsg;
	}


	//메인페이지에 인기모임 불러오기
	@Override
	public void hotMoim(Model model) {

		ArrayList<HotMoimDTO> hotDtos = sixDao.hotMoim();
		model.addAttribute("hotDtos", hotDtos);
	}

	//메인페이지에 추천모임 불러오기
	@Override
	public void recommendMoim(Model model) {
		//추천모임
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");

		//회원의 관심 카테고리 정보 조회
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		if(mem_id != null) {
			InterestCatDTO cateDto = sixDao.inteCate(mem_id);
			if(cateDto != null ){
				String group_inte1 = cateDto.getInter_first();	
				String group_inte2 = cateDto.getInter_second();
				//회원의 관심 지역 정보 조회
				InterestLocationDTO locaDto = sixDao.inteLoca(mem_id);
				String group_location = locaDto.getLoc_city() + "-" + locaDto.getLoc_gu();

				//추천모임
				Map<String, Object> daoMap = model.asMap();
				daoMap.put("group_inte1", group_inte1);
				daoMap.put("group_inte2", group_inte2);
				daoMap.put("group_location", group_location);

				int cnt = sixDao.recommendMoimChk(daoMap);
				if (cnt != 0){
					ArrayList<MoimOpenDTO> recommendDtos = sixDao.recommendMoim(daoMap);
					model.addAttribute("recommendDtos", recommendDtos);
				}
			}
		}
	}

	//메인페이지에 추천장소 불러오기
	@Override
	public void recPlace(Model model) {
		int lcnt = 0;

		lcnt = twoDao.getPlaceLikeCount();
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("start2", 1);
		daoMap.put("end2", 5);
		if(lcnt > 0) {
			ArrayList<Place_likeDTO> lpodtos = twoDao.getPlaceLikeList(daoMap);
			System.out.println("lpdtos : " + lpodtos.size());
			model.addAttribute("lpodtos", lpodtos);
		}

		model.addAttribute("lcnt", lcnt);
		System.out.println("lcnt : "+lcnt);
	}

	// 모임후기 사진 앨범
	@Override
	public void getPostPictures(Model model) {

		HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
		
		int pageSize = 32;      //   한 페이지당 출력한 글 개수
		int pageBlock = 5;      //   출력할 페이지 개수

		int cnt = 0;         // 사진 개수
		int start = 0;         // 현재 페이지 시작번호 : rownum
		int end   = 0;         // 현재 페이지지 끝번호 : rownum
		int number = 0;         // 출력할 글 번호
		String pageNum = null;   // 페이지 번호
		int currentPage = 0;   // 현재 페이지

		int pageCount = 0;      // 페이지 개수
		int startPage = 0;      // 시작 페이지
		int endPage = 0;      // 마지막 페이지

		// 사진개수 구하기
		cnt = mainDao.getTotalPicCnt();

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
		map.put("start", start);
		map.put("end", end);

		// 모임후기 사진 리스트를 가져옴
		List<PostPictureDTO> dtos = mainDao.getPostPictures(map);

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
	}
	
	// 모임후기 동영상 앨범
	@Override
	public void getPostVideos(Model model) {

		HttpServletRequest req = (HttpServletRequest)model.asMap().get("req");
		
		int pageSize = 32;      //   한 페이지당 출력한 글 개수
		int pageBlock = 5;      //   출력할 페이지 개수

		int cnt = 0;         // 사진 개수
		int start = 0;         // 현재 페이지 시작번호 : rownum
		int end   = 0;         // 현재 페이지지 끝번호 : rownum
		int number = 0;         // 출력할 글 번호
		String pageNum = null;   // 페이지 번호
		int currentPage = 0;   // 현재 페이지

		int pageCount = 0;      // 페이지 개수
		int startPage = 0;      // 시작 페이지
		int endPage = 0;      // 마지막 페이지

		// 동영상 개수 구하기
		cnt = mainDao.getTotalVideoCnt();

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
		map.put("start", start);
		map.put("end", end);

		// 모임후기 동영상 리스트를 가져옴
		List<PostVideoDTO> dtos = mainDao.getPostVideos(map);

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
	}

	// 모임후기 상세정보 조회
	@Override
	public void getPostDetails(HttpServletRequest req, ModelAndView mav) {
		
		int post_num = Integer.parseInt(req.getParameter("post_num"));
		
		MeetingPostViewDTO postDto = fiveDao.getPostDetail(post_num);
		if(postDto.getPost_tag() != null){
			postDto.setPost_tags(Arrays.asList(postDto.getPost_tag().split(",")));
		}
		mav.addObject("postDto", postDto);
		
	}

	// 회원, 모임장, 판매자 알림 등록
	@Override
	public void addNotice(Map<String, Object> map) {
		
		// 알림을 줄 타입
		int type = 0;
		try {
			type = (Integer)map.get("type");
		} catch(NullPointerException e) {
			e.printStackTrace();
			System.out.println("type 숫자 Null");
			return ;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("type 형변환 에러 발생");
			return ;
		}
		// 알림 발생 시간
		long time = System.currentTimeMillis();
		// 알림 등록 결과 값
		int cnt = 0;
		
		// 현호
		// 이벤트에 당첨된 회원의 알림을 생성하는 메서드 (당첨된 회원아이디, 이벤트 명)(회원) - type(1)
		if(type == 1) {
			
			List<EventDTO> eventDtos = (List<EventDTO>)map.get("mem_ids");
			String event_title = (String)map.get("event_title");
			
			for(EventDTO dto : eventDtos) {
				String msg = TextMessage.memWinningMsg(dto.getMem_id(), event_title);
				cnt = addMemberNotiDTO(msg, time, dto.getMem_id());
			}
			
		// 상준
		// 모임에 작성한 가입인사 게시판에 댓글이 달린 경우 알림을 생성하는 메서드(회원)(게시글을 작성한 회원아이디, 모임의 이름, 댓글을 작성한 회원의 아이디) - type(2)	
		} else if(type == 2) {
			String mem_id = (String)map.get("mem_id");
			String group_name = (String)map.get("group_name");
			String from_id = (String)map.get("from_id");
			String msg = TextMessage.memGreetingReplyMsg(mem_id, group_name, from_id);
			
			cnt = addMemberNotiDTO(msg, time, mem_id);
			
		// 모임에 작성한 가입인사 게시판의 좋아요 버튼을 누른 경우 알림을 생성하는 메서드(게시글을 작성한 회원아이디, 모임의 이름, 좋아한 회원의 아이디) - type(3)
		} else if(type == 3) {
			String mem_id = (String)map.get("mem_id");
			String group_name = (String)map.get("group_name");
			String from_id = (String)map.get("from_id");
			String msg = TextMessage.memGreetingLikeMsg(mem_id, group_name, from_id);
			
			cnt = addMemberNotiDTO(msg, time, mem_id);
			
		// 우진
		// 회원알림테이블에 Q&A 질문에 대한 답변이 달린경우 알림을 생성하는 메서드(회원)(해당 질문의 제목, 질문한 회원의 아이디) - type(4)	
		} else if(type == 4) {
			
			String mem_id = (String)map.get("mem_id");
			String qna_title = (String)map.get("qna_title");
			String msg = TextMessage.memQnaReplyMsg(mem_id, qna_title);
			
			cnt = addMemberNotiDTO(msg, time, mem_id);
			
		// 모임이 신고되면 모임장에게 모임이 신고됨을 알림(모임장) - type(5)	
		} else if(type == 5) {
			
			// 모임장 아이디
			String mem_id = (String)map.get("mem_id");
			// 모임번호
			int group_num = (Integer)map.get("group_num");
			String msg = TextMessage.groupReportNotiMsg();
			
			cnt = addGroupLeaderNotiDTO(msg, time, mem_id, group_num);
			
		// 모임신고에 관리자가 처리내역을 업데이트 하면 모임을 신고한 회원에게 알림(회원) - type(6)	
		} else if(type == 6) {
			
			String mem_id = (String)map.get("mem_id");
			String group_name = (String)map.get("group_name");
			String msg = TextMessage.groupReportSolNotiMsg(mem_id, group_name);
			
			cnt = addMemberNotiDTO(msg, time, mem_id);
			
			
		// 일품
		// 모임후기의 좋아요 알림을 생성하는 메서드(모임후기의 제목, 좋아한 회원의 아이디, 모임번호)(모임장) - type(7)
		} else if(type == 7) {
			
			String from_id = (String)map.get("from_id");
			int group_num = (Integer)map.get("group_num");
			String post_title = (String)map.get("post_title");
			String mem_id = (String)map.get("mem_id");
			
			String msg = TextMessage.postLikeMsg(post_title, from_id);
			
			cnt = addGroupLeaderNotiDTO(msg, time, mem_id, group_num);
			
		// 모임후기에 달린 댓글 알림을 생성하는 메서드(모임후기의 제목, 댓글을 작성한 회원의 아이디, 모임번호)(모임장) - type(8)
		} else if(type == 8) {
			
			String from_id = (String)map.get("from_id");
			int group_num = (Integer)map.get("group_num");
			String post_title = (String)map.get("post_title");
			String mem_id = (String)map.get("mem_id");
			
			String msg = TextMessage.postReplyMsg(post_title, from_id);
			
			cnt = addGroupLeaderNotiDTO(msg, time, mem_id, group_num);
			
		// 대성
		// 모임이 폐지될 경우, 모임장과 모임원들에게 알림(회원) - type(9)
		} else if(type == 9) {
			
			List<String> memberList = (List<String>)map.get("memberList");
			String group_name = (String)map.get("group_name");
			
			for(String mem_id : memberList) {
				String msg = TextMessage.shutDownGroupMsg(mem_id, group_name);
				cnt = addMemberNotiDTO(msg, time, mem_id);
			}
			
		// 승우
		// 회원의 등급이 변화될 경우 알림(회원) - type(10)
		} else if(type == 10) {
			
			String mem_id = (String)map.get("mem_id");
			String group_name = (String)map.get("group_name");
			String msg = TextMessage.changeGroupPerMsg(mem_id, group_name);
			
			cnt = addMemberNotiDTO(msg, time, mem_id);
			
		// 모임에서 강제 탈퇴 당한 경우 알림(회원) - type(11)
		} else if(type == 11) {
			
			String mem_id = (String)map.get("mem_id");
			String group_name = (String)map.get("group_name");
			String msg = TextMessage.kickedNotiMsg(mem_id, group_name);
			
			cnt = addMemberNotiDTO(msg, time, mem_id);
			
		// 모임에서 가입이 승인된 경우 알림(회원) - type(12)
		} else if(type == 12) {
			
			String mem_id = (String)map.get("mem_id");
			String group_name = (String)map.get("group_name");
			String msg = TextMessage.acceptedGroupMsg(mem_id, group_name);
			
			cnt = addMemberNotiDTO(msg, time, mem_id);
			
		// 모임에서 가입이 거절된 경우 알림(회원) - type(13)	
		} else if(type == 13) {
			
			String mem_id = (String)map.get("mem_id");
			String group_name = (String)map.get("group_name");
			String msg = TextMessage.refusedGroupMsg(mem_id, group_name);
			
			cnt = addMemberNotiDTO(msg, time, mem_id);
			
		// 비모임원이 모임에 가입을 신청한 경우 알림(모임장) - type(14)
		} else if(type == 14) {
			
			int group_num = (Integer)map.get("group_num");
			String group_name = (String)map.get("group_name");
			String mem_id = (String)map.get("mem_id");
			
			String msg = TextMessage.applyJoinGroupMsg(mem_id, group_name);
			
			cnt = addGroupLeaderNotiDTO(msg, time, mem_id, group_num);
			
		} 
		if(cnt == 1) {
			System.out.println("알림 정상등록");
		} else {
			System.out.println("알림등록 실패");
		}
	}
	
	public int addMemberNotiDTO(String msg, long time, String mem_id) {
		MemberNotiDTO dto = new MemberNotiDTO();
		dto.setNoti_content(msg);
		dto.setNoti_date(new Date(time));
		dto.setIs_checked(Code.NotiNonChecked);
		dto.setMem_id(mem_id);
		return mainDao.addMemberNoti(dto);
	}
	
	public int addGroupLeaderNotiDTO(String msg, long time, String mem_id, int group_num) {
		GroupLeaderNotiDTO dto = new GroupLeaderNotiDTO();
		dto.setNoti_content(msg);
		dto.setNoti_date(new Date(time));
		dto.setIs_checked(Code.NotiNonChecked);
		dto.setMem_id(mem_id);
		dto.setGroup_num(group_num);
		return mainDao.addLeaderNoti(dto);
	}
	
	public int addSellerNotiDTO(String msg, long time, String seller_id) {
		SellerNotiDTO dto = new SellerNotiDTO();
		dto.setNoti_content(msg);
		dto.setNoti_date(new Date(time));
		dto.setIs_checked(Code.NotiNonChecked);
		dto.setSeller_id(seller_id);
		return mainDao.addSellerNoti(dto);
	}
	
}