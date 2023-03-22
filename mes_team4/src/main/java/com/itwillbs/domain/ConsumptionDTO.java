package com.itwillbs.domain;

import java.sql.Date;

public class ConsumptionDTO {
	private int product_cd;
	private String cproduct_cd_name;
	private String cproduct_name;
	private String rproduct_cd_name;
	private String rproduct_name;
	private int consumtion;
	private String consumtion_unit;
	private Date insert_date;
	private Date update_date;
	
	public int getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
	}
	public String getCproduct_cd_name() {
		return cproduct_cd_name;
	}
	public void setCproduct_cd_name(String cproduct_cd_name) {
		this.cproduct_cd_name = cproduct_cd_name;
	}
	public String getCproduct_name() {
		return cproduct_name;
	}
	public void setCproduct_name(String cproduct_name) {
		this.cproduct_name = cproduct_name;
	}
	public String getRproduct_cd_name() {
		return rproduct_cd_name;
	}
	public void setRproduct_cd_name(String rproduct_cd_name) {
		this.rproduct_cd_name = rproduct_cd_name;
	}
	public String getRproduct_name() {
		return rproduct_name;
	}
	public void setRproduct_name(String rproduct_name) {
		this.rproduct_name = rproduct_name;
	}
	public int getConsumtion() {
		return consumtion;
	}
	public void setConsumtion(int consumtion) {
		this.consumtion = consumtion;
	}
	public String getConsumtion_unit() {
		return consumtion_unit;
	}
	public void setConsumtion_unit(String consumtion_unit) {
		this.consumtion_unit = consumtion_unit;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	
	
}// class
