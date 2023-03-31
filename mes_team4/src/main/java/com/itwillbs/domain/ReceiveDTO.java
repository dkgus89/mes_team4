package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReceiveDTO {
	private String rec_schedule_cd;
	private Timestamp rec_date;
	private String remarks;
	private String in_complete;
	private int rec_count;
	
	public String getRec_schedule_cd() {
		return rec_schedule_cd;
	}
	public void setRec_schedule_cd(String rec_schedule_cd) {
		this.rec_schedule_cd = rec_schedule_cd;
	}
	public Timestamp getRec_date() {
		return rec_date;
	}
	public void setRec_date(Timestamp rec_date) {
		this.rec_date = rec_date;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getIn_complete() {
		return in_complete;
	}
	public void setIn_complete(String in_complete) {
		this.in_complete = in_complete;
	}
	public int getRec_count() {
		return rec_count;
	}
	public void setRec_count(int rec_count) {
		this.rec_count = rec_count;
	}
	

}
