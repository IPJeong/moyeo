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
	
}
