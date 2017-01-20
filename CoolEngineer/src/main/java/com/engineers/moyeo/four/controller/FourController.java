package com.engineers.moyeo.four.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.four.service.FourService;

/**
 * 
 * @author 이상준
 *
 */
@RequestMapping("/four")
@Controller
public class FourController {

	@Autowired
	FourService fourService;
	
}
