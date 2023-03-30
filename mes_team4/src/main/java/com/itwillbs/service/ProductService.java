package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

public interface ProductService {
	
	// 품목명 팝업 리스트 
		public  List<ProductDTO> getPnameList(PageDTO pageDTO);
		
		public int getProductCount();
}
