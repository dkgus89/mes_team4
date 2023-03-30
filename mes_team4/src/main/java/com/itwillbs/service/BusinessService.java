package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.PageDTO;

public interface BusinessService {

	// 거래처이름 팝업 리스트 
	public  List<BusinessDTO> getBnameList(PageDTO pageDTO);
	
	public int getBusinessCount();
}