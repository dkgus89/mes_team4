package com.itwillbs.domain;

import java.sql.Date;

public class PerformDTO {
	
	private int perform_no;
	private String instruction_code;
	private String line_cd;
	private String order_cd;
	private int product_cd;
	private Date perform_date;
	private int fair_prod;
	private int defect_prod;
	private String defect_remarks;
	private String remarks;
	
	public int getPerform_no() {
		return perform_no;
	}
	public void setPerform_no(int perform_no) {
		this.perform_no = perform_no;
	}
	public String getInstruction_code() {
		return instruction_code;
	}
	public void setInstruction_code(String instruction_code) {
		this.instruction_code = instruction_code;
	}
	public String getLine_cd() {
		return line_cd;
	}
	public void setLine_cd(String line_cd) {
		this.line_cd = line_cd;
	}
	public String getOrder_cd() {
		return order_cd;
	}
	public void setOrder_cd(String order_cd) {
		this.order_cd = order_cd;
	}
	public int getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(int product_cd) {
		this.product_cd = product_cd;
	}
	public Date getPerform_date() {
		return perform_date;
	}
	public void setPerform_date(Date perform_date) {
		this.perform_date = perform_date;
	}
	public int getFair_prod() {
		return fair_prod;
	}
	public void setFair_prod(int fair_prod) {
		this.fair_prod = fair_prod;
	}
	public int getDefect_prod() {
		return defect_prod;
	}
	public void setDefect_prod(int defect_prod) {
		this.defect_prod = defect_prod;
	}
	public String getDefect_remarks() {
		return defect_remarks;
	}
	public void setDefect_remarks(String defect_remarks) {
		this.defect_remarks = defect_remarks;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
		
}
