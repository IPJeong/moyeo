package com.engineers.moyeo.one.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.engineers.moyeo.one.dto.ManagerDTO;
import com.engineers.moyeo.one.dto.MemberInformDTO;
import com.engineers.moyeo.one.dto.MoimReportDTO;
import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.engineers.moyeo.one.dto.QnaReplyDTO;

public interface OneDAO {
	
	public int getCount();
	public ArrayList<QnaBoardDTO> getArticles(Map<String, Integer> daoMap); // 寃뚯떆湲� 紐⑸줉
	public int insert(QnaBoardDTO dto);
	public QnaBoardDTO getArticle(int qboard_num);
	public void addReadCnt(int qboard_num);
	public int update(QnaBoardDTO dto);
	public int delete(int qboard_num);
	public int deleteAnws(int reply_num);

	
	public int insertReply(QnaReplyDTO dto);
	public int updateStatus(QnaBoardDTO dto);
	public List<QnaReplyDTO> getReArticle(int qboard_num);
	public QnaReplyDTO getArtReply(int qboard_num);
	public int deleteRe(int qboard_num);
	
	// 모임신고 
	public MoimReportDTO getMoimArticle(int group_num);
	public int MoimReportInsert(MoimReportDTO dto);
	public int getReportCount();
	public ArrayList<MoimReportDTO> getReportArticles(Map<String, Integer> daoMap);
	public MoimReportDTO getMoimContentArticle(int report_num);
	public int updateReport(MoimReportDTO dto);
	
	
	////////////////////////////// 관리자게시판 //////////////////////////////////////
	public int getManagerCount();
	public ArrayList<MemberInformDTO> gerMemberArticles(Map<String, Integer> daoMap);
	public MemberInformDTO getMemberInformArticle(String mem_id);
	
	// 관리자 권한에서 회원 강퇴
	public int deleteInfo(String mem_id);
	
	// 관리자 권한에서 관리자 임명
	public int insertManager(ManagerDTO dto);
	
	// 관리자 권한에서 관리자 삭제
	public int getManagerDeleteCount();
	
	// 권한이 master인 관리자만 조회
	public ArrayList<ManagerDTO> getManagerArticles(Map<String, Integer> daoMap);
	
	// 권한이 manager인 관리자만 조회
	public ArrayList<ManagerDTO> getManagerArticles2(Map<String, Integer> daoMap);

	// 모든 관리자 조회
	public ArrayList<ManagerDTO> getManagerArticles3(Map<String, Integer> daoMap);
}
