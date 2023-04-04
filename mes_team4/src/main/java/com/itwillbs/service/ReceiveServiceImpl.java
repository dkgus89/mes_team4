package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReceiveDAO;
import com.itwillbs.domain.ReceiveDTO;

@Service
public class ReceiveServiceImpl implements ReceiveService{

	@Inject
	private ReceiveDAO receiveDAO;
	
	@Override
	public void insertReceive(ReceiveDTO receiveDTO) {
		
		receiveDAO.insertReceive(receiveDAO);
	}

}