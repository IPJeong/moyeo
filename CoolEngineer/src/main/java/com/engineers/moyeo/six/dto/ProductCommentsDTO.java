package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class ProductCommentsDTO {

	//상품평 번호
	private int comments_num;
	
	//평가 내용
	private String comments_content;
	
	//상품 평가일
	private Timestamp comments_date;
	
	//별점
	private int star_points;
	
	//제품번호
	private int product_num;
	
	//아이디
	private String mem_id;
	
	//평가 타이틀
	private String comments_title;

	public int getComments_num() {
		return comments_num;
	}

	public void setComments_num(int comments_num) {
		this.comments_num = comments_num;
	}

	public String getComments_content() {
		return comments_content;
	}

	public void setComments_content(String comments_content) {
		this.comments_content = comments_content;
	}

	public Timestamp getComments_date() {
		return comments_date;
	}

	public void setComments_date(Timestamp comments_date) {
		this.comments_date = comments_date;
	}

	public int getStar_points() {
		return star_points;
	}

	public void setStar_points(int star_points) {
		this.star_points = star_points;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getComments_title() {
		return comments_title;
	}

	public void setComments_title(String comments_title) {
		this.comments_title = comments_title;
	}
	
}
