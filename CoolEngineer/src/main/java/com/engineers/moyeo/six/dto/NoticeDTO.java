package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class NoticeDTO {

	//공지사항 번호
	private int noti_num;       
	
	//공지사항 제목
	private String noti_title;   
	
	//공지사항 내용
	private String noti_content;   
	
	//공지사항 작성일자
	private Timestamp noti_date;   
	
	//공지사항 조회수
	private int noti_hit;
	
	//공지사항 관리자ID
	private String manager_id;

	public int getNoti_num() {
		return noti_num;
	}
	public void setNoti_num(int noti_num) {
		this.noti_num = noti_num;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public Timestamp getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Timestamp noti_date) {
		this.noti_date = noti_date;
	}
	public int getNoti_hit() {
		return noti_hit;
	}
	public void setNoti_hit(int noti_hit) {
		this.noti_hit = noti_hit;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
}