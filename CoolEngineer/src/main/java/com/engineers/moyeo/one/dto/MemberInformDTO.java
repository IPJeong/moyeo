package com.engineers.moyeo.one.dto;

import java.sql.Timestamp;

public class MemberInformDTO {

	private String mem_id; // 아이디
	private String passwd; // 비밀번호
	private String name;   // 이름 
	private String address; // 주소
	private String tel;  // 전화번호
	private Timestamp birth; // 생년월일
	private String email;  // 이메일
	private String propic_path; // 프사경로 
	private String propic_name; // 프사이름
	private Timestamp join_date; // 가입날짜
	private String gender; // 성별
	
	public Timestamp getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
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
	public void setAddress(String adderss) {
		this.address = adderss;
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
	public void setPropic_name(String propci_name) {
		this.propic_name = propci_name;
	}
}
