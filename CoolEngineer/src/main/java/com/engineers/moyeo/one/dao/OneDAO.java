package com.engineers.moyeo.one.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

public interface OneDAO {
/////////////////////// Q&A 게시판 //////////////////////////
	
	// Q&A게시판 글개수 구하기
	public int getCount();
	
	// Q&A게시판 질문정보 구하기
	public ArrayList<QnaBoardDTO> getArticles(Map<String, Integer> daoMap); // 寃뚯떆湲� 紐⑸줉
	
	// Q&A게시판 질문 등록
	public int insert(QnaBoardDTO dto);
	
	// Q&A게시판 게시판키를 이용하여 해당 질문정보 가져오기
	public QnaBoardDTO getArticle(int qboard_num);
	
	// Q&A게시판 조회수 증가
	public void addReadCnt(int qboard_num);
	
	// Q&A게시판 질문내용 수정
	public int update(QnaBoardDTO dto);
	
	// Q&A게시판 질문내용 삭제
	public int delete(int qboard_num);
	
	// Q&A 게시판 답변내용 삭제
	public int deleteAnws(int reply_num);

	// Q&A 게시판 관리자가 답변 등록
	public int insertReply(QnaReplyDTO dto);
	
	// Q&A 게시판 답변여부 체크
	public int updateStatus(QnaBoardDTO dto);
	
	// Q&A 게시판 답변정보 구하기
	public List<QnaReplyDTO> getReArticle(int qboard_num);
	
	// Q&A 게시판 답변정보 구하기
	public QnaReplyDTO getArtReply(int qboard_num);
	
	// Q&A 게시판 관리자가 답변한 내용 삭제
	public int deleteRe(int qboard_num);
	
	// Q&A 알림을 위해 qboard_num을 이용해 mem_id 불러오기
	public QnaBoardDTO bringMemId(int qboard_num);
	
	
/////////////////////// 모임신고 //////////////////////////
	
	// group_num을 이용하여 해당 모임의 정보를 출력
	public MoimReportDTO getMoimArticle(int group_num);
	
	// 모임을 신고한 내용을 insert
	public int MoimReportInsert(MoimReportDTO dto);
	
	// 모임신고 글갯수 구하기
	public int getReportCount();
	
	// 신고한 모든 모임 정보 불러오기
	public ArrayList<MoimReportDTO> getReportArticles(Map<String, Integer> daoMap);
	
	//report_num을 통하여 해당 모임 정보 가져오기
	public MoimReportDTO getMoimContentArticle(int report_num);
	
	// 답변여부 바꾸기
	public int updateReport(MoimReportDTO dto);
	
	// 그룹번호를 통하여 신고내용 가져오기(알림)
	public String bringReportInform(int group_num);
	
	// 신고키를 통하여 신고내용 가져오기(알림)
	public MoimReportDTO bringReportInform2(int report_num);
	
	public String bringGroup_name(int group_num);
	
/////////////////////// 관리자게시판 //////////////////////////
	
	//관리자가 회원정보 몇명인지 구하기
	public int getManagerCount();
	
	// 모든 회원정보 가져오기
	public ArrayList<MemberInfoDTO> gerMemberArticles(Map<String, Integer> daoMap);
	public MemberInfoDTO getMemberInformArticle(String mem_id);
	
	// 관리자 권한에서 회원 강퇴
	public int deleteInfo(String mem_id);
	
	// 회원이 등록되어 있는 모임도 삭제
	public int deleteGroup(String mem_id);
	
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

	// 관리자 아이디 확인
	public int idCheck(String manager_id);
	// 관리자 비밀번호확인
	public int pwdCheck(Map<String, String> map);
	// 관리자 권한 확인
	public String getAuthority(String manager_id);
	
	// 권리자 권한에서 모든 모임 조회
	public ArrayList<MoimOpenDTO> getGroupArticles(Map<String, Integer> daoMap);

	// 관리자 권한에서 모임 상세보기
	public MoimOpenDTO getGroupInformArticle(int group_num);
	
	// 모임에 등록한 메인사진 가져오기
	public MainPictureDTO getMainPicture(int group_num);
	
	// 모임 갯수 구하기
	public int getGroupCount();
	
	// 모임의 모임장 구하기
	public MyGroupDTO moimGroupLeader(int group_num);
	
	// 모임의 모든 멤버 구하기
	public MyGroupDTO moimGroupMember(int group_num);
	
	// 모임원 명수 구하기
	public int getMemberCount(int group_num);
	
	// 모든 멤버 구하기
	public ArrayList<MyGroupDTO> getMemberArticles(Map<String, Integer> daoMap);

	// 관리자 권한으로 모임 폐쇄
	public int groupDelete(int group_num);
	
	// 하위관리자 몇명인지 구하기
	public int getLowManagerCount();
	
	// 관리자 권한에서 하위관리자 강퇴
	public int deleteManager(String manager_id);
	
	public int getSearchNameCount(Map<String, Object> daoMap);
	
	public int getSearchIdCount(Map<String, Object> daoMap);
	
	// 관리자 권한에서 회원리스트 검색(아이디)
	public ArrayList<MemberInfoDTO> getMemberList(Map<String, Object> daoMap);
	
	// 관리자 권한에서 회원리스트 검색(아이디)
	public ArrayList<MemberInfoDTO> getMemberList2(Map<String, Object> daoMap);
	
	// 관리자 권한에서 모임리스트 검색
	public int getSearchGroupCount(Map<String, Object> daoMap);
	
	// 검색결과에 따른 모임 리스트
	public ArrayList<MoimOpenDTO> getGroupList(Map<String, Object> daoMap);
	
	// 판매신청한 회원 몇명인지 구하기
	public int getSellerCount(); 
	
	// 판매신청한 모든 회원정보 가져오기
	public ArrayList<SellerInfoDTO> getSellerArticles(Map<String, Integer> daoMap);

	public SellerInfoDTO getSellerInformArticle(String seller_id);
	
	// 판매승인 후 승인여부 바꾸기
	public int updateRecognition(String seller_id);
	
	// 판매거절 후 승인여부 바꾸기
	public int updateRecognition2(String seller_id);
	
	
	/////////////////////판매샵////////////////////////
	
	// 전체제품 갯수 구하기
	public int getProductCount();
	
	// 해당 판매자가 등록한 제품 갯수 구하기
	public int getSellerProductCount();
	
	// 해당 판매자가 등록한 제품의 정보들을 불러옴
	public ArrayList<ProductInfoDTO> getSellerProductInform(Map<String, Object> daoMap);
	
	// 모든 제품정보 구하기
	public ArrayList<ProductInfoDTO> getProductArticles(Map<String, Integer> daoMap);
	
	// 판매자 recognition 구하기
	public String getRecognition(String seller_id);
}
