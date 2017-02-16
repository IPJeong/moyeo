package com.engineers.moyeo.one.service;

import org.springframework.ui.Model;

public interface OneSellerService {

	// 메인 판매샵(구매자)
	public String moyeoShop(Model model);
	
	// 메인 판매샵(판매자)
	public String moyeoSeller(Model model);
	
	// 판매샵에 등록된 제품의 상세정보 보기
	public String productDetail(Model model);
}
