package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class MoimScheduleDTO {

	//모임일정 번호
	private int meeting_num;
	
	//모임일정 명
	private String meeting_title;
	
	//모임일정 상세설명
	private String meeting_detail;
	
	//모임일정 장소좌표
	private String meeting_loc;
	
	//모임일정 장소상세설명
	private String loc_detail;
	
	//모임일정 일시
	private Timestamp meeting_date;
	
	//모임 번호
	private int group_num;
	
	//모임일정 비용
	private int meeting_cost;
	
	//모임일정 정원
	private int meeting_pernum;
	
	//모임일정 참여자번호
	private int pre_per_num;
	
	//모임일정 참여자아이디
	private String mem_id;
	
	//모임일정 참여자 숫자
	private int join_num;
	
	public int getMeeting_num() {
		return meeting_num;
	}
	public void setMeeting_num(int meeting_num) {
		this.meeting_num = meeting_num;
	}
	public String getMeeting_title() {
		return meeting_title;
	}
	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
	}
	public String getMeeting_detail() {
		return meeting_detail;
	}
	public void setMeeting_detail(String meeting_detail) {
		this.meeting_detail = meeting_detail;
	}
	public String getMeeting_loc() {
		return meeting_loc;
	}
	public void setMeeting_loc(String meeting_loc) {
		this.meeting_loc = meeting_loc;
	}
	public String getLoc_detail() {
		return loc_detail;
	}
	public void setLoc_detail(String loc_detail) {
		this.loc_detail = loc_detail;
	}
	public Timestamp getMeeting_date() {
		return meeting_date;
	}
	public void setMeeting_date(Timestamp meeting_date) {
		this.meeting_date = meeting_date;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public int getMeeting_cost() {
		return meeting_cost;
	}
	public void setMeeting_cost(int meeting_cost) {
		this.meeting_cost = meeting_cost;
	}
	public int getMeeting_pernum() {
		return meeting_pernum;
	}
	public void setMeeting_pernum(int meeting_pernum) {
		this.meeting_pernum = meeting_pernum;
	}
	public int getPre_per_num() {
		return pre_per_num;
	}
	public void setPre_per_num(int pre_per_num) {
		this.pre_per_num = pre_per_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getJoin_num() {
		return join_num;
	}

}
