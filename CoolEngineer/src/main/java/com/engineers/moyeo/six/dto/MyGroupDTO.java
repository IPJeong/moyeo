package com.engineers.moyeo.six.dto;

public class MyGroupDTO {

	//소속모임번호
	private int my_group_num;
	
	//모임권한
	private int group_per;
	
	//모임번호
	private int group_num;
	
	//아이디
	private String mem_id;

	public int getMy_group_num() {
		return my_group_num;
	}

	public void setMy_group_num(int my_group_num) {
		this.my_group_num = my_group_num;
	}

	public int getGroup_per() {
		return group_per;
	}

	public void setGroup_per(int group_per) {
		this.group_per = group_per;
	}

	public int getGroup_num() {
		return group_num;
	}

	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
