package com.engineers.moyeo.two.dto;

import java.sql.Timestamp;

public class Join_requestDTO {
	public int request_num;
	private Timestamp request_date;
	public String status;
	public String mem_id;
	public int group_num;
	
	public int getRequest_num() {
		return request_num;
	}
	public Timestamp getRequest_date() {
		return request_date;
	}
	public String getStatus() {
		return status;
	}
	public String getMem_id() {
		return mem_id;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setRequest_num(int request_num) {
		this.request_num = request_num;
	}
	public void setRequest_date(Timestamp request_date) {
		this.request_date = request_date;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
}
