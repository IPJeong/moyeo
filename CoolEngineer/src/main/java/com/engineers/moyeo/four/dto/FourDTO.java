package com.engineers.moyeo.four.dto;

import java.sql.Timestamp;

public class FourDTO {
	
	//공지사항 dto
	private int group_noti_num;
	private String group_noti_title;
	private String group_noti_content;
	private Timestamp group_noti_date;
	private int hit;
	private String mem_id;
	private int group_num; 

	//가입인사 게시판
	private int greeting_num;
	private String greeting_title;
	private String greeting_content;  
	private Timestamp greeting_date;
	private int greeting_hit; 
	private int like_num; 

	//가입인사 댓글
	private int gre_reply_num; 
	private String gre_reply_content; 
	private Timestamp gre_reply_date;
	
	
	public int getGroup_noti_num() {
		return group_noti_num;
	}
	public void setGroup_noti_num(int group_noti_num) {
		this.group_noti_num = group_noti_num;
	}
	public String getGroup_noti_title() {
		return group_noti_title;
	}
	public void setGroup_noti_title(String group_noti_title) {
		this.group_noti_title = group_noti_title;
	}
	public String getGroup_noti_content() {
		return group_noti_content;
	}
	public void setGroup_noti_content(String group_noti_content) {
		this.group_noti_content = group_noti_content;
	}
	public Timestamp getGroup_noti_date() {
		return group_noti_date;
	}
	public void setGroup_noti_date(Timestamp group_noti_date) {
		this.group_noti_date = group_noti_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
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

}
