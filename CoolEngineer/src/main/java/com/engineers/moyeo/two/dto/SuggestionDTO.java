package com.engineers.moyeo.two.dto;

import java.sql.Timestamp;

public class SuggestionDTO {
	private int sug_num;
	private String sug_title;
	private String sug_content;
	private Timestamp sug_date;
	private String re_email;
	private String sug_status;
	private String manager_id;
	private String sol_content;
	private Timestamp sol_date;
	private String mem_id;
	
	public int getSug_num() {
		return sug_num;
	}
	public String getSug_title() {
		return sug_title;
	}
	public String getSug_content() {
		return sug_content;
	}
	public Timestamp getSug_date() {
		return sug_date;
	}
	public String getRe_email() {
		return re_email;
	}
	public String getSug_status() {
		return sug_status;
	}
	public String getManager_id() {
		return manager_id;
	}
	public String getSol_content() {
		return sol_content;
	}
	public Timestamp getSol_date() {
		return sol_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setSug_num(int sug_num) {
		this.sug_num = sug_num;
	}
	public void setSug_title(String sug_title) {
		this.sug_title = sug_title;
	}
	public void setSug_content(String sug_content) {
		this.sug_content = sug_content;
	}
	public void setSug_date(Timestamp sug_date) {
		this.sug_date = sug_date;
	}
	public void setRe_email(String re_email) {
		this.re_email = re_email;
	}
	public void setSug_status(String sug_status) {
		this.sug_status = sug_status;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public void setSol_content(String sol_content) {
		this.sol_content = sol_content;
	}
	public void setSol_date(Timestamp sol_date) {
		this.sol_date = sol_date;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
}
