package com.engineers.moyeo.two.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.two.service.TwoService;


/**
 * 
 * @author 신승우
 *
 */
@RequestMapping("/two")
@Controller
public class TwoController {

	@Autowired
	TwoService twoService;
	
}
