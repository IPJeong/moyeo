package com.engineers.moyeo.three.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.engineers.moyeo.three.dao.ThreeDAO;

@Service
public class ThreeServiceImpl implements ThreeService{

	
	@Autowired
	ThreeDAO threeDao;
}
