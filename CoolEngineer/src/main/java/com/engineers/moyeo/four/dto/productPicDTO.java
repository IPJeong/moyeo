package com.engineers.moyeo.four.dto;

public class productPicDTO {

	int pic_num; /* 사진번호 */
	String pic_path; /* 사진경로 */
	String pic_name; /* 사진이름 */
	int product_num; /* 제품번호 */
	int pic_type;
	
	public int getPic_num() {
		return pic_num;
	}
	public void setPic_num(int pic_num) {
		this.pic_num = pic_num;
	}
	public String getPic_path() {
		return pic_path;
	}
	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public int getPic_type() {
		return pic_type;
	}
	public void setPic_type(int pic_type) {
		this.pic_type = pic_type;
	}
}
