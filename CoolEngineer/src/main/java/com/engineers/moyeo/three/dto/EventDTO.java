package com.engineers.moyeo.three.dto;

import java.sql.Timestamp;

public class EventDTO {	
	
	private int eventNum; //이벤트 번호
	private int eventNum2; 
	private String eventTitle; //이벤트 이름
	private String eventCon; //이벤트 내용
	private Timestamp regDate; //이벤트등록일
	private Timestamp startDate; //이벤트시작일
	private Timestamp endDate; //이벤트종료일
	private Timestamp notiDate; //이벤트발표일
	private String ing; //이벤트진행여부
	private String adminId; //이벤트 등록자
	private String picPath; //썸네일 이미지 경로
	private String picName; //썸네일 이미지 이름
	private String picPath2; //이벤트 이미지 경로
	private String picName2; //이벤트 이미지 이름
	
	
	public int getEventNum2() {
		return eventNum2;
	}
	public void setEventNum2(int eventNum2) {
		this.eventNum2 = eventNum2;
	}
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventCon() {
		return eventCon;
	}
	public void setEventCon(String eventCon) {
		this.eventCon = eventCon;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public Timestamp getStartDate() {
		return startDate;
	}
	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}
	public Timestamp getEndDate() {
		return endDate;
	}
	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}
	public Timestamp getNotiDate() {
		return notiDate;
	}
	public void setNotiDate(Timestamp notiDate) {
		this.notiDate = notiDate;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public String getPicName() {
		return picName;
	}
	public void setPicName(String picName) {
		this.picName = picName;
	}
	public String getPicPath2() {
		return picPath2;
	}
	public void setPicPath2(String picPath2) {
		this.picPath2 = picPath2;
	}
	public String getPicName2() {
		return picName2;
	}
	public void setPicName2(String picName2) {
		this.picName2 = picName2;
	} 
	
}
