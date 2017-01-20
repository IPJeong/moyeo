package com.engineers.moyeo.five.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.five.service.FiveService;

/**
 * 
 * @author 정일품
 *
 */
@RequestMapping("/five")
@Controller
public class FiveController {
	
	@Autowired
	FiveService fiveService;
	
	
	@RequestMapping("/main")
	public String main(){
		return null;
	}
}
