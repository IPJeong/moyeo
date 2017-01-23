package com.engineers.moyeo.six.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.six.dto.NoticeDTO;

@Repository
public class SixDAOImpl implements SixDAO{


	@Autowired
	private SqlSession sqlSession;

	DataSource dataSource;	// 커넥션 객체를 보관

	//공지-글개수 구하기
	@Override
	public int getCount() {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.getCount();	
		System.out.println(cnt);

		return cnt;
	}

	//공지-게시글리스트 불러오기
	@Override
	public ArrayList<NoticeDTO> getArticles(Map<String, Integer> daoMap) {
		ArrayList<NoticeDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.getArticles(daoMap);

		return dtos;
	}

	//공지-게시글리스트(메인용)
	public ArrayList<NoticeDTO> getArticles_main(){
		ArrayList<NoticeDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.getArticles_main();

		return dtos;
	}

	//공지-상세글정보
	@Override
	public NoticeDTO getArticle(int num) {
		NoticeDTO dto = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dto = dao.getArticle(num);

		return dto;
	}

	//공지-조회수 증가
	@Override
	public void addReadCnt(int num) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dao.addReadCnt(num);
	}

	//공지-글작성
	@Override
	public int insert(NoticeDTO dto) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.insert(dto);

		return cnt;
	}

	//공지-글수정
	@Override
	public int update(NoticeDTO dto) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.update(dto);

		return cnt;
	}

	//공지-글삭제
	@Override
	public int delete(int num) {
		int cnt = 0;

		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.delete(num);

		return cnt;
	}
}
