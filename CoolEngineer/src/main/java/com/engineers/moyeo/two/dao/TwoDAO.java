package com.engineers.moyeo.two.dao;

import java.util.ArrayList;
import java.util.Map;

import com.engineers.moyeo.five.dto.MeetingPostDTO;
import com.engineers.moyeo.five.dto.PostPictureDTO;
import com.engineers.moyeo.four.dto.GreetingBoardDTO;
import com.engineers.moyeo.four.dto.GroupNoticeDTO;
import com.engineers.moyeo.one.dto.ProductInfoDTO;
import com.engineers.moyeo.one.dto.SellerInfoDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;
import com.engineers.moyeo.three.dto.MemberDTO;
import com.engineers.moyeo.two.dto.Join_requestDTO;
import com.engineers.moyeo.two.dto.Moim_infoDTO;
import com.engineers.moyeo.two.dto.Place_infoDTO;
import com.engineers.moyeo.two.dto.Place_likeDTO;
import com.engineers.moyeo.two.dto.Rec_placeDTO;
import com.engineers.moyeo.two.dto.StatisticsDTO;
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
	public ArrayList<Place_infoDTO> getPlacePictureList(Map<String, Object> daoMap); //장소사진 리스트
	public int getPlaceMainLocCount(Map<String, Object> daoMap); //지역별 장소검색 결과 개수
	public int getPlaceMainRecplaCount(Map<String, Object> daoMap); //관심사별 장소검색 결과 개수
	public ArrayList<Place_infoDTO> getPlaceLocList(Map<String, Object> daoMap); //지역별 검색 결과에 따른 장소정보 리스트
	public ArrayList<Place_infoDTO> getPlaceLocPictureList(Map<String, Object> daoMap); //지역별 검색 결과에 따른 장소사진 리스트
	public ArrayList<Place_infoDTO> getPlaceRecplaList(Map<String, Object> daoMap); //관심사별 검색 결과에 따른 장소정보 리스트
	public ArrayList<Place_infoDTO> getPlaceRecplaPictureList(Map<String, Object> daoMap); //관심사별 검색 결과에 따른 장소사진 리스트
	public int getPlaceLikeCount(); //추천받은 장소정보의 개수
	public ArrayList<Place_likeDTO> getPlaceLikeList(Map<String, Object> daoMap); //추천받은 장소정보들의 리스트
	public Place_infoDTO readPlace(int place_num); //장소정보 상세보기
	public Place_infoDTO readPlacePicture(int place_num); //장소사진 상세보기
	public int inputPlace(Place_infoDTO piDTO); //장소정보 입력
	public void inputPictures(Place_infoDTO ppdto); //장소사진 입력
	public int getPlaceNum(); //장소정보 테이블에서 가장 최근에 등록한 것의 place_num을 불러옴
	public int deletePlace(int place_num); //장소정보 삭제
	public void deletePlacePicture(int place_num); //장소사진 삭제
	public int modifyPlace(Place_infoDTO dto); //장소정보 수정
	public void modifyPictures(Place_infoDTO ppdto); //장소사진 삭제
	
	//추천장소 후기&추천장소 좋아요
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
	
	//모임 가입&탈퇴
	public Moim_infoDTO readMoimInfo(int group_num); //어떤 모임 하나의 모임 정보를 불러옴 
	public int identifyMoimMember(Map<String, Object> daoMap); //모임에 가입했는지 확인함
	public int moimJoinCheck(Map<String, Object> daoMap); //모임가입 신청을 했는지 확인함
	public int moimBanishCheck(Map<String, Object> daoMap); //모임에서 강제탈퇴된 적이 있는지 확인
	public int checkGroupMemLimit(int group_num); //모임의 정원 제한을 확인
	public int checkGroupMemNumber(int group_num); //모임의 현재 모임원수를 확인
	public int moimJoin(Map<String, Object> daoMap); //모임에 가입신청 처리함
	public String getMoimCheifId(int group_num); //모임장의 아이디를 불러옴
	public int moimWithdraw(Map<String, Object> daoMap); //모임 탈퇴 처리함
	
	//모임 관리(모임장 권한) : 모임원 관리, 가입신청 관리, 게시판 관리
	public int getMoimJoinCount(int group_num); //모임에 가입신청한 사람의 수를 구함
	public ArrayList<Join_requestDTO> getMoimJoinList(Map<String, Object> daoMap); //모임에 가입신청한 사람들의 리스트를 불러옴
	public ArrayList<MemberDTO> getMoimJoinMemberInfoList(Map<String, Object> daoMap); //모임에 가입신청한 사람들의 개인정보를 불러와서 리스트로 보여줌
	public Join_requestDTO getMoimJoinInfo(int request_num); //모임에 가입신청한 사람 한명의 정보를 불러옴
	public void moimJoinOK(Map<String, Object> daoMap); //모임가입 승인 처리함
	public void moimJoinPro(Map<String, Object> daoMap); //모임 가입 승인한 후 모임원 정보 테이블에 등록함
	public void moimJoinNO(Map<String, Object> daoMap); //모임가입 거절 처리함
	public int getMoimMemberCount(int group_num); //모임원수를 구함
	public ArrayList<MyGroupDTO> getMoimMemberList(Map<String, Object> daoMap); //모임원 리스트를 구함
	public ArrayList<MemberDTO> getMoimMemberInfoList(Map<String, Object> daoMap); //모임원들의 개인정보를 불러와서 리스트로 보여줌
	public MyGroupDTO getMoimMemberInfo(int my_group_num); //모임원 정보 테이블의 프리머리 키값을 통해 모임원 정보를 구함
	public MyGroupDTO getMoimMemberInfo2(Map<String, Object> daoMap); //아이디, 모임번호를 통해 모임원 정보를 구함
	public String checkMoimMemberRank(int my_group_num); //모임원의 등급을 확인함
	public int changeMoimMemberRank(Map<String, Object> daoMap); //모임원 등급을 변경함
	public int banishMoimMember(int my_group_num); //모임원을 강제탈퇴시킴
	public void moimJoinOut(Map<String, Object> daoMap); //모임원이 탈퇴하면 모임가입 테이블의 상태를 탈퇴로 변경
	public int getNoticeBoardCount(int group_num); //모임공지 게시판의 게시글수를 불러옴
	public int getGreetingBoardCount(int group_num); //가입인사 게시판의 게시글수를 불러옴
	public int getPostBoardCount(int group_num); //모임후기 게시판의 게시글수를 불러옴
	public ArrayList<GroupNoticeDTO> getNoticeBoardArticles(Map<String, Object> daoMap); //모임공지 게시판의 게시글들의 리스트를 불러옴
	public ArrayList<GreetingBoardDTO> getGreetingBoardArticles(Map<String, Object> daoMap); //가입인사 게시판의 게시글들의 리스트를 불러옴
	public ArrayList<MeetingPostDTO> getPostBoardArticles(Map<String, Object> daoMap); //모임후기 게시판의 게시글들의 리스트를 불러옴
	public int deleteNoticeBoardArticle(Map<String, Object> daoMap); //모임공지 게시판의 게시글들을 삭제함
	public int deleteGreetingBoardArticle(Map<String, Object> daoMap); //가입인사 게시판의 게시글들을 삭제함
	public int deletePostBoardArticle(Map<String, Object> daoMap); //모임후기 게시판의 게시글들을 삭제함
	
	//메인 검색 : 모임, 모임후기, 장소, 추천장소 후기
	public int getMoimSearchCount(Map<String, Object> daoMap); //모임을 검색했을 때 나오는 모임수
	public int getMoimPostSearchCount(Map<String, Object> daoMap); //모임후기를 검색했을 때 나오는 모임수
	public int getPlaceSearchCount(Map<String, Object> daoMap); //장소정보를 검색했을 때 나오는 장소수
	public int getRecPlaceSearchCount(Map<String, Object> daoMap); //추천장소 후기를 검색했을 때 나오는 게시글수 
	public ArrayList<Moim_infoDTO> getMoimSearchList(Map<String, Object> daoMap); //모임을 검색했을 때 나오는 모임들을 리스트로 보여줌
	public ArrayList<Moim_infoDTO> getMoimPictureSearchList(Map<String, Object> daoMap); //모임을 검색했을 때 나오는 모임들의 side 사진을 리스트로 보여줌
	public ArrayList<MeetingPostDTO> getMoimPostSearchList(Map<String, Object> daoMap); //모임훅를 검색했을 때 나오는 게시글들을 리스트로 보여줌
	public ArrayList<PostPictureDTO> getMoimPostPictureSearchList(Map<String, Object> daoMap); //모임후기를 검색했을 때 나오는 게시글들의 사진을 리스트로 보여줌
	public ArrayList<Place_infoDTO> getPlaceSearchList(Map<String, Object> daoMap); //장소를 검색했을 때 나오는 장소 정보들을 리스트로 보여줌
	public ArrayList<Place_infoDTO> getPlacePictureSearchList(Map<String, Object> daoMap); //장소를 검색했을 때 나오는 장소 정보들의 사진을 리스트로 보여줌
	public ArrayList<Rec_placeDTO> getRecPlaceSearchList(Map<String, Object> daoMap); //추천장소 후기를 검색했을 때 나오는 추천장소 후기들을 리스트로 보여줌
	public ArrayList<Rec_placeDTO> getRecPlacePictureSearchList(Map<String, Object> daoMap); //추천장소 후기를 검색했을 때 나오는 추천장소 후기들의 사진을 리스트로 보여줌
	
	//모임 통계 : 모임원, 모임가입, 출석일, 게시글
	public StatisticsDTO chartByGender(int group_num); //성비에 따라 통계 차트를 표시
	public StatisticsDTO chartByAge(int group_num); //연령비에 따라 통계 차트를 표시
	public StatisticsDTO getDate(); //오늘, 일주일, 이주일, 삼주일, 한달 전 날짜를 구함
	public StatisticsDTO chartByArticleOfMonth(int group_num); //한달간 게시글의 조회수에 따라 통계 차트를 표시
	public StatisticsDTO chartByPresentOfMonth(int group_num); //일년간 게시글의 조회수에 따라 통계 차트를 표시
	public StatisticsDTO chartByJoinOfMonth(int group_num); //한달간 모임가입자에 따라 통계 차트를 표시
	public StatisticsDTO chartByArticleOfYear(int group_num); //일년간 모임가입자에 따라 통계 차트를 표시
	public StatisticsDTO chartByPresentOfYear(int group_num); //한달간 모임원의 출석일수에 따라 통계 차트를 표시
	public StatisticsDTO chartByJoinOfYear(int group_num); //일년간 모임원의 출석일수에 따라 통계 차트를 표시
	public int checkBestTenArticle(int group_num); //모임에서 게시글이 존재하는지 여부를 확인
	public int checkBestTenPresent(int group_num); //모임원 중에 출석한 적이 있는지 여부를 확인
	public ArrayList<StatisticsDTO> getBestTenArticle(int group_num); //조회수가 높은 10개의 게시글 리스트를 순서대로 보여줌
	public ArrayList<StatisticsDTO> getBestTenPresent(int group_num); //출석일수가 높은 10명의 모임원의 리스트를 순서대로 보여줌
	
	//상품 검색
	public int getProductSearchCount(Map<String, Object> daoMap); //상품을 검색했을 때 나오는 상품수
	public ArrayList<ProductInfoDTO> getProductSearchList(Map<String, Object> daoMap); //상품을 검색했을 때 나오는 상품들을 리스트로 보여줌
	
	//판매자 정보 수정&삭제
	public int revokeSellerRecognition(Map<String, Object> daoMap); //판매자 자격 박탈
	public int modifySellerInfo(SellerInfoDTO dto); //판매자 정보 수정
	
}
