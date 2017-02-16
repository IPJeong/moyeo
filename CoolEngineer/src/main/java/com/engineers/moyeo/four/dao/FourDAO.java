package com.engineers.moyeo.four.dao;

import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.four.dto.GreetingBoardDTO;
import com.engineers.moyeo.four.dto.GreetingReplyDTO;
import com.engineers.moyeo.four.dto.GroupNoticeDTO;
import com.engineers.moyeo.four.dto.productInfoDTO;
import com.engineers.moyeo.four.dto.productPicDTO;



public interface FourDAO {
	//공지사항 글 세는 메소드
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
	//가입인사 글 불러오는 메소드
	public ArrayList<GreetingBoardDTO> greetingGetArticles(Map<String, Integer> daoMap);
	//가입인사 글 등록하는 메소드
	public int greetingInsert(GreetingBoardDTO dto);
	//가입인사 글내용 불러오는 메소드
	public GreetingBoardDTO greetingGetArticle(int num);
	//가입인사 조회수 증가
	public void greetingAddReadCnt(int num);
	//가입인사 글 수정
	public int greetingUpdate(GreetingBoardDTO dto);
	//가입인사 글 삭제
	public int greetingDelete(int num);
	
	
	//가입인사 댓글 등록
	public int repleInsert(GreetingReplyDTO dto);
	//가입인사 댓글 불러오는 메소드
	public ArrayList<GreetingReplyDTO> replegGetArticles(int num);
	//가입인사 댓글 삭제하는 메소드
	public int repledelete(int num);
	//가입인사 댓글 세는 메소드
	public int getRepleyCnt(int num);
	
	
	
	//좋아요를 눌렀는지 확인
	public int checkGreetingLike(Map<String, Object> daoMap);
	
	//좋아요 추가하는 메소드 
	public void likecacount(int greeting_num);
	
	//좋아요 새롭게 추가하는 메소드
	public int likeInsert(Map<String, Object> daoMap);
	
	//샵 게시판 페이징
	public int shopGetCount();
	
	//제품 등록
	public int productInsert(productInfoDTO dto);
	
	//제품 조회
	public ArrayList<productInfoDTO> productArticles(Map<String, Integer> daoMap);
	
	//제품 번호 조회
	public int getProductNum();
	
	//제품 사진 등록
	public int productPictureInsert(productPicDTO dto);
	
	//알림
	public Map<String, String>alrim(int greeting_num);
	
	
}
