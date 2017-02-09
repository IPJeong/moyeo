package com.engineers.moyeo.four.dto;

import java.sql.Timestamp;

public class GreetingBoardDTO {
	//가입인사 게시판 컬럼들
	private int greeting_num; //가입인사 글번호
	private String greeting_title; //가입인사 글제목 
	private String greeting_content; //가입인사 글 내용
	private Timestamp greeting_date; //가입인사 글쓴 날짜
	private int greeting_hit; //가입인사 조회수 
	private int like_num;  //가입인사 좋아요
 	private String mem_id; //회원 ID 
	private int group_num; //모임 고유번호
	
	public int getGreeting_num() {
		return greeting_num;
	}
	public void setGreeting_num(int greeting_num) {
		this.greeting_num = greeting_num;
	}
	public String getGreeting_title() {
		return greeting_title;
	}
	public void setGreeting_title(String greeting_title) {
		this.greeting_title = greeting_title;
	}
	public String getGreeting_content() {
		return greeting_content;
	}
	public void setGreeting_content(String greeting_content) {
		this.greeting_content = greeting_content;
	}
	public Timestamp getGreeting_date() {
		return greeting_date;
	}
	public void setGreeting_date(Timestamp greeting_date) {
		this.greeting_date = greeting_date;
	}
	public int getGreeting_hit() {
		return greeting_hit;
	}
	public void setGreeting_hit(int greeting_hit) {
		this.greeting_hit = greeting_hit;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
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
