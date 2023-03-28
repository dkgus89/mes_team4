package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.DeliverDTO;
import com.itwillbs.domain.PageDTO;

public interface DeliverService {
	
	
	
	public List<DeliverDTO> getDeliverList(PageDTO pageDTO);
	
	//추상메소드
	public void insertDeliver(DeliverDTO deliverDTO);

	public DeliverDTO getDeliver(String deliver_cd);

	public void updateDeliver(DeliverDTO deliverDTO);
	
	int getDeliverCount(PageDTO pageDTO);

	

	
	
}
