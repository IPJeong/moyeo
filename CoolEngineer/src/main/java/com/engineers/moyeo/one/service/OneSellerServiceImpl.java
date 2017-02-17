package com.engineers.moyeo.one.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.engineers.moyeo.four.dao.FourDAO;
import com.engineers.moyeo.four.dto.productInfoDTO;
import com.engineers.moyeo.four.dto.productPicDTO;
import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.main.common.FileManager;
import com.engineers.moyeo.main.model.FileForm;
import com.engineers.moyeo.one.dao.OneDAO;
import com.engineers.moyeo.one.dto.ProductInfoDTO;
import com.engineers.moyeo.one.dto.SellerInfoDTO;

@Service
public class OneSellerServiceImpl implements OneSellerService {

	@Autowired
	OneDAO oneDao;
	
	@Autowired
	FourDAO fourDao;
	
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
			
			// 등록된 모든 상품의 정보를 가져옴
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
		
		model.addAttribute("view_page", "moyeoShop");
		
		return "one/shop/moyeoShop";
	}
	
	// 판매샵에 등록된 제품의 상세정보 보기
	@Override
	public String productDetail(Model model) {
		
		return "one/shop/productDetail";
	}

	// 판매샵 판매자페이지 메인화면
	@Override
	public String moyeoSeller(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		
		String mem_id = (String)req.getSession().getAttribute("mem_id");
		String seller_id = mem_id;
		System.out.println(req.getSession().getAttribute("mem_id"));
		System.out.println("seller_id: " + seller_id);
		
		String recognition = oneDao.getRecognition(seller_id);
		System.out.println("recognition: " + recognition);
		
		SellerInfoDTO dto = oneDao.getSellerInformArticle(seller_id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("seller_id", seller_id);
		model.addAttribute("recognition", recognition);
		
		return "one/shop/moyeoSeller";
	}

	@Override
	public String productInsertForm(Model model) {

		return "one/shop/productInsertForm";
	}

	@Override
	public String productInsertPro(Model model) {
		
		Map<String, Object> map = model.asMap();
	    HttpServletRequest req= (HttpServletRequest)map.get("req");
	    
	    System.out.println(req.getParameter("shop_category1"));
	    System.out.println(req.getParameter("shop_category2"));
		String product_cat1 = req.getParameter("shop_category1"); //카테고리1
		String product_cat2 = req.getParameter("shop_category2"); //카테고리2
		
		// 세션값으로 판매하려는 아이디를 가져옴
		String mem_id = (String)(req.getSession().getAttribute("mem_id"));
		
		productInfoDTO dto = new productInfoDTO();
		
		//SELECT로 제품번호 조회 메소드 실행
		int product_num = fourDao.getProductNum();
		dto.setProduct_num(product_num);
		dto.setProduct_name(req.getParameter("product_name"));
		dto.setProduct_price(req.getParameter("product_price"));
		dto.setProduct_qty(Integer.parseInt(req.getParameter("product_qty")));
		dto.setProduct_detail(req.getParameter("product_detail"));
		dto.setSeller_id(mem_id);
		dto.setProduct_cat1(product_cat1);
		dto.setProduct_cat2(product_cat2);
		
		//데이터 메소드 실행
		int cnt = fourDao.productInsert(dto);
		model.addAttribute("cnt", cnt);
		System.out.println(cnt);
		
		// 업로드 파일 객체를 꺼냄
		FileForm fileForm = (FileForm)map.get("fileForm");
		
		// 업로드파일 관리
		List<MultipartFile> files = fileForm.getFiles();
		int pic_cnt = 0;
		
		// 업로드 파일 확인
		for (MultipartFile multipartFile : files) {
			// 업로드된 파일 이름을 받아옴
			String fileName = multipartFile.getOriginalFilename();
			
			if(fileName.trim().length()>4){
				
				String rootPath = Code.rootPath;
				String imgPath = Code.PRODUCT_PATH;
				
				int type = FileManager.checkFileType(fileName);
				String filename = null;
				
				if(type == 1) {
					// 파일을 저장 후 저장된 파일명을 반환
					filename = FileManager.saveFile(multipartFile, rootPath + imgPath, fileName);
					productPicDTO pic_dto = new productPicDTO();
					pic_dto.setProduct_num(product_num);
					pic_dto.setPic_path(Code.PRODUCT_PATHS);	
					pic_dto.setPic_name(filename);
					//사진타입 임시로 1로 지정
					pic_dto.setPic_type(1);
					System.out.println(pic_dto.getPic_name());
					System.out.println(pic_dto.getPic_path());
					System.out.println(pic_dto.getProduct_num());
					
					pic_cnt = fourDao.productPictureInsert(pic_dto); 
				}
			}
			
		}
		model.addAttribute("pic_cnt", pic_cnt);
		
		return "one/shop/productInsertPro";
	}

	@Override
	public String productManage(Model model) {
	
		int pageSize = 8;
		int pageBlock = 3;
		
		int cnt = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		String pageNum = null;
		int currentPage = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		// 해당 판매자가 등록한 모든 제품의 갯수를 불러옴
		cnt = oneDao.getSellerProductCount();
		
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
			Map<String, Object> daoMap = new HashMap<String, Object>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			// 모든 그룹의 정보를 ArrayList에 담는다.
			ArrayList<ProductInfoDTO> dtos = oneDao.getSellerProductInform(daoMap);
			model.addAttribute("dtos", dtos);
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
			
			System.out.println("currentPage: " + currentPage);
		}
		
		return "one/shop/productManage";
	}
	

}
