package com.itwillbs.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.InstructionDAO;
import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class InstructionServiceImpl implements InstructionService{
	@Inject
	private InstructionDAO instructionDAO;

	@Override
	public List<Map<String, Object>> getorderlist(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl getorderlist()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize();
		int endRow = startRow + pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);  
		pageDTO.setEndRow(endRow);
		
		return instructionDAO.getorderlist(pageDTO);
	}

	@Override
	public int getordercount(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl getordercount()");
		
		return instructionDAO.getordercount(pageDTO);
	}

	@Override
	public OrderDTO orderinfo(String order_cd) {
		System.out.println("InstructionServiceImpl orderinfo()");
		
		return instructionDAO.orderinfo(order_cd);
	}

	@Override
	public List<InstructionDTO> instructionlist(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl instructionlist()");

		return instructionDAO.instructionlist(pageDTO);
	}

	@Override
	public int getinstructioncount(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl getinstructioncount()");
		
		return instructionDAO.getinstructioncount(pageDTO);
	}

	@Override
	public void instructioninsertpro(InstructionDTO instructionDTO) {
		System.out.println("InstructionServiceImpl instructioninsertpro()");
		
		instructionDAO.instructioninsertpro(instructionDTO);
		
	}

	@Override
	public InstructionDTO instructioninfo(String instruction_code) {
		System.out.println("InstructionServiceImpl instructioninfo()");
		
		return instructionDAO.instructioninfo(instruction_code);
	}

	@Override
	public List<Map<String, Object>> conslist(String order_cd) {
		System.out.println("InstructionServiceImpl instructioninfo()");
		
		return instructionDAO.conslist(order_cd);
	}

	@Override
	public List<Map<String, Object>> getInstMap() {
		System.out.println("InstructionServiceImpl getInstMap()");
		
		return instructionDAO.getInstMap();
	}

	@Override
	public Map<String, Object> getInst(String instruction_code) {
		System.out.println("InstructionServiceImpl getInst()");
		
		return instructionDAO.getInst(instruction_code);
	}

	@Override
	public void instupdatepro(InstructionDTO instructionDTO) {
		System.out.println("InstructionServiceImpl instupdatepro()");
		
		instructionDAO.instupdatepro(instructionDTO);
		
	}

	@Override
	public void deletePerform(String instruction_code) {
		System.out.println("InstructionServiceImpl deletePerform()");
		
		instructionDAO.deletePerform(instruction_code);
		
	}

	@Override
	public int getordercheck(String order_cd) {
		System.out.println("InstructionServiceImpl getordercheck()");
		
		return instructionDAO.getordercheck(order_cd);
	}

	@Override
	public List<Map<String, Object>> getOrderListMap(PageDTO pageDTO) {
		System.out.println("InstructionServiceImpl getOrderListMap()");
		
		return instructionDAO.getOrderListMap(pageDTO);
	}

	
	
	


	
}	

