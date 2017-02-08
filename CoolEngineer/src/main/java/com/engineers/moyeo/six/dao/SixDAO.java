package com.engineers.moyeo.six.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.engineers.moyeo.six.dto.CheckPresentDTO;
import com.engineers.moyeo.six.dto.InterestGroupDTO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MemberInfoDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.MoimScheduleDTO;
import com.engineers.moyeo.six.dto.MsgListDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;
import com.engineers.moyeo.six.dto.NoticeDTO;


public interface SixDAO {

	//공지-글개수 구하기
	public int getCount(); 
	
	//공지-게시글리스트 불러오기
	public ArrayList<NoticeDTO> getArticles(Map<String, Integer> daoMap); 
	
	//공지-게시글리스트(메인용)
	public ArrayList<NoticeDTO> getArticles_main();
	
	//공지-상세글정보
	public NoticeDTO getArticle(int num); 
	
	//공지-조회수 증가
	public void addReadCnt(int intNum); 
	
	//공지-글작성
	public int insert(NoticeDTO dto);
	
	//공지-글수정
	public int update(NoticeDTO dto);
	
	//공지-글삭제
	public int delete(int num);
	
	
	
	//모임일정-일정 개수 구하기
	public int moimScheduleCount(int group_num);
	
	//모임일정-일정 리스트 
	public ArrayList<MoimScheduleDTO> moimScheduleDetail(Map<String, Integer> daoMap);
	
	//모임일정-상세정보
	public MoimScheduleDTO moimScheduleContents(int num);
	
	//모임일정-등록
	public int moimRegister(MoimScheduleDTO dto);
	
	//모임일정-수정
	public int moimScheduleModify(MoimScheduleDTO dto);
	
	//모임일정-삭제
	public int moimScheduleDelete(int num);
	
	//모임일정-참석여부확인
	public int moimScheduleJoinCheck(MoimScheduleDTO dto);
	
	//모임일정-참석신청
	public int moimScheduleJoin(MoimScheduleDTO dto);

	//모임일정-참석취소
	public int moimScheduleCancel(MoimScheduleDTO dto);
	
	//모임일정-참석인원 확인
	public int moimScheduleCheck(int num);
	
	//모임일정-참석회원 아이디 조회
	public ArrayList<MoimScheduleDTO> moimScheduleMember(int num);

	
	
	//모임-개설번호 받아오기
	public int moimOpenNum();
	
	//모임-개설
	public int moimOpenPro(MoimOpenDTO dto);
	
	//모임-모임장등록
	public void moimLeaderRegister(MyGroupDTO dto);
	
	//모임-기본 사진 설정(사이드)
	public void moimSidePhoto(MainPictureDTO dto);

	//모임-기본 사진 설정(메인)
	public void moimMainPhoto(MainPictureDTO dto);
	
	//카테고리-관심사별(아웃도어/여행)
	public ArrayList<MoimOpenDTO> categoryHobbyA();
	
	//카테고리-관심사별(운동/스포츠)
	public ArrayList<MoimOpenDTO> categoryHobbyB();

	//카테고리-관심사별(인문학/책/글)
	public ArrayList<MoimOpenDTO> categoryHobbyC();

	//카테고리-관심사별(외국/언어)
	public ArrayList<MoimOpenDTO> categoryHobbyD();
	
	//카테고리-관심사별(문화/공연)
	public ArrayList<MoimOpenDTO> categoryHobbyE();
	
	//카테고리-관심사별(음악/악기)
	public ArrayList<MoimOpenDTO> categoryHobbyF();
	
	//카테고리-관심사별(공예/만들기)
	public ArrayList<MoimOpenDTO> categoryHobbyG();
	
	//카테고리-관심사별(댄스/무용)
	public ArrayList<MoimOpenDTO> categoryHobbyH();
	
	//카테고리-관심사별(봉사활동)
	public ArrayList<MoimOpenDTO> categoryHobbyI();
	
