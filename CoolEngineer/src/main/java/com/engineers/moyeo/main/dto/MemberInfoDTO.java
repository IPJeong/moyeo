package com.engineers.moyeo.main.dto;

import java.sql.Timestamp;

public class MemberInfoDTO {

	String mem_id;
	String passwd;
	String name;
	String address;
	String tel;
	Timestamp birth;
	String email;
	String propic_path;
	String propic_name;
	
	
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
