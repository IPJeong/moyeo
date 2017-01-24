package com.engineers.moyeo.five.dto;

public class PostPictureDTO {

	// 사진번호
	int pic_num;
	// 사진경로
	String pic_path;
	// 사진이름
	String pic_name;
	// 업로드회원 아이디
	String mem_id;
	// 모임번호
	int group_num;
	// 모임후기번호
	int post_num;
	
	
	public int getPic_num() {
		return pic_num;
	}
	public void setPic_num(int pic_num) {
		this.pic_num = pic_num;
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
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	
	
	
}
