package com.engineers.moyeo.main.dao;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.main.dto.MemberInfoDTO;

@Repository
public class MainDAOImpl implements MainDAO{

	
	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 커넥션 객체를 보관

	@Override
	public int insertTest(MemberInfoDTO dto) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		int cnt = dao.insertTest(dto);
		return cnt;
	}
}
