package com.engineers.moyeo.four.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.four.dao.FourDAO;
import com.engineers.moyeo.four.dto.GreetingBoardDTO;
import com.engineers.moyeo.four.dto.GreetingReplyDTO;
import com.engineers.moyeo.four.dto.GroupNoticeDTO;

@Service
public class FourServiceImpl implements FourService{

	@Autowired
	FourDAO fourDao;
	
	public void memethod() {
		//TextMessage.memGreetingReplyMsg(mem_id, group_name, id);
	}

	//글목록 불러오는 메소드
	@Override
	public String execute(Model model) {
	
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		int pageSize = 5;//한 페이지당 출력할 글 개수
		int pageBlock = 3; //출력할 페이지 개수
		
		int cnt = 0; 		//글 개수
		int start = 0; 		//현재 페이지 시작번호 : rownum
		int end = 0;		//현재 페이지 끝번호 : rownum
		int number = 0;		//출력할 글 번호
		String pageNum = null; //페이지 번호
		int currentPage = 0; //현재 페이지
		
		int pageCount = 0; //페이지 개수
		int startPage = 0; //시작 페이지
		int endPage = 0; //마지막 페이지
		
		//싱글톤, 다형성 적용해서 객체 생성
		/*BoardDAO dao = BoardDAOImpl.getInstance();*/
		
		
		//1. db메소드 실행
		//글 개수 구하기
		cnt = fourDao.getCount();
		
		System.out.println("cnt: " + cnt);
		
		//2. 		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) { //페이지 번호가 없으면, 1로 주겠다
			pageNum = "1"; // 첫 페이지를 1로 주겠다.
		}
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt/pageSize) + (cnt % pageSize > 0 ? 1 : 0);
										//0보다 크면 1로 주고, 아니면 0을 준다.
										//반올림해서 값 맞추기 위함
		start = (currentPage - 1) * pageSize + 1; //(5 - 1) * 10 + 1;
		end = start + pageSize -1; // 41번 + 10 - 1 = 50; 
		
		if(end > cnt) end = cnt;
		
		
		// 글번호
		number = cnt- (currentPage - 1) * pageSize;
		if(cnt > 0) {
			
			//ArrayList<BoardDTO> dtos = dao.getArticles(start, end); //임포트
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			ArrayList<GroupNoticeDTO> dtos = fourDao.getArticles(daoMap);
			System.out.println("dtos: " + dtos);
			
			model.addAttribute("dtos", dtos);
	
		}
		startPage =(currentPage / pageBlock) * pageBlock + 1; //(5/3)*3+1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock; //(5 % 3)
		
		endPage = startPage + pageBlock - 1; //4 + 3 -1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		

		
		if(cnt > 0) {
			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
			

		}
			
		return "/four/notice/moim_notice_board";
	}

	//글 작성 메소드
	@Override
	public String writeExecute(Model model) {

		//Model로부터 맵가져오는 것. 맵의 키를 이용하여 req의 값을 가져오기 위하여.
		Map<String, Object> map = model.asMap();
		
		//Map에서 가져온 값을 req변수에 담는다.
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		return "/four/notice/moim_notice_write_form";
	
	}

	//글 작성 처리 메소드
	@Override
	public String writeproExecute(Model model) {
		//Model로부터 맵가져오는 것. 맵의 키를 이용하여 req의 값을 가져오기 위하여.
		Map<String, Object> map = model.asMap();
		
		//Map에서 가져온 값을 req변수에 담는다.
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		//1. 작은 바구니(=DTO(data transfer object)를 만든다.
		
		GroupNoticeDTO dto = new GroupNoticeDTO();
		//2. 입력받은 내용을 작은 바구니에 담는다.
		System.out.println(req.getParameter("writer"));
		
		//not null인건 모두 데이터 셋팅
		dto.setGroup_noti_title(req.getParameter("title"));
		dto.setGroup_noti_content(req.getParameter("content"));
		dto.setGroup_noti_date(new Timestamp(System.currentTimeMillis()));
		dto.setMem_id("guest");
		dto.setGroup_num(1);
		
		//3. dao객체 생성(싱긑톤, 다형성 적용)
		//BoardDAO dao = BoardDAOImpl.getInstance();
		
		//4.insert
		int cnt = fourDao.insert(dto);
		
		model.addAttribute("cnt", cnt);

		return "/four/notice/moim_notice_writepro";
	}

	
	
	// 글 내용 보는 메소드
	@Override
	public String moimContentExecute(Model model) {
		Map<String, Object> map = model.asMap(); //Ű �� �޾ƿ��� ����
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		

		GroupNoticeDTO dto = fourDao.getArticle(num);
		System.out.println("dto: " + dto);
		
		fourDao.addReadCnt(num);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		model.addAttribute("dto", dto);
		
	
		return "/four/notice/moim_notice_contentform";
	}
	
	//글 수정 폼 메소드
	@Override
	public String moimModifyFormExecute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		
		return "/four/notice/moim_notice_modifyForm";
		
	}

	//글 수정 확인 메소드
	@Override
	public String moimModifyViewExecute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("num", num);
		
		GroupNoticeDTO dto = fourDao.getArticle(num);
		req.setAttribute("dto", dto);
	
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "/four/notice/moim_notice_modifyView";
	}

	//글 수정처리 메소드
	@Override
	public String moimModifyProExecute(Model model) {
	
		
		//Model로부터 맵가져오는 것. 맵의 키를 이용하여 req의 값을 가져오기 위하여.
	    Map<String, Object> map = model.asMap();
	    
	    //Map에서 가져온 값을 req변수에 담는다.
	    HttpServletRequest req= (HttpServletRequest)map.get("req");
	     
	    int num = Integer.parseInt(req.getParameter("group_noti_num"));
		System.out.println(req.getParameter("pageNum"));
	    
	    int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
	    
	    
	    GroupNoticeDTO dto = new GroupNoticeDTO();
	    //2. 입력받은 내용을 작은 바구니에 담는다.
	    System.out.println(req.getParameter("writer"));
	    
	    //not null인건 모두 데이터 셋팅
	    dto.setGroup_noti_num(num);
	    dto.setGroup_noti_title(req.getParameter("title"));
	    dto.setGroup_noti_content(req.getParameter("content"));
	    dto.setGroup_noti_date(new Timestamp(System.currentTimeMillis()));
	    dto.setMem_id("guest");
	    dto.setGroup_num(1);
	    
	    //3. dao객체 생성(싱긑톤, 다형성 적용)
	    //BoardDAO dao = BoardDAOImpl.getInstance();
	    
	    //4.insert
	    int cnt = fourDao.update(dto);
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("cnt", cnt);
	
		
		return "/four/notice/moim_notice_modifypro";
	}

	//글 삭제 폼 메소드
	@Override
	public String moimDeleteExecute(Model model) {
		
		Map<String, Object> map = model.asMap(); 
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		
		return "/four/notice/moim_notice_delete";
		
	}

	//글 삭제 처리 메소드
	@Override
	public String moimDeleteproExecute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		int num = Integer.parseInt(req.getParameter("num")); 
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		Map<String, Object> daoMap= new HashMap<String, Object>();
		daoMap.put("num", num);
		
		int deleteCnt = fourDao.delete(num);
		//테스트
		System.out.println("deleteCnt :" + deleteCnt);
		
		
		req.setAttribute("deleteCnt", deleteCnt);
		
		model.addAttribute("pageNum", pageNum);
		
		return "/four/notice/moim_notice_deletePro";
	}
	
	//가입인사 게시판 - 글개수, 글목록 메소드 처리 
	@Override
	public String greetinglistExecute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		int pageSize = 5;//한 페이지당 출력할 글 개수
		int pageBlock = 3; //출력할 페이지 개수
		
		int cnt = 0; 		//글 개수
		int start = 0; 		//현재 페이지 시작번호 : rownum
		int end = 0;		//현재 페이지 끝번호 : rownum
		int number = 0;		//출력할 글 번호
		String pageNum = null; //페이지 번호
		int currentPage = 0; //현재 페이지
		
		int pageCount = 0; //페이지 개수
		int startPage = 0; //시작 페이지
		int endPage = 0; //마지막 페이지
		
		//싱글톤, 다형성 적용해서 객체 생성
		/*BoardDAO dao = BoardDAOImpl.getInstance();*/
		
		//1. db메소드 실행
		//글 개수 구하기
		cnt = fourDao.greetingGetCount();
		
		System.out.println("cnt: " + cnt);
		
		//2. 		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) { //페이지 번호가 없으면, 1로 주겠다
			pageNum = "1"; // 첫 페이지를 1로 주겠다.
		}
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt/pageSize) + (cnt % pageSize > 0 ? 1 : 0);
										//0보다 크면 1로 주고, 아니면 0을 준다.
										//반올림해서 값 맞추기 위함
		start = (currentPage - 1) * pageSize + 1; //(5 - 1) * 10 + 1;
		end = start + pageSize -1; // 41번 + 10 - 1 = 50; 
		
		if(end > cnt) end = cnt;
		
		
		// 글번호
		number = cnt- (currentPage - 1) * pageSize;
		if(cnt > 0) {
			
			//ArrayList<BoardDTO> dtos = dao.getArticles(start, end); //임포트
			Map<String, Integer> daoMap = new HashMap<String, Integer>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			ArrayList<GreetingBoardDTO> dtos = fourDao.greetingGetArticles(daoMap);
			System.out.println("dtos: " + dtos);
			
			model.addAttribute("dtos", dtos);
	
		}
		startPage =(currentPage / pageBlock) * pageBlock + 1; //(5/3)*3+1 = 4
		if(currentPage % pageBlock == 0) startPage -= pageBlock; //(5 % 3)
		
		endPage = startPage + pageBlock - 1; //4 + 3 -1 = 6;
		if(endPage > pageCount) endPage = pageCount;
		
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if(cnt > 0) {
			
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);

		}
		
		return "/four/greeting_board/moim_greeting_board";
	}

	@Override
	public String greetintwriteExecute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		//Map에서 가져온 값을 req변수에 담는다.
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		
		return "/four/greeting_board/moim_greeting_write_form";
	}

	

	@Override
	public String greetintwriteProExecute(Model model) {
		//Model로부터 맵가져오는 것. 맵의 키를 이용하여 req의 값을 가져오기 위하여.
		Map<String, Object> map = model.asMap();
		
		//Map에서 가져온 값을 req변수에 담는다.
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		//1. 작은 바구니(=DTO(data transfer object)를 만든다.
		
		GreetingBoardDTO dto = new GreetingBoardDTO();
		//2. 입력받은 내용을 작은 바구니에 담는다.
		
		//not null인건 모두 데이터 셋팅
		dto.setGreeting_title(req.getParameter("title"));
	    dto.setGreeting_content(req.getParameter("content"));
	    dto.setGreeting_date(new Timestamp(System.currentTimeMillis()));
	    dto.setMem_id("guest");
	    dto.setGroup_num(1);
	    
		
		//3. dao객체 생성(싱긑톤, 다형성 적용)
		//BoardDAO dao = BoardDAOImpl.getInstance();
		
		//4.insert
		int cnt = fourDao.greetingInsert(dto);
		
		model.addAttribute("cnt", cnt);
		System.out.println("insert cnt:" + cnt);

		return "/four/greeting_board/moim_greeting_writepro";
	}

	@Override
	public String greetingContentExecute(Model model) {
		Map<String, Object> map = model.asMap(); 
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		
		//fourDao.greetingGetArticle(number);
		GreetingBoardDTO dto = fourDao.greetingGetArticle(num);
		
		int number2 = fourDao.getRepleyCnt(num);
		ArrayList<GreetingReplyDTO> dtos = fourDao.replegGetArticles(num);
		
		System.out.println("dto: " + dto);
		//System.out.println("dtos: " + dtos);
		fourDao.greetingAddReadCnt(num);
		
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("number", number);
		model.addAttribute("dto", dto);
		// 댓글개수 카운트
		model.addAttribute("number2", number2);
		
		model.addAttribute("dtos", dtos);
		
		return "/four/greeting_board/moim_greeting_contentform";
	}

	@Override
	public String greetingDeleteExecute(Model model) {
		
		Map<String, Object> map = model.asMap(); 
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		
		return "/four/greeting_board/moim_greeting_delete";
	}

	@Override
	public String greetingDeleteProExecute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		int num = Integer.parseInt(req.getParameter("num")); 
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		Map<String, Object> daoMap= new HashMap<String, Object>();
		daoMap.put("num", num);
		
		int deleteCnt = fourDao.greetingDelete(num);
				
		//테스트
		System.out.println("deleteCnt :" + deleteCnt);
		
		
		req.setAttribute("deleteCnt", deleteCnt);
		
		model.addAttribute("pageNum", pageNum);
		
		return "/four/greeting_board/moim_greeting_deletePro";
	}

	@Override
	public String greetingModifyViewExecute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req= (HttpServletRequest)map.get("req");
		
		int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("num", num);
		
		
		GreetingBoardDTO dto = fourDao.greetingGetArticle(num);
		req.setAttribute("dto", dto);
	
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "/four/greeting_board/moim_greeting_modifyView";
	}

	@Override
	public String greetingModifyProExecute(Model model) {
		//Model로부터 맵가져오는 것. 맵의 키를 이용하여 req의 값을 가져오기 위하여.
	    Map<String, Object> map = model.asMap();
	    
	    //Map에서 가져온 값을 req변수에 담는다.
	    HttpServletRequest req= (HttpServletRequest)map.get("req");
	     
	    int num = Integer.parseInt(req.getParameter("greeting_num"));
		System.out.println(req.getParameter("pageNum"));
	    
	    int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
	    
	    
	    GreetingBoardDTO dto = new GreetingBoardDTO();
	    //2. 입력받은 내용을 작은 바구니에 담는다.
	  
	    
	    
	    //not null인건 모두 데이터 셋팅
	    dto.setGreeting_num(num);
	    dto.setGreeting_title(req.getParameter("title"));
	    dto.setGreeting_content(req.getParameter("content"));
	    dto.setGreeting_date(new Timestamp(System.currentTimeMillis()));
	    dto.setMem_id("guest");
	    dto.setGroup_num(1);
	    
	    
	    
	    //3. dao객체 생성(싱긑톤, 다형성 적용)
	    //BoardDAO dao = BoardDAOImpl.getInstance();
	    
	    //4.insert
	    
	    int cnt = fourDao.greetingUpdate(dto);
	    model.addAttribute("pageNum", pageNum);
	    model.addAttribute("cnt", cnt);
	
		
		return "/four/greeting_board/moim_greeting_modifypro";
	}

	@Override
	public String greeting_repleExecute(Model model) {
		Map<String, Object> map = model.asMap();
	    HttpServletRequest req= (HttpServletRequest)map.get("req");
		
	   System.out.println("1번" + req.getParameter("replecontent"));
	   
	    int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		int greeting_num = Integer.parseInt(req.getParameter("greeting_num"));
		
		
		System.out.println("2번" + req.getParameter("replecontent"));
		
		GreetingReplyDTO dto = new GreetingReplyDTO();
		
		dto.setMem_id((String) req.getSession().getAttribute("mem_id"));
		dto.setGre_reply_content(req.getParameter("replecontent"));
		dto.setGre_reply_date(new Timestamp(System.currentTimeMillis()));
		dto.setGreeting_num(greeting_num);
		
		System.out.println(greeting_num);
		System.out.println("3번" + req.getParameter("replecontent"));
		
		//FourDAO dao = FourDAOImpl.getInstance();
		int cnt = fourDao.repleInsert(dto);
		System.out.println("cnt: " + cnt);
		model.addAttribute("cnt", cnt);
		
		return "redirect:/four/moim_greeting_contentform?num="+num+"&pageNum="+pageNum+"&number="+number;

	}

	@Override
	public String repledeleteExecute(Model model) {
		
		Map<String, Object> map = model.asMap();
	    HttpServletRequest req= (HttpServletRequest)map.get("req");
	   
	    int num = Integer.parseInt(req.getParameter("num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int number = Integer.parseInt(req.getParameter("number"));
		int gre_reply_num = Integer.parseInt(req.getParameter("gre_reply_num"));
		
		int cnt = fourDao.repledelete(gre_reply_num);
		System.out.println("삭제 cnt: " + cnt);
		
		return "redirect:/four/moim_greeting_contentform?num="+num+"&pageNum="+pageNum+"&number="+number;
	}
}
