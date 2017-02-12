package com.engineers.moyeo.six.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.six.dto.CheckPresentDTO;
import com.engineers.moyeo.six.dto.HotMoimDTO;
import com.engineers.moyeo.six.dto.InterestCatDTO;
import com.engineers.moyeo.six.dto.InterestGroupDTO;
import com.engineers.moyeo.six.dto.InterestLocationDTO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.MoimScheduleDTO;
import com.engineers.moyeo.six.dto.MsgListDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;
import com.engineers.moyeo.six.dto.NoticeDTO;

@Repository
public class SixDAOImpl implements SixDAO{

	@Autowired
	private SqlSession sqlSession;

	DataSource dataSource;	// 커넥션 객체를 보관

	//공지-글개수 구하기
	@Override
	public int getCount() {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.getCount();	
		return cnt;
	}

	//공지-게시글리스트 불러오기
	@Override
	public ArrayList<NoticeDTO> getArticles(Map<String, Integer> daoMap) {
		ArrayList<NoticeDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.getArticles(daoMap);

		return dtos;
	}

	//공지-게시글리스트(메인용)
	public ArrayList<NoticeDTO> getArticles_main(){
		ArrayList<NoticeDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.getArticles_main();

		return dtos;
	}

	//공지-상세글정보
	@Override
	public NoticeDTO getArticle(int num) {
		NoticeDTO dto = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dto = dao.getArticle(num);

		return dto;
	}

