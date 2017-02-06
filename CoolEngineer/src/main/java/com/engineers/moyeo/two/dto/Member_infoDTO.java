package com.engineers.moyeo.two.dto;

import java.sql.Timestamp;

public class Member_infoDTO {
		
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
	
	
}
