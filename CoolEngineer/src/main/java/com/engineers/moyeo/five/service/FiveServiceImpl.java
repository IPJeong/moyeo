package com.engineers.moyeo.five.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.engineers.moyeo.five.dao.FiveDAO;

@Service
public class FiveServiceImpl implements FiveService{
	
	@Autowired
	FiveDAO fiveDao;
	
	@Override
	public void main(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String postPro() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
