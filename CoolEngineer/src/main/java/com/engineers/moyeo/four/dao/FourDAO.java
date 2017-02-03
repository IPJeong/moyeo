package com.engineers.moyeo.four.dao;

import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.four.dto.GreetingBoardDTO;
import com.engineers.moyeo.four.dto.GreetingReplyDTO;
import com.engineers.moyeo.four.dto.GroupNoticeDTO;
import com.engineers.moyeo.four.dto.like_greetingDTO;
import com.engineers.moyeo.four.dto.post_picturesDTO;

public interface FourDAO {
	
	public int getCount(int group_num);
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
	public int greetingGetCount(int group_num);
	
	public ArrayList<GreetingBoardDTO> greetingGetArticles(Map<String, Integer> daoMap);
	
	public int greetingInsert(GreetingBoardDTO dto);
	
	public GreetingBoardDTO greetingGetArticle(int num);
	
	public void greetingAddReadCnt(int num);
	
	public int greetingUpdate(GreetingBoardDTO dto);
	
	public int greetingDelete(int num);
	
	
	
	
	
	//가입인사 댓글
	
	public int repleInsert(GreetingReplyDTO dto);
	
	public ArrayList<GreetingReplyDTO> replegGetArticles(int num);
	
	public int repledelete(int num);
	// 댓글개수 카운트
	public int getRepleyCnt(int num);
	
	
	//좋아요 
	public void likecacount(int num);
	
	//사진첩 
	/*public int pictureGetCount(); //글개수 세기
	
	public ArrayList<post_picturesDTO> pictureGetArticles(Map<String, Integer> daoMap);
	*/
	
}
