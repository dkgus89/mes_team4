package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.DeliverDTO;

public interface DeliverService {
	
	
	
	public List<DeliverDTO> getDeliverList();
	
	//추상메소드
	public void insertDeliver(DeliverDTO deliverDTO);

	public DeliverDTO getDeliver(String deliver_cd);

	public void updateDeliver(DeliverDTO deliverDTO);

	

	
	
}
