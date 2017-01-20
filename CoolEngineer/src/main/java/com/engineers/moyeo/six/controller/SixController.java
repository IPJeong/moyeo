package com.engineers.moyeo.six.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.six.service.SixService;


/**
 * 
 * @author 하대성
 *
 */
@RequestMapping("/six")
@Controller
public class SixController {

	@Autowired
	SixService sixService;
	
}
