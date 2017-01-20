package com.engineers.moyeo.three.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.three.service.ThreeService;


/**
 * 
 * @author 홍현호
 *
 */
@RequestMapping("/three")
@Controller
public class ThreeController {

	@Autowired
	ThreeService threeService;
	
	
}
