package com.engineers.moyeo.three.dao;

import java.util.ArrayList;

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

}
