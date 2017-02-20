package com.engineers.moyeo.one.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.one.dto.ManagerDTO;
import com.engineers.moyeo.one.dto.MoimReportDTO;
import com.engineers.moyeo.one.dto.ProductInfoDTO;
import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.engineers.moyeo.one.dto.QnaReplyDTO;
import com.engineers.moyeo.one.dto.SellerInfoDTO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;

@Repository
public class OneDAOImpl implements OneDAO{

	@Autowired
	private SqlSession sqlSession;
	
	DataSource dataSource;	

	// Q&A게시판 글개수 구하기
	@Override
	public int getCount() {
		int cnt = 0;

		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getCount();
		return cnt;
	}
	
	// Q&A게시판 질문정보 구하기
	@Override
	public ArrayList<QnaBoardDTO> getArticles(Map<String, Integer> daoMap) {
		ArrayList<QnaBoardDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getArticles(daoMap);
		return dtos;
	}

	// Q&A게시판 질문 등록
	@Override
	public int insert(QnaBoardDTO dto) {
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.insert(dto);
		
		return count;
	}

	// Q&A게시판 게시판키를 이용하여 해당 질문정보 가져오기
	@Override
	public QnaBoardDTO getArticle(int qboard_num) {
		QnaBoardDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getArticle(qboard_num);
		
		return dto;
	}
	
	// Q&A게시판 조회수 증가
	@Override
	public void addReadCnt(int qboard_num) {
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dao.addReadCnt(qboard_num);
	}

	// Q&A게시판 질문내용 수정
	@Override
	public int update(QnaBoardDTO dto) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.update(dto);
		
