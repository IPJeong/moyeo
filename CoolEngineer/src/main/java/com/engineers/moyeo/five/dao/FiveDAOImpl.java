package com.engineers.moyeo.five.dao;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.five.dto.PostVideoDTO;

@Repository
public class FiveDAOImpl implements FiveDAO{

	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 커넥션 객체를 보관

	// 모임의 글개수를 반환하는 메서드
	@Override
	public int getPostCnt(int group_num) {
		
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.getPostCnt(group_num);
	}

	// 모임의 글 리스트를 가져오는 메서드
	@Override
	public List<MeetingPostDTO> getPostList(Map<String, Integer> map) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.getPostList(map);
	}

	// 모임후기 데이터를 삽입하는 메서드
	@Override
	public int insertPost(MeetingPostDTO dto) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.insertPost(dto);
	}

	// 모임후기 번호를 가져오는 메서드(사진, 동영상 파일 저장을 위해서...)
	@Override
	public int getPostNum(Map<String, Object> dataMap) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.getPostNum(dataMap);
	}

	// 모임후기 사진을 등록하는 메서드
	@Override
	public int insertPostPic(PostPictureDTO dto) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.insertPostPic(dto);
	}

	// 모임후기 동영상을 등록하는 메서드
	@Override
	public int insertPostVideo(PostVideoDTO dto) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.insertPostVideo(dto);
	}

	// 모임후기의 상세정보를 조회
	@Override
	public MeetingPostDTO getPostDetail(int post_num) {
		
		FiveDAO fiveDao = sqlSession.getMapper(FiveDAO.class);
		return fiveDao.getPostDetail(post_num);
	}
	
	// 모임후기의 사진을 조회
	@Override
	public List<PostPictureDTO> getPostPics(int post_num) {
		FiveDAO fiveDao = sqlSession.getMapper(FiveDAO.class);
		return fiveDao.getPostPics(post_num);
	}

	// 모임후기의 동영상을 조회
	@Override
	public List<PostVideoDTO> getPostVideos(int post_num) {
		FiveDAO fiveDao = sqlSession.getMapper(FiveDAO.class);
		return fiveDao.getPostVideos(post_num);
	}

	// 모임후기의 조회수를 증가시킴
	@Override
	public int updatePostHit(int post_num) {
		FiveDAO fiveDao = sqlSession.getMapper(FiveDAO.class);
		return fiveDao.updatePostHit(post_num);
	}

	// 모임후기를 삭제시킴
	@Override
	public int deletePost(int post_num) {
		FiveDAO fiveDao = sqlSession.getMapper(FiveDAO.class);
		return fiveDao.deletePost(post_num);
	}

	// 모임후기 좋아요 추가
	@Override
	public int likePost(Map<String, Object> map) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.likePost(map);
	}

	// 모임후기 좋아요 수 업데이트(증가)
	@Override
	public int updateLikeNum(int post_num) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.updateLikeNum(post_num);
	}

	// 모임후기 좋아요 취소
	@Override
	public int unLikePost(Map<String, Object> map) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.unLikePost(map);
	}
	
	// 모임후기 좋아요 수 업데이트(감소)
	@Override
	public int downDateLikeNum(int post_num) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.downDateLikeNum(post_num);
	}

	// 모임후기 좋아요 수 검색
	@Override
	public int getLikeNum(int post_num) {
		FiveDAO dao = sqlSession.getMapper(FiveDAO.class);
		return dao.getLikeNum(post_num);
	}
	
	
	
}
