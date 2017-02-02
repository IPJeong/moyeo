package com.engineers.moyeo.three.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.three.dto.EventDTO;
import com.engineers.moyeo.three.dto.ThreeDTO;

public interface ThreeDAO {
	
	public int getCount();  //카테고리 개수
	public int getCount2(); //FAQ 글 개수
	public int ctgCheck(ThreeDTO dto); //카테고리 중복 체크
	public int insert(ThreeDTO dto); //카테고리 입력
	public int insertFaq(ThreeDTO dto); //FAQ 입력	
	public int update(ThreeDTO dto); //카테고리 수정
	public void update2(ThreeDTO dto); //FAQ안 카테고리 수정
	public int updateFaq(ThreeDTO dto); //FAQ 수정
	public int delete(ThreeDTO dto); //카테고리 삭제
	public void delete2(ThreeDTO dto); //카테고리에 속하는 FAQ 삭제
	public int deleteFaq(ThreeDTO dto); //FAQ 삭제
	public ThreeDTO getInfo(int faqNum); //FAQ 수정폼에 보여지는 정보
	public ArrayList<ThreeDTO> getCategory(); //카테고리 리스트
	public ArrayList<ThreeDTO> getQuestions(); //FAQ 리스트
	
	public int eventInsert(EventDTO dto); //이벤트 등록
	public void eventImgInsert(EventDTO dto); //이벤트 썸네일 사진 등록
	public void eventImgsInsert(EventDTO dto); //이벤트 사진 등록
	public int getEventNum(Timestamp regDate); //이벤트 번호
	public int getEventCount(); //진행중인 이벤트 개수
	public ArrayList<EventDTO> getEventList(Map<String, Integer> map); //진행중인 이벤트 리스트
	public ArrayList<EventDTO> getEventPic(Map<String, Integer> map); //진행중인 이벤트 사진
	
	public int confirmId(Map<String, Object> map); //아이디 중복 체크

}
