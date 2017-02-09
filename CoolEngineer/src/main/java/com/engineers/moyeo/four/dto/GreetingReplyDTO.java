package com.engineers.moyeo.four.dto;

import java.sql.Timestamp;

public class GreetingReplyDTO {
	
	//가입인사 댓글 테이블 컬럼들
	private int gre_reply_num; //가입인사 댓글 번호
	private String gre_reply_content; //가입인사 댓글 내용
	private Timestamp gre_reply_date; //가입인사 댓글 날짜
	private String mem_id; //회원ID
	private int greeting_num; //가입인사 숫자
	
	public int getGre_reply_num() {
		return gre_reply_num;
	}
	public void setGre_reply_num(int gre_reply_num) {
		this.gre_reply_num = gre_reply_num;
	}
	public String getGre_reply_content() {
		return gre_reply_content;
	}
	public void setGre_reply_content(String gre_reply_content) {
		this.gre_reply_content = gre_reply_content;
	}
	public Timestamp getGre_reply_date() {
		return gre_reply_date;
	}
	public void setGre_reply_date(Timestamp gre_reply_date) {
		this.gre_reply_date = gre_reply_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getGreeting_num() {
		return greeting_num;
	}
	public void setGreeting_num(int greeting_num) {
		this.greeting_num = greeting_num;
	}
	
	

}
