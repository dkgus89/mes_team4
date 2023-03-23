package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{

	@Inject
	private ProductDAO productDAO;
	
	@Override
	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductServiceImpl insertProduct()");
		
		productDAO.insertProduct(productDTO);
		
	}

}
