package com.engineers.moyeo.three.dao;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.three.dto.ThreeDTO;

@Repository
public class ThreeDAOImpl implements ThreeDAO{

	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 커넥션 객체를 보관

	@Override
	public int getCount() { //카테고리 개수
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getCount");
		return cnt;
	}

	@Override
	public int getCount2() { //FAQ 질문 개수
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getCount2");
		return cnt;
	}

	@Override
	public ArrayList<ThreeDTO> getCategory() {
		ArrayList<ThreeDTO> dtos = null;
		dtos = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getCategory");
		return dtos;
	}

	@Override
	public ArrayList<ThreeDTO> getQuestions() {
		// TODO Auto-generated method stub
		return null;
	}
}
