package com.engineers.moyeo.one.dto;

import java.sql.Timestamp;

public class QnaBoardDTO {

	private int qboard_num; // 게시판키
	private String title; // 질문제목
	private String content; // 질문내용
	private Timestamp write_date; // 작성일
	private int hit; // 조회수
	private String status; // 답변여부
	private String mem_id; // 아이디
	
	public int getQboard_num() {
		return qboard_num;
	}
	public void setQboard_num(int qboard_num) {
		this.qboard_num = qboard_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
}
