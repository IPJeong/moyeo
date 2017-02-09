package com.engineers.moyeo.one.service;


import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.one.dao.OneDAO;
import com.engineers.moyeo.one.dto.ManagerDTO;
import com.engineers.moyeo.one.dto.QnaBoardDTO;
import com.engineers.moyeo.one.dto.QnaReplyDTO;

@Service
public class OneServiceImpl implements OneService{
	
	@Autowired
	OneDAO oneDao;

	// qna 메인화면
	@Override
	public String qna(Model model) {
		
		int pageSize = 10; 	
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
		

		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		cnt = oneDao.getCount();
		
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
			
			ArrayList<QnaBoardDTO> dtos = oneDao.getArticles(daoMap);
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
		}
		
		return "one/qna/qna";
	}

	// qna 질문 폼
	@Override
	public String qnaWrite(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int qboard_num = 0;
		
		if(req.getParameter("qboard_num") != null) {
			qboard_num = Integer.parseInt(req.getParameter("num"));
		}
		
		// 게시판키를 담는다.
		model.addAttribute("qboard_num", qboard_num);
		
		return "one/qna/qnaWrite";
	}

	// qna 질문 확정요청
	@Override
	public String qnaWritePro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// qna 질문시 제목
		String title = req.getParameter("title");
		// qna 질문시 내용
		String content = req.getParameter("content");
		
		QnaBoardDTO dto = new QnaBoardDTO();
		
		// dto에 질문제목을 담는다.
		dto.setTitle(title);
		
		// dto에 질문내용을 담는다.
		dto.setContent(content);
		
		// dto에 게시판키를 담는다.
		dto.setQboard_num(Integer.parseInt(req.getParameter("qboard_num")));
		
		// dto에 작성일을 담는다.
		dto.setWrite_date(new Timestamp(System.currentTimeMillis()));
		
		// dto에 아이디를 담는다.
		dto.setMem_id((String)req.getSession().getAttribute("mem_id"));
		
		// dto에 담은 내용으로 Q&A게시판에 추가
		int cnt = oneDao.insert(dto);
		
		model.addAttribute("cnt", cnt);
		
		return "one/qna/qnaWritePro";
	}
	
	// qna 질문 세부사항
	@Override
	public String qnaContentForm(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int qboard_num = Integer.parseInt(req.getParameter("qboard_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		QnaBoardDTO dto = oneDao.getArticle(qboard_num);
		
		List<QnaReplyDTO> bdtos = oneDao.getReArticle(qboard_num);
		Map<String, Integer> daoMap = new HashMap<String, Integer>();
		List<ManagerDTO> mdtos = oneDao.getManagerArticles3(daoMap);
		
		oneDao.addReadCnt(qboard_num);
		
		model.addAttribute("qboard_num", qboard_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		model.addAttribute("dto", dto);
		model.addAttribute("bdtos", bdtos);
		model.addAttribute("mdtos", mdtos);
	
		return "one/qna/qnaContentForm";
	}

	// qna 질문 수정폼
	@Override
	public String qnaModifyForm(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int qboard_num = Integer.parseInt(req.getParameter("qboard_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("qboard_num", qboard_num);
		
		QnaBoardDTO dto = oneDao.getArticle(qboard_num);
		model.addAttribute("dto", dto);
		
		model.addAttribute("qboard_num", qboard_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
		return "one/qna/qnaModifyForm";
	}

	// qna 질문수정 확정요청
	@Override
	public String qnaModifyPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int qboard_num = Integer.parseInt(req.getParameter("qboard_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		
		QnaBoardDTO dto = new QnaBoardDTO();
		
		dto.setQboard_num(qboard_num);
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		
		int cnt = oneDao.update(dto);
		
		
		model.addAttribute("qboard_num", qboard_num);
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
		System.out.println("cnt: " + cnt);
		
		return "one/qna/qnaModifyPro";
	}
	
	// qna 질문삭제 확정요청
	@Override
	public String qnaDeletePro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int qboard_num = Integer.parseInt(req.getParameter("qboard_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		System.out.println("qboard_num: " + qboard_num);
		
		
		int deleteCntRe = oneDao.deleteRe(qboard_num);
		//QnaReplyDTO dto = oneDao.getArtReply(qboard_num);; // �떟湲��씠 �엳�쓣 �븣
		int deleteCnt = oneDao.delete(qboard_num); // �떟湲��씠 �뾾�쓣 �븣
		
		req.setAttribute("deleteCnt", deleteCnt);
		req.setAttribute("deleteCntRe", deleteCntRe);
		System.out.println("delete:" + deleteCntRe);
		
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("qboad_num", qboard_num);
		//model.addAttribute("dto", dto);
		
		return "one/qna/qnaDeletePro";
		
	}
	
	// qna 관리자 답변삭제 확정요청
	@Override
	public String qnaAnsDelPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int reply_num = Integer.parseInt(req.getParameter("reply_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int qboard_num = Integer.parseInt(req.getParameter("qboard_num"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		int deleteCnt = oneDao.deleteAnws(reply_num);
		req.setAttribute("deleteCnt", deleteCnt);
		
		System.out.println("deleteCnt: " + deleteCnt);
		
		req.setAttribute("qboard_num", qboard_num);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("number", number);
		
		return "one/qna/qnaAnsDelPro";
	}

	// qna 관리자 답변폼
	@Override
	public String qnaAnswerForm(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int qboard_num = Integer.parseInt(req.getParameter("qboard_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("qboard_num", qboard_num);
		
		QnaBoardDTO dto = oneDao.getArticle(qboard_num);
		model.addAttribute("dto", dto);
		
		model.addAttribute("qboard_num", qboard_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		
		return "one/qna/qnaAnswerForm";
	}

	// qna 관리자 답변확정 폼
	@Override
	public String qnaAnswerPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int qboard_num = Integer.parseInt(req.getParameter("qboard_num"));	
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		String manager_id = (String)req.getSession().getAttribute("manager_id");
		QnaReplyDTO rdto = new QnaReplyDTO();
		
		rdto.setQboard_num(qboard_num);
		rdto.setReply_content(req.getParameter("reply_content"));
		rdto.setManager_id(manager_id);
		rdto.setWrite_date(new Timestamp(System.currentTimeMillis()));
		
		System.out.println(rdto.getQboard_num());
		System.out.println(rdto.getReply_content());
		System.out.println(rdto.getManager_id());
		System.out.println(rdto.getWrite_date());
		
		
		int cnt = oneDao.insertReply(rdto);	
		System.out.println("Rcnt: " + cnt);
	
		
		QnaBoardDTO bdto = new QnaBoardDTO();
		bdto.setQboard_num(qboard_num);
		int cnt2 = oneDao.updateStatus(bdto);
		System.out.println("Bcnt: " + cnt2);
		
		model.addAttribute("qboard_num", qboard_num);
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("rdto", rdto);
		model.addAttribute("number", number);
		System.out.println("number: " + number);
		
			
		System.out.println("cnt: " + cnt);
		
		return "one/qna/qnaAnswerPro";
	}

}
