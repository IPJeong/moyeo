package com.engineers.moyeo.main.service;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;

import com.engineers.moyeo.main.dao.MainDAO;
import com.engineers.moyeo.main.dto.MemberInfoDTO;

@org.springframework.stereotype.Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDAO mainDao;
	
	// 메인페이지가 로딩될 때 각종 정보를 읽어오는 메서드
	@Override
	public void main() {
		
		MemberInfoDTO dto = new MemberInfoDTO();
		dto.setMem_id("id");
		dto.setPasswd("123");
		dto.setName("양우진");
		dto.setAddress("서울시");
		dto.setTel("010-0000-0000");
		dto.setBirth(new Timestamp(System.currentTimeMillis()));
		dto.setEmail("woo@naver.com");
		
		/*int cnt = mainDao.insertTest(dto);*/
		/*System.out.println("ServiceImpl 입력 결과값 : " + cnt);*/
		
	}
}