	//카테고리-관심사별(사교/인맥)
	public ArrayList<MoimOpenDTO> categoryHobbyJ();
	
	//카테고리-관심사별(차/오토바이)
	public ArrayList<MoimOpenDTO> categoryHobbyK();
	
	//카테고리-관심사별(사진)
	public ArrayList<MoimOpenDTO> categoryHobbyL();
	
	//카테고리-관심사별(야구관람)
	public ArrayList<MoimOpenDTO> categoryHobbyM();
	
	//카테고리-관심사별(게임/오락)
	public ArrayList<MoimOpenDTO> categoryHobbyN();
	
	//카테고리-관심사별(요리/제조)
	public ArrayList<MoimOpenDTO> categoryHobbyO();
	
	//카테고리-관심사별(반려동물)
	public ArrayList<MoimOpenDTO> categoryHobbyP();
	
	//카테고리-관심사별(가족/결혼)
	public ArrayList<MoimOpenDTO> categoryHobbyQ();
	
	//카테고리-관심사별(자유주제)
	public ArrayList<MoimOpenDTO> categoryHobbyR();
	
	
	
	//카테고리-지역별(서울특별시)
	public ArrayList<MoimOpenDTO> categoryLocationA();
	
	//카테고리-지역별(부산광역시)
	public ArrayList<MoimOpenDTO> categoryLocationB();

	//카테고리-지역별(인천광역시)
	public ArrayList<MoimOpenDTO> categoryLocationC();

	//카테고리-지역별(대구광역시)
	public ArrayList<MoimOpenDTO> categoryLocationD();
	
	//카테고리-지역별(대전광역시)
	public ArrayList<MoimOpenDTO> categoryLocationE();
	
	//카테고리-지역별(광주광역시)
	public ArrayList<MoimOpenDTO> categoryLocationF();
	
	//카테고리-지역별(울산광역시)
	public ArrayList<MoimOpenDTO> categoryLocationG();
	
	//카테고리-지역별(세종특별자치시)
	public ArrayList<MoimOpenDTO> categoryLocationH();
	
	//카테고리-지역별(경기도)
	public ArrayList<MoimOpenDTO> categoryLocationI();
	
	//카테고리-지역별(강원도)
	public ArrayList<MoimOpenDTO> categoryLocationJ();
	
	//카테고리-지역별(충청북도)
	public ArrayList<MoimOpenDTO> categoryLocationK();
	
	//카테고리-지역별(충청남도)
	public ArrayList<MoimOpenDTO> categoryLocationL();
	
	//카테고리-지역별(경상북도)
	public ArrayList<MoimOpenDTO> categoryLocationM();
	
	//카테고리-지역별(경상남도)
	public ArrayList<MoimOpenDTO> categoryLocationN();
	
	//카테고리-지역별(전라북도)
	public ArrayList<MoimOpenDTO> categoryLocationO();
	
	//카테고리-지역별(전라남도)
	public ArrayList<MoimOpenDTO> categoryLocationP();
	
	//카테고리-지역별(제주특별자치도)
	public ArrayList<MoimOpenDTO> categoryLocationQ();
	
	
	
	//카테고리-규모별(5명이하)
	public ArrayList<MoimOpenDTO> categoryScaleA();
	
	//카테고리-규모별(10명이하)
	public ArrayList<MoimOpenDTO> categoryScaleB();

	//카테고리-규모별(20명이하)
	public ArrayList<MoimOpenDTO> categoryScaleC();

	//카테고리-규모별(30명이하)
	public ArrayList<MoimOpenDTO> categoryScaleD();
	
	//카테고리-규모별(40명이하)
	public ArrayList<MoimOpenDTO> categoryScaleE();
	
	//카테고리-규모별(50명이하)
	public ArrayList<MoimOpenDTO> categoryScaleF();
	
	//카테고리-규모별(100명이하)
	public ArrayList<MoimOpenDTO> categoryScaleG();
	
