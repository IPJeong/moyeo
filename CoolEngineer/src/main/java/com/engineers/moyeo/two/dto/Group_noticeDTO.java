package com.engineers.moyeo.two.dto;

import java.sql.Timestamp;

public class Group_noticeDTO {
	
	//공지사항 게시판 컬럼들
	private int group_noti_num;
	private String group_noti_title;
	private String group_noti_content;
	private Timestamp group_noti_date;
	private int hit;
	private String mem_id;
	private int group_num;
	
	public int getGroup_noti_num() {
		return group_noti_num;
	}
	public void setGroup_noti_num(int group_noti_num) {
		this.group_noti_num = group_noti_num;
	}
	public String getGroup_noti_title() {
		return group_noti_title;
	}
	public void setGroup_noti_title(String group_noti_title) {
		this.group_noti_title = group_noti_title;
	}
	public String getGroup_noti_content() {
		return group_noti_content;
	}
	public void setGroup_noti_content(String group_noti_content) {
		this.group_noti_content = group_noti_content;
	}
	public Timestamp getGroup_noti_date() {
		return group_noti_date;
	}
	public void setGroup_noti_date(Timestamp group_noti_date) {
		this.group_noti_date = group_noti_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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
