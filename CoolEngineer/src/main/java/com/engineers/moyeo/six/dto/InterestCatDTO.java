package com.engineers.moyeo.six.dto;

public class InterestCatDTO {

	//관심사번호
	private int inter_num;
	
	//관심사1차
	private String inter_first;
	
	//관심사2차
	private String inter_second;
	
	//아이디
	private String mem_id;

	public int getInter_num() {
		return inter_num;
	}

	public void setInter_num(int inter_num) {
		this.inter_num = inter_num;
	}

	public String getInter_first() {
		return inter_first;
	}

	public void setInter_first(String inter_first) {
		this.inter_first = inter_first;
	}

	public String getInter_second() {
		return inter_second;
	}

	public void setInter_second(String inter_second) {
		this.inter_second = inter_second;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
