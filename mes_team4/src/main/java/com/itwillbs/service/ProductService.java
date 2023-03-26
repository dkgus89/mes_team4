package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Service
public interface ProductService {
	
	public void insertProduct(ProductDTO productDTO);

	public List<ProductDTO> getProductList(PageDTO pageDTO);

	public int getProductCount();

	public void deleteProduct(String product_cd_name);

	public ProductDTO getProduct(String product_cd_name);
}
