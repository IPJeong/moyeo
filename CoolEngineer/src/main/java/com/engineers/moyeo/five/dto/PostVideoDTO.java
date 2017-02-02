package com.engineers.moyeo.five.dto;

public class PostVideoDTO {

	// 동영상 번호
	int video_num;
	// 동영상 저장경로
	String video_path;
	// 동영상파일명
	String video_name;
	// 업로드회원 아이디
	String mem_id;
	// 모임번호
	int group_num;
	// 모임후기 번호
	int post_num;
	
	public int getVideo_num() {
		return video_num;
	}
	public void setVideo_num(int video_num) {
		this.video_num = video_num;
	}
	public String getVideo_path() {
		return video_path;
	}
	public void setVideo_path(String video_path) {
		this.video_path = video_path;
	}
	public String getVideo_name() {
		return video_name;
	}
	public void setVideo_name(String video_name) {
		this.video_name = video_name;
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
