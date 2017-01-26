package com.engineers.moyeo.five.dao;

import java.util.List;
import java.util.Map;

import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.five.dto.PostVideoDTO;

public interface FiveDAO {

	// 모임후기의 글 개수 구하기
	public int getPostCnt(int group_num);
	// 모임후기의 글목록 가져오기
	public List<MeetingPostDTO> getPostList(Map<String, Integer> map);
	
	// 모임후기 등록
	public int insertPost(MeetingPostDTO dto);
	// 모임후기번호 조회
	public int getPostNum(Map<String, Object> dataMap);
	// 모임후기의 사진파일을 등록
	public int insertPostPic(PostPictureDTO dto);
	// 모임후기의 동영상 파일을 등록
	public int insertPostVideo(PostVideoDTO dto);
	// 모임후기의 상세정보를 조회
	public MeetingPostDTO getPostDetail(int post_num);
	// 모임후기의 사진을 조회
	public List<PostPictureDTO> getPostPics(int post_num);
	// 모임후기의 동영상을 조회
	public List<PostVideoDTO> getPostVideos(int post_num);
	
}
