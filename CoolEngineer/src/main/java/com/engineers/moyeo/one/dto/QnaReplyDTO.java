package com.engineers.moyeo.one.dto;

import java.sql.Timestamp;

public class QnaReplyDTO {
	
	private int reply_num;
	private String reply_content;
	private String manager_id;
	private Timestamp write_date;
	private int qboard_num;
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getQboard_num() {
		return qboard_num;
	}
	public void setQboard_num(int qboard_num) {
		this.qboard_num = qboard_num;
	}

}
