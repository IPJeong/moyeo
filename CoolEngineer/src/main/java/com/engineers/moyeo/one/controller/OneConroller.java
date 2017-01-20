package com.engineers.moyeo.one.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.engineers.moyeo.one.service.OneService;

/**
 * 
 * @author 양우진
 *
 */

@RequestMapping("/one")
@Controller
public class OneConroller {

	@Autowired
	OneService oneService;
	
}
