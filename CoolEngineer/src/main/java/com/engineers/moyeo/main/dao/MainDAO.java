package com.engineers.moyeo.main.dao;

import java.util.List;
import java.util.Map;

import com.engineers.moyeo.main.dto.WordDTO;


public interface MainDAO {

	// 로그인시 아이디 체크
	public int idCheck(String mem_id);
	
	// 로그인시 비밀번호 체크
	public int pwdCheck(Map<String, String> map);
	
	// 로그인시 임시비밀번호 체크
	public int tempPwdCheck(Map<String, String> map);
	
	// 워드클라우드 단어가 이미 존재하는지 확인
	public int checkWordCloud(String word);
	
	// 워드클라우드 단어 모델을 가져옴
	public List<WordDTO> getWordCloudModel();
	
	// 분석된 워드 클라우드 단어를 추가
	public int addWordCloud(WordDTO dto);
	
	// 분석된 워드 클라우드 단어수 업데이트
	public int updateWordCloud(WordDTO dto);
	
	// 워드카운트 검색
	public List<WordDTO> searchWordcloud(Map<String, Object> map);
}
