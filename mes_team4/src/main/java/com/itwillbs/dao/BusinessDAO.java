package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.PageDTO;

public interface BusinessDAO {


	public void insertBusiness(BusinessDTO businessDTO);
	
	public Integer getONum();
	
	public Integer getPNum();
	
	public int getBusinessCount();
	
	public  List<BusinessDTO> getBusinessList(PageDTO pageDTO);

	public void deleteBusiness(String cd);
}
