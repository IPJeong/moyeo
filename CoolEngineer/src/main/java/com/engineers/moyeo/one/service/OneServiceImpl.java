package com.engineers.moyeo.one.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engineers.moyeo.one.dao.OneDAO;

@Service
public class OneServiceImpl implements OneService{

	@Autowired
	OneDAO oneDao;
	
	
}
