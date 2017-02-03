package com.engineers.moyeo.four.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.four.dto.GreetingBoardDTO;
import com.engineers.moyeo.four.dto.GreetingReplyDTO;
import com.engineers.moyeo.four.dto.GroupNoticeDTO;
import com.engineers.moyeo.four.dto.like_greetingDTO;
import com.engineers.moyeo.four.dto.post_picturesDTO;

@Repository
public class FourDAOImpl implements FourDAO{

	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 而ㅻ꽖�뀡 媛앹껜瑜� 蹂닿�

	//공지사항 글 개수 세기
	@Override
	public int getCount(int group_num) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.getCount(group_num);
		
		return cnt;
	}
	//공지사항 글 목록 보여주기
	@Override
	public ArrayList<GroupNoticeDTO> getArticles(Map<String, Integer> daoMap) {
		ArrayList<GroupNoticeDTO> dtos = null;
		
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		dtos = dao.getArticles(daoMap);
		
		return dtos;
	}

	//공지사항 글쓰기
	@Override
	public int insert(GroupNoticeDTO dto) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.insert(dto);
		return cnt;
	}
	
	//공지사항 글 상세조회 content
	@Override
	public GroupNoticeDTO getArticle(int group_noti_num) {
		
		GroupNoticeDTO dto = null;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		dto = dao.getArticle(group_noti_num);
		return dto;
	}
	
	//공지사항 글 조회수 올리기
	@Override
	public void addReadCnt(int group_noti_num) {
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		
		dao.addReadCnt(group_noti_num);
		
	}
	//공지사랑 글수정
	@Override
	public int update(GroupNoticeDTO dto) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.update(dto);
		return cnt;
	}
	
	//공지사랑 글삭제
	@Override
	public int delete(int num) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.delete(num);
		return cnt;
	}
	//가입인사 글 세기
	@Override
	public int greetingGetCount(int group_num) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.greetingGetCount(group_num);
		return cnt;
	}
	//가입인사 글 목록보여주기
	@Override
	public ArrayList<GreetingBoardDTO> greetingGetArticles(Map<String, Integer> daoMap) {
		ArrayList<GreetingBoardDTO> dtos = null;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		dtos = dao.greetingGetArticles(daoMap);
		return dtos;
	}
	
	@Override
	public int greetingInsert(GreetingBoardDTO dto) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.greetingInsert(dto);
		return cnt;
	}
	
	@Override
	public GreetingBoardDTO greetingGetArticle(int greeting_num) {
		GreetingBoardDTO dto = null;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		dto = dao.greetingGetArticle(greeting_num);
		return dto;
	}
	

	@Override
	public void greetingAddReadCnt(int num) {
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		dao.greetingAddReadCnt(num);
	}
	
	@Override
	public int greetingUpdate(GreetingBoardDTO dto) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.greetingUpdate(dto);
		return cnt;
	}
	@Override
	public int greetingDelete(int num) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.greetingDelete(num);
		return cnt;
	}
	@Override
	public int repleInsert(GreetingReplyDTO dto) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.repleInsert(dto);
		return cnt;

		
	}
	@Override
	public ArrayList<GreetingReplyDTO> replegGetArticles(int greeting_num) {
		ArrayList<GreetingReplyDTO> dtos = null;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		dtos = dao.replegGetArticles(greeting_num);
		return dtos;
	}
	@Override
	public int repledelete(int num) {
		int cnt = 0;
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		cnt = dao.repledelete(num);
		return cnt;
	}
	@Override
	public int getRepleyCnt(int num) {
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		return dao.getRepleyCnt(num);
	}
	/*@Override
	public int pictureGetCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public ArrayList<post_picturesDTO> pictureGetArticles(Map<String, Integer> daoMap) {
		// TODO Auto-generated method stub
		return null;
	}*/
	
	@Override
	public void likecacount(int num) {
		
		FourDAO dao = this.sqlSession.getMapper(FourDAO.class);
		dao.likecacount(num);
		
	}
	
}
