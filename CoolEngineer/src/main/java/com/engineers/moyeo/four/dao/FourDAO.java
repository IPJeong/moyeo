package com.engineers.moyeo.four.dao;

import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.four.dto.GreetingBoardDTO;
import com.engineers.moyeo.four.dto.GroupNoticeDTO;

public interface FourDAO {
	
	//글개수
	public int getCount();
	//글라인 목록
	public ArrayList<GroupNoticeDTO> getArticles(Map<String, Integer> daoMap);
	
	//글쓰기 writePro
	public int insert(GroupNoticeDTO dto);
	
	//글 상세조회 content
	public GroupNoticeDTO getArticle(int num);
	
	//글 조회수 올리기
	public void addReadCnt(int num);
	
	//글수정
	public int update(GroupNoticeDTO dto);
	
	//글삭제
	public int delete(int num);
	
	
	
	//가입인사 게시판
	public int greetingGetCount();
	
	public ArrayList<GreetingBoardDTO> greetingGetArticles(Map<String, Integer> daoMap);
	
	public int greetingInsert(GreetingBoardDTO dto);
	
	public int greetingUpdate(GreetingBoardDTO dto);
	
	public int greetingDelete(int num);
	
}
