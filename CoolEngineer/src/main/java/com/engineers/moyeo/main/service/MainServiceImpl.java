package com.engineers.moyeo.main.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.engineers.moyeo.main.dao.MainDAO;
import com.engineers.moyeo.main.dto.WordDTO;
import com.engineers.moyeo.main.twitterKoreanParser.KoreanParser;
import com.engineers.moyeo.six.dao.SixDAO;
import com.engineers.moyeo.six.dto.NoticeDTO;

@org.springframework.stereotype.Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDAO mainDao;

	@Autowired
	SixDAO sixDao;
	
	// 워드클라우드 모델 객체
//	private static WordModel wordModel;
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
		
		req.setAttribute("wordDtos", wordDtos);
		
		if(cnt > 0) {
			ArrayList<NoticeDTO> dtos = sixDao.getArticles_main();
			req.setAttribute("dtos", dtos);
			req.setAttribute("pageNum", 1);
		}
		
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
			req.getSession().invalidate();
			req.getSession().setAttribute("mem_id", mem_id);
			model.addAttribute("cnt", cnt);
//			model.addAttribute("beforeurl", beforeurl);
			return "main/memberLoginPro";
		} else {
			model.addAttribute("cnt", cnt);
			return "main/memberLoginPro";	
		}
	}
	
	// 단어 형태소 분석을 처리하는 메서드
	@Override
	public void wordAnalyzer(String title, String content, String tag) {
		StringBuilder sb = new StringBuilder(title);
		if(content != null) {
			sb.append(" " + content);
		}
		if(tag != null) {
			String[] tags = tag.split(",");
			for(String ta : tags) {
				ta = "#"+ta.replaceAll(" ", "");
				sb.append(ta);
			}
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
	public String wordcloudRefresh(HttpServletRequest req) {
		
		String strDate = req.getParameter("strDate");
		String endDate = req.getParameter("endDate");
		String[] wordOps = req.getParameterValues("wordOps");
		
		Map<String, Object> map = new HashMap<>();
		System.out.println("strDate : " + strDate + ", endDate : " + endDate);
		if(strDate != null && endDate != null){
			if(!strDate.equals("")) {
				strDate = strDate + " 00:00:01.000000";
				endDate = endDate + " 23:59:59.000000";
				Timestamp stp = Timestamp.valueOf(strDate);
				Timestamp etp = Timestamp.valueOf(endDate);
				map.put("strDate", stp);
				map.put("endDate", etp);
			}
		}
		
		int type = 0;
		
		if(wordOps != null) {
			List<String> list = Arrays.asList(wordOps);
			if(list.contains("Noun") && list.contains("Verb") && list.contains("Hashtag")){
				type = 6;
				System.out.println("명사, 동사, 해시태그 검색요청");
			} else if(list.contains("Noun") && list.contains("Verb")) {
				type = 4;
				System.out.println("명사, 동사 검색요청");
			} else if(list.contains("Noun") && list.contains("Hashtag")) {
				type = 7;
				System.out.println("명사, 해시태그 검색요청");
			} else if(list.contains("Hashtag") && list.contains("Verb")) {
				type = 5;
				System.out.println("해시태그, 동사 검색요청");
			} else if(list.contains("Noun")) {
				type = 1;
				System.out.println("명사 검색요청");
			} else if(list.contains("Verb")) {
				type = 2;
				System.out.println("동사 검색요청");
			} else if(list.contains("Hashtag")) {
				type = 3;
				System.out.println("해시태그 검색요청");
			}
		} else {
			type = 6;
			System.out.println("명사, 동사, 해시태그 전체검색 요청");
		}
		
		map.put("type", type);
		
		List<WordDTO> words = mainDao.searchWordcloud(map);
		
		for(WordDTO dt : words) {
			System.out.println(dt.toString());
		}
		
		return "redirect:/main/home";
	}
}