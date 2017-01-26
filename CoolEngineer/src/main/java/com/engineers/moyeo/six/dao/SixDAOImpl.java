package com.engineers.moyeo.six.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.six.dto.MoimScheduleDTO;
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

	
	
	
	
	//모임일정-일정개수 구하기
	public int moimScheduleCount() {
		
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimScheduleCount();
	
		return cnt;	
	}
	
	//모임일정-메인에 일정 리스트 불러오기
	public ArrayList<MoimScheduleDTO> moimSchedule() {
		ArrayList<MoimScheduleDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.moimSchedule();
		
		return dtos;
	}
	
	//모임일정-일정 리스트
	public ArrayList<MoimScheduleDTO> moimScheduleDetail(Map<String, Integer> daoMap) {
		ArrayList<MoimScheduleDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.moimScheduleDetail(daoMap);
		
		return dtos;
	}
	
	//모임일정-상세정보
	public MoimScheduleDTO moimScheduleContents(int num) {
		MoimScheduleDTO dto = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dto = dao.moimScheduleContents(num);
		
		return dto;
	}

	//모임일정-등록
	@Override
	public int moimRegister(MoimScheduleDTO dto) {
		int cnt = 0;
		
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimRegister(dto);
		
		return cnt;
	}

	//모임일정-수정
	@Override
	public int moimScheduleModify(MoimScheduleDTO dto) {
		int cnt = 0;
		
	
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimScheduleModify(dto);
		
		return cnt;
	}
	
	//모임일정-삭제
	@Override
	public int moimScheduleDelete(int num) {
		int cnt = 0;
		
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimScheduleDelete(num);
		
		return cnt;
	}






}
