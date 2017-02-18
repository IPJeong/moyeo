package com.engineers.moyeo.six.dto;

import java.sql.Timestamp;

public class OrderListDTO {

	//구매번호
	private int order_num;
	
	//구매일
	private Timestamp order_date;
	
	//구매수량
	private int order_qty;
	
	//진행상태
	private String order_status;
	
	//아이디
	private String mem_id;
	
	//제품번호
	private int product_num;
	
	//결제번호
	private int payment_num;

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}

	public int getOrder_qty() {
		return order_qty;
	}

	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
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

	public int getPayment_num() {
		return payment_num;
	}

	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}
}
