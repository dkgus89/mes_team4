package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReleaseDTO {
	private String rel_schedule_cd;
	private String rel_date;
	private Timestamp remarks;
	private String out_complete;
	
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
