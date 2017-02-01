package com.engineers.moyeo.one.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.engineers.moyeo.one.dto.MoimReportDTO;
import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.engineers.moyeo.one.dto.QnaReplyDTO;

public interface OneDAO {
	// �쉶�썝 寃뚯떆�뙋 �벑濡�,�닔�젙,�궘�젣
	public int getCount();
	public ArrayList<QnaBoardDTO> getArticles(Map<String, Integer> daoMap); // 寃뚯떆湲� 紐⑸줉
	public int insert(QnaBoardDTO dto);
	public QnaBoardDTO getArticle(int qboard_num);
	public void addReadCnt(int qboard_num);
	public int update(QnaBoardDTO dto);
	public int delete(int qboard_num);
	public int deleteAnws(int reply_num);

	
	// 愿�由ъ옄 寃뚯떆�뙋�뿉 �떟蹂� �벑濡�
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
}
