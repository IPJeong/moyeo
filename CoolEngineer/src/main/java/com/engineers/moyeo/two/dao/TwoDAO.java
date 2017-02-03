package com.engineers.moyeo.two.dao;

import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.two.dto.Greeting_boardDTO;
import com.engineers.moyeo.two.dto.Group_noticeDTO;
import com.engineers.moyeo.two.dto.Join_requestDTO;
import com.engineers.moyeo.two.dto.Meeting_postDTO;
import com.engineers.moyeo.two.dto.Moim_infoDTO;
import com.engineers.moyeo.two.dto.My_groupDTO;
import com.engineers.moyeo.two.dto.Place_infoDTO;
import com.engineers.moyeo.two.dto.Place_picDTO;
import com.engineers.moyeo.two.dto.Rec_placeDTO;
import com.engineers.moyeo.two.dto.SuggestionDTO;

public interface TwoDAO {
	//건의사항
	public int writeSuggestion(SuggestionDTO dto); //회원 : 건의사항 작성
	public int getSuggetionCount(String sug_status); //관리자 : 건의사항 정보의 개수를 파악한다
	public ArrayList<SuggestionDTO> getSuggestionList(Map<String, Object> daoMap); //관리자 : 건의사항 정보들을 받아서 리스트를 본다
	public SuggestionDTO readSuggestion(int sug_num); //관리자 : 건의사항 한개를 읽는다
	public int checkSuggestion(SuggestionDTO dto); //관리자 : 건의사항을 확인하고 확인처리를 한다
	
	//장소정보&장소사진
	public int getPlaceCount(); //장소정보 개수
	public ArrayList<Place_infoDTO> getPlaceList(Map<String, Object> daoMap); //장소정보 리스트
	public ArrayList<Place_picDTO> getPlacePictureList(Map<String, Object> daoMap); //장소사진 리스트
	public int getPlaceMainLocCount(Map<String, Object> daoMap); //지역별 장소검색 결과 숫자
	public int getPlaceMainRecplaCount(Map<String, Object> daoMap); //관심사별 장소검색 결과 숫자
	public ArrayList<Place_infoDTO> getPlaceLocList(Map<String, Object> daoMap); //지역별 검색 결과에 따른 장소정보 리스트
	public ArrayList<Place_picDTO> getPlaceLocPictureList(Map<String, Object> daoMap); //지역별 검색 결과에 따른 장소사진 리스트
	public ArrayList<Place_infoDTO> getPlaceRecplaList(Map<String, Object> daoMap); //관심사별 검색 결과에 따른 장소정보 리스트
	public ArrayList<Place_picDTO> getPlaceRecplaPictureList(Map<String, Object> daoMap); //관심사별 검색 결과에 따른 장소사진 리스트
	public int getPlaceLikeCount(); //추천받은 장소정보의 개수
	public ArrayList<Place_infoDTO> getPlaceLikeList(); //추천받은 장소정보들의 리스트
	public ArrayList<Place_picDTO> getPlaceLikePictureList(); // 추천받은 장소사진들의 리스트
	public Place_infoDTO readPlace(int place_num); //장소정보 상세보기
	public Place_picDTO readPlacePicture(int place_num); //장소사진 상세보기
	public int inputPlace(Place_infoDTO piDTO); //장소정보 입력
	public void inputPictures(Place_picDTO ppdto); //장소사진 입력
	public int getPlaceNum(); //장소정보 테이블에서 가장 최근에 등록한 것의 place_num을 불러옴
	public int deletePlace(int place_num); //장소정보 삭제
	public void deletePlacePicture(int place_num); //장소사진 삭제
	public int modifyPlace(Place_infoDTO dto); //장소정보 수정
	public void modifyPictures(Place_picDTO ppdto); //장소사진 삭제
	
	//추천장소&추천장소 좋아요
	public int getRecPlaceCount(int place_num); //추천장소 게시글의 개수
	public ArrayList<Rec_placeDTO> getRecPlaceList(Map<String, Object> daoMap); //추천장소 게시판
	public Rec_placeDTO readRecPlace(int recplace_num); //추천장소 게시글 상세보기
	public int writeRecPlace(Rec_placeDTO dto); //추천장소 게시글 작성
	public int deleteRecPlace(Map<String, Object> daoMap); //추천장소 게시글 삭제
	public int modifyRecPlace(Rec_placeDTO dto); //추천장소 게시글 수정
	public int readPlaceLike(Map<String, Object> daoMap); //게시글에 추천한 횟수를 불러옴
	public int checkMyPlaceLike(Map<String, Object> daoMap); //내가 추천했는지 확인함
	public int plusPlaceLike(Map<String, Object> daoMap); //추천을 누름
	public int checkPlalikeNum(Map<String, Object> daoMap); //장소좋아요 테이블에서 내가 누른 추천의 plalike_num을 확인함
	public int minusPlaceLike(int plalike_num); //추천을 취소함
	
	public Moim_infoDTO readMoimInfo(int group_num);
	public int modifyMoimInfo(Moim_infoDTO dto);
	public int identifyMoimMember(Map<String, Object> daoMap);
	public int moimJoin(Map<String, Object> daoMap);
	public int moimWithdraw(Map<String, Object> daoMap);
	public int getMoimJoinCount(int group_num);
	public ArrayList<Join_requestDTO> getMoimJoinList(Map<String, Object> daoMap);
	public Join_requestDTO getMoimJoinInfo(int request_num);
	public void moimJoinOK(Map<String, Object> daoMap);
	public void moimJoinPro(Map<String, Object> daoMap);
	public void moimJoinNO(Map<String, Object> daoMap);
	public int getMoimMemberCount(int group_num);
	public ArrayList<My_groupDTO> getMoimMemberList(Map<String, Object> daoMap);
	public My_groupDTO getMoimMemberInfo(int my_group_num);
	public My_groupDTO getMoimMemberInfo2(Map<String, Object> daoMap);
	public int changeMoimMemberRank(Map<String, Object> daoMap);
	public int banishMoimMember(int my_group_num);
	public int getNoticeBoardCount(int group_num);
	public int getGreetingBoardCount(int group_num);
	public int getPostBoardCount(int group_num);
	public ArrayList<Group_noticeDTO> getNoticeBoardArticles(Map<String, Object> daoMap);
	public ArrayList<Greeting_boardDTO> getGreetingBoardArticles(Map<String, Object> daoMap);
	public ArrayList<Meeting_postDTO> getPostBoardArticles(Map<String, Object> daoMap);
	public int deleteNoticeBoardArticle(Map<String, Object> daoMap);
	public int deleteGreetingBoardArticle(Map<String, Object> daoMap);
	public int deletePostBoardArticle(Map<String, Object> daoMap);
}
