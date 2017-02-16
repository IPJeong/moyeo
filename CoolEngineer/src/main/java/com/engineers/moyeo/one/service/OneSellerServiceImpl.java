package com.engineers.moyeo.one.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.one.dao.OneDAO;
import com.engineers.moyeo.one.dto.MemberInformDTO;
import com.engineers.moyeo.one.dto.ProductInfoDTO;

@Service
public class OneSellerServiceImpl implements OneSellerService {

	@Autowired
	OneDAO oneDao;
	
	// 메인 판매샵
	public String moyeoShop(Model model) {
		int pageSize = 9;
		int pageBlock = 5;
		
		int cnt = 0;
		int start = 0;
		int end = 9;
		int number = 0;
		String pageNum = null;
		int currentPage = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		cnt = oneDao.getProductCount();
		
		System.out.println("cnt: " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		
		if(cnt > 0) {
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			// 가입한 회원의 정보를 ArrayList에 담는다.
			ArrayList<ProductInfoDTO> dtos = oneDao.getProductArticles(daoMap);
			model.addAttribute("dtos", dtos);
			
			System.out.println("dtos: " + dtos);
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1; // 4 + 3 - 1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("cnt: " + cnt);
		
		if(cnt > 0) {
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
		}
		
		return "one/shop/moyeoShop";
	}
	
	// 판매샵에 등록된 제품의 상세정보 보기
	@Override
	public String productDetail(Model model) {
		
		return "one/shop/productDetail";
	}

	@Override
	public String moyeoSeller(Model model) {
		
		return "one/shop/moyeoSeller";
	}
}
