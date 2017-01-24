package com.engineers.moyeo.five.dao;

import java.util.Map;

import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.five.dto.PostVideoDTO;

public interface FiveDAO {

	// 모임후기 등록
	public int insertPost(MeetingPostDTO dto);
	// 모임후기번호 조회
	public int getPostNum(Map<String, Object> dataMap);
	// 모임후기의 사진파일을 등록
	public int insertPostPic(PostPictureDTO dto);
	// 모임후기의 동영상 파일을 등록
	public int insertPostVideo(PostVideoDTO dto);
}
