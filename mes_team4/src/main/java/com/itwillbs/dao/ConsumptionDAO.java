package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ConsumptionDTO;
import com.itwillbs.domain.PageDTO;

public interface ConsumptionDAO {
	
	public List<Map<String, Object>> getPrList(PageDTO pageDTO);
	
	public int getPrCount(PageDTO pageDTO);
	
	public void insertConsmpt(ConsumptionDTO consumptionDTO);
	
}// class
