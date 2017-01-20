package com.engineers.moyeo.six.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engineers.moyeo.six.dao.SixDAO;

@Service
public class SixServiceImpl implements SixService{

	@Autowired
	SixDAO sixDao;
	
}
