package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.DeliverDTO;

public interface DeliverDAO {
	
	//추상메소드
		public void insertDeliver(DeliverDTO deliverDTO);
		
		
		public List<DeliverDTO> getDeliverList();
}
