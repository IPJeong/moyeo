package com.engineers.moyeo.two.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engineers.moyeo.two.dao.TwoDAO;

@Service
public class TwoServiceImpl implements TwoService{

	@Autowired
	TwoDAO twoDao;
}