	//공지-조회수 증가
	@Override
	public void addReadCnt(int num) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dao.addReadCnt(num);
	}

	//공지-글작성
	@Override
	public int insert(NoticeDTO dto) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.insert(dto);

		return cnt;
	}

	//공지-글수정
	@Override
	public int update(NoticeDTO dto) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.update(dto);

		return cnt;
	}

	//공지-글삭제
	@Override
	public int delete(int num) {
		int cnt = 0;

		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.delete(num);

		return cnt;
	}

	
	
	
	
	//모임일정-일정개수 구하기
	public int moimScheduleCount(int group_num) {
		
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimScheduleCount(group_num);
	
		return cnt;	
	}
	
	//모임일정-일정 리스트
	public ArrayList<MoimScheduleDTO> moimScheduleDetail(Map<String, Integer> daoMap) {
		ArrayList<MoimScheduleDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.moimScheduleDetail(daoMap);
		
		return dtos;
	}
	
	//모임일정-상세정보
	public MoimScheduleDTO moimScheduleContents(int num) {
		MoimScheduleDTO dto = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dto = dao.moimScheduleContents(num);
		
		return dto;
	}

	//모임일정-등록
	@Override
	public int moimRegister(MoimScheduleDTO dto) {
		int cnt = 0;
		
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimRegister(dto);
		
		return cnt;
	}

	//모임일정-수정
	@Override
	public int moimScheduleModify(MoimScheduleDTO dto) {
		int cnt = 0;
		
	
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimScheduleModify(dto);
		
		return cnt;
	}
	
	//모임일정-삭제
	@Override
	public int moimScheduleDelete(int num) {
		int cnt = 0;
		
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimScheduleDelete(num);
		
		return cnt;
	}

	//모임일정-참석여부확인
	@Override
	public int moimScheduleJoinCheck(MoimScheduleDTO dto) {
		int cnt = 0;
		
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		
		cnt = dao.moimScheduleJoinCheck(dto);
		
		return cnt;
	}

	//모임일정-참석신청
	@Override
	public int moimScheduleJoin(MoimScheduleDTO dto) {
		int cnt = 0;
		
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimScheduleJoin(dto);
		
		return cnt;
	}

	//모임일정-참석취소
	@Override
	public int moimScheduleCancel(MoimScheduleDTO dto) {
		int cnt = 0;
		
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimScheduleCancel(dto);
		
		return cnt;
	}
	
	//모임일정-참석인원 확인
	@Override
	public int moimScheduleCheck(int num) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimScheduleCheck(num);
				
		return cnt;
	}
	
	//모임일정-참석회원 아이디 조회
	@Override
	public ArrayList<MoimScheduleDTO> moimScheduleMember(int num) {
		ArrayList<MoimScheduleDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.moimScheduleMember(num);
		
		return dtos;
	}

	
	
	//모임-개설번호 받아오기
	@Override
	public int moimOpenNum() {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int moimNum = dao.moimOpenNum();
		
		return moimNum;
	}
	
	//모임-개설
	@Override
	public int moimOpenPro(MoimOpenDTO dto) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimOpenPro(dto);
				
		return cnt;
	}

	//모임-모임장등록
	@Override
	public void moimLeaderRegister(MyGroupDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dao.moimLeaderRegister(dto);
	}
	
	//모임-기본 사진 설정(사이드)
	public void moimSidePhoto(MainPictureDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dao.moimSidePhoto(dto);
	}

	//모임-기본 사진 설정(메인)
	public void moimMainPhoto(MainPictureDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dao.moimMainPhoto(dto);
	}
	
	
	//카테고리-관심사별(아웃도어/여행)
	@Override
	public ArrayList<MoimOpenDTO> categoryHobbyA() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyA();
		return dtos;
	}
	
	//카테고리-관심사별(운동/스포츠)
	public ArrayList<MoimOpenDTO> categoryHobbyB() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyB();
		return dtos;
	}
	
	//카테고리-관심사별(인문학/책/글)
	public ArrayList<MoimOpenDTO> categoryHobbyC() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyC();
		return dtos;
	}
	
	//카테고리-관심사별(외국/언어)
	public ArrayList<MoimOpenDTO> categoryHobbyD() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyD();
		return dtos;
	}
	
	//카테고리-관심사별(문화/공연)
	public ArrayList<MoimOpenDTO> categoryHobbyE() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyE();
		return dtos;
	}
	
	//카테고리-관심사별(음악/악기)
	public ArrayList<MoimOpenDTO> categoryHobbyF() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyF();
		return dtos;
	}
	
	//카테고리-관심사별(공예/만들기)
	public ArrayList<MoimOpenDTO> categoryHobbyG() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyG();
		return dtos;
	}
	
	//카테고리-관심사별(댄스/무용)
	public ArrayList<MoimOpenDTO> categoryHobbyH() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyH();
		return dtos;
	}
	
	//카테고리-관심사별(봉사활동)
	public ArrayList<MoimOpenDTO> categoryHobbyI() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyI();
		return dtos;
	}
	
	//카테고리-관심사별(사교/인맥)
	public ArrayList<MoimOpenDTO> categoryHobbyJ() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyJ();
		return dtos;
	}
	
	//카테고리-관심사별(차/오토바이)
	public ArrayList<MoimOpenDTO> categoryHobbyK() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyK();
		return dtos;
	}
	
	//카테고리-관심사별(사진)
	public ArrayList<MoimOpenDTO> categoryHobbyL() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyL();
		return dtos;
	}
	
	//카테고리-관심사별(야구관람)
	public ArrayList<MoimOpenDTO> categoryHobbyM() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyM();
		return dtos;
	}
	
	//카테고리-관심사별(게임/오락)
	public ArrayList<MoimOpenDTO> categoryHobbyN() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyN();
		return dtos;
	}
	
	//카테고리-관심사별(요리/제조)
	public ArrayList<MoimOpenDTO> categoryHobbyO() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyO();
		return dtos;
	}
	
	//카테고리-관심사별(반려동물)
		public ArrayList<MoimOpenDTO> categoryHobbyP() {
			ArrayList<MoimOpenDTO> dtos = null;
			SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
			dtos = dao.categoryHobbyP();
			return dtos;
	}
	
	//카테고리-관심사별(가족/결혼)
	public ArrayList<MoimOpenDTO> categoryHobbyQ() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyQ();
		return dtos;
	}	
	
	//카테고리-관심사별(자유주제)
	public ArrayList<MoimOpenDTO> categoryHobbyR() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryHobbyR();
		return dtos;
	}

	
	
	//카테고리-지역별(서울특별시)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationA() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationA();
		return dtos;
	}

	//카테고리-지역별(부산광역시)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationB() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationB();
		return dtos;
	}

	//카테고리-지역별(인천광역시)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationC() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationC();
		return dtos;
	}

	//카테고리-지역별(대구광역시)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationD() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationD();
		return dtos;
	}

	//카테고리-지역별(대전광역시)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationE() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationE();
		return dtos;
	}

	//카테고리-지역별(광주광역시)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationF() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationF();
		return dtos;
	}

	//카테고리-지역별(울산광역시)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationG() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationG();
		return dtos;
	}

	//카테고리-지역별(세종특별자치시)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationH() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationH();
		return dtos;
	}

	//카테고리-지역별(경기도)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationI() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationI();
		return dtos;
	}

	//카테고리-지역별(강원도)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationJ() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationJ();
		return dtos;
	}

	//카테고리-지역별(충청북도)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationK() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationK();
		return dtos;
	}

	//카테고리-지역별(충청남도)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationL() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationL();
		return dtos;
	}

	//카테고리-지역별(경상북도)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationM() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationM();
		return dtos;
	}

	//카테고리-지역별(경상남도)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationN() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationN();
		return dtos;
	}
	
	//카테고리-지역별(전라북도)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationO() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationO();
		return dtos;
	}

	//카테고리-지역별(전라남도)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationP() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationP();
		return dtos;
	}

	//카테고리-지역별(제주특별자치도)
	@Override
	public ArrayList<MoimOpenDTO> categoryLocationQ() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryLocationQ();
		return dtos;
	}

	
	
	//카테고리-규모별(5명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleA() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleA();
		return dtos;
	}

	//카테고리-규모별(10명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleB() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleB();
		return dtos;
	}

	//카테고리-규모별(20명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleC() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleC();
		return dtos;
	}

	//카테고리-규모별(30명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleD() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleD();
		return dtos;
	}

	//카테고리-규모별(40명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleE() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleE();
		return dtos;
	}

	//카테고리-규모별(50명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleF() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleF();
		return dtos;
	}

	//카테고리-규모별(100명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleG() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleG();
		return dtos;
	}

	//카테고리-규모별(150명이하)	
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleH() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleH();
		return dtos;
	}

	//카테고리-규모별(200명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleI() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleI();
		return dtos;
	}

	//카테고리-규모별(250명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleJ() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleJ();
		return dtos;
	}

	//카테고리-규모별(300명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleK() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleK();
		return dtos;
	}

	//카테고리-규모별(350명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleL() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleL();
		return dtos;
	}

	//카테고리-규모별(400명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleM() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleM();
		return dtos;
	}

	//카테고리-규모별(450명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleN() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleN();
		return dtos;
	}

	//카테고리-규모별(500명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleO() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleO();
		return dtos;
	}

	//카테고리-규모별(600명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleP() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleP();
		return dtos;
	}

	//카테고리-규모별(700명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleQ() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleQ();
		return dtos;
	}

	//카테고리-규모별(800명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleR() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleR();
		return dtos;
	}

	//카테고리-규모별(900명이하)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleS() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleS();
		return dtos;
	}

	//카테고리-규모별(1000명이상)
	@Override
	public ArrayList<MoimOpenDTO> categoryScaleT() {
		ArrayList<MoimOpenDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.categoryScaleT();
		return dtos;
	}

	//모임-메인화면
	@Override
	public MoimOpenDTO moimMain(int group_num) {
		MoimOpenDTO dto = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dto = dao.moimMain(group_num);
		return dto;
	}
	
	//모임-모임정보수정처리
	@Override
	public int moimModifyPro(MoimOpenDTO dto) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimModifyPro(dto);
				
		return cnt;
	}

	//모임-모임폐쇄
	@Override
	public int moimDelete(int group_num) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimDelete(group_num);
		
		return cnt;
	}

	//모임사이드-대표사진 등록
	@Override
	public int moimAddImagePro(MainPictureDTO dto) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimAddImagePro(dto);
		
		return cnt;
	}
	
	//모임사이드-모임멤버 상세보기
	@Override
	public MemberInfoDTO moimMemberDetail(String mem_id) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		MemberInfoDTO dto = dao.moimMemberDetail(mem_id);
		return dto;
	}
	
	// 모임 대표사진불러오기
	@Override
	public List<MainPictureDTO> moimImagesView(int group_num) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		return dao.moimImagesView(group_num);
	}

	//모임-소개사진 등록
	@Override
	public int moimAddImageProB(MainPictureDTO dto) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimAddImageProB(dto);
		
		return cnt;
	}
	
	//모임-소개사진 개수 구하기
		public int moimImageCountB(int group_num) {
			int cnt = 0;
			SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
			cnt = dao.moimImageCountB(group_num);
			
			
			return cnt;
		}
	
	//모임-소개사진 불러오기
	@Override
	public ArrayList<MainPictureDTO> moimImageViewB(int group_num) {
		ArrayList<MainPictureDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.moimImageViewB(group_num);
		
		return dtos;
	}

	//모임-가입여부확인
	@Override
	public int memberCheck(CheckPresentDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int cnt = dao.memberCheck(dto);
		
		return cnt;
	}
	
	//모임-출석체크 중복체크
	@Override
	public int checkPresentCount(CheckPresentDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int cnt = dao.checkPresentCount(dto);
	
		return cnt;
	}
	
	//모임-출석체크 입력
	@Override
	public void checkPresent(CheckPresentDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dao.checkPresent(dto);
	}
	
	//모임-회원 권한 설정
	public int groupPer(Map<String, Object> perMap) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int cnt = dao.groupPer(perMap);
		return cnt;
	}
	
	//모임사이드-모임멤버 리스트 불러오기
	@Override
	public ArrayList<MemberInfoDTO> memberList(int group_num) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		ArrayList<MemberInfoDTO> dtos = dao.memberList(group_num);
		
		return dtos;
	}

	//최근접속일 불러오기
	@Override
	public Timestamp lastConnect(Map<String, Object> daoMap) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		Timestamp last_connect = dao.lastConnect(daoMap); 
	
		return last_connect;
	}
	
	//모임채팅방 개설
	@Override
	public void moimChatRegister(int group_num) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dao.moimChatRegister(group_num);
	}
	
	//모임채팅방 번호 받아오기
	@Override
	public int moimChatNum(int group_num) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int chat_room_num = dao.moimChatNum(group_num);
		return chat_room_num;
	}
	
	//모임채팅방 채팅내용 입력
	public int addMsg(MsgListDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int cnt = dao.addMsg(dto);
		
		return cnt;
	}
	
	//모임채팅방 입력한 채팅내용 출력
	public MsgListDTO getMsg(Map<String, Object> map) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		MsgListDTO dto = dao.getMsg(map);
		
		return dto;
	}
	
	//모임채팅방 전체 채팅내용 불러오기
	public ArrayList<MsgListDTO> getMsgs(int chat_room_num) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		ArrayList<MsgListDTO> dtos = dao.getMsgs(chat_room_num);
		
		return dtos;
	}

	
	//모임채팅방 전체채팅내용 실시간 
	public ArrayList<MsgListDTO> getChat(Map<String, Object> map){
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		ArrayList<MsgListDTO> dtos = dao.getChat(map);
		
		return dtos;
	}

	//관심모임 체크
	public int favoriteCheck(InterestGroupDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int cnt = dao.favoriteCheck(dto);
	
		return cnt;
	}
	
	//관심모임 등록
	public int favoriteInsert(InterestGroupDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int cnt = dao.favoriteInsert(dto);
		
		return cnt;
	}
	
	//관심모임 해제
	public int favoriteDelete(InterestGroupDTO dto) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int cnt = dao.favoriteDelete(dto);
		
		return cnt;
	}
	
	//인기모임 목록 조회
	public ArrayList<HotMoimDTO> hotMoim() {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		ArrayList<HotMoimDTO> dtos = dao.hotMoim();
		
		return dtos;
	}
	
	//회원의 관심카테고리 불러오기
	public InterestCatDTO inteCate(String mem_id) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		InterestCatDTO cateDto = dao.inteCate(mem_id);
		
		return cateDto;
	}
	
	//회원의 관심지역 불러오기
	public InterestLocationDTO inteLoca(String mem_id) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		InterestLocationDTO locaDto = dao.inteLoca(mem_id);
		
		return locaDto;
	}
	
	//추천모임 개수 체크
	public int recommendMoimChk(Map<String, Object> daoMap) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		int cnt = dao.recommendMoimChk(daoMap);
		
		return cnt;
	}
	
	//추천모임 리스트
	public ArrayList<MoimOpenDTO> recommendMoim(Map<String, Object> daoMap) {
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		ArrayList<MoimOpenDTO> recommendDtos = dao.recommendMoim(daoMap);
		
		return recommendDtos;
	}
}
