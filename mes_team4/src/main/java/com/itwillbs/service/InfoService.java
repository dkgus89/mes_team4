package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.LineDTO;


public interface InfoService {

	public List<LineDTO> getLineList();
	
	public void insertLine(LineDTO lineDTO);
}
