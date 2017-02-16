package com.engineers.moyeo.three.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.three.dto.EventDTO;
import com.engineers.moyeo.three.dto.JoinRequestDTO;
import com.engineers.moyeo.three.dto.MemberDTO;
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
	public int eventParticipantsCount(int event_Num); //이벤트 참여자 명수
	public ArrayList<EventDTO> getEvePartList(int event_num); //이벤트 참여자 명단
	public EventDTO getEveInfo(int event_num);// 이벤트 정보 가져오기
	public int winInsert(Map<String, Object> map); //이벤트 마감
	public int getWinNum(int event_num); //당첨번호 가져오기
	public void winnerInsert(Map<String, Object> map); //당첨자 입력
	public void eventParticipantsDelete(int event_num); //참여자 리스트에서 삭제
	public void eventDone(int event_num); //이벤트 진행상황 바꾸기
	public void winNoti(Map<String, Object> map); //이벤트 종료 알림
	public int getWinCount(); //당첨 리스트 개수
	public ArrayList<EventDTO> getWinList(Map<String, Integer> map); //당첨 리스트 가져오기
	public ArrayList<EventDTO> getDoneEventList(Map<String, Integer> map);//끝난 이벤트 정보
	public int getWinnerCount(int winning_num); //이벤트 당첨자 수
	public ArrayList<EventDTO> getWinnerList(int winning_num); //이벤트 당첨자 
	
	public int confirmId(Map<String, Object> map); //아이디 중복 체크
	public int memInfoInsert(MemberDTO dto); //회원가입	
	public void proImgInsert(MemberDTO dto); //프로필사진 넣기
	public int placeInsert(Map<String, Object> map); //관심지역 넣기
	public int cateInsert(Map<String, Object> map);//관심사 넣기
	public MemberDTO getMyInfo(Map<String, Object> map);//마이페이지
	public int getGroupCnt(String memid);//가입한 모임 개수
	public ArrayList<MoimOpenDTO> getGroupList(Map<String, Object> map); //가입한 모임 리스트
	public int confirmPw(Map<String, Object> map); //현 비밀번호 체크
	public int changePw(Map<String, Object> map); //비밀번호 변경
	public int changeMyInfo(Map<String, Object> map);//내정보 수정
	public int deleteMem(String mem_id); //회원탈퇴
	public String getEmail(String mem_id); //이메일 가져오기
	public int tempIdChk(String mem_id); //임시번호 아이디 체크
	public int tempInsert(Map<String, Object> map); //임시번호 저장
	public int tempUpdate(Map<String, Object> map); //임시번호 변경
	public int tempDelete(String mem_id); //임시번호 삭제
	public int getNotiCount(String mem_id); //알림메세지 개수
	public ArrayList<MemberDTO> getNotiList(Map<String, Object> map); //알림메세지
	public int getNoneChkNoti(String mem_id); //확인안한 알림개수
	public void chkNoti(String mem_id);//알림 확인
	public int getInterGroupCnt(String mem_id); //관심모임 개수
	public int getApplHistoryCnt(String mem_id); // 가입신청 이력 개수
	public List<MoimOpenDTO> getInterGroup(String mem_id); //관심모임 가져오기
	public List<JoinRequestDTO> getApplHistory(String mem_id); // 가입신청 이력 가져오기

}
