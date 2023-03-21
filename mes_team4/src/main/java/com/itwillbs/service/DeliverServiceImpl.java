package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.DeliverDAO;
import com.itwillbs.domain.DeliverDTO;

@Service
public class DeliverServiceImpl implements DeliverService{
	
	@Inject
	private DeliverDAO deliverDAO;
	
	@Override
	public void insertDeliver(DeliverDTO deliverDTO) {
		System.out.println("DeliverServiceImpl insertDeliver()");
		
		deliverDAO.insertDeliver(deliverDTO);
	}

	

}
