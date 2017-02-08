package com.engineers.moyeo.three.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.three.dto.EventDTO;
import com.engineers.moyeo.three.dto.MemberDTO;
import com.engineers.moyeo.three.dto.MygroupDTO;
import com.engineers.moyeo.three.dto.ThreeDTO;

public interface ThreeDAO {
	
	public int getCount();  //카테고리 개수
	public int getCount2(); //FAQ 글 개수
	public int ctgCheck(ThreeDTO dto); //카테고리 중복 체크
	public int insert(ThreeDTO dto); //카테고리 입력
	public int insertFaq(ThreeDTO dto); //FAQ 입력	
	public int update(ThreeDTO dto); //카테고리 수정
	public void update2(ThreeDTO dto); //FAQ안 카테고리 수정
	public int updateFaq(ThreeDTO dto); //FAQ 수정
	public int delete(ThreeDTO dto); //카테고리 삭제
	public void delete2(ThreeDTO dto); //카테고리에 속하는 FAQ 삭제
	public int deleteFaq(ThreeDTO dto); //FAQ 삭제
	public ThreeDTO getInfo(int faqNum); //FAQ 수정폼에 보여지는 정보
	public ArrayList<ThreeDTO> getCategory(); //카테고리 리스트
	public ArrayList<ThreeDTO> getQuestions(); //FAQ 리스트
	
	public int eventInsert(EventDTO dto); //이벤트 등록
	public void eventImgInsert(EventDTO dto); //이벤트 썸네일 사진 등록
	public void eventImgsInsert(EventDTO dto); //이벤트 사진 등록
	public int getEventNum(Timestamp regDate); //이벤트 번호
	public int getEventCount(); //진행중인 이벤트 개수
	public ArrayList<EventDTO> getEventList(Map<String, Integer> map); //진행중인 이벤트 리스트
	public ArrayList<EventDTO> getEventPic(Map<String, Integer> map); //진행중인 이벤트 사진
	public int eveChk(Map<String, Object> map); //이벤트 참여여부
	public int eveParticipate(Map<String, Object> map); //이벤트 참여
	
	public int confirmId(Map<String, Object> map); //아이디 중복 체크
	public int memInfoInsert(MemberDTO dto); //회원가입	
	public void proImgInsert(MemberDTO dto); //프로필사진 넣기
	public int placeInsert(Map<String, Object> map); //관심지역 넣기
	public int cateInsert(Map<String, Object> map);//관심사 넣기
	public MemberDTO getMyInfo(Map<String, Object> map);//마이페이지
	public int getGroupCnt(String memid);//가입한 모임 개수
	public ArrayList<MygroupDTO> getGroupList(Map<String, Object> map); //가입한 모임 리스트
	public int confirmPw(Map<String, Object> map); //현 비밀번호 체크
	public int changePw(Map<String, Object> map); //비밀번호 변경
	public int changeMyInfo(Map<String, Object> map);//내정보 수정
	

}