		return cnt;
	}

	// Q&A게시판 질문내용 삭제
	@Override
	public int delete(int qboard_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.delete(qboard_num);
		
		return cnt;
	}
	
	// Q&A 게시판 관리자가 답변한 내용 삭제
	@Override
	public int deleteRe(int qboard_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.deleteRe(qboard_num);
		
		return cnt;
	}
	
	// Q&A 알림을 위해 qboard_num을 이용해 mem_id 불러오기
	@Override
	public  QnaBoardDTO bringMemId(int qboard_num) {
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);

		return dao.bringMemId(qboard_num);
	}
	
	
	// Q&A 게시판 답변내용 삭제
	@Override
	public int deleteAnws(int reply_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt= dao.deleteAnws(reply_num);
		
		return cnt;
	}

	// Q&A 게시판 관리자가 답변 등록
	@Override
	public int insertReply(QnaReplyDTO dto) {
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.insertReply(dto);
		
		return count;
	}

	// Q&A 게시판 답변정보 구하기
	@Override
	public List<QnaReplyDTO> getReArticle(int qboard_num) {
		
		List<QnaReplyDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getReArticle(qboard_num);
		
		return dtos;
	}

	// Q&A 게시판 답변여부 체크
	@Override
	public int updateStatus(QnaBoardDTO dto) {
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.updateStatus(dto);
		
		return count;
	}

	// Q&A 게시판 답변정보 구하기
	@Override
	public QnaReplyDTO getArtReply(int qboard_num) {
		QnaReplyDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getArtReply(qboard_num);
		
		return dto;
	}

	// group_num을 이용하여 해당 모임의 정보를 출력
	@Override
	public MoimReportDTO getMoimArticle(int group_num) {
		MoimReportDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getMoimArticle(group_num);
		
		return dto;
	}

	// 모임을 신고한 내용을 insert
	@Override
	public int MoimReportInsert(MoimReportDTO dto) {
		int count = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		
		count = dao.MoimReportInsert(dto);
		
		return count;
	}

	// 모임신고 글갯수 구하기
	@Override
	public int getReportCount() {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getReportCount();
		return cnt;
	}

	// 신고한 모든 모임 정보 불러오기
	@Override
	public ArrayList<MoimReportDTO> getReportArticles(Map<String, Integer> daoMap) {
		ArrayList<MoimReportDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getReportArticles(daoMap);
		return dtos;
	}

	//report_num을 통하여 해당 모임 정보 가져오기
	@Override
	public MoimReportDTO getMoimContentArticle(int report_num) {
		MoimReportDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getMoimContentArticle(report_num);
		
		return dto;
	}

	// 답변여부 바꾸기
	@Override
	public int updateReport(MoimReportDTO dto) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.updateReport(dto);
		
		return cnt;
	}
	
	// 신고키를 통하여 신고내용 가져오기(알림)
	public String bringReportInform(int group_num) {
		String mem_id;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		mem_id = dao.bringReportInform(group_num);
		
		return mem_id;
	}
	
	@Override
	public MoimReportDTO bringReportInform2(int report_num) {
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);

		return dao.bringReportInform2(report_num);
	}
	
	@Override
	public String bringGroup_name(int group_num) {
		String group_name;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		group_name = dao.bringGroup_name(group_num);
		
		return group_name;
	}

	//관리자가 회원정보 몇명인지 구하기
	@Override
	public int getManagerCount() {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getManagerCount();
		return cnt;
	}

	// 모든 회원정보 가져오기
	@Override
	public ArrayList<MemberInfoDTO> gerMemberArticles(Map<String, Integer> daoMap) {
		ArrayList<MemberInfoDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.gerMemberArticles(daoMap);
		return dtos;
	}

	// 모든 회원정보 가져오기
	@Override
	public MemberInfoDTO getMemberInformArticle(String mem_id) {
		MemberInfoDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getMemberInformArticle(mem_id);
		
		return dto;
	}
	
	// 회원 강퇴
	@Override
	public int deleteInfo(String mem_id) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt= dao.deleteInfo(mem_id);
		return cnt;
	}
	
	// 회원이 모임장인 모임도 함께 삭제
	@Override
	public int deleteGroup(String mem_id) {
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		return dao.deleteGroup(mem_id);
	}

	//
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

	// 모든 관리자 조회
	@Override
	public ArrayList<ManagerDTO> getManagerArticles3(Map<String, Integer> daoMap) {
		ArrayList<ManagerDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getManagerArticles3(daoMap);
		return dtos;
	}

	// 관리자 비밀번호 체크
	@Override
	public int pwdCheck(Map<String, String> map) {
		int cnt = 0;
		OneDAO dao = sqlSession.getMapper(OneDAO.class);
		
		String manager_id = map.get("manager_id");
		
		int idCheck = dao.idCheck(manager_id);
		
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

	// 관리자 아이디 체크
	@Override
	public int idCheck(String manager_id) {
		int cnt = 0;
		OneDAO dao = sqlSession.getMapper(OneDAO.class);
		cnt = dao.idCheck(manager_id);
		return cnt;
	}
	
	// 관리자 권한 체크
	public String getAuthority(String manager_id) {
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		String authority = dao.getAuthority(manager_id);
		
		return authority;
	}

	// 권리자 권한에서 모든 모임 조회
	@Override
	public ArrayList<MoimOpenDTO> getGroupArticles(Map<String, Integer> daoMap) {
		
		ArrayList<MoimOpenDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getGroupArticles(daoMap);
		return dtos;
	}

	// 관리자 권한에서 모임 상세보기
	@Override
	public MoimOpenDTO getGroupInformArticle(int group_num) {
		MoimOpenDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getGroupInformArticle(group_num);
		
		return dto;
	}

	// 모임에 등록한 메인사진 가져오기
	@Override
	public MainPictureDTO getMainPicture(int group_num) {
		MainPictureDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getMainPicture(group_num);
		
		return dto;
	}

	// 모임갯수 구하기
	@Override
	public int getGroupCount() {
	    int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getGroupCount();
		return cnt;
	}

	// 모임 운영진들 정보 불러오기
	@Override
	public MyGroupDTO moimGroupLeader(int group_num) {
		MyGroupDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.moimGroupLeader(group_num);
		
		return dto;
	}

	// 모임 모든 멤버들 아이디 불러오기
	@Override
	public MyGroupDTO moimGroupMember(int group_num) {
		MyGroupDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.moimGroupMember(group_num);
		
		return dto;
	}

	// 모임원 명수 구하기
	@Override
	public int getMemberCount(int group_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getMemberCount(group_num);
		return cnt;
	}

	// 모든 멤버 구하기
	@Override
	public ArrayList<MyGroupDTO> getMemberArticles(Map<String, Integer> daoMap) {
		
		ArrayList<MyGroupDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getMemberArticles(daoMap);
		return dtos;
	}

	// 관리자 권한으로 모임 폐쇄
	@Override
	public int groupDelete(int group_num) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt= dao.groupDelete(group_num);
		
		return cnt;
	}

	// 하위관리자 몇명인지 구하기
	@Override
	public int getLowManagerCount() {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getLowManagerCount();
		return cnt;
	}

	// 관리자 권한에서 하위관리자 강퇴
	@Override
	public int deleteManager(String manager_id) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.deleteManager(manager_id);
		
		return cnt;
	}

	// 관리자 권한에서 회원리스트 검색
	@Override
	public int getSearchNameCount(Map<String, Object> daoMap) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getSearchNameCount(daoMap);
		return cnt;
	}
	
	// 관리자 권한에서 회원리스트 검색
	@Override
	public int getSearchIdCount(Map<String, Object> daoMap) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getSearchIdCount(daoMap);
		return cnt;
	}

	// 관리자 권한에서 회원 검색
	@Override
	public ArrayList<MemberInfoDTO> getMemberList(Map<String, Object> daoMap) {
		ArrayList<MemberInfoDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getMemberList(daoMap);
		return dtos;
	}
	
	// 관리자 권한에서 회원 검색
	@Override
	public ArrayList<MemberInfoDTO> getMemberList2(Map<String, Object> daoMap) {
		ArrayList<MemberInfoDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getMemberList2(daoMap);
		return dtos;
	}
	
	@Override
	public int getSearchGroupCount(Map<String, Object> daoMap) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getSearchGroupCount(daoMap);
		return cnt;
	}

	@Override
	public ArrayList<MoimOpenDTO> getGroupList(Map<String, Object> daoMap) {
		ArrayList<MoimOpenDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getGroupList(daoMap);
		return dtos;
	}

	// 판매신청한 회원수 구하기
	@Override
	public int getSellerCount() {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getSellerCount();
		return cnt;
	}

	@Override
	public ArrayList<SellerInfoDTO> getSellerArticles(Map<String, Integer> daoMap) {
		ArrayList<SellerInfoDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getSellerArticles(daoMap);
		return dtos;
	}
	
	@Override
	public SellerInfoDTO getSellerInformArticle(String seller_id) {
		SellerInfoDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getSellerInformArticle(seller_id);
		
		return dto;
	}

	// 판매자승인 후 승인여부 바꾸기
	@Override
	public int updateRecognition(String seller_id) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.updateRecognition(seller_id);
		
		return cnt;
	}

	// 판매자거절 후 승인여부 바꾸기
	@Override
	public int updateRecognition2(String seller_id) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.updateRecognition2(seller_id);
		
		return cnt;
	}

	// 판매샵에 등록된 모든 제품갯수 구하기
	@Override
	public int getProductCount() {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getProductCount();
		return cnt;
	}
	
	// 해당 판매자가 등록한 제품갯수 구하기
	@Override
	public int getSellerProductCount(String seller_id) {
		int cnt = 0;
		
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.getSellerProductCount(seller_id);
		return cnt;
	}
	
	// 해당 판매자가 등록한 모든 제품 구하기
	@Override
	public ArrayList<ProductInfoDTO> getSellerProductInform(Map<String, Object> daoMap) {
		ArrayList<ProductInfoDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getSellerProductInform(daoMap);
		return dtos;
	}
	
	
	// 모든 제품정보 가져오기
	@Override
	public ArrayList<ProductInfoDTO> getProductArticles(Map<String, Integer> daoMap) {
		ArrayList<ProductInfoDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getProductArticles(daoMap);
		return dtos;
	}
	
	// 해당 판매자의 아이디를 이용하여 제품정보 가져오기
	@Override
	public ArrayList<ProductInfoDTO> getProductArticles2(Map<String, Object> daoMap) {
		ArrayList<ProductInfoDTO> dtos = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dtos = dao.getProductArticles2(daoMap);
		return dtos;
	}

	@Override
	public String getRecognition(String seller_id) {
		String recognition;

		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		recognition = dao.getRecognition(seller_id);
		return recognition;
	}

	@Override
	public ProductInfoDTO getProductInform(int product_num) {
		ProductInfoDTO dto = null;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		dto = dao.getProductInform(product_num);
		
		return dto;
	}

	// 판매중인 상품 업데이트하기
	@Override
	public int productUpdate(ProductInfoDTO dto) {
		int cnt = 0;
		OneDAO dao = this.sqlSession.getMapper(OneDAO.class);
		cnt = dao.productUpdate(dto);
		
		return cnt;
	}

}
