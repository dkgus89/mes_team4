package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReceiveDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReceiveDTO;

@Service
public class ReceiveServiceImpl implements ReceiveService{

	@Inject
	private ReceiveDAO receiveDAO;
	
	@Override
	public void insertReceive(ReceiveDTO receiveDTO) {
		
		receiveDAO.insertReceive(receiveDAO);
	}

	@Override
	public List<ReceiveDTO> getReceiveList(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			return receiveDAO.getReciveList(pageDTO);
	}

	@Override
	public int getReceiveCount(PageDTO pageDTO) {
		return receiveDAO.getReceiveCount(pageDTO);
	}

}