package com.engineers.moyeo.six.dto;

public class MainPictureDTO {

	//메인사진 등록 번호
	private int main_pic_num;
	
	//메인사진 등록 경로
	private String main_pic_path;
	
	//메인사진 등록 이름
	private String main_pic_name;
	
	//모임번호
	private int group_num;
	
	public int getMain_pic_num() {
		return main_pic_num;
	}
	public void setMain_pic_num(int main_pic_num) {
		this.main_pic_num = main_pic_num;
	}
	public String getMain_pic_path() {
		return main_pic_path;
	}
	public void setMain_pic_path(String main_pic_path) {
		this.main_pic_path = main_pic_path;
	}
	public String getMain_pic_name() {
		return main_pic_name;
	}
	public void setMain_pic_name(String main_pic_name) {
		this.main_pic_name = main_pic_name;
	}
	public int getGroup_num() {
		return group_num;
	}
	public void setGroup_num(int group_num) {
		this.group_num = group_num;
	}
}
