package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class MoimOpenDTO {

	//모임번호
	private int group_num;
	
	//모임명
	private String group_name;
	
	//인원
	private int group_mem_cnt;
	
	//관심사1
	private String group_inte1;
	
	//관심사2
	private String group_inte2;
	
	//지역
	private String group_location;
	
	//모임소개
	private String group_intro;
	
	//모임등록일
	private Timestamp reg_date;
	
	//메인사진 등록 경로
	private String main_pic_path;
	
	//메인사진 등록 이름
	private String main_pic_name;
	
	public int getGroup_num() {
		return group_num;
	}

	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public int getGroup_mem_cnt() {
		return group_mem_cnt;
	}

	public void setGroup_mem_cnt(int group_mem_cnt) {
		this.group_mem_cnt = group_mem_cnt;
	}

	public String getGroup_inte1() {
		return group_inte1;
	}

	public void setGroup_inte1(String group_inte1) {
		this.group_inte1 = group_inte1;
	}

	public String getGroup_inte2() {
		return group_inte2;
	}

	public void setGroup_inte2(String group_inte2) {
		this.group_inte2 = group_inte2;
	}

	public String getGroup_location() {
		return group_location;
	}

	public void setGroup_location(String group_location) {
		this.group_location = group_location;
	}

	public String getGroup_intro() {
		return group_intro;
	}

	public void setGroup_intro(String group_intro) {
		this.group_intro = group_intro;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public String getMain_pic_path() {
		return main_pic_path;
	}

	public void setMain_pic_path(String main_pic_path) {
		this.main_pic_path = main_pic_path;
	}

	public String getMain_pic_name() {
		return main_pic_name;
	}

	public void setMain_pic_name(String main_pic_name) {
		this.main_pic_name = main_pic_name;
	}
}
