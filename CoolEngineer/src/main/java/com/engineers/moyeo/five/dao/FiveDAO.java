package com.engineers.moyeo.five.dao;

import com.engineers.moyeo.five.dto.MeetingPostDTO;

public interface FiveDAO {

	// 모임후기 삽입
	public int insertPost(MeetingPostDTO dto);
	
}
