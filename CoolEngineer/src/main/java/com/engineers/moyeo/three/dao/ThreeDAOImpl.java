package com.engineers.moyeo.three.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.three.dto.EventDTO;
import com.engineers.moyeo.three.dto.JoinRequestDTO;
import com.engineers.moyeo.three.dto.MemberDTO;
import com.engineers.moyeo.three.dto.ThreeDTO;

@Repository
public class ThreeDAOImpl implements ThreeDAO{

	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 커넥션 객체를 보관
	
	//카테고리 개수
	@Override
	public int getCount() { 
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getCount");
		return cnt;
	}
	
	//FAQ 질문 개수
	@Override
	public int getCount2() { 
		int cnt2 = 0;
		cnt2 = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getCount2");
		return cnt2;
	}
	
	//FAQ카테고리 가져오기
	@Override
	public ArrayList<ThreeDTO> getCategory() {
		ArrayList<ThreeDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getCategory();
		return dtos;
	}
	
	//FAQ가져오기
	@Override
	public ArrayList<ThreeDTO> getQuestions() {		
		ArrayList<ThreeDTO> dtos2 = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos2 = dao.getQuestions();
		return dtos2;
	}
	
	//FAQ카테고리 입력
	@Override
	public int insert(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.insert", dto);
		return cnt;
	}
	
	//FAQ 입력
	@Override
	public int insertFaq(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.insertFaq", dto);
		return cnt;
	}
	
	//FAQ카테고리 수정 처리
	@Override
	public int update(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.update", dto);
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dao.update2(dto);
		return cnt;
	}
	
	//FAQ수정하기
	@Override
	public void update2(ThreeDTO dto) {
		this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.update2", dto);		
	}
	
	//FAQ수정하기
	@Override
	public int updateFaq(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.updateFaq", dto);
		return cnt;
	}

	//FAQ값 가져오기
	@Override
	public ThreeDTO getInfo(int faqNum) {
		ThreeDTO dto = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getInfo", faqNum);
		return dto;
	}
	
	//FAQ 카테고리 삭제
	@Override
	public int delete(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.delete("com.engineers.moyeo.three.dao.ThreeDAO.delete", dto);
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dao.delete2(dto);
		return cnt;
	}
	
	//FAQ 카테고리와 관련된 FAQ삭제 
	@Override
	public void delete2(ThreeDTO dto) {
		this.sqlSession.delete("com.engineers.moyeo.three.dao.ThreeDAO.delete2", dto);		
	}
	
	//FAQ삭제하기
	@Override
	public int deleteFaq(ThreeDTO dto) {		
		int cnt = 0;
		cnt = this.sqlSession.delete("com.engineers.moyeo.three.dao.ThreeDAO.deleteFaq", dto);		
		return cnt;
	}
	
	//FAQ카테고리 중복 확인
	@Override
	public int ctgCheck(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.ctgCheck", dto);
		return cnt;
	}

	//이벤트 등록
	@Override
	public int eventInsert(EventDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.eventInsert", dto);
		return cnt;
	}
	
	//이벤트 번호
	@Override
	public int getEventNum(Timestamp regDate) {
		int eNum = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getEventNum", regDate);
		return eNum;
	}

	//이벤트 썸네일 사진 등록
	@Override
	public void eventImgInsert(EventDTO dto) {
		this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.eventImgInsert", dto);
		
	}

	//이벤트 사진 등록
	@Override
	public void eventImgsInsert(EventDTO dto) {
		this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.eventImgsInsert", dto);
		
	}

	//진행중인 이벤트 개수
	@Override
	public int getEventCount() {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getEventCount");
		return cnt;
	}

	//진행중인 이벤트 리스트
	@Override
	public ArrayList<EventDTO> getEventList(Map<String, Integer> map) {
		ArrayList<EventDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getEventList(map);			
		return dtos;
	}

	//진행중인 이벤트 사진
	@Override
	public ArrayList<EventDTO> getEventPic(Map<String, Integer> map) {
		ArrayList<EventDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getEventPic(map);		
		return dtos;
	}

	//아이디 중복 체크
	@Override
	public int confirmId(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.confirmId", map);
		return cnt;
	}

	//회원가입
	@Override
	public int memInfoInsert(MemberDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.memInfoInsert", dto);
		return cnt;
	}

	//프로필사진 넣기
	@Override
	public void proImgInsert(MemberDTO dto) {
		this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.proImgInsert", dto);
		
	}

	//관심지역 넣기
	@Override
	public int placeInsert(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.placeInsert", map);
		return cnt;
	}

	//관심사 넣기
	@Override
	public int cateInsert(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.cateInsert", map);
		return cnt;
	}
	
	//이벤트 참여 여부
	@Override
	public int eveChk(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.eveChk", map);
		return cnt;
	}
	
	//이벤트 참여
	@Override
	public int eveParticipate(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.eveParticipate", map);
		return cnt;
	}
	
	//마이페이지
	@Override
	public MemberDTO getMyInfo(Map<String, Object> map) {
		MemberDTO dto = null;
		dto = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getMyInfo", map);
		return dto;
	}
	
