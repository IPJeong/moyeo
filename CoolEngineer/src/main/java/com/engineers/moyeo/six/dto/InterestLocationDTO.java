package com.engineers.moyeo.six.dto;

public class InterestLocationDTO {

	//관심지역번호
	private int int_loc_num;
	
	//지역_시
	private String loc_city;
	
	//지역_구
	private String loc_gu;
	
	//아이디
	private String mem_id;

	public int getInt_loc_num() {
		return int_loc_num;
	}

	public void setInt_loc_num(int int_loc_num) {
		this.int_loc_num = int_loc_num;
	}

	public String getLoc_city() {
		return loc_city;
	}

	public void setLoc_city(String loc_city) {
		this.loc_city = loc_city;
	}

	public String getLoc_gu() {
		return loc_gu;
	}

	public void setLoc_gu(String loc_gu) {
		this.loc_gu = loc_gu;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
