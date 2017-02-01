package com.engineers.moyeo.six.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.engineers.moyeo.six.dto.CheckPresentDTO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.MoimScheduleDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;
import com.engineers.moyeo.six.dto.NoticeDTO;
import com.engineers.moyeo.three.dao.ThreeDAO;
import com.engineers.moyeo.three.dto.ThreeDTO;

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
		System.out.println(cnt);

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
	
	//모임일정-메인에 일정 리스트 불러오기
	public ArrayList<MoimScheduleDTO> moimSchedule(int group_num) {
		ArrayList<MoimScheduleDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.moimSchedule(group_num);
		
		return dtos;
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

	//모임-대표사진 등록
	@Override
	public int moimAddImagePro(MainPictureDTO dto) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimAddImagePro(dto);
		
		return cnt;
	}
	
	//모임-대표사진 개수 구하기
	@Override
	public int moimImageCount(int group_num) {
		int cnt = 0;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		cnt = dao.moimImageCount(group_num);
		
		return cnt;
	}
	
	//모임-대표사진 불러오기
	@Override
	public ArrayList<MainPictureDTO> moimImageView(int group_num) {
		ArrayList<MainPictureDTO> dtos = null;
		SixDAO dao = this.sqlSession.getMapper(SixDAO.class);
		dtos = dao.moimImageView(group_num);
		
		return dtos;
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
}