	//가입한 모임 개수
	@Override
	public int getGroupCnt(String memid) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getGroupCnt", memid);
		return cnt;
	}
	
	//가입한 모임 리스트
	@Override
	public ArrayList<MoimOpenDTO> getGroupList(Map<String, Object> map) {
		ArrayList<MoimOpenDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getGroupList(map);		
		return dtos;
	}
	
	//현 비밀번호 체크
	@Override
	public int confirmPw(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.confirmPw", map);
		return cnt;
	}
	
	//비밀번호 변경
	@Override
	public int changePw(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.changePw", map);
		return cnt;
	}
	
	//내 정보 변경
	@Override
	public int changeMyInfo(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.changeMyInfo", map);
		return cnt;
	}
	
	//회원탈퇴
	@Override
	public int deleteMem(String mem_id) {
		System.out.println(mem_id + "2");
		int cnt = 0;
		cnt = this.sqlSession.delete("com.engineers.moyeo.three.dao.ThreeDAO.deleteMem", mem_id);
		return cnt;
	}
	
	//이메일 가져오기
	@Override
	public String getEmail(String mem_id) {
		String email = "";
		email = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getEmail", mem_id);
		return email;
	}
	
	//임시번호 아이디 체크
	@Override
	public int tempIdChk(String mem_id) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.tempIdChk", mem_id);
		return cnt;
	}
	
	//임시번호 입력
	@Override
	public int tempInsert(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.tempInsert", map);
		return cnt;
	}
	
	//임시번호 수정
	@Override
	public int tempUpdate(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.tempUpdate", map);
		return cnt;
	}
	
	//임시번호 삭제
	@Override
	public int tempDelete(String mem_id) {
		int cnt = 0;
		cnt = this.sqlSession.delete("com.engineers.moyeo.three.dao.ThreeDAO.tempDelete", mem_id);
		return cnt;
	}
	
	//이벤트 참여자 수
	@Override
	public int eventParticipantsCount(int event_Num) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.eventParticipantsCount", event_Num);
		return cnt;
	}
	
	//이벤트 참여자 명단
	@Override
	public ArrayList<EventDTO> getEvePartList(int event_num) {
		ArrayList<EventDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getEvePartList(event_num);		
		return dtos;
	}

	//이벤트 정보 가져오기
	@Override
	public EventDTO getEveInfo(int event_num) {
		EventDTO dto = null;
		dto = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getEveInfo", event_num);
		return dto;
	}

	//이벤트 마감
	@Override
	public int winInsert(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.winInsert", map);
		return cnt;
	}

	//당첨번호 가져오기
	@Override
	public int getWinNum(int event_num) {
		int winNum = 0;
		winNum = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getWinNum", event_num);
		return winNum;
	}

	//당첨자 입력
	@Override
	public void winnerInsert(Map<String, Object> map) {
		this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.winnerInsert", map);
		
	}
	
	//참여자 리스트에서 삭제
	@Override
	public void eventParticipantsDelete(int event_num) {
		this.sqlSession.delete("com.engineers.moyeo.three.dao.ThreeDAO.eventParticipantsDelete", event_num);
		
	}
	
	//이벤트 진행상황 바꾸기
	@Override
	public void eventDone(int event_num) {
		this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.eventDone", event_num);
		
	}
	
	//이벤트 종료 알림
	@Override
	public void winNoti(Map<String, Object> map) {		
		this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.winNoti", map);
		
	}
	
	//당첨 리스트 개수
	@Override
	public int getWinCount() {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getWinCount");
		return cnt;
	}
	
	//당첨 리스트 가져오기
	@Override
	public ArrayList<EventDTO> getWinList(Map<String, Integer> map) {
		ArrayList<EventDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getWinList(map);		
		return dtos;
	}
	
	//끝난 이벤트 정보
	@Override
	public ArrayList<EventDTO> getDoneEventList(Map<String, Integer> map) {
		ArrayList<EventDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getDoneEventList(map);		
		return dtos;
	}
	
	//이벤트 당첨자 수
	@Override
	public int getWinnerCount(int winning_num) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getWinnerCount", winning_num);
		return cnt;
	}
	
	//이벤트 당첨자 
	@Override
	public ArrayList<EventDTO> getWinnerList(int winning_num) {
		ArrayList<EventDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getWinnerList(winning_num);		
		return dtos;
	}

	@Override
	public int getNotiCount(String mem_id) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getNotiCount", mem_id);
		return cnt;
	}

	@Override
	public ArrayList<MemberDTO> getNotiList(Map<String, Object> map) {
		ArrayList<MemberDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getNotiList(map);
		return dtos;
	}

	@Override
	public int getNoneChkNoti(String mem_id) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getNoneChkNoti", mem_id);
		return cnt;
	}

	@Override
	public void chkNoti(String mem_id) {
		this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.chkNoti", mem_id);
		
	}
	
	// 관심모임 개수
	@Override
	public int getInterGroupCnt(String mem_id) {
		ThreeDAO dao = sqlSession.getMapper(ThreeDAO.class);
		return dao.getInterGroupCnt(mem_id);
	}

	// 모임가입신청 이력 개수
	@Override
	public int getApplHistoryCnt(String mem_id) {
		ThreeDAO dao = sqlSession.getMapper(ThreeDAO.class);
		return dao.getApplHistoryCnt(mem_id);
	}

	// 관심모임 가져오기
	@Override
	public List<MoimOpenDTO> getInterGroup(String mem_id) {
		ThreeDAO dao = sqlSession.getMapper(ThreeDAO.class);
		return dao.getInterGroup(mem_id);
	}

	// 모임가입신청 이력 가져오기
	@Override
	public List<JoinRequestDTO> getApplHistory(String mem_id) {
		ThreeDAO dao = sqlSession.getMapper(ThreeDAO.class);
		return dao.getApplHistory(mem_id);
	}
	
	
}
