package com.itwillbs.domain;

import com.google.protobuf.Timestamp;

public class DeliverDTO {
	private String deliver_cd;
	private String business_cd;
	private String order_cd;
	private String product_cd;
	private String product_cd2;
	private Timestamp deliver_date;
	private int deliver_count;
	public String getDeliver_cd() {
		return deliver_cd;
	}
	public void setDeliver_cd(String deliver_cd) {
		this.deliver_cd = deliver_cd;
	}
	public String getBusiness_cd() {
		return business_cd;
	}
	public void setBusiness_cd(String business_cd) {
		this.business_cd = business_cd;
	}
	public String getOrder_cd() {
		return order_cd;
	}
	public void setOrder_cd(String order_cd) {
		this.order_cd = order_cd;
	}
	public String getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}
	public String getProduct_cd2() {
		return product_cd2;
	}
	public void setProduct_cd2(String product_cd2) {
		this.product_cd2 = product_cd2;
	}
	public Timestamp getDeliver_date() {
		return deliver_date;
	}
	public void setDeliver_date(Timestamp deliver_date) {
		this.deliver_date = deliver_date;
	}
	public int getDeliver_count() {
		return deliver_count;
	}
	public void setDeliver_count(int deliver_count) {
		this.deliver_count = deliver_count;
	}
	
	
	


}
