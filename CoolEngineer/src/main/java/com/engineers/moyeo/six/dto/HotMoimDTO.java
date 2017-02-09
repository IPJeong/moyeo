package com.engineers.moyeo.six.dto;

public class HotMoimDTO {

	//회원수+모임후기수+출석체크수+가입인사수+모임공지수+모임일정수
	private int cnt;
	
	//그룹번호
	private String group_num;
	
	//그룹이름
	private String group_name;
	
	//그룹관심사1
	private String group_inte1;
	
	//그룹관심사2
	private String group_inte2;
	
	//그룹지역
	private String group_location;

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getGroup_num() {
		return group_num;
	}

	public void setGroup_num(String group_num) {
		this.group_num = group_num;
	}

	public String getGroup_name() {
		return group_name;
	}

	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}

	public String getGroup_inte1() {
		return group_inte1;
	}

	public void setGroup_inte1(String group_inte1) {
		this.group_inte1 = group_inte1;
	}

	public String getGroup_inte2() {
		return group_inte2;
	}

	public void setGroup_inte2(String group_inte2) {
		this.group_inte2 = group_inte2;
	}

	public String getGroup_location() {
		return group_location;
	}

	public void setGroup_location(String group_location) {
		this.group_location = group_location;
	}
}
