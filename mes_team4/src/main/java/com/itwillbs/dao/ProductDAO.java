package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

public interface ProductDAO {

	public void insertProduct(ProductDTO productDTO);

	public List<ProductDTO> getProductList(PageDTO pageDTO);

	public int getProductCount();
	
	public Integer getMaxNum();

	public void deleteProduct(String product_cd_name);

}
