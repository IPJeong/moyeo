package com.engineers.moyeo.four.dto;

public class like_greetingDTO {
	
	int gre_like_num; //좋아요 수
	String mem_id; //회원ID
	int greeting_num; //모임 고유 번호
	
	public int getGre_like_num() {
		return gre_like_num;
	}
	public void setGre_like_num(int gre_like_num) {
		this.gre_like_num = gre_like_num;
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
