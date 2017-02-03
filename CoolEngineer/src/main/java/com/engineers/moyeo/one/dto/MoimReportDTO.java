package com.engineers.moyeo.one.dto;

import java.sql.Timestamp;

public class MoimReportDTO {
	
	private int report_num; // 신고키
	private String report_title; // 신고제목
	private String report_content; // 신고사유
	private Timestamp report_date; // 작성일
	private String sol_content; // 처리내용
 	private String sol_status; // 처리여부
	private Timestamp sol_date; // 처리날짜
	private String manager_id; // 관리자 아이디
	private String pic_path; // 사진경로
	private String pic_name; // 사진이름
	private String mem_id; // 신고자 아이디
	private int group_num; // 모임번호
	private String group_name; // 그룹이름
	
	
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public String getReport_title() {
		return report_title;
	}
	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public Timestamp getReport_date() {
		return report_date;
	}
	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}
	public String getSol_content() {
		return sol_content;
	}
	public void setSol_content(String sol_content) {
		this.sol_content = sol_content;
	}
	public String getSol_status() {
		return sol_status;
	}
	public void setSol_status(String sol_status) {
		this.sol_status = sol_status;
	}
	public Timestamp getSol_date() {
		return sol_date;
	}
	public void setSol_date(Timestamp sol_date) {
		this.sol_date = sol_date;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getPic_path() {
		return pic_path;
	}
	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
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
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	
	@Override
	public String toString() {
		
		return "[report_num: " + report_num + ", report_title: " + report_title + ", report_content: " + report_content +
				", report_date: " + report_date + ", sol_content: " + sol_content + ", sol_status: " + sol_status + 
				", sol_date: " + sol_date + ", manager_id: " + manager_id + ", pic_path: " + pic_path + ", pic_name: " + pic_name + 
				", mem_id: " + mem_id + ", group_num: " + group_num + ", group_name: " + group_name;
	}
	
	

}
