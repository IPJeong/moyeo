package com.engineers.moyeo.six.dao;

import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.six.dto.MoimScheduleDTO;
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
	
	
	
	//모임일정-일정 개수 구하기
	public int moimScheduleCount();
	
	//모일일정-메인에 일정리스트 불러오기
	public ArrayList<MoimScheduleDTO> moimSchedule();
	
	//모임일정-일정 리스트 
	public ArrayList<MoimScheduleDTO> moimScheduleDetail(Map<String, Integer> daoMap);
	
	//모임일정-상세정보
	public MoimScheduleDTO moimScheduleContents(int num);
	
	//모임일정-등록
	public int moimRegister(MoimScheduleDTO dto);
	
	//모임일정-수정
	public int moimScheduleModify(MoimScheduleDTO dto);
	
	//모임일정-삭제
	public int moimScheduleDelete(int num);
}
