package com.engineers.moyeo.five.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public interface FiveService {

	// 모임후기 리스트 출력 프로세스
	public String postList(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 등록 프로세스
	public String postPro(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 상세보기
	public String postDetail(Model model) throws NumberFormatException, NullPointerException;
	
	// 모임후기 상세보기(모달창)
	public void getPostDetail(ModelAndView mav) throws NumberFormatException, NullPointerException;
	
	// 모임후기 수정하기
	public void modifyPost(ModelAndView mav) throws NumberFormatException, NullPointerException;
	
	// 모임후기 삭제하기
	public void deletePost(ModelAndView mav) throws NumberFormatException, NullPointerException;
	
	public void likePost(ModelAndView mav, HttpServletRequest req) throws NumberFormatException, NullPointerException;
	
}
