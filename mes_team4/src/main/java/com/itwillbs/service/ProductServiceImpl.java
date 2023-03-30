package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Inject
	private ProductDAO productDAO;
	
	// 품목명 팝업 리스트 
	@Override
	public List<ProductDTO> getPnameList(PageDTO pageDTO) {
		System.out.println("ProductServiceImpl getPnameList()");
		//시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
		
		return productDAO.getBnameList(pageDTO);
	}

	@Override
	public int getProductCount() {
		System.out.println("BusinessServiceImpl getBusinessCount()");
		
		return productDAO.getProductCount();
	}

}
