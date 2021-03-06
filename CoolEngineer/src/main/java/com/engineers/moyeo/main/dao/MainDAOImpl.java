package com.engineers.moyeo.main.dao;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.five.dto.PostVideoDTO;
import com.engineers.moyeo.main.dto.GroupLeaderNotiDTO;
import com.engineers.moyeo.main.dto.MainPicDTO;
import com.engineers.moyeo.main.dto.MainVideoDTO;
import com.engineers.moyeo.main.dto.MemberNotiDTO;
import com.engineers.moyeo.main.dto.SellerNotiDTO;
import com.engineers.moyeo.main.dto.WordDTO;


@Repository
public class MainDAOImpl implements MainDAO{

	
	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 커넥션 객체를 보관
	

	// 메인페이지 모임후기 사진 리스트
	@Override
	public List<MainPicDTO> getMainPictures(Map<String, Integer> map) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.getMainPictures(map);
	}

	// 메인페이지 모임후기 동영상 리스트
	@Override
	public List<MainVideoDTO> getMainVideos(Map<String, Integer> map) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.getMainVideos(map);
	}
	
	// 메인페이지 모임후기 리스트
	@Override
	public List<MeetingPostDTO> getMeetingPost(String last_day) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.getMeetingPost(last_day);
	}

	//중복확인 체크
	@Override
 	public int idCheck(String mem_id) {
		int cnt = 0;
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		cnt = dao.idCheck(mem_id);
		return cnt;
	}

	// 로그인 비밀번호 확인
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
	
	// 임시번호 존재하는지 확인
	@Override
	public int tempPwdCheck(Map<String, String> map) {
		int cnt = 0;
		cnt = this.sqlSession.selectOne("com.engineers.moyeo.main.dao.MainDAO.tempPwdCheck", map);
		return cnt;
	}

	// 워드클라우드 모델을 가져옴
	@Override
	public List<WordDTO> getWordCloudModel() {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.getWordCloudModel();
	}

	// 워드클라우드 단어가 존재하는지 확인
	@Override
	public int checkWordCloud(String word) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.checkWordCloud(word);
	}

	// 워드클라우드 단어 추가
	@Override
	public int addWordCloud(WordDTO dto) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.addWordCloud(dto);
	}

	// 워드클라우드 단어 카운트 업데이트
	@Override
	public int updateWordCloud(WordDTO dto) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.updateWordCloud(dto);
	}

	// 워드클라우드 검색
	@Override
	public List<WordDTO> searchWordcloud(Map<String, Object> map) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.searchWordcloud(map);
	}
	
	// 워드클라우드 검색
	@Override
	public List<WordDTO> searchWordcloud2(Map<String, Object> map) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.searchWordcloud2(map);
	}

	// 모임후기 전체 사진개수 구하기
	@Override
	public int getTotalPicCnt() {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.getTotalPicCnt();
	}
	
	// 메인페이지 모임후기 사진 리스트
	@Override
	public List<PostPictureDTO> getPostPictures(Map<String, Integer> map) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.getPostPictures(map);
	}

	// 모임후기 전체 동영상 개수 구하기
	@Override
	public int getTotalVideoCnt() {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.getTotalVideoCnt();
	}

	// 메인페이지 모임후기 동영상 리스트
	@Override
	public List<PostVideoDTO> getPostVideos(Map<String, Integer> map) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.getPostVideos(map);
	}

	// 회원의 알림을 추가
	@Override
	public int addMemberNoti(MemberNotiDTO dto) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.addMemberNoti(dto);
	}

	// 모임장의 알림을 추가
	@Override
	public int addLeaderNoti(GroupLeaderNotiDTO dto) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.addLeaderNoti(dto);
	}

	// 판매자의 알림을 추가
	@Override
	public int addSellerNoti(SellerNotiDTO dto) {
		MainDAO dao = sqlSession.getMapper(MainDAO.class);
		return dao.addSellerNoti(dto);
	}
	
}
