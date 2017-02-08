package com.engineers.moyeo.six.dto;

public class InterestGroupDTO {

	//관심모임번호
	int intergroup_num;
	
	//모임번호
	int group_num;
	
	//아이디
	String mem_id;

	public int getIntergroup_num() {
		return intergroup_num;
	}

	public void setIntergroup_num(int intergroup_num) {
		this.intergroup_num = intergroup_num;
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
