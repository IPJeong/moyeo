package com.engineers.moyeo.one.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.main.common.Code;
import com.engineers.moyeo.one.dao.OneDAO;
import com.engineers.moyeo.one.dto.ManagerDTO;
import com.engineers.moyeo.one.dto.MemberInformDTO;
import com.engineers.moyeo.six.dto.MainPictureDTO;
import com.engineers.moyeo.six.dto.MoimOpenDTO;
import com.engineers.moyeo.six.dto.MyGroupDTO;

@Service
public class OneManagerServiceImpl implements OneManagerService {

	@Autowired
	OneDAO oneDao;
	
	// 관리자화면 메인
	@Override
	public String managerMain(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		// 관리자의 권한('MASTER'=최고관리자, 'MANAGER'=하위관리자)
		String authority = req.getParameter("authority");
		
		// 관리자의 권한을 담아준다.
		model.addAttribute("authority", authority);
		
		System.out.println(authority);
		
		return "one/manager/managerMain";
	}

	// 회원리스트 불러오기
	@Override
	public String guestList(Model model) {
		
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
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		cnt = oneDao.getManagerCount();
		
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
			ArrayList<MemberInformDTO> dtos = oneDao.gerMemberArticles(daoMap);
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
		
		return "one/manager/guestList";
	}

	// 회원리스트 상세정보 불러오기
	@Override
	public String guestInform(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// 회원의 아이디
		String mem_id = req.getParameter("mem_id");
		
		// 페이지 번호
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		// 회원관리에서의 타입과 모임관리에서의 회원관리의 타입이 나뉨
		String openType = req.getParameter("openType");
		
		// mem_id로 회원정보를 불러옴
		MemberInformDTO dto = oneDao.getMemberInformArticle(mem_id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("openType", openType);
		
		return "one/manager/guestInform";
	}

	// 회원 강퇴하기
	@Override
	public String guestDelete(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		// 회원의 아이디
		String mem_id = req.getParameter("mem_id");
		
		// 회원관리에서의 타입과 모임관리에서의 회원관리의 타입이 나뉨
		String openType = req.getParameter("openType");
		
		int deleteGroupCnt = oneDao.deleteGroup(mem_id);
		
		// mem_id를 이용하여 회원의 정보를 delete함
		int deleteCnt = oneDao.deleteInfo(mem_id);
		
		req.setAttribute("deleteCnt", deleteCnt);
		req.setAttribute("pageNum", pageNum);
		
		System.out.println("삭제된 회원 아이디 : " + mem_id);
		
		if(deleteGroupCnt == 1){
			System.out.println("해당 회원이 모임장인 테이블도 모두 삭제");
		}
		
		req.setAttribute("mem_id", mem_id);
	
		req.setAttribute("openType", openType);
		
		return "one/manager/guestDelete";
	}

	// 관리자 임명하기
	@Override
	public String adminAppoint(Model model) {
		
		return "one/manager/adminAppoint";
	}
	
	// 관리자 임명요청
	@Override
	public String adminAppointPro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// 등록할 관리자 아이디
		String manager_id = req.getParameter("manager_id");
		
		// 등록할 관리자 비밀번호
		String passwd = req.getParameter("passwd");
		String name = req.getParameter("name");
		
		ManagerDTO dto = new ManagerDTO();
		
		// dto에 등록할 관리자의 아이디, 비밀번호, 이름을 넣는다.
		dto.setManager_id(manager_id);
		dto.setPasswd(passwd);
		dto.setName(name);
		dto.setAuthority(Code.authority_2);
		
		System.out.println(manager_id);
		System.out.println(passwd);
		System.out.println(name);
		System.out.println(Code.authority_2);
		
		// dto를 이용하여 입력한 관리자 정보(아이디,비밀번호,이름)을 insert 시켜준다.
		int cnt = oneDao.insertManager(dto);
		
		model.addAttribute("cnt", cnt);
		
		return "one/manager/adminAppointPro";
	}

	// 관리자 삭제
	@Override
	public String adminDelete(Model model) {
		
		int pageSize = 5;
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
		
		// 하위관리자가(권한이 MANAGER) 몇명인지 구함
		cnt = oneDao.getLowManagerCount();
		
		System.out.println("cnt: " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		System.out.println("pageNum: " + pageNum);
		
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
			
			// 권한이 MASTER인 최고관리자 정보를 가져옴
			ArrayList<ManagerDTO> dtos = oneDao.getManagerArticles(daoMap);
			model.addAttribute("dtos", dtos);
			
			// 권한이 MANAGER인 하위관리자 정보를 가져옴
			ArrayList<ManagerDTO> mdtos = oneDao.getManagerArticles2(daoMap);
			model.addAttribute("mdtos", mdtos);
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
			
			System.out.println("cuerrentPage: " + currentPage);
		}
		return "one/manager/adminDelete";
	}
	
	// 관리자 삭제 요청
	@Override
	public String adminDeletePro(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		// manager_id를 불러온다.
		String manager_id = req.getParameter("manager_id");
		
		// 불러온 manager_id를 이용하여 권한이 'MANAGER'인 하위관리자를 삭제한다.
		int deleteCnt = oneDao.deleteManager(manager_id);
		req.setAttribute("deleteCnt", deleteCnt);
		req.setAttribute("pageNum", pageNum);
		
		System.out.println("manager_id: " + manager_id);
		
		req.setAttribute("manager_id", manager_id);
		
		return "one/manager/adminDeletePro";
	}

	// 관리자가 모든 모임 조회
	@Override
	public String moimCheck(Model model) {
		
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
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// 모든 그룹의 리스트를 불러온다.
		cnt = oneDao.getGroupCount();
		
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
			
			// 모든 그룹의 정보를 ArrayList에 담는다.
			ArrayList<MoimOpenDTO> dtos = oneDao.getGroupArticles(daoMap);
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
		
		return "one/manager/moimCheck";
	}

