package com.engineers.moyeo.three.dto;

import java.sql.Timestamp;

public class MemberDTO {
		
	private String mem_id;
	private String passwd;
	private String name;
	private String address;
	private String tel;
	private Timestamp birth;
	private String email;
	private String proPicPath;
	private String proPicName;
	private Timestamp joinDate;
	private String gender;
	private String noti_content;
	private Timestamp noti_date;
	
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Timestamp getBirth() {
		return birth;
	}
	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProPicPath() {
		return proPicPath;
	}
	public void setProPicPath(String proPicPath) {
		this.proPicPath = proPicPath;
	}
	public String getProPicName() {
		return proPicName;
	}
	public void setProPicName(String proPicName) {
		this.proPicName = proPicName;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNoti_content() {
		return noti_content;
	}
	public void setNoti_content(String noti_content) {
		this.noti_content = noti_content;
	}
	public Timestamp getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Timestamp noti_date) {
		this.noti_date = noti_date;
	}
	
	
}
