package com.engineers.moyeo.main.dao;

import java.util.Map;


public interface MainDAO {

	public int idCheck(String mem_id);
	public int pwdCheck(Map<String, String> map);
}
