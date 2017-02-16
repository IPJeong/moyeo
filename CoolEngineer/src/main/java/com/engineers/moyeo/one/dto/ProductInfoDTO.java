package com.engineers.moyeo.one.dto;

public class ProductInfoDTO {
	private int product_num;   // 제품번호
	private String product_name; // 제품명
	private int product_price; // 제품가격
	private int product_qty; // 제품수량
	private String product_detail; // 제품설명
	private String seller_id; // 판매자 아이디
	private String product_cat1;
	private String product_cat2;
	private int pic_num; /* 사진번호 */
	private String pic_path; /* 사진경로 */
	private String pic_name; /* 사진이름 */
	private int pic_type; /*사진유형*/
	
	
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
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
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
	public int getPic_type() {
		return pic_type;
	}
	public void setPic_type(int pic_type) {
		this.pic_type = pic_type;
	}
}
