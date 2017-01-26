package com.engineers.moyeo.one.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.engineers.moyeo.one.dto.QnaReplyDTO;

@Repository
public class OneDAOImpl implements OneDAO{

	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 커넥션 객체를 보관

	// 글개수 구하기
	@Override
	public int getCount() {
		int cnt = 0;
		
		// 인터페이스명 dao = this.sqlSession.getMapper("인터페이스명.class");
		// dao.id명
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getCount();
		return cnt;
	}

	// 게시글 목록조회
	@Override
	public ArrayList<QnaBoardDTO> getArticles(Map<String, Integer> daoMap) {
		ArrayList<QnaBoardDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getArticles(daoMap);
		return dtos;
	}

	@Override
	public int insert(QnaBoardDTO dto) {
		
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.insert(dto);
		
		return count;
	}

	@Override
	public QnaBoardDTO getArticle(int qboard_num) {
		QnaBoardDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getArticle(qboard_num);
		
		return dto;
	}
	
	@Override
	public void addReadCnt(int qboard_num) {
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dao.addReadCnt(qboard_num);
	}

	@Override
	public int update(QnaBoardDTO dto) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.update(dto);
		
		return cnt;
	}

	@Override
	public int delete(int qboard_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.delete(qboard_num);
		
		return cnt;
	}
	
	@Override
	public int deleteRe(int qboard_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.deleteRe(qboard_num);
		
		return cnt;
	}
	
	@Override
	public int deleteAnws(int reply_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt= dao.deleteAnws(reply_num);
		
		return cnt;
	}

	@Override
	public int insertReply(QnaReplyDTO dto) {
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.insertReply(dto);
		
		return count;
	}

	@Override
	public List<QnaReplyDTO> getReArticle(int qboard_num) {
		
		List<QnaReplyDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getReArticle(qboard_num);
		
		return dtos;
	}

	@Override
	public int updateStatus(QnaBoardDTO dto) {
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.updateStatus(dto);
		
		return count;
	}

	@Override
	public QnaReplyDTO getArtReply(int qboard_num) {
		QnaReplyDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getArtReply(qboard_num);
		
		return dto;
	}


}
