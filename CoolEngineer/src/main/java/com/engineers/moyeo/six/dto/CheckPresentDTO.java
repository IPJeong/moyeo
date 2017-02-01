package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class CheckPresentDTO {

	//출석번호
	private int present_num;
	
	//날짜
	private Timestamp present_date;
	
	//아이디
	private String mem_id;
	
	//모임번호
	private int group_num;

	public int getPresent_num() {
		return present_num;
	}

	public void setPresent_num(int present_num) {
		this.present_num = present_num;
	}

	public Timestamp getPresent_date() {
		return present_date;
	}

	public void setPresent_date(Timestamp present_date) {
		this.present_date = present_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getGroup_num() {
		return group_num;
	}

	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
}
