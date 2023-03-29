package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReleaseDTO {
	// 출고코드, 출고일자, 적요, 진행상태, 출고수량
	private String rel_schedule_cd;
	private String rel_date;
	private Timestamp remarks;
	private String out_complete;
	private int rel_count;
	
	public int getRel_count() {
		return rel_count;
	}
	public void setRel_count(int rel_count) {
		this.rel_count = rel_count;
	}
	public String getRel_schedule_cd() {
		return rel_schedule_cd;
	}
	public void setRel_schedule_cd(String rel_schedule_cd) {
		this.rel_schedule_cd = rel_schedule_cd;
	}
	public String getRel_date() {
		return rel_date;
	}
	public void setRel_date(String rel_date) {
		this.rel_date = rel_date;
	}
	public Timestamp getRemarks() {
		return remarks;
	}
	public void setRemarks(Timestamp remarks) {
		this.remarks = remarks;
	}
	public String getOut_complete() {
		return out_complete;
	}
	public void setOut_complete(String out_complete) {
		this.out_complete = out_complete;
	}
}
