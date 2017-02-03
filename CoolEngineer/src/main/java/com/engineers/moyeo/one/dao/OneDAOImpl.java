package com.engineers.moyeo.one.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.one.dto.ManagerDTO;
import com.engineers.moyeo.one.dto.MemberInformDTO;
import com.engineers.moyeo.one.dto.MoimReportDTO;
import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.engineers.moyeo.one.dto.QnaReplyDTO;

@Repository
public class OneDAOImpl implements OneDAO{

	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	// 而ㅻ꽖�뀡 媛앹껜瑜� 蹂닿�

	// 湲�媛쒖닔 援ы븯湲�
	@Override
	public int getCount() {
		int cnt = 0;
		
		// �씤�꽣�럹�씠�뒪紐� dao = this.sqlSession.getMapper("�씤�꽣�럹�씠�뒪紐�.class");
		// dao.id紐�
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getCount();
		return cnt;
	}

	// 寃뚯떆湲� 紐⑸줉議고쉶
	@Override
	public ArrayList<QnaBoardDTO> getArticles(Map<String, Integer> daoMap) {
		ArrayList<QnaBoardDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getArticles(daoMap);
		return dtos;
	}

	@Override
	public int insert(QnaBoardDTO dto) {
		
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.insert(dto);
		
		return count;
	}

	@Override
	public QnaBoardDTO getArticle(int qboard_num) {
		QnaBoardDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getArticle(qboard_num);
		
		return dto;
	}
	
	@Override
	public void addReadCnt(int qboard_num) {
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dao.addReadCnt(qboard_num);
	}

	@Override
	public int update(QnaBoardDTO dto) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.update(dto);
		
		return cnt;
	}

	@Override
	public int delete(int qboard_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.delete(qboard_num);
		
		return cnt;
	}
	
	@Override
	public int deleteRe(int qboard_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.deleteRe(qboard_num);
		
		return cnt;
	}
	
	@Override
	public int deleteAnws(int reply_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt= dao.deleteAnws(reply_num);
		
		return cnt;
	}

	@Override
	public int insertReply(QnaReplyDTO dto) {
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.insertReply(dto);
		
		return count;
	}

	@Override
	public List<QnaReplyDTO> getReArticle(int qboard_num) {
		
		List<QnaReplyDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getReArticle(qboard_num);
		
		return dtos;
	}

	@Override
	public int updateStatus(QnaBoardDTO dto) {
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.updateStatus(dto);
		
		return count;
	}

	@Override
	public QnaReplyDTO getArtReply(int qboard_num) {
		QnaReplyDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getArtReply(qboard_num);
		
		return dto;
	}

	@Override
	public MoimReportDTO getMoimArticle(int group_num) {
		MoimReportDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getMoimArticle(group_num);
		
		return dto;
	}

	@Override
	public int MoimReportInsert(MoimReportDTO dto) {
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.MoimReportInsert(dto);
		
		return count;
	}

	@Override
	public int getReportCount() {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getReportCount();
		return cnt;
	}

	@Override
	public ArrayList<MoimReportDTO> getReportArticles(Map<String, Integer> daoMap) {
		ArrayList<MoimReportDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getReportArticles(daoMap);
		return dtos;
	}

	@Override
	public MoimReportDTO getMoimContentArticle(int report_num) {
		MoimReportDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getMoimContentArticle(report_num);
		
		return dto;
	}

	@Override
	public int updateReport(MoimReportDTO dto) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.updateReport(dto);
		
		return cnt;
	}

	@Override
	public int getManagerCount() {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getManagerCount();
		return cnt;
	}

	@Override
	public ArrayList<MemberInformDTO> gerMemberArticles(Map<String, Integer> daoMap) {
		ArrayList<MemberInformDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.gerMemberArticles(daoMap);
		return dtos;
	}

	@Override
	public MemberInformDTO getMemberInformArticle(String mem_id) {
		MemberInformDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getMemberInformArticle(mem_id);
		
		return dto;
	}
	
	@Override
	public int deleteInfo(String mem_id) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt= dao.deleteInfo(mem_id);
		
		return cnt;
	}

	@Override
	public int insertManager(ManagerDTO dto) {
		
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		count = dao.insertManager(dto);
		
		return count;
	}
	
	@Override
	public int getManagerDeleteCount() {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getManagerDeleteCount();
		return cnt;
	}

	// 모든 관리자 조회
	@Override
	public ArrayList<ManagerDTO> getManagerArticles(Map<String, Integer> daoMap) {
		
		ArrayList<ManagerDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getManagerArticles(daoMap);
		return dtos;
	}

	// 권한이 manager인 관리자 조회
	@Override
	public ArrayList<ManagerDTO> getManagerArticles2(Map<String, Integer> daoMap) {		
		ArrayList<ManagerDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getManagerArticles2(daoMap);
		return dtos;
	}

	@Override
	public ArrayList<ManagerDTO> getManagerArticles3(Map<String, Integer> daoMap) {
		ArrayList<ManagerDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getManagerArticles3(daoMap);
		return dtos;
	}
}
