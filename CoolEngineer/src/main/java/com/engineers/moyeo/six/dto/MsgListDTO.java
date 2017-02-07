package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class MsgListDTO {

	//대화번호
	private int msg_num;
	
	//아이디
	private String mem_id;
	
	//대화내용
	private String msg_content;
	
	//작성일
	private Timestamp msg_date;
	
	//대화방번호
	private int chat_room_num;
	
	//프사경로
	private String propic_path;
	
	//프사이름
	private String propic_name;

	public int getMsg_num() {
		return msg_num;
	}

	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public Timestamp getMsg_date() {
		return msg_date;
	}

	public void setMsg_date(Timestamp msg_date) {
		this.msg_date = msg_date;
	}

	public int getChat_room_num() {
		return chat_room_num;
	}

	public void setChat_room_num(int chat_room_num) {
		this.chat_room_num = chat_room_num;
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
