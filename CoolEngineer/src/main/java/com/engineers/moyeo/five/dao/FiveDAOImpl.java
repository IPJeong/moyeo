package com.engineers.moyeo.five.dao;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.five.dto.MeetingPostDTO;

@Repository
public class FiveDAOImpl implements FiveDAO{

	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 커넥션 객체를 보관

	
	@Override
	public int insertPost(MeetingPostDTO dto) {
		
		
		
		return 0;
	}
	
}
