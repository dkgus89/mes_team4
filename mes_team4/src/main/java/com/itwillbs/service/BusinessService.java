package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.PageDTO;

public interface BusinessService {

	public void insertBusiness(BusinessDTO businessDTO);
	
	public int getBusinessCount();
	
	public  List<BusinessDTO> getBusinessList(PageDTO pageDTO);
	
	public void deleteBusiness(String cd);
	
}
