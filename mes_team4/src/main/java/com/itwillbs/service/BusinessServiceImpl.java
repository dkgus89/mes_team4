package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BusinessDAO;
import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.PageDTO;


@Service
public class BusinessServiceImpl implements BusinessService{

	@Inject
	private BusinessDAO businessDAO;
	
	@Override
	public int getBusinessCount() {
		System.out.println("BusinessServiceImpl getBusinessCount()");
		
		return businessDAO.getBusinessCount();
	}

	// 거래처이름 팝업 리스트 
	@Override
	public List<BusinessDTO> getBnameList(PageDTO pageDTO) {
		System.out.println("BusinessServiceImpl getBnameList()");
		//시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
		
		return businessDAO.getBnameList(pageDTO);
	}

	
	


}
