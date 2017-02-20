package com.engineers.moyeo.one.service;

import org.springframework.ui.Model;

public interface OneSellerService {

	// 메인 판매샵(구매자)
	public String moyeoShop(Model model);
	
	// 메인 판매샵(판매자)
	public String moyeoSeller(Model model);
	
	// 판매샵에 등록된 제품의 상세정보 보기
	public String productDetail(Model model);
	
	// 제품등록 폼
	public String productInsertForm(Model model);
	
	// 제품등록 성공요청
	public String productInsertPro(Model model);
	
	// 제품관리 페이지(판매자)
	public String productManage(Model model);
	
	// 제품정보 수정 폼
	public String productModifyForm(Model model);
	
	// 제품정보 수정요청
	public String productModifyPro(Model model);
}
