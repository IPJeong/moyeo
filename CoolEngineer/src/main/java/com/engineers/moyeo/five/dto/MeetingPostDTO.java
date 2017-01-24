package com.engineers.moyeo.five.dto;

import java.sql.Timestamp;

public class MeetingPostDTO {

	// 모임후기 글넘버
	int post_num;
	// 모임후기 제목
	String post_title;
	// 모임후기 내용
	String post_content;
	// 모임후기 태그
	String post_tag;
	// 모임후기 작성일
	Timestamp post_date;
	// 좋아요 수
	int like_num;
	// 작성한 회원아이디
	String mem_id;
	// 모임번호
	int group_num;
	
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public String getPost_tag() {
		return post_tag;
	}
	public void setPost_tag(String post_tag) {
		this.post_tag = post_tag;
	}
	public Timestamp getPost_date() {
		return post_date;
	}
	public void setPost_date(Timestamp post_date) {
		this.post_date = post_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
