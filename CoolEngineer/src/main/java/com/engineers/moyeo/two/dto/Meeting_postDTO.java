package com.engineers.moyeo.two.dto;

import java.sql.Timestamp;

public class Meeting_postDTO {

	// 모임후기 글넘버
	private int post_num;
	// 모임후기 제목
	private String post_title;
	// 모임후기 내용
	private String post_content;
	// 모임후기 태그
	private String post_tag;
	// 모임후기 작성일
	private Timestamp post_date;
	// 좋아요 수
	private int like_num;
	// 모임후기 조회수
	private int post_hit;
	// 작성한 회원아이디
	private String mem_id;
	// 모임번호
	private int group_num;
	
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
	public int getPost_hit() {
		return post_hit;
	}
	public void setPost_hit(int post_hit) {
		this.post_hit = post_hit;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	@Override
	public String toString() {
		return "[ post_num : " + post_num + ", post_title : " + post_title + ", post_content : " + post_content + ", post_tag : " + post_tag +
				", post_date : " + post_date +", like_num : " + like_num + ", post_hit : " + post_hit + ", mem_id : " + mem_id + ", group_num : " + group_num;
	}
}
