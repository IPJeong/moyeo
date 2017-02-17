package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class ProductQueDTO {

	//문의번호
	private int que_num;
	
	//문의제목
	private String que_title;
	
	//문의내용
	private String que_content;
	
	//문의날짜
	private Timestamp que_date;
	
	//아이디
	private String mem_id;
	
	//제품번호
	private int product_num;
	
	//문의유형
	private String que_type;
	
	//공개여부
	private String visible;

	public int getQue_num() {
		return que_num;
	}

	public void setQue_num(int que_num) {
		this.que_num = que_num;
	}

	public String getQue_title() {
		return que_title;
	}

	public void setQue_title(String que_title) {
		this.que_title = que_title;
	}

	public String getQue_content() {
		return que_content;
	}

	public void setQue_content(String que_content) {
		this.que_content = que_content;
	}

	public Timestamp getQue_date() {
		return que_date;
	}

	public void setQue_date(Timestamp que_date) {
		this.que_date = que_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getQue_type() {
		return que_type;
	}

	public void setQue_type(String que_type) {
		this.que_type = que_type;
	}

	public String getVisible() {
		return visible;
	}

	public void setVisible(String visible) {
		this.visible = visible;
	}
}
