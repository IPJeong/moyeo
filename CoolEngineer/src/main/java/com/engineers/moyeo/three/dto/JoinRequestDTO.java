package com.engineers.moyeo.three.dto;

import java.sql.Date;

public class JoinRequestDTO {

	int request_num;
	int group_num;
	Date request_date;
	String status;
	String mem_id;
	String group_name;
	
	public int getRequest_num() {
		return request_num;
	}
	public void setRequest_num(int request_num) {
		this.request_num = request_num;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public Date getRequest_date() {
		return request_date;
	}
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	
}
