package com.engineers.moyeo.three.dto;

import java.sql.Timestamp;

public class ThreeDTO {
	
	private int ctgNum; //카테고리 번호
	private String ctgName; //카테고리 이름
	private int faqNum; //FAQ 게시물 번호
	private String faqTitle; //FAQ 게시물 제목
	private String faqContent; //FAQ 게시물 내용
	private Timestamp faqDate; //FAQ 게시날짜	
	private String ctgName2; //카테고리 이름
	private int ctgNum2; //FAQ 카테고리 번호
	private String adminId;// 관리자아이디
	
	public String getCtgName2() {
		return ctgName2;
	}
	public void setCtgName2(String ctgName2) {
		this.ctgName2 = ctgName2;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public int getCtgNum() {
		return ctgNum;
	}
	public void setCtgNum(int ctgNum) {
		this.ctgNum = ctgNum;
	}
	public String getCtgName() {
		return ctgName;
	}
	public void setCtgName(String ctgName) {
		this.ctgName = ctgName;
	}
	public int getFaqNum() {
		return faqNum;
	}
	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public Timestamp getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(Timestamp faqDate) {
		this.faqDate = faqDate;
	}
	public int getCtgNum2() {
		return ctgNum2;
	}
	public void setCtgNum2(int ctgNum2) {
		this.ctgNum2 = ctgNum2;
	}
	
	
	

}
