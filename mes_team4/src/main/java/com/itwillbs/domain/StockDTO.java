package com.itwillbs.domain;

public class StockDTO {

	private String stock_cd;
	private String wh_cd;
	private String rec_schedule_cd;
	private String product_cd;
	private int stock_count;
	
	
	public String getStock_cd() {
		return stock_cd;
	}
	public void setStock_cd(String stock_cd) {
		this.stock_cd = stock_cd;
	}
	public String getWh_cd() {
		return wh_cd;
	}
	public void setWh_cd(String wh_cd) {
		this.wh_cd = wh_cd;
	}
	public String getRec_schedule_cd() {
		return rec_schedule_cd;
	}
	public void setRec_schedule_cd(String rec_schedule_cd) {
		this.rec_schedule_cd = rec_schedule_cd;
	}
	public String getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}
	public int getStock_count() {
		return stock_count;
	}
	public void setStock_count(int stock_count) {
		this.stock_count = stock_count;
	}

}
