package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

public interface ProductDAO {
	
	// 품목명 팝업 리스트 
	List<ProductDTO> getBnameList(PageDTO pageDTO);

	int getProductCount();

}
