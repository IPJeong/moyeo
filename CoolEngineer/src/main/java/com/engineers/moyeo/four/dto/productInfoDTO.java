package com.engineers.moyeo.four.dto;

public class productInfoDTO {
	int product_num; /* 제품번호 */
	String product_name; /* 제품명 */
	String product_price; /* 제품가격 */
	int product_qty; /* 제품수량 */
	String product_detail; /* 제품설명 */
	String seller_id; /* 판매자아이디 */
	String product_cat1; /*제품분류1*/
	String product_cat2; /*제품분류2*/
	String pic_name; /*제품사진이름*/
	String pic_path; /*제품사진경로*/
	String pic_num; /*제품번호*/
	
	
	public int getProduct_num() {
		return product_num;
	}
	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public int getProduct_qty() {
		return product_qty;
	}
	public void setProduct_qty(int product_qty) {
		this.product_qty = product_qty;
	}
	public String getProduct_detail() {
		return product_detail;
	}
	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}
	public String getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}
	public String getProduct_cat1() {
		return product_cat1;
	}
	public void setProduct_cat1(String product_cat1) {
		this.product_cat1 = product_cat1;
	}
	public String getProduct_cat2() {
		return product_cat2;
	}
	public void setProduct_cat2(String product_cat2) {
		this.product_cat2 = product_cat2;
	}
	public String getPic_name() {
		return pic_name;
	}
	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}
	public String getPic_path() {
		return pic_path;
	}
	public void setPic_path(String pic_path) {
		this.pic_path = pic_path;
	}
	public String getPic_num() {
		return pic_num;
	}
	public void setPic_num(String pic_num) {
		this.pic_num = pic_num;
	}
	
}
