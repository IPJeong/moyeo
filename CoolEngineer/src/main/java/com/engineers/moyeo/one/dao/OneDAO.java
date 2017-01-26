package com.engineers.moyeo.one.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.engineers.moyeo.one.dto.QnaReplyDTO;

public interface OneDAO {
	// 회원 게시판 등록,수정,삭제
	public int getCount();
	public ArrayList<QnaBoardDTO> getArticles(Map<String, Integer> daoMap); // 게시글 목록
	public int insert(QnaBoardDTO dto);
	public QnaBoardDTO getArticle(int qboard_num);
	public void addReadCnt(int qboard_num);
	public int update(QnaBoardDTO dto);
	public int delete(int qboard_num);
	public int deleteAnws(int reply_num);

	
	// 관리자 게시판에 답변 등록
	public int insertReply(QnaReplyDTO dto);
	public int updateStatus(QnaBoardDTO dto);
	public List<QnaReplyDTO> getReArticle(int qboard_num);
	public QnaReplyDTO getArtReply(int qboard_num);
	public int deleteRe(int qboard_num);
}
