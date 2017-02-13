package com.engineers.moyeo.main.service;

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

import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.main.dao.MainDAO;
import com.engineers.moyeo.main.dto.MainPicDTO;
import com.engineers.moyeo.main.dto.MainVideoDTO;
import com.engineers.moyeo.main.dto.WordDTO;
import com.engineers.moyeo.main.twitterKoreanParser.KoreanParser;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.HotMoimDTO;
import com.engineers.moyeo.six.dto.InterestCatDTO;
import com.engineers.moyeo.six.dto.InterestLocationDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.NoticeDTO;
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
	
	// 워드클라우드 리스트
	private static List<WordDTO> wordDtos;
	

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
		
		List<MainPicDTO> picDtos = mainDao.getMainPictures();
		
		List<MainVideoDTO> videoDtos = mainDao.getMainVideos();
		
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
			resultMsg += "<li><a href='#' target='_blank'>" + dto.getWord() + "</a></li>";
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
		
		if(lcnt > 0) {
			ArrayList<Place_likeDTO> lpodtos = twoDao.getPlaceLikeList();
			System.out.println("lpdtos : " + lpodtos.size());
			model.addAttribute("lpodtos", lpodtos);
		}
		
		model.addAttribute("lcnt", lcnt);
		System.out.println("lcnt : "+lcnt);
	}

}