	//카테고리-규모별(150명이하)
	public ArrayList<MoimOpenDTO> categoryScaleH();
	
	//카테고리-규모별(200명이하)
	public ArrayList<MoimOpenDTO> categoryScaleI();
	
	//카테고리-규모별(250명이하)
	public ArrayList<MoimOpenDTO> categoryScaleJ();
	
	//카테고리-규모별(300명이하)
	public ArrayList<MoimOpenDTO> categoryScaleK();
	
	//카테고리-규모별(350명이하)
	public ArrayList<MoimOpenDTO> categoryScaleL();
	
	//카테고리-규모별(400명이하)
	public ArrayList<MoimOpenDTO> categoryScaleM();
	
	//카테고리-규모별(450명이하)
	public ArrayList<MoimOpenDTO> categoryScaleN();
	
	//카테고리-규모별(500명이하)
	public ArrayList<MoimOpenDTO> categoryScaleO();
	
	//카테고리-규모별(600명이하)
	public ArrayList<MoimOpenDTO> categoryScaleP();
	
	//카테고리-규모별(700명이하)
	public ArrayList<MoimOpenDTO> categoryScaleQ();
	
	//카테고리-규모별(800명이하)
	public ArrayList<MoimOpenDTO> categoryScaleR();
	
	//카테고리-규모별(900명이하)
	public ArrayList<MoimOpenDTO> categoryScaleS();

	//카테고리-규모별(1000명이상)
	public ArrayList<MoimOpenDTO> categoryScaleT();

	
	//모임-메인화면
	public MoimOpenDTO moimMain(int group_num);
	
	//모임사이드-모임정보수정처리
	public int moimModifyPro(MoimOpenDTO dto);
	
	//모임사이드-모임폐쇄
	public int moimDelete(int group_num);
	
	//모임사이드-대표사진 등록
	public int moimAddImagePro(MainPictureDTO dto);
	
	//모임사이드-모임멤버 상세보기
	public MemberInfoDTO moimMemberDetail(String mem_id);
	
	//모임-사이드 사진 불러오기
	public List<MainPictureDTO> moimImagesView(int group_num);
	
	
	//모임-소개사진 등록
	public int moimAddImageProB(MainPictureDTO dto);
	
	//모임-소개사진 개수 구하기
	public int moimImageCountB(int group_num);
	
	//모임-소개사진 불러오기
	public ArrayList<MainPictureDTO> moimImageViewB(int group_num);
	
	//모임-가입여부확인
	public int memberCheck(CheckPresentDTO dto);
	
	//모임-출석체크 중복체크
	public int checkPresentCount(CheckPresentDTO dto);
	
	//모임-출석체크 입력
	public void checkPresent(CheckPresentDTO dto);
	
	//모임-회원 권한 설정
	public int groupPer(Map<String, Object> perMap);
	
	//모임사이드-모임멤버 리스트 불러오기
	public ArrayList<MemberInfoDTO> memberList(int group_num);

	//최근접속일 불러오기
	public Timestamp lastConnect(Map<String, Object> daoMap);
	
	//모임 채팅방 개설
	public void moimChatRegister(int group_num);
	
	//모임채팅방 번호 받아오기
	public int moimChatNum(int group_num);
	
	//모임채팅방 채팅내용 입력
	public int addMsg(MsgListDTO dto);
	
	//모임채팅방 입력한채팅내용 불러오기
	public MsgListDTO getMsg(Map<String, Object> map);
	
	//모임채팅방 전체채팅내용 불러오기
	public List<MsgListDTO> getMsgs(int chat_room_num);

	//모임채팅방 채팅내용 실시간 불러오기
	public ArrayList<MsgListDTO> getChat(Map<String, Object> map);

	//관심모임 체크
	public int favoriteCheck(InterestGroupDTO dto);

	//관심모임 등록
	public int favoriteInsert(InterestGroupDTO dto);
	
	//관심모임 해제
	public int favoriteDelete(InterestGroupDTO dto);
}
