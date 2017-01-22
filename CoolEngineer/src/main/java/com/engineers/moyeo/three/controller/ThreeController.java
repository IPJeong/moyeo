package com.engineers.moyeo.three.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.three.service.ThreeService;


/**
 * @기능 FAQ와 이벤트관련기능을 수행하는 컨트롤러
 * @author 홍현호
 * @최초작성일 2017.01.20
 * @최종수정일 2017.01.21
 *
 */
@RequestMapping("/three")
@Controller
public class ThreeController {

	@Autowired
	ThreeService threeService;
	
	@RequestMapping("/faq")
	public String faq(HttpServletRequest req, Model model) {
		String viewPage = threeService.faq(model);
		System.out.println("faq()");
		
		return viewPage;
	}
	
}
