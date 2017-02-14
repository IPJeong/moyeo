package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class SellerInfoDTO {

	//판매자 아이디
	private String seller_id;
	
	//연락처
	private String tel;
	
	//주소
	private String address;
	
	//상호명
	private String comp_name;
	
	//거래은행
	private String bank;
	
	//계좌번호
	private String account_number;
	
	//예금주
	private String depositor;
	
	//신청사유
	private String reason;
	
	//신청일
	private Timestamp reg_date;
	
	//사업자등록증 경로
	private String bc_path;
	
	//사업자등록증 이름
	private String bc_name;
	
	//승인여부
	private String recognition;

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getComp_name() {
		return comp_name;
	}

	public void setComp_name(String comp_name) {
		this.comp_name = comp_name;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public String getDepositor() {
		return depositor;
	}

	public void setDepositor(String depositor) {
		this.depositor = depositor;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public String getBc_path() {
		return bc_path;
	}

	public void setBc_path(String bc_path) {
		this.bc_path = bc_path;
	}

	public String getBc_name() {
		return bc_name;
	}

	public void setBc_name(String bc_name) {
		this.bc_name = bc_name;
	}

	public String getRecognition() {
		return recognition;
	}

	public void setRecognition(String recognition) {
		this.recognition = recognition;
	}
	
	
}
