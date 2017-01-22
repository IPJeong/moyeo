package com.engineers.moyeo.three.dao;

import java.util.ArrayList;

import com.engineers.moyeo.three.dto.ThreeDTO;

public interface ThreeDAO {
	
	public int getCount(); //카테고리 개수
	public int getCount2(); //FAQ 글 개수
	public ArrayList<ThreeDTO> getCategory();
	public ArrayList<ThreeDTO> getQuestions();

}
