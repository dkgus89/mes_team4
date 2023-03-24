package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PerformDTO;

public interface PerformService {

	public List<PerformDTO> getPerformList(PageDTO pageDTO);
	
	public int getPerformCount();
	
	public void insertPerform(PerformDTO performDTO);
	
	public PerformDTO getPerform(String perform_cd);
	
	public void updatePerform(PerformDTO performDTO);
	
	public void deletePerform(String perform_cd);
	
	//map
	public List<Map<String, Object>> getInstMap();
}
