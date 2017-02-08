package com.engineers.moyeo.three.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.three.dto.EventDTO;
import com.engineers.moyeo.three.dto.MemberDTO;
import com.engineers.moyeo.three.dto.MygroupDTO;
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
		int cnt2 = 0;
		cnt2 = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getCount2");
		return cnt2;
	}

	@Override
	public ArrayList<ThreeDTO> getCategory() {
		ArrayList<ThreeDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getCategory();
		return dtos;
	}
	

	@Override
	public ArrayList<ThreeDTO> getQuestions() {		
		ArrayList<ThreeDTO> dtos2 = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos2 = dao.getQuestions();
		return dtos2;
	}

	@Override
	public int insert(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.insert", dto);
		return cnt;
	}

	@Override
	public int insertFaq(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.insertFaq", dto);
		return cnt;
	}

	@Override
	public int update(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.update", dto);
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dao.update2(dto);
		return cnt;
	}

	@Override
	public void update2(ThreeDTO dto) {
		this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.update2", dto);		
	}

	@Override
	public int updateFaq(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.updateFaq", dto);
		return cnt;
	}

	@Override
	public ThreeDTO getInfo(int faqNum) {
		ThreeDTO dto = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getInfo", faqNum);
		return dto;
	}

	@Override
	public int delete(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.delete("com.engineers.moyeo.three.dao.ThreeDAO.delete", dto);
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dao.delete2(dto);
		return cnt;
	}

	@Override
	public void delete2(ThreeDTO dto) {
		this.sqlSession.delete("com.engineers.moyeo.three.dao.ThreeDAO.delete2", dto);		
	}

	@Override
	public int deleteFaq(ThreeDTO dto) {		
		int cnt = 0;
		cnt = this.sqlSession.delete("com.engineers.moyeo.three.dao.ThreeDAO.deleteFaq", dto);		
		return cnt;
	}

	@Override
	public int ctgCheck(ThreeDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.ctgCheck", dto);
		return cnt;
	}

	@Override
	public int eventInsert(EventDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.eventInsert", dto);
		return cnt;
	}
	
	@Override
	public int getEventNum(Timestamp regDate) {
		int eNum = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getEventNum", regDate);
		return eNum;
	}

	@Override
	public void eventImgInsert(EventDTO dto) {
		this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.eventImgInsert", dto);
		
	}

	@Override
	public void eventImgsInsert(EventDTO dto) {
		this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.eventImgsInsert", dto);
		
	}

	@Override
	public int getEventCount() {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.getEventCount");
		return cnt;
	}

	@Override
	public ArrayList<EventDTO> getEventList(Map<String, Integer> map) {
		ArrayList<EventDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getEventList(map);			
		return dtos;
	}

	@Override
	public ArrayList<EventDTO> getEventPic(Map<String, Integer> map) {
		ArrayList<EventDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getEventPic(map);		
		return dtos;
	}

	@Override
	public int confirmId(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.confirmId", map);
		return cnt;
	}

	@Override
	public int memInfoInsert(MemberDTO dto) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.memInfoInsert", dto);
		return cnt;
	}

	@Override
	public void proImgInsert(MemberDTO dto) {
		this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.proImgInsert", dto);
		
	}

	@Override
	public int placeInsert(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.insert("com.engineers.moyeo.three.dao.ThreeDAO.placeInsert", map);
		return cnt;
	}

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
	public ArrayList<MygroupDTO> getGroupList(Map<String, Object> map) {
		ArrayList<MygroupDTO> dtos = null;
		ThreeDAO dao = this.sqlSession.getMapper(ThreeDAO.class);
		dtos = dao.getGroupList(map);		
		return dtos;
	}

	@Override
	public int confirmPw(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.three.dao.ThreeDAO.confirmPw", map);
		return cnt;
	}

	@Override
	public int changePw(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.changePw", map);
		return cnt;
	}

	@Override
	public int changeMyInfo(Map<String, Object> map) {
		int cnt = 0;
		cnt = this.sqlSession.update("com.engineers.moyeo.three.dao.ThreeDAO.changeMyInfo", map);
		return cnt;
	}
	
	
}
