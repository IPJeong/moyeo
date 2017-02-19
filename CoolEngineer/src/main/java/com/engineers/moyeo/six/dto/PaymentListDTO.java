package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class PaymentListDTO {

	//결제번호
	private int payment_num;
	
	//수령자명
	private String receiver_name;
	
	//주소
	private String address;
	
	//핸드폰번호
	private String tel1;
	
	//집번호
	private String tel2;
	
	//배송요구사항
	private String delivery_request;
	
	//결제수단
	private String payment_means;
	
	//결제금액
	private int payment_amount;
	
	//아이디
	private String mem_id;
	
	//제품번호
	private int product_num;
	
	//제품명
	private String product_name;
	
	//제품사진주소
	private String pic_path;
	
	//제품사진명
	private String pic_name;
	
	//제품사진번호
	private int pic_num;
	
	//주문일자
	private Timestamp order_date;
	
	//주문상태
	private String order_status;
	
	//주문수량
	private int order_qty;
	
	public int getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}
	public int getOrder_qty() {
		return order_qty;
	}
	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getDelivery_request() {
		return delivery_request;
	}
	public void setDelivery_request(String delivery_request) {
		this.delivery_request = delivery_request;
	}
	public String getPayment_means() {
		return payment_means;
	}
	public void setPayment_means(String payment_means) {
		this.payment_means = payment_means;
	}
	public int getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(int payment_amount) {
		this.payment_amount = payment_amount;
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
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
	public int getPic_num() {
		return pic_num;
	}
	public void setPic_num(int pic_num) {
		this.pic_num = pic_num;
	}
	public Timestamp getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	
}
