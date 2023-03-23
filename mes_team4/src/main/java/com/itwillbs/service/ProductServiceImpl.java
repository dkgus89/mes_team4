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
	
	@Override
	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductServiceImpl insertProduct()");
//		if(productDAO.getMaxNum()==null) {
//		productDTO.setproduct_cd("1");
//	}else {
//		productDTO.setproduct_cd(productDAO.getMaxNum()+"1");
//	}
		productDAO.insertProduct(productDTO);
	}
	@Override
	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow= startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return productDAO.getProductList(pageDTO);
	}
	@Override
	public int getProductCount() {

		return productDAO.getProductCount();
	}

}
