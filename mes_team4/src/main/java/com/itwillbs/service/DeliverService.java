package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.DeliverDTO;
import com.itwillbs.domain.PageDTO;

public interface DeliverService {
	
	
	
	public List<DeliverDTO> getDeliverList(PageDTO pageDTO);
	
	//추상메소드
	public void insertDeliver(DeliverDTO deliverDTO);

	public DeliverDTO getDeliver(DeliverDTO deliverDTO);

	public void updateDeliver(DeliverDTO deliverDTO);
	
	int getDeliverCount(PageDTO pageDTO);

	public void deleteDeliver(String deliver_cd);

	public List<Map<String, Object>> getInstMap();

	public List<Map<String, Object>> getInstMap2();

	public List<Map<String, Object>> getInstMap3();

	public String getDeliver_cd();
	
	

	

	
	
}
