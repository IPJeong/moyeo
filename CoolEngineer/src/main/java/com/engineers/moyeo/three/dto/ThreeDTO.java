package com.engineers.moyeo.three.dto;

import java.sql.Timestamp;

public class ThreeDTO {
	
	int ctgNum; //카테고리 번호
	String ctgName; //카테고리 이름
	int faqNum; //FAQ 게시물 번호
	String faqTitle; //FAQ 게시물 제목
	String faqContent; //FAQ 게시물 내용
	Timestamp faqDate; //FAQ 게시날짜	
	int ctgNum2; //FAQ 카테고리 번호
	
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
