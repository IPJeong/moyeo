package com.engineers.moyeo.six.dao;

import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.six.dto.NoticeDTO;


public interface SixDAO {

	//공지-글개수 구하기
	public int getCount(); 
	
	//공지-게시글리스트 불러오기
	public ArrayList<NoticeDTO> getArticles(Map<String, Integer> daoMap); 
	
	//공지-게시글리스트(메인용)
	public ArrayList<NoticeDTO> getArticles_main();
	
	//공지-상세글정보
	public NoticeDTO getArticle(int num); 
	
	//공지-조회수 증가
	public void addReadCnt(int intNum); 
	
	//공지-글작성
	public int insert(NoticeDTO dto);
	
	//공지-글수정
	public int update(NoticeDTO dto);
	
	//공지-글삭제
	public int delete(int num);
}
