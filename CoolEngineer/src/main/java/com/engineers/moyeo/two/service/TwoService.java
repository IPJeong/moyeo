package com.engineers.moyeo.two.service;

import org.springframework.ui.Model;

public interface TwoService {
	public String suggestionInputPro(Model model); //건의사항 입력 처리(회원)
	public String suggestionList(Model model); //건의사항 리스트(관리자)
	public String suggestionContentForm(Model model); //건의사항 상세보기(관리자)
	public String suggestionCheckPro(Model model); //건의사항 확인 처리(관리자)
	
	public String placeMainLoc(Model model); //장소정보&추천장소 메인페이지1
	public String placeMainLocSearch(Model model); //지역별 장소정보 검색
	public String placeMainRecpla(Model model); //장소정보&추천장소 메인페이지2
	public String placeMainRecplaSearch(Model model); //관심사별 장소정보 검색
	public String placeList(Model model); //전체 장소정보 리스트
	public String placeContentForm(Model model); //장소정보 상세보기&추천장소 게시판
	public String placeInputPro(Model model); //장소정보 입력 처리
	public String placeDeletePro(Model model); //장소정보 삭제 처리
	public String placeModifyForm(Model model); //장소정보 수정 페이지
	public String placeModifyPro(Model model); //장소정보 수정 처리
	
	public String recPlaceContentForm(Model model); //추천장소 게시글 상세보기
	public String recPlaceWriteForm(Model model); //추천장소 게시글 작성 페이지
	public String recPlaceWritePro(Model model); //추천장소 게시글 작성 처리
	public String recPlaceDeletePro(Model model); //추천장소 게시글 삭제 처리
	public String recPlaceModifyForm(Model model); //추천장소 게시글 수정 페이지
	public String recPlaceModifyPro(Model model); //추천장소 게시글 수정 처리
	public String plusPlaceLike(Model model); //추천장소 게시글에 추천 누름
	public String minusPlaceLike(Model model); //추천장소 게시글에서 추천을 취소함

	public String moimJoinForm(Model model); //모임가입 페이지
	public String moimJoinPro(Model model); //모임가입 처리
	public String moimWithdraw(Model model); //모임탈퇴 처리
	public String moimJoinManaging(Model model); //모임가입 관리 페이지(모임장)
	public String moimJoinOK(Model model); //모임가입 수락(모임장)
	public String moimJoinNO(Model model); //모임가입 거절(모임장)
	public String moimMemberManaging(Model model); //모임원 관리 페이지(모임장)
	public String moimMemberRankForm(Model model); //모임원 등급변경 페이지(모임장)
	public String moimMemberRankPro(Model model); //모임원 등급변경 처리(모임장)
	public String moimMemberBanish(Model model); //모임원 강제탈퇴(모임장)
	public String moimBoardManaging(Model model); //모임 게시판 관리 페이지(모임장)
	public String deleteNoticeBoardArticle(Model model); //모임공지 게시판의 게시글 삭제(모임장)
	public String deleteGreetingBoardArticle(Model model); //가입인사 게시판의 게시글 삭제(모임장)
	public String deletePostBoardArticle(Model model); //모임후기 게시판의 게시글 삭제(모임장)
	
	public String mainSearch(Model model); //메인페이지 검색기능
	
	public String moimStatistics(Model model);
	public String moimStatisticsArticle(Model model);
	public String moimStatisticsPresent(Model model);

}
