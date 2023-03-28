package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.DeliverDTO;
import com.itwillbs.domain.PageDTO;

public interface DeliverDAO {
	
	//추상메소드
		public void insertDeliver(DeliverDTO deliverDTO);
		
		
		public List<DeliverDTO> getDeliverList(PageDTO pageDTO);
		
		public DeliverDTO getDeliver(String deliver_cd);
		
		public void updateDeliver(DeliverDTO deliverDTO);
		
		int getDeliverCount(PageDTO pageDTO);



}
