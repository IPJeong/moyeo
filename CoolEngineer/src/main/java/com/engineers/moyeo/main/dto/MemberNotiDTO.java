package com.engineers.moyeo.main.dto;

import java.sql.Date;

public class MemberNotiDTO {

	// 알림번호
	int noti_num;
	// 알림내용
	String noti_content;
	// 알림 확인 여부
	String is_checked;
	// 알림 발생 일자
	Date noti_date;
	// 회원 아이디
	String mem_id;
	
	public int getNoti_num() {
		return noti_num;
	}
	public void setNoti_num(int noti_num) {
		this.noti_num = noti_num;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public String getIs_checked() {
		return is_checked;
	}
	public void setIs_checked(String is_checked) {
		this.is_checked = is_checked;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
}
