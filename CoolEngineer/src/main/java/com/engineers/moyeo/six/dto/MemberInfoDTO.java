package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class MemberInfoDTO {

	//모임권한
	private String group_per;
	
	//아이디
	private String mem_id;
	
	//비밀번호
	private String passwd;

	//이름
	private String name;
	
	//주소
	private String address;
	
	//연락처
	private String tel;
	
	//생년월일
	private Timestamp birth;
	
	//이메일
	private String email;
	
	//프사경로
	private String propic_path;
	
	//프사이름
	private String propic_name;
	
	//가입일
	private String join_date;
	
	//성별
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

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGroup_per() {
		return group_per;
	}

	public void setGroup_per(String group_per) {
		this.group_per = group_per;
	}
	
}
