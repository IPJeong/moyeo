package com.engineers.moyeo.five.dto;

import java.sql.Timestamp;

public class PostReplyDTO {
	
	// 댓글의 번호
	private int postrep_num;
	// 댓글의 내용
	private String reply_content;
	// 댓글 작성일
	private Timestamp write_date;
	// 댓글을 작성한 회원 아이디
	private String mem_id;
	// 달린 댓글의 모임후기 번호
	private int post_num;
	// 작성한 회원의 사진 경로
	private String propic_path;
	// 작성한 회원의 사진 이름
	private String propic_name;
	
	public int getPostrep_num() {
		return postrep_num;
	}
	public void setPostrep_num(int postrep_num) {
		this.postrep_num = postrep_num;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getPropic_path() {
		return propic_path;
	}
	public void setPropic_path(String propic_path) {
		this.propic_path = propic_path;
	}
	public String getPropic_name() {
		return propic_name;
	}
	public void setPropic_name(String propic_name) {
		this.propic_name = propic_name;
	}
	
	
}
