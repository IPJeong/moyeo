package com.engineers.moyeo.five.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public interface FiveService {

	// 모임후기 리스트 출력 프로세스
	public String postList(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 입력폼 로드
	public String postForm(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 등록 프로세스
	public String postPro(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 수정 프로세스
	public String modifyPostPro(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 상세보기
	public String postDetail(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 수정폼 로드
	public String modifyPost(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 삭제하기
	public String deletePost(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 좋아요 / 좋아요 취소
	public void likePost(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException;
	
	// 모임후기 댓글 등록
	public void addPostReply(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException;
	
	// 모임후기 댓글 삭제
	public void deletePostReply(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException;
	
	// 모임후기 사진리스트 조회
	public String getGroupPictures(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 사진리스트 조회
	public String getGroupVideos(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 바로 조회
	public String postDetailView(Model model) throws NumberFormatException, NullPointerException;
}
