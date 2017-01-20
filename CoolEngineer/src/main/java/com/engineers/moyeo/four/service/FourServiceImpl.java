package com.engineers.moyeo.four.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engineers.moyeo.four.dao.FourDAO;

@Service
public class FourServiceImpl implements FourService{

	@Autowired
	FourDAO fourDao;
	
}
