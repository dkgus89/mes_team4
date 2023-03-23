package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WHDTO;

public interface WHDAO {
	
	public void insertwh(WHDTO whdto);
	
	public Integer getMaxNum();
	
	public List<WHDTO> getWhList(PageDTO pageDTO);
	
	public int getWhCount();
	
	public void updatewh(WHDTO whdto);
	

}
