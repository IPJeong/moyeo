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
	
	public String moimInfoManaging(Model model);
	public String moimInfoManagingPro(Model model);
	public String moimJoinForm(Model model);
	public String moimJoinPro(Model model);
	public String moimWithdraw(Model model);
	public String moimJoinManaging(Model model);
	public String moimJoinOK(Model model);
	public String moimJoinNO(Model model);
	public String moimMemberManaging(Model model);
	public String moimMemberRankForm(Model model);
	public String moimMemberRankPro(Model model);
	public String moimMemberBanish(Model model);
	public String moimBoardManaging(Model model);
	public String deleteNoticeBoardArticle(Model model);
	public String deleteGreetingBoardArticle(Model model);
	public String deletePostBoardArticle(Model model);

}
