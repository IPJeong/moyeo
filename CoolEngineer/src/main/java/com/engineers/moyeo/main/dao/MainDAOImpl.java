package com.engineers.moyeo.main.dao;

import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MainDAOImpl implements MainDAO{

	
	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 커넥션 객체를 보관
	
	//중복확인 체크
	@Override
 	public int idCheck(String mem_id) {
		int cnt = 0;
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		cnt = dao.idCheck(mem_id);
		return cnt;
	}

	@Override
	public int pwdCheck(Map<String, String> map) {
		int cnt = 0;
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		
		String mem_id = map.get("mem_id");
		
		int idCheck = dao.idCheck(mem_id);
		
		if (idCheck == 1) { //로그인한 id와 일치하면 idCheck가 1
			
			int pwdCheck = dao.pwdCheck(map);
			
			if(pwdCheck == 1) { //아이디와 패스워드가 일치하면 cnt = 1;
				cnt = 1;
			} else { //아이디는 일치하지만 패스워드가 일치하지 않으면 cnt = -1;
				cnt = -1;
			}	
				
		} else { //로그인한 id와 일치하지 않으면 cnt = 0;
			cnt = 0;
		}
		
		return cnt;
	}
}