	// 관리자 로그인 폼
	@Override
	public String managerLoginForm(Model model) {
		
		return "one/manager/managerLoginForm";
	}

	// 관리자 로그인 요청
	@Override
	public String managerLoginPro(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		// 입력한 manager_id를 불러온다.
		String manager_id = req.getParameter("manager_id");
		String passwd = req.getParameter("passwd");
		
		Map<String, String> daoMap = new HashMap<String, String>();
		daoMap.put("manager_id", manager_id);
		daoMap.put("passwd", passwd);
		
		// 불러온 manager_id를 이용하여 dto에 담는다.
		String authority = oneDao.getAuthority(manager_id);
		
		System.out.println("authority: " + authority);
		System.out.println(manager_id);
		System.out.println(passwd);
		
		int cnt = oneDao.pwdCheck(daoMap);
		System.out.println("cnt: " + cnt);
		model.addAttribute("cnt", cnt);
		if(cnt == 1) {
			req.getSession().setAttribute("authority", authority);
			req.getSession().setAttribute("manager_id", manager_id);
		} 
		return "one/manager/managerLoginPro";
	}

	// 관리자 권한에서 모임상세보기
	@Override
	public String groupInform(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// 모임상세보기를 위하여 모임번호를 불러온다.
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		System.out.println("pageNum: " + pageNum);
		System.out.println("group_num: " + group_num);
		
		// 모임번호를 이용하여 정보를 가져온다.
		MoimOpenDTO dto = oneDao.getGroupInformArticle(group_num);
		
		// 모임번호를 이용하여 모임메인사진을 가져온다.
		MainPictureDTO pdto = oneDao.getMainPicture(group_num);
		pdto.setMain_pic_path(pdto.getMain_pic_path().replaceAll("-", ""));;
		model.addAttribute("pdto", pdto);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
		
		return "one/manager/groupInform";
	}

	// 관리자 권한에서 모임에 있는 멤버리스트 보기
	@Override
	public String groupMemberInform(Model model) {
		
		int pageSize = 5;
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
		
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		
		// 해당 모임에 있는 멤버가 몇명인지 cnt에 가져온다.
		cnt = oneDao.getMemberCount(group_num);
		
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
			daoMap.put("group_num", group_num);
			ArrayList<MyGroupDTO> dtos = oneDao.getMemberArticles(daoMap);
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
		
		MyGroupDTO ldto = oneDao.moimGroupLeader(group_num);
		MainPictureDTO pdto = oneDao.getMainPicture(group_num);
		
		pdto.setMain_pic_path(pdto.getMain_pic_path().replaceAll("-", ""));
		
		model.addAttribute("ldto", ldto);
		model.addAttribute("pdto", pdto);
		model.addAttribute("group_num", group_num);
		
		return "one/manager/groupMemberInform";
		
	}

	// 관리자 권한에서 그룹 폐쇄시키기
	@Override
	public String groupDelete(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		// 모임번호를 불러온다.
		int group_num = Integer.parseInt(req.getParameter("group_num"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		// 모임번호를 이용하여 해당모임을 폐쇄한다.
		int deleteCnt = oneDao.groupDelete(group_num);

		req.setAttribute("deleteCnt", deleteCnt);
		req.setAttribute("pageNum", pageNum);
		return "one/manager/groupDelete";
	}

	@Override
	public String guestListSearch(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 5;
		int pageBlock = 3;
		
		int start = 0;
		int end = 0;
		int number = 0;
		String pageNum = null;
		int currentPage = 0;
		
		int pageCount = 0;	
		int startPage = 0;	
		int endPage = 0;	
		
		int cnt = 0;
		
		String search_name = req.getParameter("search_name");
		String type = req.getParameter("type");
		System.out.println("type: " + type);
		System.out.println("search_name: " + search_name);
		search_name = search_name.toLowerCase();
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		
		daoMap.put("search", search_name);
		
		if(type.equals("name")){
			cnt = oneDao.getSearchNameCount(daoMap);
		} else {
			cnt = oneDao.getSearchIdCount(daoMap);
		}
		
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
	
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		
		daoMap.put("start", start);
		daoMap.put("end", end);
		
		if(cnt > 0) {
			ArrayList<MemberInformDTO> dtos = null;
			if(type.equals("name")){
				dtos = oneDao.getMemberList(daoMap);
			} else {
				dtos = oneDao.getMemberList2(daoMap);
			}
			
					
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
			
			System.out.println("cuerrentPage: " + currentPage);
		}
		
		return "one/manager/guestList";
	}

	@Override
	public String guestGroupSearch(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize = 5;
		int pageBlock = 3;
		
		int start = 0;
		int end = 0;
		int number = 0;
		String pageNum = null;
		int currentPage = 0;
		
		int pageCount = 0;	
		int startPage = 0;	
		int endPage = 0;	
		
		int cnt = 0;
		
		String search_group = req.getParameter("search_group");
		
		Map<String, Object> daoMap = new HashMap<String, Object>();
		daoMap.put("group_name", search_group);
		
		cnt = oneDao.getSearchGroupCount(daoMap);
		System.out.println("가져온 cnt: " + cnt);
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1; 
		end = start + pageSize -1; 
		
		if(end > cnt) end = cnt;
		
		number = cnt - (currentPage - 1) * pageSize;
		
		daoMap.put("start", start);
		daoMap.put("end", end);
		
		if(cnt > 0) {
			ArrayList<MoimOpenDTO> dtos = oneDao.getGroupList(daoMap);
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
			
			System.out.println("cuerrentPage: " + currentPage);
		}
		
		return "one/manager/moimCheck";
	}

	

}
