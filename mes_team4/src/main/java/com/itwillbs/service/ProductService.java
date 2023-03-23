package com.itwillbs.service;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.ProductDTO;

@Service
public interface ProductService {
	
	public void insertProduct(ProductDTO productDTO);
}
